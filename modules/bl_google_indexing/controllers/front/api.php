<?php

/**
 * 2010-2021 Bl Modules.
 */
class Bl_Google_IndexingApiModuleFrontController extends ModuleFrontController
{
    protected $fullURL = '';
    protected $googleClient = null;

    public function postProcess()
    {
        $this->fullURL = Tools::getValue('url');
    }

    public function initContent()
    {
        include_once(dirname(__FILE__).'/../../vendor/autoload.php');
        include_once(dirname(__FILE__).'/../../IndexingApiLog.php');
        include_once(dirname(__FILE__).'/../../IndexingApi.php');

        $settings = json_decode(htmlspecialchars_decode(Configuration::get('BLMOD_INDEXING_SETTINGS')), true);
        if (empty($settings['json_api_key'])) {
            $this->response(false, 'Invalid JSON API Key');
        }

        $action = Tools::getValue('action');
        $startId = (int)Tools::getValue('start_id');
        $endId = (int)Tools::getValue('end_id');

        // Initialisation du client Google
        $this->initGoogleClient($settings['json_api_key']);

        if ($action == 'index_all') {
            $this->processBatchIndexing($startId, $endId, $settings);
        } else {
            $this->processSingleUrl($settings);
        }
    }

    protected function initGoogleClient($apiKey)
    {
        try {
            $this->googleClient = new Google\Client();
            $this->googleClient->setAuthConfig(json_decode($apiKey, true));
            $this->googleClient->addScope('https://www.googleapis.com/auth/indexing');

            // Configuration spécifique pour éviter les erreurs de handler
            $handler = new \GuzzleHttp\Handler\CurlHandler();
            $stack = \GuzzleHttp\HandlerStack::create($handler);
            $httpClient = new \GuzzleHttp\Client([
                'handler' => $stack,
                'verify' => false // Désactive la vérification SSL si nécessaire
            ]);
            $this->googleClient->setHttpClient($httpClient);
        } catch (Exception $e) {
            $this->response(false, 'Google Client initialization failed: '.$e->getMessage());
        }
    }

    protected function processBatchIndexing($startId, $endId, $settings)
    {
        if ($startId <= 0 || $endId <= 0 || $startId > $endId) {
            $this->response(false, 'IDs de produit invalides.');
        }
    
        $sql = new DbQuery();
        $sql->select('id_product');
        $sql->from('product');
        $sql->where('id_product >= ' . (int)$startId);
        $sql->where('id_product <= ' . (int)$endId);
        $sql->orderBy('id_product ASC');
    
        $results = Db::getInstance()->executeS($sql);
    
        if (empty($results)) {
            $this->response(false, 'Aucun produit trouvé dans la plage spécifiée.');
        }
    
        $successCount = 0;
        $errors = [];
        $id_lang = 3; // Votre ID de langue
        $indexingApi = new IndexingApi($this->googleClient); // Instancier l'IndexingApi une seule fois
    
        foreach ($results as $productInfo) {
            try {
                $product = new Product($productInfo['id_product'], false, $id_lang, $this->context->shop->id);
                $url = $this->context->link->getProductLink($product->id);
                $response = $indexingApi->send($url, $settings); // Envoyer la requête individuellement
    
                if ($response['phrase'] == IndexingApi::RESPONSE_OK) {
                    $successCount++;
                } else {
                    $errors[] = [
                        'id_product' => $product->id,
                        'error' => $response['message']['error'] ?? 'Unknown error'
                    ];
                }
    
                // Respecter les quotas de l'API
                usleep(500000); // 500ms entre les requêtes (ajustez selon vos besoins)
            } catch (Exception $e) {
                $errors[] = [
                    'id_product' => $product->id,
                    'error' => $e->getMessage()
                ];
            }
        }
    
        $this->response(true, [
            'success_count' => $successCount,
            'error_count' => count($errors),
            'errors' => $errors
        ]);
    }

    protected function processSingleUrl($settings)
    {
        if (empty($this->fullURL)) {
            $this->response(false, 'Empty URL');
        }

        try {
            $indexingApi = new IndexingApi($this->googleClient);
            $response = $indexingApi->send($this->fullURL, $settings);

            if ($response['phrase'] == IndexingApi::RESPONSE_OK) {
                $this->response(true, 'Indexing request sent successfully to Google');
            } else {
                $error = $response['message']['error'] ?? ['message' => 'Google API error'];
                $this->response(false, $error['message']);
            }
        } catch (Exception $e) {
            $this->response(false, 'Exception: '.$e->getMessage());
        }
    }

    public function response($success, $message)
    {
        $response = [
            'success' => $success,
            'message' => $message,
            'timestamp' => date('Y-m-d H:i:s')
        ];

        if (method_exists('ModuleFrontController', 'ajaxRender')) {
            $this->ajaxRender(json_encode($response));
        } else {
            $this->ajaxDie(json_encode($response));
        }
        exit;
    }
}

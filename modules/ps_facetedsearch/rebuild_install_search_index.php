<?php

require_once dirname(__FILE__).'/../../config/config.inc.php';
require_once dirname(__FILE__).'/../../init.php';

// Permettre une exécution prolongée du script
ini_set('max_execution_time', '7200');

$action = $argv[1] ?? null; // Récupère l'action passée en CLI

// Vérifie si le module est installé et activé
if (!Module::isInstalled('ps_facetedsearch') || !Module::isEnabled('ps_facetedsearch')) {
    http_response_code(500);
    header('Content-Type: application/json');
    die(json_encode(['error' => 'Module Ps_Facetedsearch not installed or disabled']));
}

// Instanciation du module après vérification
$module = Module::getInstanceByName('ps_facetedsearch');

Shop::setContext(Shop::CONTEXT_ALL);

switch ($action) {
    case 'indexSurfaces':
        $cursor = isset($argv[2]) ? (int) $argv[2] : 0;
        $ajax = isset($argv[3]) ? filter_var($argv[3], FILTER_VALIDATE_BOOLEAN) : false;
        $full = isset($argv[4]) ? filter_var($argv[4], FILTER_VALIDATE_BOOLEAN) : false;

        $response = $full
            ? $module->fullSurfacesIndexProcess($cursor, $ajax, true)
            : $module->surfacesIndexProcess($cursor, $ajax);

        header('Content-Type: application/json');
        echo json_encode($response);
        exit;

    case 'indexRooms':
        $cursor = isset($argv[2]) ? (int) $argv[2] : 0;
        $ajax = isset($argv[3]) ? filter_var($argv[3], FILTER_VALIDATE_BOOLEAN) : false;
        $full = isset($argv[4]) ? filter_var($argv[4], FILTER_VALIDATE_BOOLEAN) : false;

        $response = $full
            ? $module->fullRoomsIndexProcess($cursor, $ajax, true)
            : $module->roomsIndexProcess($cursor, $ajax);

        header('Content-Type: application/json');
        echo json_encode($response);
        exit;

    case 'indexFeatures':
        $module->indexFeatures();
        exit;

    case 'clearCache':
        $module->ajaxRender($module->invalidateLayeredFilterBlockCache());
        exit;

    case 'indexPrices':
        $cursor = isset($argv[2]) ? (int) $argv[2] : 0;
        $ajax = isset($argv[3]) ? filter_var($argv[3], FILTER_VALIDATE_BOOLEAN) : false;
        $full = isset($argv[4]) ? filter_var($argv[4], FILTER_VALIDATE_BOOLEAN) : false;

        if ($full) {
            $module->ajaxRender($module->fullPricesIndexProcess($cursor, $ajax, true));
        } else {
            $module->ajaxRender($module->pricesIndexProcess($cursor, $ajax));
        }
        exit;

    case 'indexProductsSearch':
        Search::indexation(1);
        exit;

    case 'generateSitemap':
        $gsitemap = Module::getInstanceByName('gsitemap');
        /* Check if the module is enabled */
        if ($gsitemap->active) {
            /* Check if the requested shop exists */
            $shops = Db::getInstance()->ExecuteS('SELECT id_shop FROM `' . _DB_PREFIX_ . 'shop`');
            $list_id_shop = [];
            foreach ($shops as $shop) {
                $list_id_shop[] = (int) $shop['id_shop'];
            }
            $id_shop = (Tools::getIsset('id_shop') && in_array(Tools::getValue('id_shop'), $list_id_shop)) ? (int) Tools::getValue('id_shop') : (int) Configuration::get('PS_SHOP_DEFAULT');
            $gsitemap->cron = true;
            /* for the main run initiat the sitemap's files name stored in the database */
            if (!Tools::getIsset('continue')) {
                $gsitemap->emptySitemap((int) $id_shop);
            }
            /* Create the Google sitemap's files */
            $gsitemap->createSitemap((int) $id_shop);
        }
        exit;

    default:
        http_response_code(403);
        header('Content-Type: application/json');
        die(json_encode(['error' => 'Unknown action']));
}

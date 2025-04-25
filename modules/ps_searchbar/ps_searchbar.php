<?php

/**
 * 2007-2020 PrestaShop SA and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */
if (!defined('_PS_VERSION_')) {
    exit;
}
require_once __DIR__ . '/src/Adapter/Search/SearchProductSearchProviderOverride.php';

use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchContext;
use PrestaShop\PrestaShop\Adapter\Image\ImageRetriever;
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use PrestaShop\PrestaShop\Adapter\Product\ProductColorsRetriever;

$autoloadPath = __DIR__ . '/vendor/autoload.php';
if (file_exists($autoloadPath)) {
    require_once $autoloadPath;
}

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;

class Ps_Searchbar extends Module implements WidgetInterface
{
    /**
     * @var string Name of the module running on PS 1.6.x. Used for data migration.
     */
    public const PS_16_EQUIVALENT_MODULE = 'blocksearch';

    private $templateFile;

    public function __construct()
    {
        $this->name = 'ps_searchbar';
        $this->tab = 'front_office_features';
        $this->author = 'PrestaShop';
        $this->version = '2.1.3';
        $this->need_instance = 0;

        parent::__construct();

        $this->displayName = $this->trans('Search bar', [], 'Modules.Searchbar.Admin');
        $this->description = $this->trans('Help your visitors find what they are looking for, add a quick search field to your store.', [], 'Modules.Searchbar.Admin');
        $this->ps_versions_compliancy = ['min' => '1.7.8.0', 'max' => _PS_VERSION_];
        $this->templateFile = 'module:ps_searchbar/ps_searchbar.tpl';
    }

    public function install()
    {
        // Initialise le contexte si nécessaire
        if ($this->context == null) {
            $this->context = Context::getContext();
        }

        if ($this->context->language == null) {
            $this->context->language = new Language(Configuration::get('PS_LANG_DEFAULT'));
        }

        return parent::install()
            && $this->registerHook('displayTop')
            && $this->registerHook('displaySearch')
            && $this->registerHook('displayHeader')
            && $this->registerHook('actionProductSearchProviderRunQueryAfter')
            && $this->generateTplThemesColumn()
            && $this->registerHook('filterProductSearch');

    }


    private function generateTplThemesColumn()
    {
        $langs = Language::getLanguages(false);
        $themeDir = _PS_THEME_DIR_ . 'modules/ps_searchbar/';

        // Création du répertoire si nécessaire
        if (!file_exists($themeDir)) {
            if (!mkdir($themeDir, 0755, true)) {
                PrestaShopLogger::addLog('Failed to create directory: ' . $themeDir, 3);
                return false;
            }
        }

        foreach ($langs as $lang) {
            // try {
            $data = $this->getDataListCat($lang['id_lang']);


            // Validation des données
            if (empty($data)) {
                throw new Exception('Empty data for language '.$lang['id_lang']);
            }

            $destinationTplPath = $themeDir . 'themes-column-' . $lang['id_lang'] . '.tpl';

            // Suppression de l'ancien fichier
            if (file_exists($destinationTplPath) && !unlink($destinationTplPath)) {
                throw new Exception('Failed to delete old template file');
            }

            // Construction du contenu HTML
            $htmlContent = $this->buildHtmlContent($data);

            // Création des sous-répertoires si nécessaire
            if (!is_dir(dirname($destinationTplPath))) {
                if (!mkdir(dirname($destinationTplPath), 0755, true)) {
                    throw new Exception('Failed to create subdirectories');
                }
            }

            // Écriture du fichier
            if (file_put_contents($destinationTplPath, $htmlContent) === false) {
                throw new Exception('Failed to write template file');
            }

            /*} catch (Exception $e) {
                PrestaShopLogger::addLog(
                    'Error generating template for lang '.$lang['id_lang'].': '.$e->getMessage(),
                    3
                );
                continue; // Continue avec les autres langues malgré l'erreur
            }*/
        }

        return true;
    }

    private function buildHtmlContent($data)
    {
        // Vérification des données requises
        $requiredSections = ['types', 'locations', 'lifestyles', 'tourism'];
        foreach ($requiredSections as $section) {
            if (!isset($data[$section]['items'])) {
                throw new Exception('Missing data section: '.$section);
            }
        }

        // Construction du HTML
        $html = '<div class="container my-5">
        <div class="row g-4">';
        // Section Types de biens
        $html .= '<div class="col-md-4">
        <div class="card h-100 shadow-sm">
            <div class="card-header bg-black text-white">
            <h2 class="h5 mb-0">'.$data['types']['title'].'</h2>
            </div>
            <div class="card-body">
            '.$data['types']['desc_short'].'

            <ul class="list-group list-group-flush">';

        foreach ($data['types']['items'] as $item) {
            if ($item['count'] > 0) {
                $html .= $this->buildListItemHtml($item);
            }
        }

        $html .= '</ul></div></div></div>';

       

        // Section Localisation
        $html .= '<div class="col-md-4">
        <div class="card h-100 shadow-sm">
            <div class="card-header bg-black text-white">
            <h2 class="h5 mb-0">'.$data['locations']['title'].'</h2>
            </div>
            <div class="card-body">
            '.$data['locations']['desc_short'].'

            <ul class="list-group list-group-flush">';

             $html .= '<li class="list-group-item border-0">
            <div class="d-flex justify-content-between align-items-center">
                <a href="'.$data['locations']['main_url'].'">'.$data['locations']['title'].'</a>
                <span class="badge bg-primary rounded-pill">'.$data['locations']['main_count'].'</span>
            </div>';

        foreach ($data['locations']['items'] as $region) {
            $html .= '<li class="list-group-item border-0">
            <div class="d-flex justify-content-between align-items-center">
                '.$this->buildLinkHtml($region).'
                <span class="badge bg-primary rounded-pill">'.$region['count'].'</span>
            </div>';

            

            $html .= '</li>';
        }
        foreach ($data['tourism']['items'] as $item) {
            $html .= '<li class="list-group-item border-0">
            <div class="d-flex justify-content-between align-items-center">
                '.$this->buildLinkHtml($item).'
                <span class="badge bg-primary rounded-pill">'.$item['count'].'</span>
            </div>
            </li>';
        }

        $html .= '</ul></div></div></div>';

        // Section Style de vie
        $html .= '<div class="col-md-4">
        <div class="card h-100 shadow-sm">
            <div class="card-header bg-black text-white">
            <h2 class="h5 mb-0">'.$data['lifestyles']['title'].'</h2>
            </div>
            <div class="card-body">
            '.$data['lifestyles']['desc_short'].'

            <ul class="list-group list-group-flush">';

        foreach ($data['lifestyles']['items'] as $item) {
            $html .= $this->buildListItemHtml($item);
        }

        $html .= '</ul></div></div></div></div></div>';

        return $html;
    }

    private function buildListItemHtml($item)
    {
        return '<li class="list-group-item border-0 d-flex justify-content-between align-items-center">
        '.$this->buildLinkHtml($item).'
        <span class="badge bg-primary rounded-pill">'.$item['count'].'</span>
        </li>';
    }

    private function buildLinkHtml($item, $small = false)
    {
        $class = $small ? 'text-decoration-none small' : 'text-decoration-none';
        return '<a href="'.htmlspecialchars($item['url']).'" class="'.$class.'">'
            .htmlspecialchars($item['label']).'</a>';
    }

    private function getDataListCat($id_lang)
    {

        // Vérification du contexte
        if ($this->context == null) {
            $this->context = Context::getContext();
        }

        // Vérification de la langue
        if (!Validate::isLoadedObject($this->context->language)) {
            $this->context->language = new Language($id_lang);
        }

        // IDs des catégories principales
        $categoryIds = [
            'types' => 3,
            'locations' => 7,
            'lifestyles' => 4,
            'tourism' => 5
        ];

        // Récupération des catégories
        $categories = $this->getCategoriesLinks($id_lang);


        // Debug: Log la structure complète des catégories
        PrestaShopLogger::addLog('Categories structure: '.print_r($categories, true), 1);

        if (empty($categories)) {
            PrestaShopLogger::addLog('No categories found for lang '.$id_lang, 2);
            return [];
        }

        // Trouve les enfants de la catégorie racine
        $mainCategories = [];
        foreach ($categories as $category) {
            if (isset($category['children']) && is_array($category['children'])) {
                $mainCategories = array_merge($mainCategories, $category['children']);
            }
        }

        // Construction des données thématiques
        return [
            'types' => [
                'title' => $this->getCategoryName($categoryIds['types'], $id_lang),
                'desc_short' => $this->getCategoryDescription($categoryIds['types'], $id_lang),
                'items' => $this->getCategoriesWithCountById($mainCategories, $categoryIds['types'], $id_lang)
            ],
            'locations' => [
                'title' => $this->getCategoryName($categoryIds['locations'], $id_lang),
                'desc_short' => $this->getCategoryDescription($categoryIds['locations'], $id_lang),
                'main_url' => $this->getCategoryUrl($categoryIds['locations'], $id_lang),
                'main_count' => $this->getProductCount($categoryIds['locations']),

                'items' => $this->getCategoriesWithCountById($mainCategories, $categoryIds['locations'], $id_lang)
            ],
            'lifestyles' => [
                'title' => $this->getCategoryName($categoryIds['lifestyles'], $id_lang),
                'desc_short' => $this->getCategoryDescription($categoryIds['lifestyles'], $id_lang),

                'items' => $this->getCategoriesWithCountById($mainCategories, $categoryIds['lifestyles'], $id_lang)
            ],
            'tourism' => [
                'title' => 'Tourism',
                'items' => $this->getCategoriesWithCountById($mainCategories, $categoryIds['tourism'], $id_lang)
            ]
        ];
    }

    protected function getCategoryName($id_category, $id_lang)
    {
        $category = new Category($id_category, $id_lang);
        return Validate::isLoadedObject($category) ? $category->name : '';
    }

    protected function getCategoryUrl($id_category, $id_lang)
    {
        $link = new Link();
        $category = new Category($id_category, $id_lang);
        return $link->getCategoryLink((int)$id_category,null,(int)$id_lang);
    }

    protected function getCategoryDescription($id_category, $id_lang)
    {
        $category = new Category($id_category, $id_lang);
        return Validate::isLoadedObject($category) ? $category->description : '';
    }

    protected function getCategoriesWithCountById($categories, $id_category, $id_lang = null)
    {
        if (!is_array($categories)) {
            PrestaShopLogger::addLog('Invalid categories format in getCategoriesWithCountById', 2);
            return [];
        }

        foreach ($categories as $category) {
            // Nouvelle méthode d'extraction plus robuste
            $current_id = $this->extractCategoryId($category['id']);

            if ($current_id == $id_category) { // == au lieu de === pour être plus souple
                $items = $category['children'] ?? [];

                if (!is_array($items)) {
                    return [];
                }

                foreach ($items as &$item) {
                    $item_id = $this->extractCategoryId($item['id']);
                    $item['count'] = $this->getProductCount($item_id);

                    if (empty($item['url'])) {
                        $item['url'] = $this->context->link->getCategoryLink($item_id, null, $id_lang);
                    }

                    if (!empty($item['children'])) {
                        foreach ($item['children'] as &$child) {
                            $child_id = $this->extractCategoryId($child['id']);
                            $child['count'] = $this->getProductCount($child_id);

                            if (empty($child['url'])) {
                                $child['url'] = $this->context->link->getCategoryLink($child_id, null, $id_lang);
                            }
                        }
                    }
                }

                return $items;
            }
        }

        // Debug avancé
        $available = array_map(function ($cat) {
            return $this->extractCategoryId($cat['id']).':'.$cat['label'];
        }, $categories);

        PrestaShopLogger::addLog(
            "Category $id_category not found. Available: ".implode(', ', $available),
            3
        );

        return [];
    }

    protected function extractCategoryId($id)
    {
        // Cas 1: ID numérique direct
        if (is_numeric($id)) {
            return (int)$id;
        }

        // Cas 2: Chaîne avec format category-page-XX
        if (is_string($id)) {
            // Nouveau pattern plus permissif
            if (preg_match('/(\d+)/', $id, $matches)) {
                return (int)$matches[1];
            }
        }

        // Cas 3: Format inattendu - log détaillé
        $debug = is_object($id) ? get_class($id) : gettype($id).':'.$id;
        PrestaShopLogger::addLog("ID extraction failed for: $debug", 3);

        return 0;
    }

    protected function getProductCount($id_category)
    {
        $id_category = (int)$id_category;
        $id_shop = (int)Context::getContext()->shop->id;

        $sql = "SELECT COUNT(DISTINCT cp.id_product) 
                FROM "._DB_PREFIX_."category_product cp
                INNER JOIN "._DB_PREFIX_."product_shop ps ON (
                    ps.id_product = cp.id_product AND 
                    ps.id_shop = $id_shop AND 
                    ps.active = 1
                )
                WHERE cp.id_category = $id_category";

        return (int)Db::getInstance()->getValue($sql);
    }

    public function getCategoriesLinks($id_lang)
    {
            // Récupération des catégories
        $categories = Category::getRootCategory()->recurseLiteCategTree(0, 0, $id_lang, null, 'sitemap');
        
        // Chargement de la langue
        $language = new Language($id_lang);
        
        // Vérification que la langue est active
        if (Validate::isLoadedObject($language) && $language->active && $language->id !=3) {
            $prefix = $language->iso_code.'/';
            $base_url = Tools::getCurrentUrlProtocolPrefix().$this->context->shop->domain.$this->context->shop->physical_uri;
            
            // Modification récursive des URLs
            array_walk_recursive($categories, function(&$value, $key) use ($prefix, $base_url) {
                if ($key === 'url' && !empty($value)) {
                    // Standardisation de l'URL avant modification
                    $value = str_replace(
                        ['http://', 'https://'],
                        [Tools::getCurrentUrlProtocolPrefix(), Tools::getCurrentUrlProtocolPrefix()],
                        $value
                    );
                    
                    // Ajout du préfixe de langue si absent
                    if (strpos($value, $prefix) === false) {
                        $value = str_replace($base_url, $base_url.$prefix, $value);
                    }
                }
            });
        }
    
        return [$categories];
    }

    public function hookDisplayHeader()
    {
        $this->context->controller->registerStylesheet('modules-searchbar', 'modules/' . $this->name . '/ps_searchbar.css');
    }

    public function getWidgetVariables($hookName, array $configuration = [])
    {
        $id_lang = $this->context->language->id; // Corrige ici : un seul "=" pour affectation
        // On récupère les caractéristiques "Type de bien"
        $features = Feature::getFeatures($id_lang);

        $feat_type_de_bien = [];
        foreach ($features as $feature) {
            if ($feature['name'] === 'feat_type_du_bien') { // Remplace par le nom exact de la caractéristique
                // Récupération des valeurs de cette caractéristique
                $feat_type_de_bien = FeatureValue::getFeatureValuesWithLang($id_lang, $feature['id_feature']);
                break;
            }
        }

        $widgetVariables = [
            'search_controller_url' => $this->context->link->getPageLink('search', null, null, null, false, null, true),
            'properties_types' => $feat_type_de_bien,
        ];

        /** @var array $templateVars */
        $templateVars = $this->context->smarty->getTemplateVars();
        if (is_array($templateVars) && !array_key_exists('search_string', $templateVars)) {
            $widgetVariables['search_string'] = '';
        }

        return $widgetVariables;
    }

    public function renderWidget($hookName, array $configuration = [])
    {
        $this->smarty->assign($this->getWidgetVariables($hookName, $configuration));

        return $this->fetch($this->templateFile);
    }



    public function hookActionProductSearchProviderRunQueryAfter(&$params)
    {
        // Récupération manuelle du contexte
        $context = new ProductSearchContext(\Context::getContext());
        $query = $params['query'];
        $provider = new \Ps_Searchbar\Search\SearchProductSearchProviderOverride();


        // Exécution de la requête et récupération des résultats
        $result = $provider->runQuery($context, $params['query']);

        // Vérification et mise à jour du résultat de la recherche
        if ($result instanceof \PrestaShop\PrestaShop\Core\Product\Search\ProductSearchResult) {
            $params['result'] = $result; // ✅ Affectation correcte

            // ✅ Vérification et assignation des valeurs de pagination
            $params['pagination'] = [
                'page' => $query->getPage() > 0 ? $query->getPage() : 1,
                'items_per_page' => $query->getResultsPerPage() > 0 ? $query->getResultsPerPage() : 24,
                'total_items' => $result->getTotalProductsCount(),
            ];
        }
    }


    public function hookFilterProductSearch($params)
    {
        // Vérifier si la requête est AJAX
        if ($this->context->controller->ajax) {
            header('Content-Type: application/json');
        }

        // Vérifier si le résultat est valide
        if (!isset($params['result']) || !$params['result'] instanceof \PrestaShop\PrestaShop\Core\Product\Search\ProductSearchResult) {
            return;
        }

        // Récupérer les produits et le total
        $products = $params['result']->getProducts();
        $totalProducts = $params['result']->getTotalProductsCount();
        $products = empty($products) ? [] : $products;

        // Récupérer les paramètres GET actuels et générer l'URL de pagination
        $queryParams = $_GET;
        unset($queryParams['page']);
        $baseUrl = $this->context->link->getPageLink('search', true, null, $queryParams);

        // Initialisation de la pagination
        $pagination = $params['pagination'] ?? [];
        $itemsPerPage = $pagination['items_per_page'] ?? 24;
        $currentPage = $pagination['page'] ?? 1;
        $totalPages = ceil($totalProducts / $itemsPerPage);
        $itemsShownFrom = ($currentPage - 1) * $itemsPerPage + 1;
        $itemsShownTo = min($itemsShownFrom + $itemsPerPage - 1, $totalProducts);

        // Génération des pages de pagination
        $pages = [];
        if ($currentPage > 1) {
            $pages[] = ['type' => 'previous', 'page' => $currentPage - 1, 'url' => $baseUrl . '&page=' . ($currentPage - 1), 'clickable' => true];
        }
        for ($i = 1; $i <= $totalPages; $i++) {
            $pages[] = ['type' => 'page', 'page' => $i, 'url' => $baseUrl . '&page=' . $i, 'current' => ($i == $currentPage), 'clickable' => ($i != $currentPage)];
        }
        if ($currentPage < $totalPages) {
            $pages[] = ['type' => 'next', 'page' => $currentPage + 1, 'url' => $baseUrl . '&page=' . ($currentPage + 1), 'clickable' => true];
        }

        // Mise à jour de la pagination
        $pagination = [
            'items_shown_from' => $totalProducts > 0 ? $itemsShownFrom : 0,
            'items_shown_to' => $totalProducts > 0 ? $itemsShownTo : 0,
            'total_items' => $totalProducts,
            'should_be_displayed' => ($totalProducts > $itemsPerPage),
            'pages' => $pages
        ];

        // Présentation des produits
        $assembler = new ProductAssembler($this->context);
        $presenterFactory = new ProductPresenterFactory($this->context);
        $presentationSettings = $presenterFactory->getPresentationSettings();
        $presenter = new \PrestaShop\PrestaShop\Adapter\Presenter\Product\ProductListingPresenter(
            new ImageRetriever($this->context->link),
            $this->context->link,
            new PriceFormatter(),
            new ProductColorsRetriever(),
            $this->context->getTranslator()
        );

        $products_for_template = [];
        foreach ($products as $rawProduct) {
            $products_for_template[] = $presenter->present(
                $presentationSettings,
                $assembler->assembleProduct($rawProduct),
                $this->context->language
            );
        }

        // Assigner les données à Smarty
        $this->context->smarty->assign([
            'listing_search' => [
                'products' => $products_for_template,
                'total' => $totalProducts,
                'pagination' => $pagination,
            ],
            'items_shown_from' => $pagination['items_shown_from'],
            'items_shown_to' => $pagination['items_shown_to'],
            'total_items' => $totalProducts,
        ]);

        // Si requête AJAX, renvoyer la réponse JSON
        if ($this->context->controller->ajax) {
            $ajaxData = $this->getAjaxProductSearchVariables();
            $response = array_merge($ajaxData, [
                'rendered_products_top' => $ajaxData['rendered_products_top'] ?? '',
                'rendered_products' => $ajaxData['rendered_products'] ?? '',
                'rendered_products_bottom' => $ajaxData['rendered_products_bottom'] ?? '',
                'rendered_products_header' => $ajaxData['rendered_products_header'] ?? '',
                'rendered_products_footer' => $ajaxData['rendered_products_footer'] ?? '',
                'rendered_facets' => $ajaxData['rendered_facets'] ?? '',
                'rendered_active_filters' => $ajaxData['rendered_active_filters'] ?? '',
                'pagination' => $pagination,
                'listing' => [
                    'products' => $products_for_template,
                    'total' => $totalProducts,
                    'pagination' => $pagination,
                ],
                'items_shown_from' => $pagination['items_shown_from'],
                'items_shown_to' => $pagination['items_shown_to'],
                'total_items' => $totalProducts,
            ]);

            die(json_encode($response));
        }

        return '';
    }

    protected function getAjaxProductSearchVariables()
    {
        // Vérifier si la requête provient bien du contrôleur ProductListingFrontController
        if (!$this->context->controller instanceof ProductListingFrontController) {
            return [];
        }

        // Récupérer les données de recherche depuis Smarty
        $search = $this->context->smarty->getTemplateVars('listing_search');

        if (empty($search)) {
            return []; // Sécurisation pour éviter les erreurs
        }

        // Récupérer les données de pagination et de tri
        $pagination = $this->context->smarty->getTemplateVars('pagination');
        $sortOrders = $this->context->smarty->getTemplateVars('sort_orders');
        $sortSelected = $this->context->smarty->getTemplateVars('sort_selected');

        // Récupérer les templates HTML
        $this->context->smarty->assign('listing', $search);
        $renderedProductsTop = $this->context->smarty->fetch(_PS_THEME_DIR_ . 'templates/catalog/_partials/products-top.tpl');
        $renderedProducts = $this->context->smarty->fetch(_PS_THEME_DIR_ . 'templates/catalog/_partials/products.tpl', ['listing' => $search]);
        $renderedProductsBottom = $this->context->smarty->fetch(_PS_THEME_DIR_ . 'templates/catalog/_partials/products-bottom.tpl', ['listing' => $search]);
        $renderedProductsHeader = $this->context->smarty->fetch(_PS_THEME_DIR_ . 'templates/catalog/_partials/products-top.tpl', ['listing' => $search]);
        $renderedProductsFooter = $this->context->smarty->fetch(_PS_THEME_DIR_ . 'templates/catalog/_partials/products-bottom.tpl', ['listing' => $search]);
        $renderedFacets = $this->context->smarty->fetch(_PS_THEME_DIR_ . 'templates/catalog/_partials/facets.tpl', ['listing' => $search]);
        $renderedActiveFilters = $this->context->smarty->fetch(_PS_THEME_DIR_ . 'templates/catalog/_partials/active_filters.tpl', ['listing' => $search]);

        $currentUrl = $this->context->link->getPaginationLink('search', null, false, true);

        // Générer la réponse AJAX
        $response = array_merge($search, [
            'rendered_products_top' => $renderedProductsTop,
            'rendered_products' => $renderedProducts,
            'rendered_products_bottom' => $renderedProductsBottom,
            'rendered_products_header' => $renderedProductsHeader,
            'rendered_products_footer' => $renderedProductsFooter,
            'rendered_facets' => $renderedFacets,
            'rendered_active_filters' => $renderedActiveFilters,
            'pagination' => $pagination,
            'sort_orders' => $sortOrders,
            'sort_selected' => $sortSelected,
            'js_enabled' => true, // Permet d'indiquer que le JavaScript est activé
            'current_url' => $currentUrl,
        ]);

        // Vérifier si des produits existent avant de les traiter
        if (!empty($response['products']) && is_array($response['products'])) {
            $response['products'] = $this->prepareProductArrayForAjaxReturn($response['products']);
        }

        return $response;
    }

    protected function prepareProductArrayForAjaxReturn(array $products)
    {
        foreach ($products as &$product) {
            // Vérifie que ce n'est pas un LazyArray avant de modifier
            if (!($product instanceof PrestaShop\PrestaShop\Adapter\Presenter\Product\ProductListingLazyArray)) {
                if (isset($product['id_product']) && !isset($product['url'])) {
                    $product['url'] = $this->context->link->getProductLink($product['id_product']);
                }

                // Ajoute une image par défaut si elle n'existe pas
                if (!isset($product['cover']) || empty($product['cover'])) {
                    $product['cover'] = [
                        'bySize' => [
                            'home_default' => [
                                'url' => _PS_IMG_ . 'p/' . $product['id_product'] . '.jpg',
                            ],
                        ],
                    ];
                }
            }
        }
        return $products;
    }

}

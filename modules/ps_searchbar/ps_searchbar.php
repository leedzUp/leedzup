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
        // Migrate data from 1.6 equivalent module (if applicable), then uninstall
        if (Module::isInstalled(self::PS_16_EQUIVALENT_MODULE)) {
            $oldModule = Module::getInstanceByName(self::PS_16_EQUIVALENT_MODULE);
            if ($oldModule) {
                $oldModule->uninstall();
            }
        }

        return parent::install()
            && $this->registerHook('displayTop')
            && $this->registerHook('displaySearch')
            && $this->registerHook('displayHeader')
            && $this->registerHook('actionProductSearchProviderRunQueryAfter')
            && $this->registerHook('filterProductSearch')
            && $this->reloadContainer(); // Recharge les services
        ;
    }

    public function hookDisplayHeader()
    {
        // $this->context->controller->addJqueryUI('ui.autocomplete');
        $this->context->controller->registerStylesheet('modules-searchbar', 'modules/' . $this->name . '/ps_searchbar.css');
        // $this->context->controller->registerJavascript('modules-searchbar', 'modules/' . $this->name . '/ps_searchbar.js', ['position' => 'bottom', 'priority' => 150]);
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

    protected function reloadContainer()
    {
        $sfContainer = SymfonyContainer::getInstance();
        $sfContainer->reset();
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

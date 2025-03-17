<?php
use PrestaShop\PrestaShop\Adapter\Search\SearchProductSearchProvider;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchQuery;
use PrestaShop\PrestaShop\Core\Product\Search\SortOrder;

class SearchController extends SearchControllerCore
{
    protected $location;
    protected $property_type;
    protected $min_surface;
    protected $max_price;

    // Définition des ID des caractéristiques à adapter selon ta BDD
    const FEATURE_LOCATION = 12; // ID de la feature "Localisation"
    const FEATURE_PROPERTY_TYPE = 15; // ID de la feature "Type de bien"
    const FEATURE_SURFACE = 18; // ID de la feature "Surface"

    /**
     * Initialise les variables de recherche
     */
    public function init()
    {
        parent::init();

        $this->location = Tools::getValue('location');
        $this->property_type = Tools::getValue('property_type');
        $this->min_surface = Tools::getValue('min_surface');
        $this->max_price = Tools::getValue('max_price');

        // Assigner les variables au template
        $this->context->smarty->assign([
            'search_string' => $this->search_string,
            'search_tag' => $this->search_tag,
            'location' => $this->location,
            'property_type' => $this->property_type,
            'min_surface' => $this->min_surface,
            'max_price' => $this->max_price,
        ]);
    }

    /**
     * Effectue la recherche des produits
     */
    public function initContent()
    {
        parent::initContent();
        $this->doProductSearch('catalog/listing/search', ['entity' => 'search']);
    }

    /**
     * Génère la requête de recherche avec les filtres supplémentaires
     *
     * @return ProductSearchQuery
     */
    protected function getProductSearchQuery()
    {
        $query = new ProductSearchQuery();
        $query
            ->setQueryType('search')
            ->setSortOrder(new SortOrder('product', 'position', 'desc'))
            ->setSearchString($this->search_string)
            ->setSearchTag($this->search_tag);

        $facets = [];

        // Filtrage par localisation
        if (!empty($this->location)) {
            $facets['id_feature_' . self::FEATURE_LOCATION] = $this->location;
        }

        // Filtrage par type de bien
        if (!empty($this->property_type)) {
            $facets['id_feature_' . self::FEATURE_PROPERTY_TYPE] = $this->property_type;
        }

        // Filtrage par surface minimum
        if (!empty($this->min_surface)) {
            $facets['id_feature_' . self::FEATURE_SURFACE] = '[' . (int)$this->min_surface . ',]';
        }

        // Filtrage par prix max
        if (!empty($this->max_price)) {
            $facets['price'] = '[,' . (float)$this->max_price . ']';
        }

        if (!empty($facets)) {
            $query->setEncodedFacets($facets);
        }

        return $query;
    }

    /**
     * Fournisseur de recherche avec prise en compte du prix max
     *
     * @return SearchProductSearchProvider
     */
    protected function getDefaultProductSearchProvider()
    {
        return new SearchProductSearchProvider($this->getTranslator());
    }

    /**
     * Label des résultats de recherche
     *
     * @return string
     */
    public function getListingLabel()
    {
        return $this->getTranslator()->trans('Search results', [], 'Shop.Theme.Catalog');
    }

    /**
     * Génère le fil d'Ariane
     *
     * @return array
     */
    public function getBreadcrumbLinks()
    {
        $breadcrumb = parent::getBreadcrumbLinks();
        $breadcrumb['links'][] = [
            'title' => $this->getTranslator()->trans('Search results', [], 'Shop.Theme.Catalog'),
            'url' => $this->getCurrentUrl(),
        ];
        return $breadcrumb;
    }
}

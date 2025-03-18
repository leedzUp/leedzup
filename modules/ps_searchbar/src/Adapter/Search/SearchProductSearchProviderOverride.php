<?php

namespace Ps_Searchbar\Search;

use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchProviderInterface;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchContext;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchQuery;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchResult;
use Search;
use Tools;
use Hook;

use Context; // Ajoute ça en haut du fichier
use PrestaShop\PrestaShop\Core\Product\Search\SortOrder;
use PrestaShop\PrestaShop\Core\Product\Search\FacetCollection;

class SearchProductSearchProviderOverride implements ProductSearchProviderInterface
{
    public function runQuery(ProductSearchContext $context, ProductSearchQuery $query)
    {
        $products = [];
        $count = 0;
    
        $searchString = $query->getSearchString() ?: Tools::getValue('search_query');
        $encodedFacets = $query->getEncodedFacets() ?: Tools::getAllValues();
    
        if (!$searchString && empty($encodedFacets)) {
            return new ProductSearchResult();
        }
    
        $legacyContext = Context::getContext();
    
        if (is_array($encodedFacets)) {
            $encodedFacets = json_encode($encodedFacets);
        }
    
        $result = Search::find(
            $legacyContext->language->id,
            $searchString,
            $query->getPage(),
            $query->getResultsPerPage(),
            $query->getSortOrder()->toLegacyOrderBy(),
            $query->getSortOrder()->toLegacyOrderWay(),
            false,
            false,
            $legacyContext,
            $encodedFacets
        );
    
        if (!$result || empty($result['result'])) {
            return new ProductSearchResult([], 0);
        }
    
        $products = $result['result'];
        $count = (int) $result['total'];
    
        // Ajout du tri
        $sortOrder = $query->getSortOrder() ?? new SortOrder('product', 'position', 'asc');
        $availableSortOrders = [
            new SortOrder('product', 'position', 'asc'),
            new SortOrder('product', 'name', 'asc'),
            new SortOrder('product', 'name', 'desc'),
            new SortOrder('product', 'price', 'asc'),
            new SortOrder('product', 'price', 'desc'),
        ];
    
        // Création de l'objet ProductSearchResult
        $searchResult = (new ProductSearchResult())
            ->setProducts($products)
            ->setTotalProductsCount($count)
            ->setAvailableSortOrders($availableSortOrders)
            ->setCurrentSortOrder($sortOrder)
            ->setFacetCollection(new FacetCollection()); // Ajouter les facettes ici

             // Récupérer les informations de pagination
        $currentPage = $query->getPage() ?: 1;
        $itemsPerPage = $query->getResultsPerPage() ?: 24;

        $pagination = [
            'page' => $currentPage,
            'items_per_page' => $itemsPerPage,
        ];

    
            Hook::exec('filterProductSearch', [
                'result' => $searchResult,
                'label' => 'Résultats de la recherche',
                'products' => $searchResult->getProducts(),
                'sort_orders' => $searchResult->getAvailableSortOrders(),
                'sort_selected' => $searchResult->getCurrentSortOrder(),
                'pagination' => $pagination, // 🔥 Ajoute la pagination ici !
                'rendered_facets' => '',
                'rendered_active_filters' => '',
                'js_enabled' => false,
                'current_url' => $_SERVER['REQUEST_URI'],
                'cookie' => Context::getContext()->cookie,
                'cart' => Context::getContext()->cart,
                'altern' => 2,
            ]);
            
    
        return $searchResult;
    }
}

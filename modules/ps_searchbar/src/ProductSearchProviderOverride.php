<?php

namespace ps_searchbar\Search;

use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchProvider;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchContext;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchQuery;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchResult;
use Search;

class ProductSearchProviderOverride extends ProductSearchProvider
{
    public function runQuery(ProductSearchContext $context, ProductSearchQuery $query)
    {
        $products = [];
        $count = 0;

        // Récupération des critères de recherche
        $searchString = $query->getSearchString();
        $encodedFacets = $query->getEncodedFacets(); // Récupération des filtres multicritères

        // Vérification si on a une recherche texte ou une recherche filtrée
        if (!$searchString && empty($encodedFacets)) {
            return new ProductSearchResult();
        }

        // Appel de la méthode modifiée de Search::find()
        $result = Search::find(
            $context->getIdLang(),
            $searchString, // Peut être null, la méthode doit le gérer
            $query->getPage(),
            $query->getResultsPerPage(),
            $query->getSortOrder()->toLegacyOrderBy(),
            $query->getSortOrder()->toLegacyOrderWay(),
            false, // $ajax
            false, // $use_cookie
            $context,
            $encodedFacets // Passage des critères multicritères
        );

        // Traitement des résultats
        if ($result && !empty($result['result'])) {
            $products = $result['result'];
            $count = (int) $result['total'];
        }

        return new ProductSearchResult($products, $count);
    }
}

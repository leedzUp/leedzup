<?php
class Search extends SearchCore
{
        /*
    * module: ps_searchbar
    * date: 2025-03-17 17:26:07
    * version: 2.1.3
    */
    public static function find(
            $id_lang,
            $expr,
            $page_number = 1,
            $page_size = 1,
            $order_by = 'id_product',
            $order_way = 'desc',
            $ajax = false,
            $use_cookie = true,
            Context $context = null,
            $encodedFacets = null // Ajout du paramètre pour les facettes
        ) {
            if (!$context) {
                $context = Context::getContext();
            }
    
            $db = Db::getInstance(_PS_USE_SQL_SLAVE_);
    
            if (empty($page_number)) {
                $page_number = 1;
            }
            if (empty($page_size)) {
                $page_size = 1;
            }
    
            if (!Validate::isOrderBy($order_by) || !Validate::isOrderWay($order_way)) {
                return false;
            }
    
            $foundProductIds = [];
    
            $facetConditions = [];



            //dump($encodedFacets);
            // "{"controller":"search","location":"espagne","property_type":"","min_surface":"","max_price":"100","isolang":"fr","id_lang":3}"
            //die();
            if (!empty($encodedFacets)) {
                $decodedFacets = json_decode($encodedFacets, true);
                if (is_array($decodedFacets)) {
                    foreach ($decodedFacets as $facet => $values) {
                        if (!empty($values)) {
                            if ($facet === 'max_price') {
                                $facetConditions[] = "product_shop.price <= " . (float) $values;
                            } elseif ($facet === 'min_surface') {
                                $facetConditions[] = "p.surface >= " . (int) $values;
                            } /*elseif ($facet === 'location' && is_array($values)) { // Vérifier si c'est un tableau
                                $safeValues = array_map('pSQL', $values);
                                if (!empty($safeValues)) {
                                    $facetConditions[] = "p.location IN ('" . implode("','", $safeValues) . "')";
                                }
                            } elseif ($facet === 'type' && is_array($values)) { // Vérifier si c'est un tableau
                                $safeValues = array_map('pSQL', $values);
                                if (!empty($safeValues)) {
                                    $facetConditions[] = "p.type IN ('" . implode("','", $safeValues) . "')";
                                }
                            }*/
                        }
                    }
                }
            }

           
    
            if (!empty($expr)) {
                $expressions = explode(';', $expr);
                foreach ($expressions as $expression) {
                    $words = Search::extractKeyWords($expression, $id_lang, false, $context->language->iso_code);
                    foreach ($words as $word) {
                        $sql = 'SELECT DISTINCT si.id_product 
                                FROM ' . _DB_PREFIX_ . 'search_word sw 
                                LEFT JOIN ' . _DB_PREFIX_ . 'search_index si ON sw.id_word = si.id_word 
                                LEFT JOIN ' . _DB_PREFIX_ . 'product_shop product_shop ON product_shop.id_product = si.id_product 
                                WHERE sw.id_lang = ' . (int) $id_lang . ' 
                                AND sw.id_shop = ' . $context->shop->id . ' 
                                AND product_shop.active = 1 
                                AND product_shop.visibility IN ("both", "search") 
                                AND sw.word LIKE "%' . pSQL($word) . '%"';
                        
                        $result = $db->executeS($sql, true, false);
                        if ($result) {
                            $foundProductIds = array_merge($foundProductIds, array_column($result, 'id_product'));
                        }
                    }
                }
            }
    
            $foundProductIds = array_unique($foundProductIds);

            
            if (empty($expr) && !empty($facetConditions)) {
                $facetSql = "SELECT p.id_product FROM " . _DB_PREFIX_ . "product p
                             INNER JOIN " . _DB_PREFIX_ . "product_shop product_shop 
                             ON product_shop.id_product = p.id_product
                             WHERE " . implode(" AND ", $facetConditions);
                $result = $db->executeS($facetSql, true, false);
                if ($result) {
                    $foundProductIds = array_column($result, 'id_product');
                }
            }

    
            if (empty($foundProductIds)) {
                return $ajax ? [] : ['total' => 0, 'result' => []];
            }
    
            $product_pool = ' IN (' . implode(',', $foundProductIds) . ') ';
            $sql = 'SELECT p.*, product_shop.*,
                    pl.description_short, pl.available_now, pl.available_later, pl.link_rewrite, pl.name,
                    image_shop.id_image, il.legend
                    FROM ' . _DB_PREFIX_ . 'product p
                    INNER JOIN ' . _DB_PREFIX_ . 'product_lang pl 
                    ON p.id_product = pl.id_product AND pl.id_lang = ' . (int) $id_lang . Shop::addSqlRestrictionOnLang('pl') . '
                    ' . Shop::addSqlAssociation('product', 'p') . '
                    LEFT JOIN ' . _DB_PREFIX_ . 'image_shop image_shop 
                    ON image_shop.id_product = p.id_product AND image_shop.cover=1 AND image_shop.id_shop=' . (int) $context->shop->id . '
                    LEFT JOIN ' . _DB_PREFIX_ . 'image_lang il 
                    ON image_shop.id_image = il.id_image AND il.id_lang = ' . (int) $id_lang . '
                    WHERE p.id_product ' . $product_pool . '
                    ORDER BY p.id_product DESC
                    LIMIT ' . (int) (($page_number - 1) * $page_size) . ', ' . (int) $page_size;
    
            $result = $db->executeS($sql);

            
    
            $total = count($foundProductIds);
    
            return ['total' => $total, 'result' => $result];
        }
    
    
}
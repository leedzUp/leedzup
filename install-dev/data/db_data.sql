SET SESSION sql_mode = '';
SET NAMES 'utf8mb4';

/* Insertion de types d'images */
INSERT INTO `PREFIX_image_type` (`name`, `width`, `height`, `products`, `categories`, `manufacturers`, `suppliers`, `stores`)
VALUES ('home_default', 250, 250, 1, 0, 0, 0, 0);

/* Mise à jour de la configuration */
UPDATE PREFIX_configuration SET value = '1' WHERE name = 'PS_SMARTY_FORCE_COMPILE';

/* Désactivation de certains onglets */
UPDATE PREFIX_tab SET active = '0' WHERE class_name IN (
    'AdminDashboard', 'AdminParentOrders', 'AdminOrders', 'AdminInvoices', 
    'AdminSlip', 'AdminDeliverySlip', 'AdminCarts', 'IMPROVE', 'CONFIGURE', 
    'AdminTracking', 'AdminParentCartRules', 'AdminCartRules', 
    'AdminSpecificPriceRule', 'AdminStockManagement', 'AdminStats', 
    'AdminAddresses', 'AdminReturn', 'AdminParentCustomer'
);

/* Modification de l'affichage des clients */
UPDATE PREFIX_tab SET id_parent = 2 WHERE class_name = 'AdminCustomers';
UPDATE PREFIX_tab SET icon = 'account_circle' WHERE class_name = 'AdminCustomers';

/* Modification de la catégorie d'accueil */
UPDATE PREFIX_category_lang 
SET name = 'Nos biens' 
WHERE name = 'Accueil' AND id_lang = 3;

UPDATE PREFIX_category_lang 
SET link_rewrite = 'nos-biens' 
WHERE link_rewrite = 'accueil' AND id_lang = 3;

/* Ajustements des poids de recherche */
UPDATE PREFIX_configuration 
SET value = 0 
WHERE name IN (
    'PS_SEARCH_WEIGHT_PNAME', 'PS_SEARCH_WEIGHT_REF', 'PS_SEARCH_WEIGHT_SHORTDESC', 
    'PS_SEARCH_WEIGHT_DESC', 'PS_SEARCH_WEIGHT_CNAME', 'PS_SEARCH_WEIGHT_MNAME', 
    'PS_SEARCH_WEIGHT_TAG', 'PS_SEARCH_WEIGHT_ATTRIBUTE'
);

UPDATE PREFIX_configuration SET value = 8 WHERE name = 'PS_SEARCH_WEIGHT_FEATURE';

/* Autres configurations */
UPDATE PREFIX_configuration SET value = 24 WHERE name = 'PS_PRODUCTS_PER_PAGE';
UPDATE PREFIX_currency SET precision = 0 WHERE iso_code = 'EUR';
UPDATE PREFIX_configuration SET value = 3 WHERE name = 'PS_LANG_DEFAULT';
UPDATE PREFIX_configuration SET value = 'fr' WHERE name = 'PS_LOCALE_LANGUAGE';

/* Mise à jour ou insertion des routes */
INSERT INTO PREFIX_configuration (name, value, id_shop_group, id_shop, date_add, date_upd) 
VALUES ('PS_ROUTE_product_rule', '{rewrite}-{id}{-:id_product_attribute}.html', NULL, NULL, NOW(), NOW())
ON DUPLICATE KEY UPDATE value = '{rewrite}-{id}{-:id_product_attribute}.html', date_upd = NOW();

INSERT INTO PREFIX_configuration (name, value, id_shop_group, id_shop, date_add, date_upd) 
VALUES ('PS_ROUTE_category_rule', '{rewrite}-{id}.htm', NULL, NULL, NOW(), NOW())
ON DUPLICATE KEY UPDATE value = '{rewrite}-{id}.htm', date_upd = NOW();

INSERT INTO PREFIX_configuration (name, value, id_shop_group, id_shop, date_add, date_upd) 
VALUES ('PS_ROUTE_cms_rule', '{rewrite}-{id}', NULL, NULL, NOW(), NOW())
ON DUPLICATE KEY UPDATE value = '{rewrite}-{id}', date_upd = NOW();

INSERT INTO PREFIX_configuration (name, value, id_shop_group, id_shop, date_add, date_upd) 
VALUES ('PS_ROUTE_cms_category_rule', 'category/{rewrite}-{id}', NULL, NULL, NOW(), NOW())
ON DUPLICATE KEY UPDATE value = 'category/{rewrite}-{id}', date_upd = NOW();

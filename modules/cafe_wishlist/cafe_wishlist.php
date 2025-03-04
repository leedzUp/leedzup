<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once __DIR__ . '/classes/CafeWishList.php';

class cafe_wishlist extends Module
{
    public function __construct()
    {
        $this->name = 'cafe_wishlist';
        $this->tab = 'others';
        $this->version = '1.0.0';
        $this->author = 'Alexandre Carette';
        $this->need_instance = 0;
        $this->bootstrap = true;
        parent::__construct();
        $this->displayName = $this->l('cafe_wishlist');
        $this->description = $this->l('Allow to add a wishlist functionnality');
        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
    }

    public function install()
    {
        $tab = new Tab();
        foreach (Language::getLanguages() as $language) {
            $tab->name[$language['id_lang']] = 'Wishlist Produit';
        }
        $tab->class_name = 'AdminCafeWishlist';
        $tab->module = $this->name;
        $idParent = (int)Tab::getIdFromClassName('AdminCatalog');
        $tab->id_parent = $idParent;
        $tab->position = Tab::getNbTabs($idParent);

        if (!$tab->save()) {
            return false;
        }

        if (!parent::install()
        || !$this->registerHook([
            'moduleRoutes',
            'displayProductCafeWishlist',
            'displayBeforeBodyClosingTag',
            'displayCustomerAccount',
            'displayProductListCafeWishlist',
            'displayHeader',
            'displayNav2'
        ])
        || !CafeWishList::installSql()
        ) {
            return false;
        }
        return true;
    }

    public function uninstall()
    {
        if (
            !parent::uninstall()
            || !CafeWishList::uninstallSql()
        ) {
            return false;
        }
        return true;
    }


    public function hookModuleRoutes()
    {
        return [
            'module-cafe-wishlist-display' => [
                'controller' => 'display',
                'rule' => 'wishlist/{id_customer}',
                'keywords' => [
                    'id_customer' => [
                        'regexp' => '[0-9]+',
                        'param' => 'id_customer',
                    ],
                ],
                'params' => [
                    'fc' => 'module',
                    'module' => 'cafe_wishlist',
                ],
            ],
        ];
    }

    /**
    * Display additional information inside the "my account" block
    *
    * @param array $params
    *
    * @return string
    */
    public function hookDisplayCustomerAccount(array $params)
    {
        // Récupérez l'ID du client connecté
        $id_customer = $this->context->customer->id;

        // Créez l'URL en ajoutant le paramètre id_customer
        $url = $this->context->link->getModuleLink('cafe_wishlist', 'display', array('id_customer' => $id_customer));

        $this->smarty->assign([
            'url' => $url,
        ]);

        return $this->fetch('module:cafe_wishlist/views/templates/hook/myaccount-block.tpl');
    }

    public function hookDisplayNav2(array $params)
    {
        // Récupérez l'ID du client connecté
        $id_customer = $this->context->customer->id;
        // Créez l'URL en ajoutant le paramètre id_customer
        $url = $this->context->link->getModuleLink('cafe_wishlist', 'display', array('id_customer' => $id_customer));
        $isCustomerLoggedIn = $this->context->customer->isLogged();
        $this->smarty->assign([
            'isCustomerLoggedIn' => $isCustomerLoggedIn,
            'url' => $url,
            'id_customer' => $id_customer,
        ]);

        return $this->fetch('module:cafe_wishlist/views/templates/hook/nav-block.tpl');
    }

    public function hookDisplayBeforeBodyClosingTag(array $params)
    {

        $_controller = $this->context->controller;


        if (isset($_controller->php_self) && $_controller->php_self == "category") {

            $isCustomerLoggedIn = $this->context->customer->isLogged();

            $id_product = Tools::getValue('id_category');

            $id_customer = $this->context->customer->id;

            //$ifExist = CafeWishList::exists($id_customer, $id_product);
            
    
            $this->context->smarty->assign(
                array(
                    'isCustomerLoggedIn' => $isCustomerLoggedIn,
                    'id_product' => $id_product,
                    'id_customer' => $id_customer,
                )
            );

                
         
            $output3 = $this->context->smarty->fetch('module:cafe_wishlist/views/templates/hook/list_footer_js.tpl');

            return $output3;

        

        } else {

            $isCustomerLoggedIn = $this->context->customer->isLogged();

            $this->context->smarty->assign(
                array(
                    'isCustomerLoggedIn' => $isCustomerLoggedIn,
                    'id_customer' => $this->context->customer->id,
                )
            );

            //$output = $this->context->smarty->fetch('module:cafe_wishlist/views/templates/hook/modal-list.tpl');
            //$output2 = $this->context->smarty->fetch('module:cafe_wishlist/views/templates/hook/list_footer_js.tpl');

            return false;

        }
    }

    // Fiche Produit
    public function hookDisplayProductCafeWishlist()
    {

        $ifExist = CafeWishList::exists($this->context->customer->id, Tools::getValue('id_product'));
        $isCustomerLoggedIn = $this->context->customer->isLogged();

        $this->context->smarty->assign(
            array(
                'id_product' => Tools::getValue('id_category'),
                'id_customer' => $this->context->customer->id,
                'ifExist' => $ifExist,
                'isCustomerLoggedIn' => $isCustomerLoggedIn,

            )
        );
        // Render the template and assign it to a variable

        $output = $this->context->smarty->fetch('module:cafe_wishlist/views/templates/hook/product_wishlist_button.tpl');
        // Return the output to be displayed
        return $output;
    }

    // Listing Produits
    public function hookDisplayProductListCafeWishlist(array $params)
    {


        $productId = $params['category']['id_category'];

        $ifExist = CafeWishList::exists($this->context->customer->id, $productId);
        
        $total_like = CafeWishList::totalLike($productId);

        $this->context->smarty->assign(
            array(
                'id_product' => $productId,
                'id_customer' => $this->context->customer->id,
                'ifExist' => $ifExist,
                'total_like' => $total_like,

            )
        );


        // Render the template and assign it to a variable
        $output = $this->context->smarty->fetch('module:cafe_wishlist/views/templates/hook/list_wishlist_button.tpl');

        // Return the output to be displayed
        return $output;
    }

    public function hookDisplayHeader($params)
    {
        $_controller = $this->context->controller;
        





    }

}

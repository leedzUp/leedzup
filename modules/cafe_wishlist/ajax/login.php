<?php

require_once(dirname(__FILE__) . '/../../../config/config.inc.php');
require_once(dirname(__FILE__) . '/../../../init.php');

require_once(dirname(__FILE__) . '/../classes/CafeWishList.php');

$response = array();

$context = Context::getContext();
$logged = $context->customer->isLogged();

if ($logged === false) {
    $email = Tools::getValue('email');
    $password = Tools::getValue('password');
    $id_product = Tools::getValue('id_product');
    $action = Tools::getValue('action');




    if (!$logged) {
        $email = Tools::getValue('email');
        $password = Tools::getValue('password');

        if (empty($email) || empty($password)) {
            $response['status'] = 'error';
            $response['error'] = 'Veuillez remplir tous les champs.';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;

        } elseif (!Validate::isEmail($email)) {
            $response['status'] = 'error';
            $response['error'] = 'Veuillez entrer une adresse e-mail valide.';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;

        } elseif (!Validate::isPasswd($password)) {
            $response['status'] = 'error';
            $response['error'] = 'Password non valide (5 caractères min.) !';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;

        } else {
            $hashedPassword = Tools::encrypt($password);
            $customer = new Customer();
            $authentication = $customer->getByEmail(trim($email), $password);

            // (1/1) InvalidArgumentException Cannot get customer by email as given password is not a valid password
            //need to show this in :
            //$response['status'] = 'error';
            //$response['error'] = 'Authentication failed';

            /* Handle brute force attacks */
            sleep(1);

            if (!$authentication) {

                $response['status'] = 'error';
                $response['error'] = 'Erreur d\'authentification: password ou email invalide !';
                header('Content-Type: application/json');
                echo json_encode($response);
                exit;

            } else {

                $authentication->logged = 1;
                $context->customer = $authentication;
                $context->cookie->id_customer = (int) $authentication->id;
                $context->cookie->customer_lastname = $authentication->lastname;
                $context->cookie->customer_firstname = $authentication->firstname;
                $context->cookie->logged = 1;
                $context->cookie->check_cgv = 1;
                $context->cookie->is_guest = false;
                $context->cookie->passwd = $authentication->passwd;
                $context->cookie->email = $authentication->email;

                $context->cookie->registerSession(new CustomerSession());

                if ($action =="goto-wishlist") {
                    $response['status'] = 'goto-wishlist';
                    $response['id_customer'] = $authentication->id;

                } else if ($action =="sign-in") {

                    // avant l'insert on veux savoir s'il n'y a pas une entrée similaire
                    // Check if there is already an existing alert with the same parameters
                    $existingWishlist = CafeWishList::exists(
                        $context->cookie->id_customer,
                        $id_product
                    );

                    $id_customer = $context->cookie->id_customer;

                    if (!$existingWishlist) {

                        $id_customer = $context->cookie->id_customer;

                        // Create a new alert if no similar alert exists
                        $newWishlist = new CafeWishList();
                        $newWishlist->id_customer = $id_customer;
                        $newWishlist->id_product = $id_product;
                        $newWishlist->add();
                        // Set success response
                        $response['status'] = 'success3';
                        $response['id_product'] = $id_product;
                        $response['id_customer'] = $id_customer;

                    } elseif ($existingWishlist) {
                        // Set error response
                        $response['status'] = 'success4';
                        $response['id_product'] = $id_product;
                        $response['id_customer'] = $id_customer;
                    }
                }
            }
        }
    } else {
        $response['error'] = 'Utilisateur déjà connecté.';
        header('Content-Type: application/json');
        echo json_encode($response);
        exit;
    }
    // Répondre en format JSON
    header('Content-Type: application/json');
    echo json_encode($response);
    exit;
}

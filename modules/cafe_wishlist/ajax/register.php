<?php

// Include necessary files
require_once(dirname(__FILE__) . '/../../../config/config.inc.php');
require_once(dirname(__FILE__) . '/../../../init.php');
require_once(dirname(__FILE__) . '/../classes/CafeWishList.php');

$response = array();

$context = Context::getContext();

// Check if the form was submitted
if (Tools::isSubmit('email') && Tools::isSubmit('password') && Tools::isSubmit('id_product') && Tools::isSubmit('lastname') && Tools::isSubmit('firstname')) {

    // Check if the customer is not already logged in
    $logged = $context->customer->isLogged();

    if (!$logged) {

        $lastname = Tools::getValue('lastname');
        $firstname = Tools::getValue('firstname');
        $email = Tools::getValue('email');
        $password = Tools::getValue('password');
        $id_product = (int) Tools::getValue('id_product');
        $newsletterCheckbox = Tools::getValue('newsletterCheckbox');
        $termsCheckbox = Tools::getValue('termsCheckbox');


        if ($termsCheckbox === "false") {
            $response['status'] = 'error';
            $response['error'] = 'Veuillez accepter les conditions générales et la politique de confidentialité';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
            
        } 


        // Validate the form data (you can add more validations here if needed)
        if (empty($email) || empty($password) || empty($lastname) || empty($firstname)) {
            $response['status'] = 'error';
            $response['error'] = 'Veuillez remplir tous les champs.';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        } else if (!Validate::isEmail($email)) {
            $response['status'] = 'error';
            $response['error'] = 'Veuillez entrer une adresse e-mail valide !';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
            
        } else if ($termsCheckbox == "false") {
            $response['status'] = 'error';
            $response['error'] = 'Veuillez accepter les conditions générales et la politique de confidentialité';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
            
        } else if (!Validate::isCustomerName($lastname) ||!Validate::isCustomerName($firstname) ) {
            $response['status'] = 'error';
            $response['error'] = 'Veuillez entrer un nom ou prénom valide !';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
            
        } else if (!Validate::isPasswd($password)) {
            $response['status'] = 'error';
            $response['error'] = 'Password non valide (5 caractères min.) !';
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;

        // On verifie si l'email existe deja en base de donnée
            
        } else {

            // Create the new customer
            $customer = new Customer();

            $authentication = $customer->getByEmail($email, $password);


            if ($authentication) {
                $response['status'] = 'error';
                $response['error'] = 'Erreur d\'authentification: l\'email existe déja en base de donnée';
                header('Content-Type: application/json');
                echo json_encode($response);
                exit;
            } else {
                $customer->firstname = $firstname;
                $customer->lastname = $lastname;
                $customer->email = $email;
                $customer->passwd = Tools::encrypt($password);
                $customer->active = 1;
                if ($newsletterCheckbox == true) {
                    $customer->newsletter = 1;
                } else {
                    $customer->newsletter = 0;
                }
                $customer->is_guest = 0;
                $customer->add();

                $customer = new Customer($customer->id);
                $authentication = $customer->getByEmail($email, $password);

                // Validate and add the customer to the database
            
                // Set customer information in the context and cookie
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

                // Before inserting, check if there is a similar entry
                // Check if there is already an existing alert with the same parameters
                $existingWishlist = CafeWishList::exists(
                    $context->cookie->id_customer,
                    $id_product
                );

                if (!$existingWishlist) {
                    // Create a new alert if no similar alert exists
                    $newWishlist = new CafeWishList();
                    $newWishlist->id_customer = $context->cookie->id_customer;
                    $newWishlist->id_product = $id_product;
                    $newWishlist->add();

                    // Set success response
                    $response['status'] = 'success3';
                    $response['id_product'] = $id_product;
                    $response['id_customer'] = $context->cookie->id_customer;
                } else {
                    // Set error response if the product is already in the wish list
                    $response['status'] = 'success4';
                    $response['id_product'] = $id_product;
                    $response['id_customer'] = $context->cookie->id_customer;
                }
            }
        }
    } else {
        $response['status'] = 'error';
        $response['error'] = 'Utilisateur déjà connecté.';
        header('Content-Type: application/json');
        echo json_encode($response);
        exit;
    }
} else {
    $response['status'] = 'error';
    $response['error'] = 'Formulaire non soumis correctement.'; // Provide a general error message if the form is not submitted correctly
    header('Content-Type: application/json');
    echo json_encode($response);
    exit;
}

// Respond in JSON format
header('Content-Type: application/json');
echo json_encode($response);
exit;

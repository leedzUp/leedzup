<?php

require_once dirname(__FILE__).'/../../config/config.inc.php';
require_once dirname(__FILE__).'/../../init.php';
require_once dirname(__FILE__).'/ps_facetedsearch.php';

$module = Module::getInstanceByName('ps_facetedsearch');

if ($module && method_exists($module, 'surfacesIndexProcess')) {
    $module->surfacesIndexProcess(0,true);
    echo "Indexation de la surface reconstruite avec succès.\n";
} else {
    echo "Erreur : La méthode surfacesIndexProcess() n'existe pas.\n";
}

if ($module && method_exists($module, 'roomsIndexProcess')) {
    $module->roomsIndexProcess(0,true);
    echo "Indexation de la room reconstruite avec succès.\n";
} else {
    echo "Erreur : La méthode roomsIndexProcess() n'existe pas.\n";
}



// set precision currency
$currency = Currency::getCurrencyInstance(1);
$currency->precision = 0;
$currency->update();

$currency = Currency::getCurrencyInstance(2);
$currency->precision = 0;
$currency->update();
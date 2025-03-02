<?php

require_once dirname(__FILE__).'/../../config/config.inc.php';
require_once dirname(__FILE__).'/../../init.php';
require_once dirname(__FILE__).'/ps_facetedsearch.php';

$module = Module::getInstanceByName('ps_facetedsearch');

if ($module && method_exists($module, 'indexSurfaces')) {
    $module->indexSurfaces(0,true);
    echo "Indexation de la surface reconstruite avec succès.\n";
} else {
    echo "Erreur : La méthode indexSurfaces() n'existe pas.\n";
}

if ($module && method_exists($module, 'indexRooms')) {
    $module->indexRooms(0,true);
    echo "Indexation de la room reconstruite avec succès.\n";
} else {
    echo "Erreur : La méthode indexRooms() n'existe pas.\n";
}




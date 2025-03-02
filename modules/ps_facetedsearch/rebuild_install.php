<?php

require_once dirname(__FILE__).'/../../config/config.inc.php';
require_once dirname(__FILE__).'/../../init.php';
require_once dirname(__FILE__).'/ps_facetedsearch.php';

$module = Module::getInstanceByName('ps_facetedsearch');

if ($module && method_exists($module, 'indexSurfacesUnbreakable')) {
    $module->indexSurfacesUnbreakable(0,true);
    echo "Indexation de la surface reconstruite avec succès.\n";
} else {
    echo "Erreur : La méthode indexSurfacesUnbreakable() n'existe pas.\n";
}

if ($module && method_exists($module, 'indexRoomsUnbreakable')) {
    $module->indexProductRooms(0,true);
    echo "Indexation de la room reconstruite avec succès.\n";
} else {
    echo "Erreur : La méthode indexRoomsUnbreakable() n'existe pas.\n";
}




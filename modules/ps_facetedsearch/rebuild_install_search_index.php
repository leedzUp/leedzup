<?php

require_once dirname(__FILE__).'/../../config/config.inc.php';
require_once dirname(__FILE__).'/../../init.php';

// Considering the indexing task can be really long, we ask the PHP process to not stop before 2 hours.
ini_set('max_execution_time', '7200');

$action = $argv[1] ?? null; // Récupère le premier argument passé en CLI

// Vérifie si le module existe avant de l'instancier
if (!class_exists('Ps_Facetedsearch')) {
    header('HTTP/1.1 500 Internal Server Error');
    header('Content-Type: application/json');
    die(json_encode(['error' => 'Module Ps_Facetedsearch not found']));
}

$module = new Ps_Facetedsearch();
Shop::setContext(Shop::CONTEXT_ALL);

switch ($action) {
    case 'indexSurfaces':
        $cursor = (int) Tools::getValue('cursor');
        $ajax = (bool) Tools::getValue('ajax');
        $full = (bool) Tools::getValue('full');

        $response = $full ?
            $module->fullSurfacesIndexProcess($cursor, $ajax, true) :
            $module->surfacesIndexProcess($cursor, $ajax);

        header('Content-Type: application/json');
        die(json_encode($response));

    case 'indexRooms':
        $cursor = (int) Tools::getValue('cursor');
        $ajax = (bool) Tools::getValue('ajax');
        $full = (bool) Tools::getValue('full');

        $response = $full ?
            $module->fullRoomsIndexProcess($cursor, $ajax, true) :
            $module->roomsIndexProcess($cursor, $ajax);

        header('Content-Type: application/json');
        die(json_encode($response));

    case 'indexFeatures':
        Shop::setContext(Shop::CONTEXT_ALL);

        $psFacetedsearch = new Ps_Facetedsearch();
        $psFacetedsearch->indexFeatures();

        header('Content-Type: application/json');
        die(json_encode($response));

    case 'clearCache':
        $psFacetedsearch = new Ps_Facetedsearch();
        $psFacetedsearch->ajaxRender($psFacetedsearch->invalidateLayeredFilterBlockCache());
        break;

    case 'indexPrices':
        Shop::setContext(Shop::CONTEXT_ALL);

        $module = new Ps_Facetedsearch();
        if (Tools::getValue('full')) {
            $module->ajaxRender($module->fullPricesIndexProcess((int) Tools::getValue('cursor'), (bool) Tools::getValue('ajax'), true));
        } else {
            $module->ajaxRender($module->pricesIndexProcess((int) Tools::getValue('cursor'), (bool) Tools::getValue('ajax')));
        }

        break;
    
    case 'indexProductsSearch':
        
        Search::indexation(1);

    default:
        header('HTTP/1.1 403 Forbidden');
        header('Content-Type: application/json');
        die(json_encode(['error' => 'Unknown action']));
}

<?php

require_once dirname(__FILE__) . '/../../config/config.inc.php';
require_once dirname(__FILE__) . '/../../init.php';

// Vider le cache Smarty
Context::getContext()->smarty->clearAllCache();
Context::getContext()->smarty->clearCompiledTemplate();

// Vider le cache XML et fichiers temporaires
Tools::clearXMLCache();
Media::clearCache();

// Supprimer les fichiers du cache
$cache_dirs = [
    _PS_CACHE_DIR_ . 'smarty/cache/',
    _PS_CACHE_DIR_ . 'smarty/compile/',
    _PS_CACHE_DIR_ . 'xml/',
    _PS_CACHE_DIR_ . 'cachefs/',
];

// Supprimer tous les fichiers du cache
foreach ($cache_dirs as $dir) {
    if (is_dir($dir)) {
        $files = glob($dir . '*'); 
        foreach ($files as $file) {
            if (is_file($file)) {
                @unlink($file);
            }
        }
    }
}

// Rafraîchir le cache d'indexation
Search::indexation(true);

echo "Cache vidé avec succès !";

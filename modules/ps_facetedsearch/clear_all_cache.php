<?php

require_once dirname(__FILE__) . '/../../config/config.inc.php';
require_once dirname(__FILE__) . '/../../init.php';

$id_meta = 9; // Remplace par l'ID de la page
$id_lang = 3; // ID de la langue

// Nouvelle URL réécrite
$new_url = 'plan-du-site';

// Récupération de l'objet Meta
$meta = new Meta($id_meta);
$meta->url_rewrite[$id_lang] = $new_url;

if ($meta->update()) {
    echo "Mise à jour réussie !";
} else {
    echo "Échec de la mise à jour.";
}

echo "Meta succès ! \n";



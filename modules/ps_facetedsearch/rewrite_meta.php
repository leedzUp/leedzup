<?php

require_once dirname(__FILE__) . '/../../config/config.inc.php';
require_once dirname(__FILE__) . '/../../init.php';

$context = Context::getContext();
$languages = $context->language->getLanguages();

// Définition des données à insérer pour chaque page
$meta_data = [
    // ID 1 - 404 error pages
    [ 'id_meta' => 1, 'id_shop' => 1, 'id_lang' => 1, 'title' => '404 error', 'description' => 'This page cannot be found', 'url_rewrite' => 'page-not-found' ],
    [ 'id_meta' => 1, 'id_shop' => 1, 'id_lang' => 2, 'title' => 'Error 404', 'description' => 'No se encuentra esta página', 'url_rewrite' => 'error-404' ],
    [ 'id_meta' => 1, 'id_shop' => 1, 'id_lang' => 3, 'title' => 'Erreur 404', 'description' => 'Cette page est introuvable', 'url_rewrite' => 'erreur-404' ],
    [ 'id_meta' => 1, 'id_shop' => 1, 'id_lang' => 4, 'title' => '404-Fehler', 'description' => 'Diese Seite kann nicht gefunden werden', 'url_rewrite' => '404-fehler' ],
    [ 'id_meta' => 1, 'id_shop' => 1, 'id_lang' => 5, 'title' => '404 fout', 'description' => 'Deze pagina kan niet worden gevonden', 'url_rewrite' => '404-fout' ],
    [ 'id_meta' => 1, 'id_shop' => 1, 'id_lang' => 6, 'title' => '404 błąd', 'description' => 'Nie można znaleźć tej strony', 'url_rewrite' => '404-blad' ],
    
    // ID 9 - Sitemap pages
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 1, 'title' => 'Sitemap', 'description' => 'Lost ? Find what your are looking for', 'url_rewrite' => 'sitemap' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 2, 'title' => 'Mapa del sitio', 'description' => '¿Perdido? Encuentre lo que busca', 'url_rewrite' => 'mapa-del-sitio' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 3, 'title' => 'Plan du site', 'description' => 'Perdu ? Trouvez ce que vous cherchez', 'url_rewrite' => 'plan-du-site' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 4, 'title' => 'Inhaltsverzeichnis', 'description' => 'Verloren ? Finden Sie was Sie suchen', 'url_rewrite' => 'inhaltsverzeichnis' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 5, 'title' => 'Sitemap', 'description' => 'Verloren ? Vind wat u zoekt', 'url_rewrite' => 'sitemap' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 6, 'title' => 'Sitemap', 'description' => 'Zagubiony ? Znajdź to, czego szukasz', 'url_rewrite' => 'sitemap' ],
    
    // ID 4 - Voguimmo real estate pages
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 1, 'title' => 'Voguimmo - Real estate in Alicante, it\'s here!', 'description' => 'Voguimmo brings you the best real estate options in Alicante.', 'url_rewrite' => 'real-estate-alicante' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 2, 'title' => 'Voguimmo - Inmobiliaria en Alicante, ¡ya está aquí!', 'description' => 'Voguimmo te ofrece las mejores opciones inmobiliarias en Alicante.', 'url_rewrite' => 'inmobiliaria-alicante' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 3, 'title' => 'Voguimmo - L’immobilier à Alicante, c’est ici !', 'description' => 'Voguimmo vous propose les meilleures options immobilières à Alicante.', 'url_rewrite' => 'immobilier-alicante' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 4, 'title' => 'Voguimmo - Immobilien in Alicante gibt es hier!', 'description' => 'Voguimmo bietet dir die besten Immobilienoptionen in Alicante.', 'url_rewrite' => 'immobilien-alicante' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 5, 'title' => 'Voguimmo - Onroerend goed in Alicante, hier is het!', 'description' => 'Voguimmo biedt de beste vastgoedopties in Alicante.', 'url_rewrite' => 'onroerend-goed-alicante' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 6, 'title' => 'Voguimmo - Nieruchomości w Alicante, to tutaj!', 'description' => 'Voguimmo oferuje najlepsze opcje nieruchomości w Alicante.', 'url_rewrite' => 'nieruchomosci-alicante' ],
];

foreach ($meta_data as $data) {
    // Récupération de l'objet Meta
    $meta = new Meta((int)$data['id_meta'], (int)$data['id_lang']);
    
    // Mise à jour des champs
    $meta->id_shop = (int)$data['id_shop'];
    $meta->title = $data['title'];
    $meta->description = $data['description'];
    $meta->url_rewrite = $data['url_rewrite'];

    // Mise à jour de l'objet Meta
    if ($meta->update()) {
        echo "Mise à jour réussie pour l'ID meta {$data['id_meta']} et la langue {$data['id_lang']} !<br>";
    } else {
        echo "Échec de la mise à jour pour l'ID meta {$data['id_meta']} et la langue {$data['id_lang']}.<br>";
    }
}

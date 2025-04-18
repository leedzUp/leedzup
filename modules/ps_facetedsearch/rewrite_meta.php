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
    // English (United Kingdom)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 7,
        'title' => '404 error',
        'description' => 'This page cannot be found',
        'url_rewrite' => 'page-not-found'
    ],
    // Finnish
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 8,
        'title' => '404 virhe',
        'description' => 'Tätä sivua ei löydy',
        'url_rewrite' => '404-virhe'
    ],
    // Bokmål (Norwegian)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 9,
        'title' => '404 feil',
        'description' => 'Denne siden kan ikke finnes',
        'url_rewrite' => '404-feil'
    ],
    // Italian (Italian)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 10,
        'title' => 'Errore 404',
        'description' => 'Questa pagina non può essere trovata',
        'url_rewrite' => 'errore-404'
    ],
    // Portuguese PT (Portuguese)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 11,
        'title' => 'Erro 404',
        'description' => 'Esta página não pode ser encontrada',
        'url_rewrite' => 'erro-404'
    ],
    // Swedish (Svenska)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 12,
        'title' => '404 fel',
        'description' => 'Den här sidan kan inte hittas',
        'url_rewrite' => '404-fel'
    ],
    // Danish (Dansk)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 13,
        'title' => '404 fejl',
        'description' => 'Denne side kan ikke findes',
        'url_rewrite' => '404-fejl'
    ],
    // Romanian (Română)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 14,
        'title' => 'Eroare 404',
        'description' => 'Această pagină nu poate fi găsită',
        'url_rewrite' => 'eroare-404'
    ],
    // Russian (Русский)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 15,
        'title' => 'Ошибка 404',
        'description' => 'Эта страница не найдена',
        'url_rewrite' => 'oshibka-404'
    ],
    // Ukrainian (Українська)
    [
        'id_meta' => 1,
        'id_shop' => 1,
        'id_lang' => 16,
        'title' => 'Помилка 404',
        'description' => 'Цю сторінку не знайдено',
        'url_rewrite' => 'pomilka-404'
    ],

    // ID 9 - Sitemap pages
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 1, 'title' => 'Sitemap', 'description' => 'Lost ? Find what your are looking for', 'url_rewrite' => 'sitemap' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 2, 'title' => 'Mapa del sitio', 'description' => '¿Perdido? Encuentre lo que busca', 'url_rewrite' => 'mapa-del-sitio' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 3, 'title' => 'Plan du site', 'description' => 'Perdu ? Trouvez ce que vous cherchez', 'url_rewrite' => 'plan-du-site' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 4, 'title' => 'Inhaltsverzeichnis', 'description' => 'Verloren ? Finden Sie was Sie suchen', 'url_rewrite' => 'inhaltsverzeichnis' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 5, 'title' => 'Sitemap', 'description' => 'Verloren ? Vind wat u zoekt', 'url_rewrite' => 'sitemap' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 6, 'title' => 'Sitemap', 'description' => 'Zagubiony ? Znajdź to, czego szukasz', 'url_rewrite' => 'sitemap' ],
    // English (United Kingdom)
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 7,
        'title' => 'Sitemap',
        'description' => 'Lost? Find what you are looking for',
        'url_rewrite' => 'sitemap'
    ],
    // Finnish
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 8,
        'title' => 'Sivukartta',
        'description' => 'Kadonnut? Löydä etsimäsi',
        'url_rewrite' => 'sivukartta'
    ],
    // Norwegian Bokmål
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 9,
        'title' => 'Sitemap',
        'description' => 'Lost? Find what you are looking for',
        'url_rewrite' => 'sitemap'
    ],
    // Italian
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 10,
        'title' => 'Mappa del sito',
        'description' => 'Perso? Trova quello che stai cercando',
        'url_rewrite' => 'mappa-del-sito'
    ],
    // Portuguese PT
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 11,
        'title' => 'Mapa do site',
        'description' => 'Perdido? Encontre o que está procurando',
        'url_rewrite' => 'mapa-do-site'
    ],
    // Swedish
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 12,
        'title' => 'Sitemap',
        'description' => 'Lost? Find what you are looking for',
        'url_rewrite' => 'sitemap'
    ],
    // Danish
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 13,
        'title' => 'Sitemap',
        'description' => 'Lost? Find what you are looking for',
        'url_rewrite' => 'sitemap'
    ],
    // Romanian
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 14,
        'title' => 'Hartă site',
        'description' => 'Pierdut? Găsește ce cauți',
        'url_rewrite' => 'harta-site'
    ],
    // Russian
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 15,
        'title' => 'Карта сайта',
        'description' => 'Потерялись? Найдите то, что ищете',
        'url_rewrite' => 'karta-sajta'
    ],
    // Ukrainian
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 16,
        'title' => 'Карта сайту',
        'description' => 'Загубились? Знайдіть те, що шукаєте',
        'url_rewrite' => 'karta-sajtu'
    ],
    // ID 4 - Voguimmo real estate pages
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 1, 'title' => ' Real estate in Alicante, it\'s here!', 'description' => 'Our real estate agency brings you the best real estate options in Alicante.', 'url_rewrite' => '' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 2, 'title' => 'Inmobiliaria en Alicante, ¡ya está aquí!', 'description' => 'Te ofrece las mejores opciones inmobiliarias en Alicante.', 'url_rewrite' => '' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 3, 'title' => 'Agence Immo - L’immobilier à Alicante, c’est ici !', 'description' => 'Notre agence vous propose les meilleures options immobilières à Alicante.', 'url_rewrite' => '' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 4, 'title' => 'Immobilien in Alicante gibt es hier!', 'description' => 'Bietet dir die besten Immobilienoptionen in Alicante.', 'url_rewrite' => '' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 5, 'title' => 'Onroerend goed in Alicante, hier is het!', 'description' => 'Biedt de beste vastgoedopties in Alicante.', 'url_rewrite' => '' ],
    [ 'id_meta' => 4, 'id_shop' => 1, 'id_lang' => 6, 'title' => 'Nieruchomości w Alicante, to tutaj!', 'description' => 'Oferuje najlepsze opcje nieruchomości w Alicante.', 'url_rewrite' => '' ],
    // English (United Kingdom)
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 7, 
        'title' => 'Real estate in Alicante, it\'s here!', 
        'description' => 'We brings you the best real estate options in Alicante.', 
        'url_rewrite' => '' 
    ],
    // Finnish
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 8, 
        'title' => 'Kiinteistöt Alicantessa, täällä se on!', 
        'description' => 'tuo sinulle parhaat kiinteistövaihtoehdot Alicantessa.', 
        'url_rewrite' => '' 
    ],
    // Norwegian Bokmål
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 9, 
        'title' => 'Eiendom i Alicante, det er her!', 
        'description' => 'gir deg de beste eiendomsmulighetene i Alicante.', 
        'url_rewrite' => '' 
    ],
    // Italian
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 10, 
        'title' => 'Immobili a Alicante, è qui!', 
        'description' => 'ti offre le migliori opzioni immobiliari a Alicante.', 
        'url_rewrite' => '' 
    ],
    // Portuguese PT
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 11, 
        'title' => 'Imóveis em Alicante, está aqui!', 
        'description' => 'traz as melhores opções imobiliárias em Alicante.', 
        'url_rewrite' => '' 
    ],
    // Swedish
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 12, 
        'title' => 'Fastigheter i Alicante, här är det!', 
        'description' => 'erbjuder de bästa fastighetsalternativen i Alicante.', 
        'url_rewrite' => '' 
    ],
    // Danish
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 13, 
        'title' => 'Ejendom i Alicante, her er det!', 
        'description' => 'tilbyder de bedste ejendomsmuligheder i Alicante.', 
        'url_rewrite' => '' 
    ],
    // Romanian
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 14, 
        'title' => 'Imobiliare în Alicante, este aici!', 
        'description' => 'îți aduce cele mai bune opțiuni imobiliare din Alicante.', 
        'url_rewrite' => '' 
    ],
    // Russian
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 15, 
        'title' => 'Недвижимость в Аликанте, это здесь!', 
        'description' => 'предлагает вам лучшие варианты недвижимости в Аликанте.', 
        'url_rewrite' => '' 
    ],
    // Ukrainian
    [ 
        'id_meta' => 4, 
        'id_shop' => 1, 
        'id_lang' => 16, 
        'title' => 'Нерухомість в Аліканте, ось тут!', 
        'description' => 'пропонує найкращі варіанти нерухомості в Аліканте.', 
        'url_rewrite' => '' 
    ],

];

foreach ($meta_data as $data) {
    // Récupération de l'objet Meta
    $meta = new Meta((int)$data['id_meta'], (int)$data['id_lang']);

    // Mise à jour des champs
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

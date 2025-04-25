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
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 2, 'title' => 'Mapa del sitio', 'description' => '¿Perdido? Encuentre lo que busca', 'url_rewrite' => 'sitemap' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 3, 'title' => 'Plan du site', 'description' => 'Perdu ? Trouvez ce que vous cherchez', 'url_rewrite' => 'sitemap' ],
    [ 'id_meta' => 9, 'id_shop' => 1, 'id_lang' => 4, 'title' => 'Inhaltsverzeichnis', 'description' => 'Verloren ? Finden Sie was Sie suchen', 'url_rewrite' => 'sitemap' ],
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
        'url_rewrite' => 'sitemap'
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
        'url_rewrite' => 'sitemap'
    ],
    // Portuguese PT
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 11,
        'title' => 'Mapa do site',
        'description' => 'Perdido? Encontre o que está procurando',
        'url_rewrite' => 'sitemap'
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
        'url_rewrite' => 'sitemap'
    ],
    // Russian
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 15,
        'title' => 'Карта сайта',
        'description' => 'Потерялись? Найдите то, что ищете',
        'url_rewrite' => 'sitemap'
    ],
    // Ukrainian
    [
        'id_meta' => 9,
        'id_shop' => 1,
        'id_lang' => 16,
        'title' => 'Карта сайту',
        'description' => 'Загубились? Знайдіть те, що шукаєте',
        'url_rewrite' => 'sitemap'
    ],

    // SEO HOMEPAGE - Mots clefs cible Immobilier Alicante
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 1, 'title' => 'Real Estate in Alicante – Second Home for Sale in Spain',                 'description' => 'Our real estate agency brings you the best real estate options in Alicante.',      'url_rewrite' => '' ],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 2, 'title' => 'Inmobiliaria en Alicante – Segunda residencia en venta en España',        'description' => 'Descubre las mejores oportunidades inmobiliarias en Alicante con nosotros.',       'url_rewrite' => '' ],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 3, 'title' => 'Immobilier Alicante – Résidence secondaire à vendre en Espagne',          'description' => 'Trouvez votre maison idéale à Alicante grâce à notre sélection d\'annonces.',      'url_rewrite' => '' ],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 4, 'title' => 'Immobilien in Alicante – Zweitwohnsitz zu verkaufen in Spanien',          'description' => 'Finden Sie Ihre Traumimmobilie in Alicante – wir bieten die besten Angebote.',           'url_rewrite' => '' ],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 5, 'title' => 'Onroerend goed in Alicante – Betaalbare huizen te koop in Spanje',        'description' => 'Ontdek betaalbare woningen en topvastgoed in Alicante met onze makelaars.',                           'url_rewrite' => '' ],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 6, 'title' => 'Agencja nieruchomości Alicante Tanie domy Hiszpania',                     'description' => 'Znajdź idealny dom w Alicante – najlepsze oferty nieruchomości w Hiszpanii.',                     'url_rewrite' => '' ],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 7,  'title' => 'Real Estate Agency in Alicante – Cheap Houses for Sale in Spain',        'description' => 'Find your dream property in Alicante with the best real estate deals in Spain.',               'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 8,  'title' => 'Kiinteistönvälitys Alicante – Edullisia asuntoja Espanjassa',            'description' => 'Löydä unelmiesi koti Alicantesta – parhaat kiinteistötarjoukset Espanjassa.',               'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 9,  'title' => 'Eiendomsmegler i Alicante – Rimelige boliger i Spania',                  'description' => 'Finn drømmeboligen din i Alicante – vi tilbyr de beste eiendomsmulighetene.',                     'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 10, 'title' => 'Agenzia immobiliare ad Alicante – Case economiche in vendita in Spagna', 'description' => 'Scopri le migliori case in vendita ad Alicante con la nostra agenzia.',                'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 11, 'title' => 'Imobiliária em Alicante – Casas baratas à venda na Espanha',             'description' => 'Encontre casas acessíveis em Alicante com as melhores ofertas do mercado.',                   'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 12, 'title' => 'Fastighetsbyrå i Alicante – Billiga hus till salu i Spanien',            'description' => 'Hitta ditt nya hem i Alicante – vi har de bästa fastighetsalternativen.',                'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 13, 'title' => 'Ejendomsmægler i Alicante – Billige huse til salg i Spanien',            'description' => 'Find din drømmebolig i Alicante – vi tilbyder de bedste muligheder.',                   'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 14, 'title' => 'Agent imobiliar Alicante Case ieftine Spania',                           'description' => 'Găsește cele mai bune oferte imobiliare din Alicante pentru a doua ta casă.',             'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 15, 'title' => 'Недвижимость в Аликанте – Дешёвые дома на продажу в Испании',            'description' => 'Найдите лучшие предложения недвижимости в Аликанте с нашей помощью.',             'url_rewrite' => ''],
    ['id_meta' => 4, 'id_shop' => 1, 'id_lang' => 16, 'title' => 'Нерухомість в Аліканте – Дешеві будинки на продаж в Іспанії',             'description' => 'Знайдіть доступне житло в Аліканте – вигідні пропозиції від нашої агенції.',                  'url_rewrite' => '']

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

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


// Données de traduction à insérer
$translations = [
    [
        'id_lang' => 1,
        'key' => 'home_hat',
        'translation' => 'Since 2004, <span ><strong>our real estate agency in Alicante</strong></span> has been putting its <strong>local expertise</strong> at the service of your <strong>real estate project in Alicante</strong>. Discover the best <strong>homes for sale in Spain</strong>, carefully selected to make your <strong>second home</strong> a sunny reality.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 2,
        'key' => 'home_hat',
        'translation' => 'Desde 2004, <span ><strong>nuestra inmobiliaria en Alicante</strong></span> pone su <strong>experiencia local</strong> al servicio de tu proyecto <strong>inmobiliario en Alicante</strong>. Descubre las mejores <strong>casas en venta en España</strong>, seleccionadas para convertir tu <strong>segunda residencia</strong> en una realidad soleada.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 3,
        'key' => 'home_hat',
        'translation' => 'Depuis 2004, <span ><strong>notre agence immobilière à Alicante</strong></span> met son <strong>expertise locale</strong> au service de votre projet <strong>immobilier à Alicante</strong>. Découvrez les meilleures <strong>maisons à vendre en Espagne</strong>, sélectionnées selon vos critères pour faire de votre <strong>résidence secondaire</strong> une réalité ensoleillée.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 4,
        'key' => 'home_hat',
        'translation' => 'Seit 2004 stellt <span ><strong>unsere Immobilienagentur in Alicante</strong></span> ihre <strong>lokale Expertise</strong> in den Dienst Ihres <strong>Immobilienprojekts in Alicante</strong>. Entdecken Sie die besten <strong>Häuser zum Verkauf in Spanien</strong>, ausgewählt nach Ihren Wünschen für ein <strong>sonniges Zweitwohnsitz</strong>.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 5,
        'key' => 'home_hat',
        'translation' => 'Sinds 2004 stelt <span ><strong>ons vastgoedkantoor in Alicante</strong></span> zijn <strong>lokale expertise</strong> ten dienste van uw <strong>vastgoedproject in Alicante</strong>. Ontdek de beste <strong>huizen te koop in Spanje</strong>, geselecteerd volgens uw wensen voor een zonnige <strong>tweede verblijfplaats</strong>.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 6,
        'key' => 'home_hat',
        'translation' => 'Od 2004 roku <span ><strong>nasze biuro nieruchomości w Alicante</strong></span> wykorzystuje swoje <strong>lokalne doświadczenie</strong> w realizacji Twojego <strong>projektu nieruchomości w Alicante</strong>. Odkryj najlepsze <strong>domy na sprzedaż w Hiszpanii</strong>, wybrane według Twoich kryteriów, by spełnić marzenie o <strong>drugim domu w słońcu</strong>.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 7,
        'key' => 'home_hat',
        'translation' => 'Since 2004, <span ><strong>our Alicante real estate agency</strong></span> has used its <strong>local expertise</strong> to help you with your <strong>property project in Alicante</strong>. Browse the top <strong>homes for sale in Spain</strong>, selected to turn your <strong>second home dream</strong> into a sunny reality.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 8,
        'key' => 'home_hat',
        'translation' => 'Vuodesta 2004 lähtien <span ><strong>kiinteistönvälitystoimistomme Alicantessa</strong></span> on käyttänyt <strong>paikallista asiantuntemustaan</strong> tukenasi <strong>asuntohankkeessasi Alicantessa</strong>. Löydä parhaat <strong>asunnot myytävänä Espanjassa</strong> ja toteuta unelmasi <strong>aurinkoisesta kakkoskodista</strong>.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 9,
        'key' => 'home_hat',
        'translation' => 'Siden 2004 har <span ><strong>vårt eiendomsmeglerkontor i Alicante</strong></span> brukt sin <strong>lokale ekspertise</strong> til å hjelpe deg med ditt <strong>eiendomsprosjekt i Alicante</strong>. Finn de beste <strong>boligene til salgs i Spania</strong>, tilpasset dine ønsker – for et <strong>solfylt hjem nummer to</strong>.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 10,
        'key' => 'home_hat',
        'translation' => 'Dal 2004, <span ><strong>la nostra agenzia immobiliare ad Alicante</strong></span> mette la sua <strong>esperienza locale</strong> al servizio del tuo <strong>progetto immobiliare ad Alicante</strong>. Scopri le migliori <strong>case in vendita in Spagna</strong>, selezionate per trasformare la tua <strong>seconda casa</strong> in una realtà al sole.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 11,
        'key' => 'home_hat',
        'translation' => 'Desde 2004, <span ><strong>nossa imobiliária em Alicante</strong></span> oferece sua <strong>experiência local</strong> para o seu <strong>projeto imobiliário em Alicante</strong>. Descubra as melhores <strong>casas à venda na Espanha</strong>, selecionadas para transformar sua <strong>segunda residência</strong> em uma realidade ensolarada.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 12,
        'key' => 'home_hat',
        'translation' => 'Sedan 2004 har <span ><strong>vår fastighetsbyrå i Alicante</strong></span> använt sin <strong>lokala expertis</strong> för att hjälpa dig med ditt <strong>bostadsprojekt i Alicante</strong>. Utforska de bästa <strong>husen till salu i Spanien</strong> – ditt <strong>andra hem</strong> i solen väntar.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 13,
        'key' => 'home_hat',
        'translation' => 'Siden 2004 har <span ><strong>vores ejendomsmægler i Alicante</strong></span> brugt sin <strong>lokale ekspertise</strong> til at hjælpe med dit <strong>boligprojekt i Alicante</strong>. Se de bedste <strong>huse til salg i Spanien</strong>, nøje udvalgt til din <strong>solrige bolig nr. to</strong>.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 14,
        'key' => 'home_hat',
        'translation' => 'Din 2004, <span ><strong>agenția noastră imobiliară din Alicante</strong></span> îți oferă <strong>expertiză locală</strong> pentru proiectul tău <strong>imobiliar în Alicante</strong>. Descoperă cele mai bune <strong>case de vânzare în Spania</strong> și transformă-ți <strong>casa de vacanță</strong> într-o realitate însorită.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 15,
        'key' => 'home_hat',
        'translation' => 'С 2004 года <span ><strong>наше агентство недвижимости в Аликанте</strong></span> предлагает свою <strong>локальную экспертизу</strong> для вашего <strong>проекта недвижимости в Аликанте</strong>. Откройте для себя лучшие <strong>дома на продажу в Испании</strong> и воплотите в жизнь свою мечту о <strong>втором доме на солнце</strong>.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ],

    [
        'id_lang' => 16,
        'key' => 'home_hat',
        'translation' => 'З 2004 року <span ><strong>наша агенція нерухомості в Аліканте</strong></span> використовує свій <strong>локальний досвід</strong> для вашого <strong>проєкту з нерухомості в Аліканте</strong>. Дивіться найкращі <strong>будинки на продаж в Іспанії</strong> і втільте мрію про <strong>другий дім на сонці</strong> в реальність.',
        'domain' => 'ShopThemeAlmodovar',
        'theme' => 'almodovar'
    ]
];

foreach ($translations as $translation) {
    // Vérifier si la traduction existe déjà
    $existing = Db::getInstance()->getValue('
        SELECT id_translation 
        FROM '._DB_PREFIX_.'translation 
        WHERE id_lang = '.(int)$translation['id_lang'].'
        AND `key` = "'.pSQL($translation['key']).'"
        AND domain = "'.pSQL($translation['domain']).'"
        AND theme = "'.pSQL($translation['theme']).'"
    ');

    if ($existing) {
        // Mise à jour si existe déjà
        $result = Db::getInstance()->update('translation', [
            'translation' => pSQL($translation['translation'], true)
        ], 'id_translation = '.(int)$existing);
        
        echo $result 
            ? "Traduction mise à jour pour la langue ID ".$translation['id_lang']."\n"
            : "Erreur lors de la mise à jour pour la langue ID ".$translation['id_lang']."\n";
    } else {
        // Insertion si n'existe pas
        $result = Db::getInstance()->insert('translation', [
            'id_lang' => (int)$translation['id_lang'],
            'key' => pSQL($translation['key']),
            'translation' => pSQL($translation['translation'], true),
            'domain' => pSQL($translation['domain']),
            'theme' => pSQL($translation['theme'])
        ]);
        
        echo $result 
            ? "Nouvelle traduction insérée pour la langue ID ".$translation['id_lang']."\n"
            : "Erreur lors de l'insertion pour la langue ID ".$translation['id_lang']."\n";
    }
}

echo "Import des traductions terminé.\n";
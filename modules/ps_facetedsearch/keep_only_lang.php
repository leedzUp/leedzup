<?php

require_once dirname(__FILE__) . '/../../config/config.inc.php';
require_once dirname(__FILE__) . '/../../init.php';

use PrestaShop\PrestaShop\Adapter\Entity\Language;
use PrestaShop\PrestaShop\Adapter\Entity\Configuration;

// Vérification de l’argument
if ($argc < 2) {
    echo "❌ Usage : php keep_only_lang.php [id_lang_to_keep]\n";
    exit(1);
}

$idLangToKeep = (int) $argv[1];

$langToKeep = new Language($idLangToKeep);
if (!Validate::isLoadedObject($langToKeep)) {
    echo "❌ Langue introuvable avec ID : $idLangToKeep\n";
    exit(1);
}

$languages = Language::getLanguages(false);

foreach ($languages as $lang) {
    $idLang = (int) $lang['id_lang'];

    if ($idLang !== $idLangToKeep) {
        // Vérifie si c’est la langue par défaut actuelle
        if ((int) Configuration::get('PS_LANG_DEFAULT') === $idLang) {
            Configuration::updateValue('PS_LANG_DEFAULT', $idLangToKeep);
            echo "✅ Langue par défaut changée vers ID : $idLangToKeep\n";
        }

        $language = new Language($idLang);
        if ($language->delete()) {
            echo "✅ Langue supprimée : " . $lang['iso_code'] . " (ID $idLang)\n";
        } else {
            echo "❌ Échec suppression langue : " . $lang['iso_code'] . " (ID $idLang)\n";
        }
    } else {
        echo "⏩ Langue conservée : " . $lang['iso_code'] . " (ID $idLang)\n";
    }
}

<?php
/**
 * 2024 CODEMYSHOP.COM
 * NOTICE OF LICENSE
 * This file is licensed under the Software License Agreement.
 * With the purchase or the installation of the software in your application,
 * you accept the license agreement.
 *
 * @author CODEMYSHOP.COM
 * @copyright 2024 CODEMYSHOP.COM
 * @license Commercial license (You cannot resell or redistribute this software.)
 */
if (!defined('_PS_VERSION_')) {
    exit;
}
class Link extends LinkCore
{
    protected function getLangLink($idLang = null, Context $context = null, $idShop = null)
    {
        static $psRewritingSettings = null;
        if ($psRewritingSettings === null) {
            $psRewritingSettings = (int) Configuration::get('PS_REWRITING_SETTINGS', null, null, $idShop);
        }
    
        if (!$context) {
            $context = Context::getContext();
        }
    
        // Récupère l'ID de la langue par défaut
        $defaultLangId = (int) Configuration::get('PS_LANG_DEFAULT');
        
        // Conditions où on ne veut pas de préfixe de langue
        if ((!$this->allow && in_array($idShop, [$context->shop->id, null])) || !Language::isMultiLanguageActivated($idShop) || !$psRewritingSettings) {
            return '';
        }
    
        // Vérification des cookies de langue
        $cookieLang = $context->cookie->id_lang;  // Langue actuelle selon les cookies
    
        // Si la langue sélectionnée est la langue par défaut et que c'est la page d'accueil, pas de préfixe
        $controller = $context->controller;
        if ($idLang == $defaultLangId && $controller->php_self == 'index') {
            // Vérifie si le cookie de langue est déjà réglé sur la langue par défaut
            if ($cookieLang == $defaultLangId) {
                return '';  // Aucun préfixe pour la langue par défaut sur la page d'accueil
            }
    
            // Si le cookie de langue n'est pas sur la langue par défaut, on met à jour le cookie
            if ($cookieLang != $defaultLangId) {
                // Mettre à jour le cookie pour la langue par défaut
                $context->cookie->id_lang = $defaultLangId;
                $context->cookie->write();  // Sauvegarde le cookie
            }
    
            // Redirection vers la page d'accueil sans préfixe
            $uri = $_SERVER['REQUEST_URI'];
            if (strpos($uri, '/fr') === 0) {
                // Redirection sans le préfixe
                $new_uri = preg_replace('#^/fr#', '', $uri);
                Tools::redirect('https://' . $_SERVER['HTTP_HOST'] . $new_uri);
            }
    
            return '';  // Aucun préfixe à ajouter si c'est la page d'accueil avec la langue par défaut
        }
    
        // Si une autre langue est choisie, ajout du préfixe
        if ($idLang != $defaultLangId) {
            return Language::getIsoById($idLang) . '/';
        }
    
        return ''; // Retourne une chaîne vide si la langue par défaut est sélectionnée sur la page d'accueil
    }

    public function getImageLink($name, $ids, $type = null, string $extension = 'jpg')
    {
        
        $notDefault = false;
        $psLegacyImages = Configuration::get('PS_LEGACY_IMAGES');
        $theme = ((Shop::isFeatureActive() && file_exists(_PS_PRODUCT_IMG_DIR_ . $ids . ($type ? '-' . $type : '') . '-' . Context::getContext()->shop->theme_name . '.jpg')) ? '-' . Context::getContext()->shop->theme_name : '');
        if (($psLegacyImages
                && (file_exists(_PS_PRODUCT_IMG_DIR_ . $ids . ($type ? '-' . $type : '') . $theme . '.' . $extension)))
            || ($notDefault = strpos($ids, 'default') !== false)) {
            if ($this->allow && !$notDefault) {
                $uriPath = __PS_BASE_URI__ . $ids . ($type ? '-' . $type : '') . $theme . '/' . $name . '.' . $extension;
            } else {
                $uriPath = _THEME_PROD_DIR_ . $ids . ($type ? '-' . $type : '') . $theme . '.' . $extension;
            }
        } else {
            $splitIds = explode('-', $ids);
            $idImage = (isset($splitIds[1]) ? $splitIds[1] : $splitIds[0]);
            $theme = ((Shop::isFeatureActive() && file_exists(_PS_PRODUCT_IMG_DIR_ . Image::getImgFolderStatic($idImage) . $idImage . ($type ? '-' . $type : '') . '-' . (int) Context::getContext()->shop->theme_name . '.jpg')) ? '-' . Context::getContext()->shop->theme_name : '');
            if ($this->allow) {
                $uriPath = __PS_BASE_URI__ . $idImage . ($type ? '-' . $type : '') . $theme . '/' . $name . '.' . $extension;
            } else {
                $uriPath = _THEME_PROD_DIR_ . Image::getImgFolderStatic($idImage) . $idImage . ($type ? '-' . $type : '') . $theme . '.' . $extension;
            }
        }
        $resultat = '';
        $splitIds = explode('-', $ids);
        $idImage = (isset($splitIds[1]) ? $splitIds[1] : $splitIds[0]);
        for ($i = 0; $i < strlen($idImage); $i++) {
            $resultat .= $idImage[$i];
            
            if ($i < strlen($idImage) - 1) {
                $resultat .= '/';
            }
        }
        $url = 'https://statics.alicante-immobilier.fr';

        $img_new_server = $url . '/img-medium/' . $ids .'-'. $name . '.webp';
        return $img_new_server;
    }
}
    
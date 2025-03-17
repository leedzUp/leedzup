{**
 * 2007-2020 PrestaShop SA and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{*
<div id="_desktop_search" class="order-2 col-auto d-none d-md-flex align-items-center">
  <div id="search_widget" class="search-widgets js-search-widget" data-search-controller-url="{$search_controller_url}">
    <form method="get" action="{$search_controller_url}">
      <input type="hidden" name="controller" value="search">
      <div class="input-group">
      <span class="input-group-text">
        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#6c757d">
          <path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/>
        </svg>
      </span>
      <input class="form-control js-search-input" type="search" name="s" value="{$search_string}" 
        placeholder="{l s='Type de bien, ville, code postal, région...' d='Shop.Theme.Catalog'}" 
        aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
      </div>  
    </form>

    <div class="search-widgets__dropdown js-search-dropdown d-none">
      <ul class="search-widgets__results js-search-results">
      </ul>
    </div>
  </div>
</div>

<template id="search-products" class="js-search-template">
  <li class="search-result">
    <a class="search-result__link" href="">
      <img src="" alt="" class="search-result__image">
      <p class="search-result__name"></p>
    </a>
  </li>
</template>
*}

{**
 * 2007-2020 PrestaShop SA and Contributors
 * NOTICE OF LICENSE
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * @author    PrestaShop SA <contact@prestashop.com>
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}

 
 <div id="_desktop_search" class="order-2 col-auto d-none d-md-flex align-items-center">
 <div id="search_widget" class="search-widgets js-search-widget" data-search-controller-url="{$search_controller_url}">
   <form method="get" action="{$search_controller_url}">
     <input type="hidden" name="controller" value="search">
     
     <div class="input-group mb-2">
       <span class="input-group-text">
         <i class="fa fa-map-marker"></i>
       </span>
       <input class="form-control js-search-input" type="text" name="location" 
         placeholder="{l s='Région, Département, Ville...' d='Shop.Theme.Catalog'}" 
         aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
     </div>

     <div class="input-group mb-2">
       <span class="input-group-text">
         <i class="fa fa-home"></i>
       </span>
       <select class="form-select" name="property_type">
         <option value="">{l s='Type de bien' d='Shop.Theme.Catalog'}</option>
         {foreach from=$property_types item=type}
           <option value="{$type.id_feature}">{$type.name}</option>
         {/foreach}
       </select>
     </div>

     <div class="input-group mb-2">
       <span class="input-group-text">
         <i class="fa fa-arrows-alt"></i>
       </span>
       <input class="form-control" type="number" name="min_surface" 
         placeholder="{l s='Surface min (m²)' d='Shop.Theme.Catalog'}" 
         min="0">
     </div>

     <div class="input-group mb-2">
       <span class="input-group-text">
         <i class="fa fa-euro"></i>
       </span>
       <input class="form-control" type="number" name="max_price" 
         placeholder="{l s='Prix max (€)' d='Shop.Theme.Catalog'}" 
         min="0">
     </div>

     <button type="submit" class="btn btn-primary">
       {l s='Rechercher' d='Shop.Theme.Catalog'}
     </button>
   </form>
 </div>
</div>

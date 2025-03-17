{**
 * 2007-2020 PrestaShop SA and Contributors
 * NOTICE OF LICENSE
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * @author    PrestaShop SA <contact@prestashop.com>
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}

 <div class="container mt-4">
 <div class="search-widgets js-search-widget" data-search-controller-url="{$search_controller_url}">
   <form class="d-flex flex-wrap gap-3" method="get" action="{$search_controller_url}">
     <input type="hidden" name="controller" value="search">
     
     <!-- Localisation -->
     <div class="mb-2">
       <label for="search-location" class="form-label">{l s='Localisation' d='Shop.Theme.Catalog'}</label>
       <input id="search-location" class="form-control js-search-input" type="text" name="location" 
         placeholder="{l s='Région, Département, Ville...' d='Shop.Theme.Catalog'}" 
         aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
     </div>

     <!-- Type de bien -->
     <div class="mb-2">
       <label for="property-type" class="form-label">{l s='Type de bien' d='Shop.Theme.Catalog'}</label>
       <select id="property-type" class="form-select" name="property_type">
         <option value="">{l s='Sélectionner un type' d='Shop.Theme.Catalog'}</option>
         {foreach from=$property_types item=type}
           <option value="{$type.id_feature}">{$type.name}</option>
         {/foreach}
       </select>
     </div>

     <!-- Surface minimale -->
     <div class="mb-2">
       <label for="min-surface" class="form-label">{l s='Surface minimum' d='Shop.Theme.Catalog'}</label>
       <div class="input-group">
         <input id="min-surface" class="form-control" type="number" name="min_surface" 
           placeholder="{l s='Surface min' d='Shop.Theme.Catalog'}" 
           min="0">
         <span class="input-group-text">m²</span>
       </div>
     </div>

     <!-- Prix maximum -->
     <div class="mb-2">
       <label for="max-price" class="form-label">{l s='Prix maximum' d='Shop.Theme.Catalog'}</label>
       <div class="input-group">
         <span class="input-group-text">€</span>
         <input id="max-price" class="form-control" type="number" name="max_price" 
           placeholder="{l s='Prix max' d='Shop.Theme.Catalog'}" 
           min="0">
       </div>
     </div>

     <button type="submit" class="btn btn-primary">
       {l s='Rechercher' d='Shop.Theme.Catalog'}
     </button>
   </form>
 </div>
</div>

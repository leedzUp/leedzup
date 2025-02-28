{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
 {$componentName = 'search-filters'}
 <button type="button" id="close-offcanvas" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>

 {if $displayedFacets|count}
 
   <div id="search-filters" class="{$componentName}">
     {block name='facets_title'}
     {/block}
 
     {block name='facets_clearall_button'}
       {if $activeFilters|count}
        {* <div class="clear-all-wrapper w-100 order-2 order-md-1">
           <button data-search-url="{$clear_all_link}" class="btn border rounded-pill text-gray py-1 my-2 js-search-filters-clear-all bg-white">
             {l s='Clear all' d='Shop.Theme.Actions'}
           </button>
         </div>*}
         
           <ul class="d-flex align-items-center flex-wrap mb-4">
            
             {foreach from=$activeFilters item="filter"}
               {block name='active_filters_item'}
                 <li class="mt-2 xs-mt-2 filter-block btn btn-small rounded-pill bg-light align-items-center">
                   <a href="{$filter.nextEncodedFacetsURL}" rel="nofollow">
                     {l s='%1$s:' d='Shop.Theme.Catalog' sprintf=[$filter.facetLabel]} {$filter.label} <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#000000"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"></path></svg>
                   </a>
                 </li>
               {/block}
             {/foreach}
           </ul>
         
       {/if}
     {/block}
 
     <div class="order-1 order-md-2">
    



       {foreach from=$displayedFacets item="facet" name="facets"}
         <section class="mt-4 facet">
           {assign var=_expand_id value=10|mt_rand:100000}
       <span>{if $facet.label =="Prix"}Budget{else}{$facet.label}{/if}</span>
           <div id="facet_{$_expand_id}" class="collapse show">
             {if in_array($facet.widgetType, ['radio', 'checkbox'])}
               {block name='facet_item_other'}
                 <ul  class="px-0 mb-0 pb-1 pt-0">
                   {foreach from=$facet.filters key=filter_key item="filter"}
                     {$isColorOrTexture = isset($filter.properties.color) || isset($filter.properties.texture)}
                     {if !$filter.displayed}
                       {continue}
                     {/if}
 
                     <li>
                       <div class="{$componentName}-label facet-label{if $filter.active} active {/if}"   {if $filter.facetLabel == "Couleur"}style="max-width: 170px;"{/if}>
                         {if $facet.multipleSelectionAllowed}
                           <div class="form-check{if $isColorOrTexture} ps-0{/if}">
                             <input 
                               class="form-check-input{if $isColorOrTexture} d-none{/if}" 
                               id="facet_input_{$_expand_id}_{$filter_key}"
                               data-search-url="{$filter.nextEncodedFacetsURL}"
                               type="checkbox"
                               {if $filter.active }checked{/if}
                           >
                          
                             <label class="form-check-label align-middle d-flex align-items-center justify-content-between" for="facet_input_{$_expand_id}_{$filter_key}">
 
                             
                               {if isset($filter.properties.color)}
                                 <span class="color color-sm me-1 align-middle{if $filter.active } active{/if}" style="background-color:{$filter.properties.color}"></span>
                                 <span class="align-middle">
                                   {$filter.label}
                                   {if $filter.magnitude and $show_quantities}
                                     ({$filter.magnitude})
                                   {/if}
                                 </span>
                               {elseif isset($filter.properties.texture)}
                                 <span class="color color-sm me-1 texture align-middle{if $filter.active } active{/if}" style="background-image:url({$filter.properties.texture})"></span>
                                 <span class="align-middle">
                                   {$filter.label}
                                   {if $filter.magnitude and $show_quantities}
                                     ({$filter.magnitude})
                                   {/if}
                                 </span>
                               {elseif $filter.facetLabel == "Couleur"}
                                 {assign var="color_hex" value="{hook h='displayFeaturedColor' id=$filter.value}"}
 
                                 <span class="align-middle ">
                                   {$filter.label}
                                   {if $filter.magnitude and $show_quantities}
                                     ({$filter.magnitude})
                                   {/if}
                                 </span>
                                 <span class="color color-sm me-1 texture align-middle{if $filter.active } active{/if}" style="background-color:{$color_hex};margin-left: auto;"></span>
 
 
                               {else}
                                 <a
                                   href="{$filter.nextEncodedFacetsURL}"
                                   class="{$componentName}-link _gray-darker search-link js-search-link"
                                   rel="nofollow"
                               >
                                   {$filter.label}
                                   {if $filter.magnitude and $show_quantities}
                                     <span class="magnitude">({$filter.magnitude})</span>
                                   {/if}
                                 </a>
                               {/if}
                             </label>
                           </div>
                         {else}
                           <div class="form-check">
                             <input
                               class="form-check-input"
                               id="facet_input_{$_expand_id}_{$filter_key}"
                               data-search-url="{$filter.nextEncodedFacetsURL}"
                               type="radio"
                               name="filter {$facet.label}"
                               {if $filter.active }checked{/if}
                           >
                             <label class="form-check-label" for="facet_input_{$_expand_id}_{$filter_key}">
                               <a
                                 href="{$filter.nextEncodedFacetsURL}"
                                 class="{$componentName}-link _gray-darker search-link js-search-link"
                                 rel="nofollow"
                             >
                                 {$filter.label}
                                 {if $filter.magnitude and $show_quantities}
                                   <span class="magnitude">({$filter.magnitude})</span>
                                 {/if}
                               </a>
                             </label>
                           </div>
                         {/if}
                       </div>
                     </li>
                   {/foreach}
                 </ul>
               {/block}
 
             {elseif $facet.widgetType == 'dropdown'}
               {block name='facet_item_dropdown'}
                 <ul>
                   <li>
                     <div class="facet-dropdown dropdown">
                       <a class="select-title" rel="nofollow" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         {$active_found = false}
                         <span>
                           {foreach from=$facet.filters item="filter"}
                             {if $filter.active}
                               {$filter.label}
                               {if $filter.magnitude and $show_quantities}
                                 ({$filter.magnitude})
                               {/if}
                               {$active_found = true}
                             {/if}
                           {/foreach}
                           {if !$active_found}
                             {l s='(no filter)' d='Shop.Theme.Global'}
                           {/if}
                         </span>
                         <i class="material-icons float-end">&#xE5C5;</i>
                       </a>
                       <div class="dropdown-menu dropdown-menu-start">
                         {foreach from=$facet.filters item="filter"}
                           {if !$filter.active}
                             <a
                               rel="nofollow"
                               href="{$filter.nextEncodedFacetsURL}"
                               class="dropdown-item select-list js-search-link"
                            >
                               {$filter.label}
                               {if $filter.magnitude and $show_quantities}
                                 ({$filter.magnitude})
                               {/if}
                             </a>
                           {/if}
                         {/foreach}
                       </div>
                     </div>
                   </li>
                 </ul>
               {/block}
 
               {elseif $facet.widgetType == 'slider'}
                
                 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/nouislider@15.6.1/dist/nouislider.min.css">
                 <script src="https://cdn.jsdelivr.net/npm/nouislider@15.6.1/dist/nouislider.min.js"></script>
                 {block name='facet_item_slider'}
                 
                   {foreach from=$facet.filters item="filter"}
                     <div class="faceted-filter px-0 js-faceted-filter-slider">
                     <div class="d-flex align-items-center justify-content-between mb-2 gap-3">
 
                     <label class="form-label" for="slider-range-{$_expand_id}-start">{$facet.properties.unit} min.</label>
                       <input type="number" class="form-control form-range-start js-faceted-slider js-faceted-slider-start"
                         id="slider-range-{$_expand_id}-start" {if $facet.type =='price'}step="1000" pattern="[0-9]*"{elseif $facet.type =='surface'}step="10"{/if}>
 
                         <label class="form-label" for="slider-range-{$_expand_id}-end">{$facet.properties.unit} max.</label>
 
                       <input type="number" class="form-control form-range-end js-faceted-slider js-faceted-slider-end"
                         id="slider-range-{$_expand_id}-end" {if $facet.type =='price'}step="1000" pattern="[0-9]*"{elseif $facet.type =='surface'}step="10"{/if}>
                         </div>
                       <div id="slider-{$_expand_id}" class="faceted-slider js-faceted-slider-container"
                          data-slider-type="{if $facet.type =='price'}price{elseif $facet.type =='surface'}surface{/if}"
                         data-slider-min="{$facet.properties.min}" data-slider-max="{$facet.properties.max}"
                         data-slider-values="{if isset($filter.value) && $filter.value}[{$filter.value[0]}, {$filter.value[1]}]{else}[{$facet.properties.min}, {$facet.properties.max}]{/if}"
                         data-slider-unit="{$facet.properties.unit}" data-slider-label="{$facet.label}"
                         {if $facet.type =='price'}data-slider-specifications="{$facet.properties.specifications|@json_encode}"{/if}
                         data-slider-encoded-url="{$filter.nextEncodedFacetsURL}" data-slider-direction="{$language.is_rtl}">
                       </div>
                       <div class="slider-values">
                         <span id="slider-{$_expand_id}-start"></span> -
                         <span id="slider-{$_expand_id}-end"></span>
                       </div>
                       
                     </div>
                   {/foreach}
                   
                
   
                   
                 {/block}
               {/if}
           </div>
         </section>
       {/foreach}
     </div>
   </div>
 {/if}
 
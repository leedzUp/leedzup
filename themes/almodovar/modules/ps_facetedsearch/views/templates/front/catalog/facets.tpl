{$componentName = 'search-filters'}

{if $displayedFacets|count}
  <div id="search-filters" class="{$componentName}">
    {block name='facets_title'}
    {/block}

    <div class="row order-1 order-md-1">
      {foreach from=$displayedFacets item="facet" name="facets"}
        <div class="ps-0 col-md-4 facet">
          {assign var=_expand_id value=10|mt_rand:100000}
          {assign var=_collapse value=true}
          {foreach from=$facet.filters item="filter"}
            {if $filter.active}{assign var=_collapse value=false}{/if}
          {/foreach}
          {if $facet.widgetType == 'slider'}

            <span class="{$componentName}-subtitle facet-title">
              {if $facet.label == "Surface"}
                {l s='Surface' d='Shop.Theme.Almodovar'}
              {elseif $facet.label == "Room"}
                {l s='Room' d='Shop.Theme.Almodovar'}
              {else}{$facet.label}{/if}
            </span>
          {/if}
          <div id="facet_{$_expand_id}">

            {*{if in_array($facet.widgetType, ['radio', 'checkbox'])}
               {block name='facet_item_other'}
                 <ul  class="px-0 mb-0 pb-1 pt-0">
                   {foreach from=$facet.filters key=filter_key item="filter"}
                     {$isColorOrTexture = isset($filter.properties.color) || isset($filter.properties.texture)}
                     {if !$filter.displayed}
                       {continue}
                     {/if}

                     <li>
                       <div class="{$componentName}-label facet-label{if $filter.active} active {/if}">
                         {if $facet.multipleSelectionAllowed}
                           <div class="form-check{if $isColorOrTexture} ps-0{/if}">
                             <input 
                               class="form-check-input{if $isColorOrTexture} d-none{/if}" 
                               id="facet_input_{$_expand_id}_{$filter_key}"
                               data-search-url="{$filter.nextEncodedFacetsURL}"
                               type="checkbox"
                               {if $filter.active }checked{/if}
                           >
                             <label class="form-check-label align-middle" for="facet_input_{$_expand_id}_{$filter_key}">
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
                 <ul class="accordion-body">
                   <li>
                     <div class="w-25 facet-dropdown dropdown">
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
               {/block}*}

            {if $facet.widgetType == 'slider'}
              {block name='facet_item_slider'}
                {foreach from=$facet.filters item="filter"}

                  {if $facet.type == 'price'}
                    {assign var="stepValue" value=100}
                  {else if $facet.type == 'surface'}
                    {assign var="stepValue" value=10}
                  {else if $facet.type == 'room'}
                    {assign var="stepValue" value=1}
                  {else}
                    {assign var="stepValue" value=1}
                    <!-- Valeur par défaut -->
                  {/if}
                  <div class="faceted-filter px-0 js-faceted-filter-slider">

                    <!-- Inputs placés au-dessus du slider -->
                    <div class="d-flex align-items-center gap-3 faceted-slider-inputs">
                      <!-- Input de début avec préfixe -->
                      <div class="input-group">
                        <span class="input-group-text">Min</span>
                        <input type="text" class="form-control form-range-start js-faceted-slider js-faceted-slider-start"
                          id="slider-range_{$_expand_id}-start" min="{$facet.properties.min}" max="{$facet.properties.max}"
                          value="{$filter.value.0|default:$facet.properties.min}" step="{$stepValue}">
                        <span class="input-group-text">{$facet.properties.unit}</span>

                      </div>

                      <!-- Input de fin avec préfixe -->
                      <div class="input-group">
                        <span class="input-group-text">Max</span>
                        <input type="text" class="form-control form-range-end js-faceted-slider js-faceted-slider-end"
                          id="slider-range_{$_expand_id}-end" min="{$facet.properties.min}" max="{$facet.properties.max}"
                          value="{$filter.value.1|default:$facet.properties.max}" step="{$stepValue}">
                        <span class="input-group-text">{$facet.properties.unit}</span>

                      </div>
                    </div>


                    <!-- Slider -->
                    <div class="faceted-slider js-faceted-slider-container" data-slider-max="{$facet.properties.max}"
                      data-slider-id="{$_expand_id}" data-slider-values="{$filter.value|@json_encode}"
                      data-slider-unit="{$facet.properties.unit}" data-slider-label="{$facet.label}"
                      data-slider-specifications="{$facet.properties.specifications|@json_encode}"
                      data-slider-encoded-url="{$filter.nextEncodedFacetsURL}" data-slider-direction="{$language.is_rtl}"></div>

                    <div class="js-faceted-values"></div>
                  </div>
                {/foreach}



              {/block}
            {/if}
          </div>
          {if !$smarty.foreach.facets.last}{/if}
        </div>
      {/foreach}

      <div class="mt-4 mb-4 text-center ">
        <button class="btn btn-primary btn-xs" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFilters"
          aria-expanded="true" aria-controls="collapseFilters">
          + {l s='more filters' d='Shop.Theme.Almodovar'}
        </button>
      </div>

      <div id="collapseFilters" class="accordion-collapse collapse" aria-labelledby="collapseFilters">
        <div class="accordion-body">

          <div class="row accordion" id="facetAccordion">
            {foreach from=$displayedFacets item="facet" name="facets"}
              {if in_array($facet.label, ['feat_type_du_bien', 'feat_nombre_de_chambres', 'feat_nombre_de_salle_de_bain']) && in_array($facet.widgetType, ['radio', 'checkbox'])}
                <div class="col-md-4">
                  <!-- Ajuste la largeur selon ton besoin -->
                  <h2 class="facet-title">
                  {if $facet.label == "feat_type_du_bien"}
                    {l s='feat_type_du_bien' d='Shop.Theme.Almodovar'}
                  {elseif $facet.label == "feat_nombre_de_chambres"}
                    {l s='feat_nombre_de_chambres' d='Shop.Theme.Almodovar'}
                  {elseif $facet.label == "feat_nombre_de_salle_de_bain"}
                    {l s='feat_nombre_de_salle_de_bain' d='Shop.Theme.Almodovar'}
                  {else}{$facet.label|upper}{/if}
                  </h2>
                  <ul class="list-unstyled">
                    {foreach from=$facet.filters key=filter_key item="filter"}
                      {if !$filter.displayed} {continue} {/if}
                      <li>
                        <div class="form-check">
                          <input class="form-check-input" id="facet_input_{$facet.label|escape:'htmlall':'UTF-8'}_{$filter_key}"
                            data-search-url="{$filter.nextEncodedFacetsURL}"
                            type="{if $facet.multipleSelectionAllowed}checkbox{else}radio{/if}" name="filter_{$facet.label}"
                            {if $filter.active}checked{/if}>
                          <label class="form-check-label"
                            for="facet_input_{$facet.label|escape:'htmlall':'UTF-8'}_{$filter_key}">
                            <a href="{$filter.nextEncodedFacetsURL}" class="search-link js-search-link" rel="nofollow">
                              {$filter.label} {if $filter.magnitude and $show_quantities}({$filter.magnitude}){/if}
                            </a>
                          </label>
                        </div>
                      </li>
                    {/foreach}
                  </ul>
                </div>
              {/if}
            {/foreach}
            <div class="row">
            <h2 class="facet-title">
            {l s='feat_installation' d='Shop.Theme.Almodovar'}
            </h2>
          {foreach from=$displayedFacets item="facet" name="facets"}
            {if in_array($facet.label, ['feat_climatisation', 'feat_garage', 'feat_piscine']) && in_array($facet.widgetType, ['radio', 'checkbox'])}
              <div class="col-md-4">
                <!-- Ajuste la largeur selon ton besoin -->
               
                <ul class="list-unstyled">
                  {foreach from=$facet.filters key=filter_key item="filter"}
                    {if !$filter.displayed} {continue} {/if}
                    {if $filter.label == 'Oui'}
                    <li>
                      <div class="form-check">
                        <input class="form-check-input" id="facet_input_{$facet.label|escape:'htmlall':'UTF-8'}_{$filter_key}"
                          data-search-url="{$filter.nextEncodedFacetsURL}"
                          type="{if $facet.multipleSelectionAllowed}checkbox{else}radio{/if}" name="filter_{$facet.label}"
                          {if $filter.active}checked{/if}>
                        <label class="form-check-label"
                          for="facet_input_{$facet.label|escape:'htmlall':'UTF-8'}_{$filter_key}">
                          <a href="{$filter.nextEncodedFacetsURL}" class="search-link js-search-link" rel="nofollow">
                          {if $facet.label == "feat_climatisation"}
                            {l s='feat_climatisation' d='Shop.Theme.Almodovar'}
                          {elseif $facet.label == "feat_garage"}
                            {l s='feat_garage' d='Shop.Theme.Almodovar'}
                          {elseif $facet.label == "feat_piscine"}
                            {l s='feat_piscine' d='Shop.Theme.Almodovar'}
                          {/if}
                        {if $filter.magnitude and $show_quantities}({$filter.magnitude}){/if}
                          </a>
                        </label>
                      </div>
                    </li>
                      {/if}
                  {/foreach}
                </ul>
              </div>
            {/if}
          {/foreach}
        </div>




          </div>

          

        </div>
      </div>
    </div>
  </div>
{/if}
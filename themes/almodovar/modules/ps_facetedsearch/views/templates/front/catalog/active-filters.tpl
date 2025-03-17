{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<section id="js-active-search-filters">
  {if $activeFilters|count}
    <ul class="d-flex align-items-center flex-wrap mb-4">
      {block name='active_filters_title'}
        <li class="p-1">
          <p class="fw-bold m-0 me-2">{l s='Active filters' d='Shop.Theme.Global'}</p>
        </li>
      {/block}
      {foreach from=$activeFilters item="filter"}
        {block name='active_filters_item'}
          <li class="p-1">
            <a class="text-nowrap btn rounded-pill bg-light js-search-link d-flex align-items-center" href="{$filter.nextEncodedFacetsURL}" rel="nofollow">
              {l s='%1$s:' d='Shop.Theme.Catalog' sprintf=[$filter.facetLabel]} {$filter.label} 
              <svg class="font-reset ms-1 align-middle" xmlns="http://www.w3.org/2000/svg" height="14px" viewBox="0 -960 960 960" width="14px" fill="#000"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg>
            </a>
          </li>
        {/block}
      {/foreach}
      {block name='facets_clearall_button'}
        {if $activeFilters|count}
          <li class="p-1">
            <button data-search-url="{$clear_all_link}"
              class="btn border rounded-pill text-gray py-1 my-2 js-search-filters-clear-all">
              {l s='Clear all' d='Shop.Theme.Actions'}
            </button>
          </li>
        {/if}
      {/block}
    </ul>
    
  {/if}

</section>

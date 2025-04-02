{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<div id="js-product-list-top">
  <div class="products-selections-filters row">
    <div class="col-lg-12 total-products order-2 order-lg-1 mt-4 mt-lg-0">
      {if $listing.pagination.total_items> 1}
      <h1 class="fs-4">{if $page.page_name == 'category'}{$category.name}{elseif $page.page_name == 'search'}{l s='Search' d='Shop.Theme.Almodovar'}{/if}: {l s='%product_count%' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]} {l s='properties for sale' d='Shop.Theme.Almodovar'}</h1>
      {elseif $listing.pagination.total_items> 0}
        <h1>{if $page.page_name == 'category'}{$category.name}{elseif $page.page_name == 'search'}Recherche{/if}: {l s='1' d='Shop.Theme.Catalog'} {l s='propertie for sale' d='Shop.Theme.Almodovar'}</h1>
      {/if}
      {if $category.description}
        <div id="category-description" class="rich-text mb-4">{$category.description nofilter}</div>
      {/if}
    </div>


    <div class="col-lg-6 order-1 order-lg-2">
      <div class="d-flex align-items-center justify-content-md-end sort-by-row">
       

        {if !empty($listing.rendered_facets)}
          <div class="col-4 d-block d-md-none filter-button">
            <button id="search_filter_toggler" class="btn btn-outline-primary btn-with-icon w-100 js-search-toggler" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-faceted">
              {l s='Filter' d='Shop.Theme.Actions'}
            </button>
          </div>
        {/if}
      </div>
    </div>


  </div>
</div>

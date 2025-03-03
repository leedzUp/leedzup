{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<div id="js-product-list-top" class="products-selection">
  <div class="products-selections-filters row">
    <div class="col-lg-6 total-products order-2 order-lg-1 mt-4 mt-lg-0">
      {if $listing.pagination.total_items> 1}
        <h1 class="fs-4">Immobilier {$category.name} : {l s='%product_count%' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]} biens à vendre</h1>
      {elseif $listing.pagination.total_items> 0}
        <h1>{l s='1' d='Shop.Theme.Catalog'} bien à vendre</h1>
      {/if}
    </div>

    <div class="col-lg-6 order-1 order-lg-2">
      <div class="d-flex align-items-center justify-content-md-end sort-by-row">
        {block name='sort_by'}
          {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        {/block}

        {if !empty($listing.rendered_facets)}
          <div class="col-4 d-block d-md-none filter-button">
            <button id="search_filter_toggler" class="btn btn-outline-primary btn-with-icon w-100 js-search-toggler" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-faceted">
              <i class="material-icons" aria-hidden="true">filter_list</i>
              {l s='Filter' d='Shop.Theme.Actions'}
            </button>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>

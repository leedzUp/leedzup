


{if $page.page_name == 'category'}
    {block name='sort_by'}
    <div class="d-flex align-items-center justify-content-md-end sort-by-row">
    {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
              </div>
  {/block}

{capture assign="productClasses"}col-12 col-md-4{/capture}
<div class="mt-2 products row">
    {foreach from=$products item="product" key="position"}
        {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses=$productClasses}
    {/foreach}
</div>

{if $category.additional_description}
    <div id="additional_description" class="rich-text mb-4">{$category.additional_description nofilter}</div>
  {/if}

{else}
{capture assign="productClasses"}col-12 col-md-4{/capture}

<div class="mt-2 products row">
    {foreach from=$products item="product" key="position"}
        {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses=$productClasses}
    {/foreach}
</div>


{/if}



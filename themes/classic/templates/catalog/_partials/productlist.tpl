{capture assign="productClasses"}col-6 col-md-4{/capture}
<div class="products row">
    {foreach from=$products item="product" key="position"}
        {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses=$productClasses}
    {/foreach}
</div>
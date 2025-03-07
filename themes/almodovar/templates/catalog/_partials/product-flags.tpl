{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{block name='product_flags'}


  <ul class="product-flags js-product-flags">

  <li class="badge">
  {block name='product_price'}
    {if $product.show_price}
      {hook h='displayProductPriceBlock' product=$product type="before_price"}
      <span class="fs-5" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
        {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
        {if '' !== $smarty.capture.custom_price}
          {$smarty.capture.custom_price nofilter}
        {else}
          {$product.price}
        {/if}
      </span>
    {/if}
  {/block}

  {block name='product_discount_price'}
    {if $product.show_price}
      <span>
        {if $product.has_discount}
          {hook h='displayProductPriceBlock' product=$product type="old_price"}

          <span aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
        {/if}
      </span>
    {/if}
  {/block}
</li>

    {*{foreach from=$product.flags item=flag}
      <li class="badge {$flag.type}">{$flag.label}</li>
    {/foreach}*}
  </ul>
{/block}

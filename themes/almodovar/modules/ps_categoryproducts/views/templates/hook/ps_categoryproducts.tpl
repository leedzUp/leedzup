{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<section class="category-products mt-3">
  <div class="container">
    {if $products|@count == 1}
    <h2 class="h2 mt-5 fs-2">{l s='%s other product at' sprintf=[$products|@count] d='Shop.Theme.Almodovar'} {if $product.grouped_features['feat_ville']}{$product.grouped_features['feat_ville'].value}{/if}</h2>
    {else}
    <h2 class="h2 mt-5 fs-2">{l s='%s other products at' sprintf=[$products|@count] d='Shop.Theme.Almodovar'} {if $product.grouped_features['feat_ville']}{$product.grouped_features['feat_ville'].value}{/if}</h2>
    {/if}

    {include file='catalog/_partials/productlist.tpl' products=$products productClass='col-12 col-xs-6 col-lg-4 col-xl-3'}
  </div>
</section>

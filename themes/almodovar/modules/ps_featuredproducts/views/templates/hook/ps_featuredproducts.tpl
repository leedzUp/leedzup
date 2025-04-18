{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<section class="featured-products">
  <div class="container">
  <h2 class="h2 mt-5 fs-2 text-center">{l s='Our latest houses for sale in Alicante' d='Shop.Theme.Almodovar'}</h2>
    <div class="mt-5">
      {include file='catalog/_partials/productlist.tpl' products=$products productClass='col-12 col-xs-6 col-lg-4 col-xl-3'}
    </div>
  </div>

  <div class="featured-products-footer text-center">
    <a class="all-product-link btn btn-outline-primary btn-large rounded-pill fs-6 px-4" href="{$allProductsLink}">
      {l s='See more' d='Shop.Theme.Almodovar'}
    </a>
  </div>
</section>

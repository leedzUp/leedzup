{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<div class="modal fade js-product-images-modal" id="product-modal">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="rounded-4 modal-content">
      <div class="p-0 modal-body">
        <div
          id="product-images-modal"
          class="carousel slide js-product-images-modal-carousel"
          data-bs-ride="carousel"
        >
          <div class="carousel-inner">
            {if $product.images|@count > 1}
              <button class="carousel-control-prev" type="button" data-bs-target="#product-images-modal" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>

              <button class="carousel-control-next" type="button" data-bs-target="#product-images-modal" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            {/if}

            {foreach from=$product.images item=image key=key name=productImages}
              {if $key < 6}
              <div class="carousel-item{if $image.id_image == $product.default_image.id_image} active{/if}">
                  <img
                    class="rounded-4 img-fluid"
                    {if Context::getContext()->detectDeviceByUserAgent() != 'mobile'}
                    src="{$image.bySize.product_main.url|replace:'medium':'large'}" 
                    width="1280"
                    height="718"
                    {else}
                    src="{$image.bySize.product_main.url|replace:'medium':'medium'}"
                    width="475"
                    height="267"
                    {/if}
                    
                   
                    loading="{if $smarty.foreach.productImages.first}eager{else}lazy{/if}"
                    alt="{$image.legend}"
                    title="{$image.legend}"
                  >
              </div>
              {/if}
            {/foreach}
          </div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
 <div data-bs-toggle="modal" data-bs-target="#product-modal">

<div class="product__images js-images-container">
  {if $product.images|@count > 0}
    <div
      {if Context::getContext()->detectDeviceByUserAgent() != 'mobile'}
      style="height: calc(100vh - 245px); min-height: calc(100vh - 245px);"
      {/if}
      id="product-images"
      class="carousel slide js-product-carousel"
      data-bs-ride="carousel"
      >
      <div class="carousel-inner">

        {if $product.images|@count > 1}
          <button class="carousel-control-prev" type="button" data-bs-target="#product-images" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>

          <button class="carousel-control-next" type="button" data-bs-target="#product-images" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        {/if}

        {block name='product_cover'}
          {foreach from=$product.images item=image key=key name=productImages}
            {if $image.id_image == $product.default_image.id_image}
            <div class="carousel-item{if $image.id_image == $product.default_image.id_image} active{/if}"
              data-bs-target="#product-images-modal"
              data-bs-slide-to="{$key}"
              >
                <img
                  class="img-fluid"
                  src="{if Context::getContext()->detectDeviceByUserAgent() != 'mobile'}{$image.bySize.product_main.url|replace:'medium':'wide'}{else}{$image.bySize.product_main.url|replace:'medium':'small'}{/if}" 
                  {if Context::getContext()->detectDeviceByUserAgent() != 'mobile'}
                  width="1930"
                  height="718"
                  {else}
                    width="320"
                    height="180"
                  {/if}
                  loading="{if $smarty.foreach.productImages.first}eager{else}lazy{/if}"
                  alt="{$image.legend}"
                  title="{$image.legend}"
                >
            </div>
              {/if}
          {/foreach}
        {/block}
      </div>
    </div>

 
  {else}
    <picture>
      {if isset($urls.no_picture_image.bySize.default_md.sources.avif)}
        <source 
          srcset="
            {$urls.no_picture_image.bySize.default_md.sources.avif} 320w,
            {$urls.no_picture_image.bySize.product_main.sources.avif} 720w,
            {$urls.no_picture_image.bySize.product_main_2x.sources.avif} 1440w"
          sizes="(min-width: 1300px) 720px, (min-width: 768px) 50vw, 100vw" 
          type="image/avif"
        >
      {/if}

      {if isset($urls.no_picture_image.bySize.default_md.sources.webp)}
        <source 
          srcset="
            {$urls.no_picture_image.bySize.default_md.sources.webp} 320w,
            {$urls.no_picture_image.bySize.product_main.sources.webp} 720w,
            {$urls.no_picture_image.bySize.product_main_2x.sources.webp} 1440w"
          sizes="(min-width: 1300px) 720px, (min-width: 768px) 50vw, 100vw" 
          type="image/webp"
        >
      {/if}

      <img
        class="img-fluid"
        srcset="
          {$urls.no_picture_image.bySize.default_md.url} 320w,
          {$urls.no_picture_image.bySize.product_main.url} 720w,
          {$urls.no_picture_image.bySize.product_main_2x.url} 1440w"
        sizes="(min-width: 1300px) 720px, (min-width: 768px) 50vw, 100vw" 
        width="{$urls.no_picture_image.bySize.product_main.width}"
        height="{$urls.no_picture_image.bySize.product_main.height}"
        src="{$urls.no_picture_image.bySize.default_md.url}" 
        loading="lazy"
        alt="{l s='No image available' d='Shop.Theme.Catalog'}"
        title="{l s='No image available' d='Shop.Theme.Catalog'}"
      >
    </picture>
  {/if}
</div>
</div>

{block name='product_images_modal'}
  {include file='catalog/_partials/product-images-modal.tpl'}
{/block}

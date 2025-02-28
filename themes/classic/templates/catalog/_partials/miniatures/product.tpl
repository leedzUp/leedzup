{block name="product_miniature_item"}
  <div class="js-product product{if !empty($productClasses)} {$productClasses}{/if}">
    <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}"
      data-id-product-attribute="{$product.id_product_attribute}">
      <div class="thumbnail-container">
        <div class="img-fluid">
          {block name="img-fluid"}
            {if $product.cover}
              <a href="{$product.url}">
                <picture>
                  {if !empty($product.cover.bySize.home_default.sources.avif)}
                  <source srcset="{$product.cover.bySize.home_default.sources.avif}" type="image/avif">{/if}
                  {if !empty($product.cover.bySize.home_default.sources.webp)}
                  <source srcset="{$product.cover.bySize.home_default.sources.webp}" type="image/webp">{/if}
                  <img src="{$product.cover.bySize.home_default.url}"
                    alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name}{/if}" loading="lazy"
                    class="img-fluid" data-full-size-image-url="{$product.cover.large.url}" />
                </picture>
              </a>
            {else}
              <a href="{$product.url}">
                <picture>
                  {if !empty($urls.no_picture_image.bySize.home_default.sources.avif)}
                  <source srcset="{$urls.no_picture_image.bySize.home_default.sources.avif}" type="image/avif">{/if}
                  {if !empty($urls.no_picture_image.bySize.home_default.sources.webp)}
                  <source srcset="{$urls.no_picture_image.bySize.home_default.sources.webp}" type="image/webp">{/if}
                  <img src="{$urls.no_picture_image.bySize.home_default.url}" loading="lazy" />
                </picture>
              </a>
            {/if}
          {/block}
        </div>
        <div class="product-description">
          {block name="product_name"}
            <p class="product-title"><a href="{$product.url}" content="{$product.url}">{$product.name}</a></p>
            {widget name="code_featuresonlist" product=$product}

          {/block}
          {block name="product_price_and_shipping"}
            {if $product.show_price}
              <div class="product-price-and-shipping">
                {if $product.has_discount}
                  {hook h="displayProductPriceBlock" product=$product type="old_price"}

                  <span class="regular-price"
                    aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
                  {if $product.discount_type === "percentage"}
                    <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                  {elseif $product.discount_type === "amount"}
                    <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                  {/if}
                {/if}
                {hook h="displayProductPriceBlock" product=$product type="before_price"}
                <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
                  {$product.price}
                </span>
              </div>
            {/if}
          {/block}
        </div>
      </div>
    </article>
</div>{/block}
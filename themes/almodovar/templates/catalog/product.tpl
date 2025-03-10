{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
 {extends file=$layout}

 {block name='head' append}
   <meta property="og:type" content="product">
   <meta content="{$product.url}">
 
   {if $product.cover}
     <meta property="og:image" content="{$product.cover.large.url}">
   {/if}
 
   {if $product.show_price}
     <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
     <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
     <meta property="product:price:amount" content="{$product.price_amount}">
     <meta property="product:price:currency" content="{$currency.iso_code}">
   {/if}
   
 {/block}
 
 {block name='head_microdata_special'}
   {include file='_partials/microdata/product-jsonld.tpl'}
 {/block}
 
 {block name='content'}
  <div class="mb-4 p-0 container-fluid">
  {block name='product_cover_thumbnails'}
    {include file='catalog/_partials/product-cover-thumbnails.tpl'}
  {/block}
  </div>
   <div class="container">
   {* FIRST PART - PHOTO, NAME, PRICES, ADD TO CART*}
   <div class="row g-4 g-xl-5 product js-product-container">
     <div class="product__left col-md-8">
      
       {block name='product_header'}
       <h1 class="fs-1">{block name='page_title'}{$product.name}{/block}</h1>
      {/block}
         {* SECOND PART - REASSURANCE, TABS *}
   
     {block name='product_tabs'}
         <div class="product__infos accordion accordion-flush" id="product-infos-accordion">

           {block name='product_description'}
             {if $product.description}
               <div class="info accordion-item" id="description">
                 <h2 class="info__title accordion-header" id="product-description-heading">
                   <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#product-description-collapse" aria-expanded="true" aria-controls="product-description-collapse">
                     {l s='Description' d='Shop.Theme.Catalog'}
                   </button>
                 </h2>
                 <div id="product-description-collapse" class="info__content accordion-collapse collapse show" data-bs-parent="#product-infos-accordion" aria-labelledby="product-description-heading">
                   <div class="product__description accordion-body rich-text">
                     {$product.description nofilter}
                   </div>
                 </div>
               </div>
             {/if}
           {/block}

           {block name='product_images'}
            <h2 class="info__title fs-5 mt-4" id="product-description-heading">
              {l s='+ de photos' d='Shop.Theme.Catalog'}
            </h2>
            <div class="thumbnails__container">
              <ul class="thumbnails__list row g-2">
                {foreach from=$product.images item=image key=key}
                  {if $key < 6}

                  <li
                  data-bs-toggle="modal" 
                  data-bs-target="#product-modal"
                    data-bs-slide-to="{$key}"

                    class="cursor-pointer thumbnail js-thumb-container col-3 col-md-3"
                    
                    aria-label="{l s='Product image %number%' d='Shop.Theme.Catalog' sprintf=['%number%' => $key]}"
                >
                  
      
                      <img
                        class="img-fluid js-thumb{if $image.id_image == $product.default_image.id_image} js-thumb-selected{/if}"
                        src="{$image.bySize.product_main.url|replace:'medium':'small'}" 
                        
                        width="320"
                        height="200"
                        loading="lazy"
                        alt="{$image.legend}"
                        title="{$image.legend}"
                      >
                  </li>
                  {/if}
                {/foreach}
              </ul>
            </div>
          {/block}
      
          {hook h='displayAfterProductThumbs' product=$product}

           {block name='product_details'}
             {include file='catalog/_partials/product-details.tpl'}
           {/block}

           {block name='product_attachments'}
             {if $product.attachments}
               <div class="info accordion-item" id="attachments">
                 <h2 class="info__title accordion-header" id="product-attachments-heading">
                   <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#product-attachments-collapse" aria-expanded="true" aria-controls="product-attachments-collapse">
                     {l s='Download' d='Shop.Theme.Actions'}
                   </button>
                 </h2>
                 <div id="product-attachments-collapse" class="info__content accordion-collapse collapse" data-bs-parent="#product-infos-accordion" aria-labelledby="product-attachments-heading">
                   <div class="product__attachments accordion-body">
                     {foreach from=$product.attachments item=attachment}
                       <div class="attachment">
                         <p class="h5"><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></p>
                         <p>{$attachment.description}</p>
                         <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                           {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                         </a>
                       </div>
                     {/foreach}
                   </div>
                 </div>
               </div>
             {/if}
           {/block}

           {* New collapses for module hooked content *}
           {foreach from=$product.extraContent item=extra key=extraKey}
             <div class="info accordion-item" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
               <h2 class="info__title accordion-header" id="product-extra{$extraKey}-heading">
                 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#product-extra{$extraKey}-collapse" aria-expanded="true" aria-controls="product-extra{$extraKey}-collapse">
                   {$extra.title}
                 </button>
               </h2>
               <div id="product-extra{$extraKey}-collapse" class="info__content accordion-collapse collapse" data-bs-parent="#product-infos-accordion" aria-labelledby="product-extra{$extraKey}-heading">
                 <div class="accordion-body">
                   {$extra.content nofilter}
                 </div>
               </div>
             </div>
           {/foreach}

         </div>
     {/block}
 {* END OF SECOND PART *}
     
      
     </div>
 
     <div class="product__col col-md-4">
       
       {block name='product_prices'}
         {include file='catalog/_partials/product-prices.tpl'}
       {/block}
       {widget name="code_childleadsform" product=$product}

       <div class="col-lg-6 col-xl-5 order-lg-1">
     {block name='hook_display_reassurance'}
       {hook h='displayReassurance'}
     {/block}
   </div>

 
       
 
       
 
       <div class="product__actions js-product-actions">
        
       </div>{* /product-actions *}
     </div>{* /col *}
   </div>{* /row *}
   {* END OF FIRST PART *}
 

 </div>
   {block name='product_accessories'}
     {if $accessories}
       {include file='catalog/_partials/product-accessories.tpl'}
     {/if}
   {/block}
 
   {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/breadcrumb.tpl"}

   {block name='product_footer'}
     {hook h='displayFooterProduct' product=$product category=$category}
   {/block}
 
   {block name='page_footer_container'}
     {block name='page_footer'}
     {/block}
   {/block}
 {/block}
 
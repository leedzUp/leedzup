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
           <h1 class="fs-1">{block name='page_title'}{$page.meta.title}{/block}</h1>
         {/block}
 
         {block name='product_features'}
           {if $product.grouped_features}
             <div class="mt-4 info" id="product-features">
               <h2 class="info__title fs-3" id="product-details-heading">
                 {l s='Features' d='Shop.Theme.Almodovar'}:
               </h2>
               <div class="info__content">
                 <div class="row">
                   {assign var="allowed_features" value=[
                     'feat_type_du_bien', 'feat_ville', 'feat_surface_habitable', 'feat_superficie_du_terrain',
                     'feat_ascenseur', 'feat_acces_handicape', 'feat_cave', 'feat_climatisation',
                     'feat_etage', 'feat_garage', 'feat_jardin', 'feat_piscine',
                     'feat_nombre_de_chambres', 'feat_nombre_de_salle_de_bain', 'feat_parking',
                     'feat_quartier', 'feat_region', 'feat_pays'
                   ]}
         
                   {foreach from=$product.grouped_features item=feature key=featureKey}
                     {assign var="featureValue" value=$feature.value}
         
                     {if in_array($featureKey, $allowed_features) && $featureValue !== "Non" && $featureValue !== "0" && ($featureValue == "Oui" || $featureValue|floatval > 0)}
                       <div class="col-12 col-md-4 mb-3">
                         <div class="detail">
                           <div class="detail__left">
                             <span class="detail__title fw-bold">
                               {l s=$featureKey d='Shop.Theme.Almodovar'}
                             </span>
                           </div>
                           <div class="detail__right">
                             <span>
                               {if $featureValue != "Oui"}
                                 {$featureValue}
                                 {if $featureKey == 'feat_surface_habitable' || $featureKey == 'feat_superficie_du_terrain'}
                                   m²
                                 {/if}
                               {/if}
                             </span>
                           </div>
                         </div>
                       </div>
                     {/if}
                   {/foreach}
                 </div>
               </div>
             </div>
           {/if}
         {/block}
         
 
         {* SECOND PART - REASSURANCE, TABS *}
 
         {block name='product_tabs'}
           <div class="product__infos">
 
             {block name='product_description'}
               {if $product.description}
                 <div class="info" id="description">
                   <h2 class="info__title fs-3" id="product-description-heading">
                     {l s='Description' d='Shop.Theme.Almodovar'}:
                   </h2>
                   <div id="product-description" class="info__content" data-bs-parent="#product-infos-accordion"
                     aria-labelledby="product-description-heading">
                     <div class="product__description accordion-body rich-text">
                       {$product.description nofilter}
                     </div>
                   </div>
                 </div>
               {/if}
             {/block}
 
             {block name='product_images'}
               <h2 class="info__title fs-5 mt-4" id="product-description-heading">
               + {l s='more photos' d='Shop.Theme.Almodovar'}
               </h2>
               <div class="thumbnails__container">
                 <ul class="thumbnails__list row g-2">
                   {foreach from=$product.images item=image key=key}
                     {if $key < 6}
                       <li data-bs-toggle="modal" data-bs-target="#product-modal" data-bs-slide-to="{$key}"
                         class="cursor-pointer thumbnail js-thumb-container col-3 col-md-3"
                         aria-label="{l s='Product image %number%' d='Shop.Theme.Catalog' sprintf=['%number%' => $key]}">
                         <img
                           class="img-fluid js-thumb{if $image.id_image == $product.default_image.id_image} js-thumb-selected{/if}"
                           src="{$image.bySize.product_main.url|replace:'medium':'small'}" width="320" height="200" loading="lazy"
                           alt="{$image.legend}" title="{$image.legend}">
                       </li>
                     {/if}
                   {/foreach}
                 </ul>
               </div>
             {/block}
 
             {hook h='displayAfterProductThumbs' product=$product}
 
             <h2 class="info__title fs-3 mt-4">
             {l s='Localisation' d='Shop.Theme.Almodovar'}:
             </h2>
             <div class="row">
               <div class="info__content mb-4 col-md-4">
                 {foreach from=$product.grouped_features item=feature key=featureKey}
                   {if $featureKey == 'feat_region'}
                     <div class="mb-2">
                       <span class="fw-bold">
                       {l s='Region' d='Shop.Theme.Almodovar'}
                       </span>
                       <span>
                         {$feature.value}
                       </span>
                     </div>
                   {/if}
                   {if $featureKey == 'feat_departement'}
                     <div class="mb-2">
                       <span class=" fw-bold">
                         {l s='Province' d='Shop.Theme.Almodovar'}:
                       </span>
                       <span>
                         {$feature.value}
                       </span>
                     </div>
                   {/if}
                   {if $featureKey == 'feat_ville'}
                     <div class="mb-2">
                       <span class=" fw-bold">
                         {l s='City' d='Shop.Theme.Almodovar'}:
                       </span>
                       <span>
                         {$feature.value}
                       </span>
                     </div>
                   {/if}
                   {if $featureKey == 'feat_pays'}
                     <div class="mb-2">
                       <span class=" fw-bold">
                         {l s='Country' d='Shop.Theme.Almodovar'}:
                       </span>
                       <span>
                         {$feature.value}
                       </span>
                     </div>
                   {/if}
                   {if $featureKey == 'feat_quartier'}
                     <div class="mb-2">
                       <span class=" fw-bold">
                         {l s='Neighbourhood' d='Shop.Theme.Almodovar'}:
                       </span>
                       <span>
                         {$feature.value}
                       </span>
                     </div>
                   {/if}
                   {if $featureKey == 'feat_address'}
                     <div class="mb-2">
                       <span class=" fw-bold">
                         {l s='Address' d='Shop.Theme.Almodovar'}:
                       </span>
                       <span>
                         {$feature.value}
                       </span>
                     </div>
                   {/if}
                   {if $featureKey == 'feat_latitude'}
 
                     {assign var="latitude" value=$feature.value}
                   {/if}
                   {if $featureKey == 'feat_longitude'}
                     {assign var="longitude" value=$feature.value}
                   {/if}
 
                 {/foreach}
               </div>
               <div class="col-md-8">
                 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
                 <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
 
                 <style>
                   #map {
                     width: 100%;
                     height: 400px;
                   }
                 </style>
                 <div id="map"></div>
                 <script>
                   let latitude = parseFloat({$latitude});
                   let longitude = parseFloat({$longitude});
                   let region = "{$product.grouped_features['feat_region'].value}";
                   let name = "{$product.name}";
 
                 </script>
 
                 {literal}
                   <script>
                  
 
                     var map = L.map('map').setView([latitude, longitude], 15);
 
                     // Ajouter la couche OpenStreetMap
                     L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                     attribution: '&copy; OpenStreetMap contributors'
                     }).addTo(map);
 
                     // Ajouter un marqueur unique aux coordonnées du bien immobilier
                     L.marker([latitude, longitude], {
                       icon: L.divIcon({
                         className: 'custom-icon',
                         html: `<div style="
                     background: #1C354C;
                     color: white;
                     border-radius: 50%;
                     box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
                     opacity: 0.8;
                     width: 40px;
                     height: 40px;
                     display: flex;
                     align-items: center;
                     justify-content: center;
                     font-size: 16px;
                 ">🏡</div>`,
                 iconSize: [40, 40],  // Taille réelle de l'icône
         iconAnchor: [20, 40], // Centrage correct (moitié de la largeur et tout en bas pour pointer correctement)
         popupAnchor: [0, -40] // Ajustement du popup pour éviter qu'il ne soit trop bas
                       })
                     }).addTo(map);
                   </script>
                 {/literal}
 
               </div>
             </div>
 
             {block name='product_details'}
               {include file='catalog/_partials/product-details.tpl'}
             {/block}
 
             {block name='product_attachments'}
               {if $product.attachments}
                 <div class="info" id="attachments">
                   <h2 class="info__title fs-3" id="product-attachments-heading">
 
                     {l s='Download' d='Shop.Theme.Actions'}
                   </h2>
                   <div id="product-attachments" class="info__content">
                     <div class="product__attachments">
                       {foreach from=$product.attachments item=attachment}
                         <div class="attachment">
                           <p class="h5"><a
                               href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
                           </p>
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
               <div class="info" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}" {/foreach}>
                 <h2 class="info__title accordion-header" id="product-extra{$extraKey}-heading">
                   <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                     data-bs-target="#product-extra{$extraKey}-collapse" aria-expanded="true"
                     aria-controls="product-extra{$extraKey}-collapse">
                     {$extra.title}
                   </button>
                 </h2>
                 <div id="product-extra{$extraKey}-collapse" class="info__content accordion-collapse collapse"
                   data-bs-parent="#product-infos-accordion" aria-labelledby="product-extra{$extraKey}-heading">
                   <div class="accordion-body">
                     {$extra.content nofilter}
                   </div>
                 </div>
               </div>
             {/foreach}
 
           </div>
         {/block}
         {* END OF SECOND PART *}
         {hook h='displayProductVideo' product=$product} 
 
 
 
       </div>
 
       <div class="product__col col-md-4">
 
         {block name='product_prices'}
           {include file='catalog/_partials/product-prices.tpl'}
           {*{include file='catalog/_partials/product-flags.tpl'}*}
         {/block}
 
           {widget name="code_childleadsform" product=$product}
           {widget name="ps_sharebuttons"}
 
 
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
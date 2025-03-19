
<div class="d-flex" style="background:url('/modules/code_buildhomepage/uploads/block/2.webp?20250304144634') no-repeat center center; background-size: cover; height: 100vh; width: 100%;">  
 <div class="container mt-5">
 <div class="search-widgets js-search-widget mt-5" data-search-controller-url="{$search_controller_url}">
 <h1 class="title text-center mb-5 text-white text-shadow" style="text-shadow: 2px 2px 5px rgb(0 0 0 / 29%);font-size: 66px;
">L’immobilier à Alicante, c’est ici !</h1>
   <form class="pt-3 mx-auto w-75" style="max-width: 973px;" method="get" action="{$search_controller_url}">
     <input type="hidden" name="controller" value="search">
     <div class="bg-white rounded-pill ps-5 d-flex flex-wrap align-items-center gap-2">
     <!-- Localisation -->
     <div class="mt-1 mb-1 col-4 border-end">
       <label for="search-location" class="form-label">{l s='Localisation' d='Shop.Theme.Catalog'}</label>
       <input id="search-location" class="form-control border-0 p-0 shadow-none" type="text" name="location" 
         placeholder="{l s='Région, Département, Ville...' d='Shop.Theme.Catalog'}" 
         aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
     </div>

     <!-- Type de bien -->
     <div class="mt-1 mb-1 col-2 border-end">
       <label for="property-type" class="form-label">{l s='Type de bien' d='Shop.Theme.Catalog'}</label>
       <select id="property-type" class="form-select border-0 p-0 shadow-none" name="property_type">
         <option value="">{l s='Choisir...' d='Shop.Theme.Catalog'}</option>
         {foreach from=$property_types item=type}
           <option value="{$type.id_feature}">{$type.name}</option>
         {/foreach}
       </select>
     </div>

     <!-- Surface minimale -->
     <div class="mt-1 mb-1 col-2 border-end">
       <label for="min-surface" class="form-label">{l s='Surface minimum' d='Shop.Theme.Catalog'}</label>
       <div class="input-group">
         <input id="min-surface" class="form-control border-0 p-0 shadow-none" type="text" name="min_surface" 
           placeholder="{l s='Surface min' d='Shop.Theme.Catalog'}">
         <span class="input-group-text border-0 bg-white py-0 pe-3">m²</span>
       </div>
     </div>

     <!-- Prix maximum -->
     <div class="mt-1 mb-1 col-2">
       <label for="max-price" class="form-label">{l s='Prix maximum' d='Shop.Theme.Catalog'}</label>
       <div class="input-group">
         <span class="input-group-text border-0 bg-white py-0">€</span>

         <input id="max-price" class="form-control border-0 p-0 shadow-none" type="text" name="max_price" 
           placeholder="{l s='Prix max' d='Shop.Theme.Catalog'}">
       </div>
     </div>
     <div class="bg-primary rounded-end-pill">

     <div class="mt-1 mb-1 col-auto">

     <button type="submit" class="fs-5 btn text-white btn btn-transparent" style="
         min-height: 68px;
           min-width: 122px;
    max-width: 149px;
">
       {l s='chercher' d='Shop.Theme.Catalog'}
     </button>
     </div>
     </div>
     </div>
     
   </form>
 </div>
</div>
</div>


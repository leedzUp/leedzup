
<div class="d-flex" style="background:url('/modules/code_buildhomepage/uploads/block/2.webp?20250304144634') no-repeat center center; background-size: cover; height: 100vh; width: 100%;">  
 <div class="container mt-5">
 <div class="search-widgets js-search-widget mt-5" data-search-controller-url="{$search_controller_url}">
 <h1 class="title text-center mb-5 text-white text-shadow" style="text-shadow: 2px 2px 5px rgb(0 0 0 / 29%);font-size: 66px;
">{l s='slogan' d='Shop.Theme.Almodovar'}</h1>
   <form class="pt-3 mx-auto w-75" style="max-width: 973px;" method="get" action="{$search_controller_url}">
     <input type="hidden" name="controller" value="search">
     <div class="bg-white rounded-pill ps-5 d-flex flex-wrap align-items-center gap-2">
     <!-- Localisation -->
     <div class="mt-1 mb-1 col-4 border-end">
       <label for="search-location" class="form-label">{l s='Localisation' d='Shop.Theme.Almodovar'}</label>
       <input id="search-location" class="form-control border-0 p-0 shadow-none" type="text" name="location" 
         placeholder="{l s='Region, Department, City...' d='Shop.Theme.Almodovar'}" 
         aria-label="{l s='Search' d='Shop.Theme.Almodovar'}">
     </div>

     <!-- Type de bien -->
     <div class="mt-1 mb-1 col-2 border-end">
       <label for="property-type" class="form-label">{l s='Property type' d='Shop.Theme.Almodovar'}</label>
       <select id="property-type" class="form-select border-0 p-0 shadow-none" name="property_type">
         <option value="">{l s='To choose...' d='Shop.Theme.Almodovar'}</option>
         {foreach from=$property_types item=type}
           <option value="{$type.id_feature}">{$type.name}</option>
         {/foreach}
       </select>
     </div>

     <!-- Surface minimale -->
     <div class="mt-1 mb-1 col-2 border-end">
       <label for="min-surface" class="form-label">{l s='Minimum area' d='Shop.Theme.Almodovar'}</label>
       <div class="input-group">
         <input id="min-surface" class="form-control border-0 p-0 shadow-none" type="text" name="min_surface" 
           placeholder="{l s='Minimum area' d='Shop.Theme.Almodovar'}">
         <span class="input-group-text border-0 bg-white py-0 pe-3">m²</span>
       </div>
     </div>

     <!-- Prix maximum -->
     <div class="mt-1 mb-1 col-2">
       <label for="max-price" class="form-label">{l s='Maximum price' d='Shop.Theme.Almodovar'}</label>
       <div class="input-group">
         <span class="input-group-text border-0 bg-white py-0">€</span>

         <input id="max-price" class="form-control border-0 p-0 shadow-none" type="text" name="max_price" 
           placeholder="{l s='Max price' d='Shop.Theme.Almodovar'}">
       </div>
     </div>
     <div class="bg-primary rounded-end-pill">

     <div class="mt-1 mb-1 col-auto">

     <button type="submit" class="fs-5 btn text-white btn btn-transparent" style="
         min-height: 68px;
           min-width: 122px;
    max-width: 149px;
">
       {l s='Search' d='Shop.Theme.Almodovar'}
     </button>
     </div>
     </div>
     </div>
     
   </form>
 </div>
</div>
</div>


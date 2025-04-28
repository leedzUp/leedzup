
<style>
.search-gardient {
background:linear-gradient(to bottom, #9c6d92, #457b9d);
padding-bottom: 60px;
}

@media (min-width: 768px) {
  .border-end-lg {
    border-right: var(--bs-border-width) var(--bs-border-style) var(--bs-border-color)!important;
}
  .fs-4-lg {
    font-size: calc(1.275rem + .3vw)!important;
}
  .ps-5-lg {
    padding-left: 3rem!important;
}
  .search-box-lg {
    border-radius: var(--bs-border-radius-pill)!important;
    
  }
  .ms-auto-lg {
    margin-left: auto!important;
}
  .w-75-lg {
    width: 75%!important;
  }
}
@media (max-width: 768px) {
  .search-box-xs {
    padding:20px;
    border-radius: 30px;
    font-size: 1.2rem;
    margin-left: 1rem;
    margin-right: 1rem;
  }
  .search-box-xs input, .search-box-xs select {
    height: 40px;
    font-size: 1.2rem;

  }
  .rounded-xs-pill {
    border-radius: var(--bs-border-radius-pill)!important;
}

  .mt-xs-2{
    margin-top: 1rem!important;
  } 
}


</style>
<div class="d-flex search-gardient" >  
 <div class="container mt-5">
 <div class="search-widgets js-search-widget" data-search-controller-url="{$search_controller_url}">
 <h1 class="fw-bold text-center mb-2 text-white text-shadow" style="text-shadow: 2px 2px 5px rgb(0 0 0 / 29%);">{l s='slogan' d='Shop.Theme.Almodovar'}</h1>
 <p class="text-center text-white fs-4-lg">{l s='home_hat' d='Shop.Theme.Almodovar'}</p>
   <form class="pt-3 mx-auto w-75-lg" method="get" action="{$search_controller_url}">
     <input type="hidden" name="controller" value="search">
     <div class="search-box-lg search-box-xs shadow bg-white ps-5-lg d-flex flex-column flex-md-row flex-wrap align-items-center gap-2">
     <!-- Localisation -->
     <div class="mt-xs-2 mt-1 border-end-lg mb-1 col-12 col-md-3">
       <label for="search-location" class="fw-bold form-label">{l s='Localisation' d='Shop.Theme.Almodovar'}</label>
       <input id="search-location" class="form-control border-0 p-0 shadow-none" type="text" name="location" 
         placeholder="{l s='Region Department City' d='Shop.Theme.Almodovar'}" 
         aria-label="{l s='Search' d='Shop.Theme.Almodovar'}">
     </div>
       <!-- Type de bien -->
       <div class="mt-xs-2 mt-1 mb-1 col-12 col-md-2">
       <label for="propertyType" class="fw-bold form-label">{l s='Property type' d='Shop.Theme.Almodovar'}</label>
       
       {if isset($properties_types) && $properties_types|@count > 0}
        <select class="form-select border-0 p-0 shadow-none" name="property_type" id="propertyType">
            <option value="">{l s='To choose' d='Shop.Theme.Almodovar'}...</option>
            {foreach from=$properties_types item=type}
                <option value="{$type.value}">{$type.value}</option>
            {/foreach}
        </select>
        {else}
            <p>Aucun type de bien trouvé.</p>
        {/if}
 
     </div>

     <!-- Surface minimale -->
     <div class="mt-xs-2 mt-1 mb-1 col-12 col-md-3">
       <label for="min-surface" class="fw-bold form-label">{l s='Minimum area' d='Shop.Theme.Almodovar'}</label>
       <div class="input-group">
         <input id="min-surface" class="form-control border-0 p-0 shadow-none" type="text" name="min_surface" 
           placeholder="{l s='Minimum area' d='Shop.Theme.Almodovar'}">
         <span class="input-group-text border-0 bg-white py-0 pe-3">m²</span>
       </div>
     </div>

     <!-- Prix maximum -->
     <div class="mt-xs-2 mt-1 mb-1 col-12 col-md-2">
       <label for="max-price" class="fw-bold form-label">{l s='Maximum price' d='Shop.Theme.Almodovar'}</label>
       <div class="input-group">
         <span class="input-group-text border-0 bg-white py-0">€</span>

         <input id="max-price" class="form-control border-0 p-0 shadow-none" type="text" name="max_price" 
           placeholder="{l s='Max price' d='Shop.Theme.Almodovar'}">
       </div>
     </div>
     <div class="ms-auto-lg">
     <button type="submit" class="rounded-xs-pill mt-xs-2 fw-bold fs-5 text-white btn btn-primary h-100 rounded-end-pill px-4 py-3">
       {l s='Search' d='Shop.Theme.Almodovar'}
     </button>
     </div>
     </div>
     
   </form>


   
 </div>

 {include file="{$smarty.const._PS_THEME_DIR_}modules/ps_searchbar/themes-column-{$language.id}.tpl"}

</div>

</div>


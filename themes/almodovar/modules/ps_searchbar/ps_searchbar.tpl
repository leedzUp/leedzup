
<div class="d-flex" style=" 
background:linear-gradient(to bottom, #9c6d92, #457b9d);
padding-bottom: 60px;
">  
 <div class="container mt-5">
 <div class="search-widgets js-search-widget mt-5" data-search-controller-url="{$search_controller_url}">
 <h1 class="fw-bold text-center mb-5 text-white text-shadow" style="text-shadow: 2px 2px 5px rgb(0 0 0 / 29%);">{l s='slogan' d='Shop.Theme.Almodovar'}</h1>
   <form class="pt-3 mx-auto w-75" method="get" action="{$search_controller_url}">
     <input type="hidden" name="controller" value="search">
     <div class="bg-white {if Context::getContext()->detectDeviceByUserAgent() != 'mobile'}rounded-pill ps-5 {else}rounded-4 px-4{/if} d-flex flex-wrap align-items-center gap-2">
     <!-- Localisation -->
     <div class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}mt-3{else}mt-1 border-end{/if} mb-1 col-12 col-md-4">
       <label for="search-location" class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}fs-2{/if} fw-bold form-label">{l s='Localisation' d='Shop.Theme.Almodovar'}</label>
       <input id="search-location" class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}fs-2{/if} form-control border-0 p-0 shadow-none" type="text" name="location" 
         placeholder="{l s='Region Department City' d='Shop.Theme.Almodovar'}" 
         aria-label="{l s='Search' d='Shop.Theme.Almodovar'}">
     </div>

       <!-- Type de bien -->
       <div class="mt-1 mb-1 col-12 col-md-2 {if Context::getContext()->detectDeviceByUserAgent() != 'mobile'}border-end{/if}">
       <label for="propertyType" class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}fs-2{/if} fw-bold form-label">{l s='Property type' d='Shop.Theme.Almodovar'}</label>
       
 
       {if isset($properties_types) && $properties_types|@count > 0}
        <select class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}fs-2{/if} form-select border-0 p-0 shadow-none" name="property_type" id="propertyType">
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
     <div class="mt-1 mb-1 col-12 col-md-2 {if Context::getContext()->detectDeviceByUserAgent() != 'mobile'}border-end{/if}">
       <label for="min-surface" class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}fs-2{/if} fw-bold form-label">{l s='Minimum area' d='Shop.Theme.Almodovar'}</label>
       <div class="input-group">
         <input id="min-surface" class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}fs-2{/if} form-control border-0 p-0 shadow-none" type="text" name="min_surface" 
           placeholder="{l s='Minimum area' d='Shop.Theme.Almodovar'}">
         <span class="input-group-text border-0 bg-white py-0 pe-3">m²</span>
       </div>
     </div>

     <!-- Prix maximum -->
     <div class="mt-1 mb-1 col-12 col-md-2">
       <label for="max-price" class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}fs-2{/if} fw-bold form-label">{l s='Maximum price' d='Shop.Theme.Almodovar'}</label>
       <div class="input-group">
         <span class="input-group-text border-0 bg-white py-0">€</span>

         <input id="max-price" class="{if Context::getContext()->detectDeviceByUserAgent() == 'mobile'}fs-2{/if} form-control border-0 p-0 shadow-none" type="text" name="max_price" 
           placeholder="{l s='Max price' d='Shop.Theme.Almodovar'}">
       </div>
     </div>
     <div class="bg-primary {if Context::getContext()->detectDeviceByUserAgent() != 'mobile'}rounded-end-pill ms-auto{else}mx-auto rounded-4 mb-2{/if}">

     <div class="p-3">

     <button type="submit" class="fw-bold fs-5 btn text-white btn btn-transparent">
       {l s='Search' d='Shop.Theme.Almodovar'}
     </button>
     </div>
     </div>
     </div>
     
   </form>
 </div>

 {hook h='displayCategoryMap'}

</div>

</div>


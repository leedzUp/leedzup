<div class="container my-5">
  <div class="row g-4">
    <!-- Colonne Type de bien -->
    <div class="col-md-4">
      <div class="card h-100 shadow-sm">
        <div class="card-header bg-black text-white">
          <h2 class="h5 mb-0">{l s='Property type' d='Shop.Theme.Almodovar'}</h2>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush">
            {foreach $themes.types.items as $item}
              <li class="list-group-item border-0 d-flex justify-content-between align-items-center">
                <a href="{$item.url}" class="text-decoration-none">
                  {$item.label}
                </a>
                <span class="badge bg-primary rounded-pill">{$item.count}</span>
              </li>
            {/foreach}
          </ul>
        </div>
      </div>
    </div>

    <!-- Colonne Localisation -->
    <div class="col-md-4">
      <div class="card h-100 shadow-sm">
        <div class="card-header bg-black text-white">
          <h2 class="h5 mb-0">{l s='Localisation' d='Shop.Theme.Almodovar'}</h2>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush">
            {foreach $themes.locations.items as $region}
              <li class="list-group-item border-0">
                <div class="d-flex justify-content-between align-items-center">
                  <a href="{$region.url}" class="text-decoration-none">
                    {$region.label}
                  </a>
                  <span class="badge bg-primary rounded-pill">{$region.count}</span>
                </div>
                {if !empty($region.children)}
                  <ul class="list-unstyled ms-4 mt-2">
                    {foreach $region.children as $city}
                      <li class="mb-1 d-flex justify-content-between align-items-center">
                        <a href="{$city.url}" class="text-decoration-none small">
                          {$city.label}
                        </a>
                        <span class="badge bg-primary rounded-pill" style="font-size: 0.7rem;">{$city.count}</span>
                      </li>
                    {/foreach}
                  </ul>
                {/if}
              </li>
            {/foreach}
          </ul>
         
        </div>
      </div>
    </div>

    <!-- Colonne Style de vie -->
    <div class="col-md-4">
      <div class="card h-100 shadow-sm">
        <div class="card-header bg-black text-white">
          <h2 class="h5 mb-0">{l s='Lifestyle' d='Shop.Theme.Almodovar'}</h2>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush">
            {foreach $themes.lifestyles.items as $item}
              <li class="list-group-item border-0 d-flex justify-content-between align-items-center">
                <a href="{$item.url}" class="text-decoration-none">
                  {$item.label}
                </a>
                <span class="badge bg-primary rounded-pill">{$item.count}</span>
              </li>
            {/foreach}
          </ul>

          <ul class="list-group list-group-flush">
          {foreach $themes.tourism.items as $item}
            <li class="list-group-item border-0">
              <div class="d-flex justify-content-between align-items-center">
                <a href="{$item.url}" class="text-decoration-none">
                  {$item.label}
                </a>
                <span class="badge bg-primary rounded-pill">{$item.count}</span>
              </div>
             
            </li>
          {/foreach}
        </ul>
        </div>
      </div>
    </div>
  </div>
</div>
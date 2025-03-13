

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

        <div id="map" class="mb-2" style="height: 500px;"></div>

        
        <script>
        document.addEventListener("DOMContentLoaded", function () {
            var map = L.map('map').setView([40.4168, -3.7038], 6); // Centré sur Madrid, Espagne
    
            {literal}
            // Ajouter une couche OpenStreetMap
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; OpenStreetMap contributors'
            }).addTo(map);
            {/literal}
    
            // Liste des produits avec leurs coordonnées GPS
            var properties = [
                {foreach from=$products item="product"}
                    {
                        "latitude": "{$product.grouped_features['feat_latitude'].value|escape:'html':'UTF-8'}",
                        "longitude": "{$product.grouped_features['feat_longitude'].value|escape:'html':'UTF-8'}",
                        "title": "{$product.name|escape:'html':'UTF-8'}",
                        "cover": "{$product.cover.bySize.default_md.url|escape:'html':'UTF-8'}",
                        "price": "{$product.price|escape:'html':'UTF-8'}",
                        "url": "{$product.link|escape:'html':'UTF-8'}"
                    }{if !$product@last},{/if}
                {/foreach}
            ];
    
            {literal}
            // Ajouter un marqueur pour chaque bien immobilier
            properties.forEach(function (property) {
                var lat = parseFloat(property.latitude);
                var lon = parseFloat(property.longitude);
    
                if (!isNaN(lat) && !isNaN(lon)) {
                    L.marker([lat, lon])
                        .addTo(map)
                        .bindPopup(`
                            <div style="text-align:center;">
                            <img src="${property.cover}" alt="${property.title}" style="max-width: 100%; height: auto;"><br><br>
                                <strong>${property.title}</strong><br>
                                Prix: ${property.price}<br>
                                <a href="${property.url}" target="_blank">Voir l'annonce</a>
                            </div>
                        `);
                }
            });
            {/literal}
    
        });
    </script>

{capture assign="productClasses"}col-6 col-md-4{/capture}
    <div class="mt-4 products row">
        {foreach from=$products item="product" key="position"}
            {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses=$productClasses}
        {/foreach}
    </div>
    
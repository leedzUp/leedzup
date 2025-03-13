<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<style>
.leaflet-container a {
    color: #000;
}

</style>
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

    // Regroupement des biens par coordonnées GPS
    var groupedProperties = {};

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
    // Regrouper les biens ayant les mêmes coordonnées
    properties.forEach(function (property) {
        var key = property.latitude + "," + property.longitude;

        if (!groupedProperties[key]) {
            groupedProperties[key] = [];
        }
        groupedProperties[key].push(property);
    });

    // Ajouter un seul marqueur par position avec plusieurs annonces dans le popup
    Object.keys(groupedProperties).forEach(function (key) {
        var latLon = key.split(",");
        var lat = parseFloat(latLon[0]);
        var lon = parseFloat(latLon[1]);
        var propertiesAtLocation = groupedProperties[key];

        var popupContent = `
            <div style="max-height: 300px; overflow-y: auto; padding-right: 10px;">
                ${propertiesAtLocation.map(p => `
                    <div style="text-align:center; margin-bottom: 10px;">
                        <a href="${p.url}">
                            <img style="height: 165px; width: 265px; object-fit: cover;" src="${p.cover}" alt="${p.title}">
                            <br><br>
                            <strong>${p.title}</strong><br>
                            <span class="fs-4">${p.price}</span><br>
                        </a>
                    </div>
                `).join("<hr>")}
            </div>
        `;


        L.marker([lat, lon], {
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
        }).addTo(map).bindPopup(popupContent);
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

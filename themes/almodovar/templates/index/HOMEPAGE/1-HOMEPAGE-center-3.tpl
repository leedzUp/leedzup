<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Your new home in Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/en/real-estate-house-flat-near-the-sea-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Real estate house / flat near the sea" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Flat Near The Sea</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/en/real-estate-house-flat-on-golf-course-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Real estate house / flat on golf course" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Flat On Golf Course</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/en/real-estate-in-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Real estate in Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Need to be contacted?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">I have a project</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
        <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<style>
    #map {
        width: 100%;
        height: 600px;
    }
</style>
<script>
    
var map = L.map("map").setView([39.4699, -0.3763], 6);
{literal}
// Ajouter une couche OpenStreetMap
L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
attribution: "&copy; OpenStreetMap contributors"
}).addTo(map);
{/literal}

fetch(
    "https://raw.githubusercontent.com/codeforgermany/click_that_hood/refs/heads/main/public/data/spain-provinces.geojson")
.then(response => response.json())
.then(data => {
    // Liste des régions à afficher
    const regionsAFiltrer = ["Alacant/Alicante", "Murcia", "València/Valencia", "Castelló/Castellón",
        "Tarragona", "Barcelona"
    ];

    // Filtrer uniquement les régions souhaitées
    const dataFiltre = {
        "type": "FeatureCollection",
        "features": data.features.filter(feature =>
            regionsAFiltrer.includes(feature.properties.name)
        )
    };

    // Ajouter à la carte
    L.geoJSON(dataFiltre, {
        style: function(feature) {
            return {
                color: "#d23836",
                weight: 2,
                fillOpacity: 0.4
            };
        },
        onEachFeature: function(feature, layer) {
            // Générer un nombre aléatoire entre 10 et 100
            let number = 210;

            // Ajouter un marqueur au centre de la région avec ce nombre
            let center = layer.getBounds().getCenter();
            L.marker(center, {
                icon: L.divIcon({
                    className: "custom-icon",
                    html: `
        <div style="
            display: flex;
            align-items: center;
            background: transparent;
            padding: 2px;
            font-weight: bold;
            font-size: 14px;
            color:black;
            opacity: 0.8;
        ">
        {literal}

            <span style="
                background: #1C354C;
                color: white;
                border-radius: 50%;
                width: 30px;
                height: 30px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 8px;
                margin-right: 8px;
">${number}</span>
<span>${feature.properties.name}</span>
{/literal}

        </div>`,
                    iconSize: [180, 30] // Ajuste la taille du marqueur
                })
            }).addTo(map);
        }
    }).addTo(map);
})
.catch(error => console.error("Erreur chargement GeoJSON:", error));
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Get an estimate for your house in Alicante.</h2><img 
            alt="Get an estimate for your house in Alicante."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Get an estimate for your house in Alicante."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Get an estimate for your house in Alicante.</h2><div class="mw-355"><p>A correctly valued property is more likely to be sold quickly. Ask us for a free, no-obligation valuation of your property.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Get an assessment</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>A correctly valued property is more likely to be sold quickly. Ask us for a free, no-obligation valuation of your property.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Get an assessment</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Our Real Estate Guides</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>All our advice to help you make the most of your property projects in Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="en/category/our-real-estate-guides-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">See our guides</a></div>{/if}<div class="mt-6 row"><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/en/how-to-buy-a-property-in-spain-6"><picture>
                            <source media="(max-width: 480px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/6.svg">
                            <source media="(max-width: 768px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/6.svg">
                            <source media="(max-width: 950px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/6.svg">
                            <source media="(max-width: 1200px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/6.svg">
                            <source media="(min-width: 1920px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/6.svg">
                            
                                <img
                                    loading="lazy"
                                    alt="How to buy a property in Spain"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/6.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">How to buy a property in Spain</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/en/where-to-buy-real-estate-in-2025-in-alicante-7"><picture>
                            <source media="(max-width: 480px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/7.svg">
                            <source media="(max-width: 768px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/7.svg">
                            <source media="(max-width: 950px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/7.svg">
                            <source media="(max-width: 1200px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/7.svg">
                            <source media="(min-width: 1920px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/7.svg">
                            
                                <img
                                    loading="lazy"
                                    alt="Where to buy property in alicante in 2025?"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/7.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Where to buy property in alicante in 2025?</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/en/the-investor-s-guide-in-spain-8"><picture>
                            <source media="(max-width: 480px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/8.svg">
                            <source media="(max-width: 768px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/8.svg">
                            <source media="(max-width: 950px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/8.svg">
                            <source media="(max-width: 1200px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/8.svg">
                            <source media="(min-width: 1920px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/8.svg">
                            
                                <img
                                    loading="lazy"
                                    alt="The investor's guide to Spain"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/8.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">The investor's guide to Spain</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/en/5-things-to-consider-before-buying-a-alicante-9"><picture>
                            <source media="(max-width: 480px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/9.svg">
                            <source media="(max-width: 768px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/9.svg">
                            <source media="(max-width: 950px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/9.svg">
                            <source media="(max-width: 1200px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/9.svg">
                            <source media="(min-width: 1920px)"
                                    srcset="/modules/code_buildhomepage/uploads/cms_images/9.svg">
                            
                                <img
                                    loading="lazy"
                                    alt="5 things to consider before buying in Alicante"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/9.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">5 things to consider before buying in Alicante</span></a></div></li></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="en/category/our-real-estate-guides-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">See our guides</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Real Estate Alicante: Buy Houses and Apartments</h2><img 
            alt="Real Estate Alicante: Buy Houses and Apartments"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Real Estate Alicante: Buy Houses and Apartments"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Real Estate Alicante: Buy Houses and Apartments</h2><div class="mw-355"><p>The property market in Alicante is booming, attracting both international investors and residents looking for an exceptional quality of life. Its Mediterranean climate, splendid coastline and more affordable cost of living than in other major European cities make it a prime destination for property purchases.</p><p>Buying a property in Alicante has many advantages. Purchasing procedures are simplified for foreign buyers, while attractive interest rates and a dynamic market offer strategic investment opportunities. Whether for a primary residence, holiday home or rental investment, Alicante offers a wide choice of properties.</p><p>For those dreaming of a home in Alicante, the market offers a wide variety of properties. From contemporary villas by the sea to traditional houses nestled in the surrounding hills, every buyer can find a property to suit their expectations and budget. If you prefer the hustle and bustle of the city, buying a flat in Alicante is an ideal alternative. The historic centre, modern neighbourhoods and seaside residential areas offer a varied range of flats, from functional studios to penthouses with panoramic views.</p><p>With its exceptional living environment and dynamic property market, Alicante is a prime destination for a secure and profitable investment.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>The property market in Alicante is booming, attracting both international investors and residents looking for an exceptional quality of life. Its Mediterranean climate, splendid coastline and more affordable cost of living than in other major European cities make it a prime destination for property purchases.</p><p>Buying a property in Alicante has many advantages. Purchasing procedures are simplified for foreign buyers, while attractive interest rates and a dynamic market offer strategic investment opportunities. Whether for a primary residence, holiday home or rental investment, Alicante offers a wide choice of properties.</p><p>For those dreaming of a home in Alicante, the market offers a wide variety of properties. From contemporary villas by the sea to traditional houses nestled in the surrounding hills, every buyer can find a property to suit their expectations and budget. If you prefer the hustle and bustle of the city, buying a flat in Alicante is an ideal alternative. The historic centre, modern neighbourhoods and seaside residential areas offer a varied range of flats, from functional studios to penthouses with panoramic views.</p><p>With its exceptional living environment and dynamic property market, Alicante is a prime destination for a secure and profitable investment.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/en/property-in-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Property in Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Property in Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/en/property-in-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Property in Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Property in Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/en/real-estate-in-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Real estate in Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Real estate in Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/en/property-in-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Property in Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Property in Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Real Estate Alicante: Between Sea and Mountains</h2><img 
            alt="Real Estate Alicante: Between Sea and Mountains"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Real Estate Alicante: Between Sea and Mountains"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Real Estate Alicante: Between Sea and Mountains</h2><div class="mw-355"><p>The province of Alicante, located on the famous Costa Blanca, boasts an exceptional natural setting between golden beaches and mountainous terrain. With over 200 kilometres of coastline bordering the Mediterranean, the Alicante property market is booming, attracting many buyers looking for an idyllic lifestyle.</p><p>The coast is full of modern flats, particularly in Benidorm and Torrevieja, offering uninterrupted sea views and top-class amenities. For those who prefer a more intimate abode, there are superb houses for sale on the Costa Blanca, some with private pools and breathtaking views.</p><p>Buying a house in Alicante also means enjoying a unique art of living. With local gastronomy, including the famous paella and Alicante sweet wine, and a mild climate all year round, this region offers an incomparable living environment for investors and residents alike.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>The province of Alicante, located on the famous Costa Blanca, boasts an exceptional natural setting between golden beaches and mountainous terrain. With over 200 kilometres of coastline bordering the Mediterranean, the Alicante property market is booming, attracting many buyers looking for an idyllic lifestyle.</p><p>The coast is full of modern flats, particularly in Benidorm and Torrevieja, offering uninterrupted sea views and top-class amenities. For those who prefer a more intimate abode, there are superb houses for sale on the Costa Blanca, some with private pools and breathtaking views.</p><p>Buying a house in Alicante also means enjoying a unique art of living. With local gastronomy, including the famous paella and Alicante sweet wine, and a mild climate all year round, this region offers an incomparable living environment for investors and residents alike.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Flats &amp; houses for sale in Alicante</a></div></div></div></div></div>
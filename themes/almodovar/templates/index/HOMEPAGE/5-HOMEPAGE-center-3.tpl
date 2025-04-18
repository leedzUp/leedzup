<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Jouw nieuwe huis in Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/nl/vastgoed-huis-appartement-bij-de-zee-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Vastgoed huis / appartement bij de zee" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Appartement Bij De Zee</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/nl/onroerend-goed-huis-appartement-op-golfbaan-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Onroerend goed huis / appartement op golfbaan" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Appartement Op Golfbaan</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/nl/onroerend-goed-in-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Onroerend goed in Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Wil je gecontacteerd worden?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Ik heb een project</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Krijg een schatting voor je huis in Alicante</h2><img 
            alt="Krijg een schatting voor je huis in Alicante"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Krijg een schatting voor je huis in Alicante"
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Krijg een schatting voor je huis in Alicante</h2><div class="mw-355"><p>Een correct getaxeerde woning heeft meer kans om snel verkocht te worden. Vraag ons om een gratis en vrijblijvende taxatie van uw woning.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Een beoordeling krijgen</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Een correct getaxeerde woning heeft meer kans om snel verkocht te worden. Vraag ons om een gratis en vrijblijvende taxatie van uw woning.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Een beoordeling krijgen</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Onze vastgoedgidsen</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Al ons advies om u te helpen het meeste te halen uit uw vastgoedprojecten in Alicante.</p></div>{/if}<div class="mt-6 row"><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/nl/hoe-koop-ik-een-huis-in-spanje-6"><picture>
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
                                    alt="Hoe koop ik een huis in Spanje?"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/6.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Hoe koop ik een huis in Spanje?</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/nl/waar-in-2025-een-huis-kopen-in-alicante-7"><picture>
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
                                    alt="Waar in 2025 een huis kopen in Alicante?"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/7.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Waar in 2025 een huis kopen in Alicante?</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/nl/de-gids-voor-investeerders-in-spanje-8"><picture>
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
                                    alt="De gids voor investeerders in Spanje"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/8.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">De gids voor investeerders in Spanje</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/nl/5-dingen-om-te-overwegen-voordat-je-een-huis-koopt-in-alicante-9"><picture>
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
                                    alt="5 dingen om te overwegen voordat je een huis koopt in Alicante"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/9.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">5 dingen om te overwegen voordat je een huis koopt in Alicante</span></a></div></li></div></div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Vastgoed in Alicante: koop huis en appartement</h2><img 
            alt="Vastgoed in Alicante: koop huis en appartement"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Vastgoed in Alicante: koop huis en appartement"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Vastgoed in Alicante: koop huis en appartement</h2><div class="mw-355"><p>De vastgoedmarkt in Alicante is booming en trekt zowel internationale investeerders als inwoners aan die op zoek zijn naar een uitzonderlijke levenskwaliteit. Het mediterrane klimaat, de prachtige kustlijn en de meer betaalbare kosten van levensonderhoud dan in andere grote Europese steden maken het een uitstekende bestemming voor de aankoop van onroerend goed.<p>Een huis kopen in Alicante heeft veel voordelen. Aankoopprocedures zijn vereenvoudigd voor buitenlandse kopers, terwijl aantrekkelijke rentetarieven en een dynamische markt strategische investeringsmogelijkheden bieden. Of het nu gaat om een hoofdverblijfplaats, een vakantiehuis of een investering in verhuur, Alicante biedt een ruime keuze aan onroerend goed.</p> <p>Dromen van een huis in Alicante is gemakkelijk.<p>Voor wie droomt van een huis in Alicante, biedt de markt een grote verscheidenheid aan eigendommen. Van moderne villa's aan zee tot traditionele huizen in de omliggende heuvels, elke koper kan een woning vinden die aan zijn verwachtingen en budget voldoet. Als je de drukte van de stad verkiest, is een appartement kopen in Alicante een ideaal alternatief. Het historische centrum, de moderne wijken en de woonwijken aan zee bieden een gevarieerd aanbod van appartementen, van functionele studio's tot penthouses met panoramisch uitzicht.</p><p>Met zijn uitzonderlijke leefomgeving en dynamische vastgoedmarkt is Alicante een uitstekende bestemming voor een veilige en winstgevende investering.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>De vastgoedmarkt in Alicante is booming en trekt zowel internationale investeerders als inwoners aan die op zoek zijn naar een uitzonderlijke levenskwaliteit. Het mediterrane klimaat, de prachtige kustlijn en de meer betaalbare kosten van levensonderhoud dan in andere grote Europese steden maken het een uitstekende bestemming voor de aankoop van onroerend goed.<p>Een huis kopen in Alicante heeft veel voordelen. Aankoopprocedures zijn vereenvoudigd voor buitenlandse kopers, terwijl aantrekkelijke rentetarieven en een dynamische markt strategische investeringsmogelijkheden bieden. Of het nu gaat om een hoofdverblijfplaats, een vakantiehuis of een investering in verhuur, Alicante biedt een ruime keuze aan onroerend goed.</p> <p>Dromen van een huis in Alicante is gemakkelijk.<p>Voor wie droomt van een huis in Alicante, biedt de markt een grote verscheidenheid aan eigendommen. Van moderne villa's aan zee tot traditionele huizen in de omliggende heuvels, elke koper kan een woning vinden die aan zijn verwachtingen en budget voldoet. Als je de drukte van de stad verkiest, is een appartement kopen in Alicante een ideaal alternatief. Het historische centrum, de moderne wijken en de woonwijken aan zee bieden een gevarieerd aanbod van appartementen, van functionele studio's tot penthouses met panoramisch uitzicht.</p><p>Met zijn uitzonderlijke leefomgeving en dynamische vastgoedmarkt is Alicante een uitstekende bestemming voor een veilige en winstgevende investering.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/nl/eigendom-in-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Eigendom in Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Eigendom in Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/nl/eigendom-in-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Eigendom in Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Eigendom in Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/nl/onroerend-goed-in-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Onroerend goed in Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Onroerend goed in Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/nl/vastgoed-in-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Vastgoed in Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Vastgoed in Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Vastgoed in Alicante: tussen zee en bergen</h2><img 
            alt="Vastgoed in Alicante: tussen zee en bergen"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Vastgoed in Alicante: tussen zee en bergen"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Vastgoed in Alicante: tussen zee en bergen</h2><div class="mw-355"><p>De provincie Alicante, gelegen aan de beroemde Costa Blanca, heeft een uitzonderlijke natuurlijke omgeving tussen gouden stranden en bergachtig terrein. Met meer dan 200 kilometer kustlijn aan de Middellandse Zee is de vastgoedmarkt van Alicante booming en trekt het veel kopers aan die op zoek zijn naar een idyllische levensstijl.</p><p>De kust staat vol met moderne flats, vooral in Benidorm en Torrevieja, die een ononderbroken uitzicht op zee en eersteklas voorzieningen bieden. Voor degenen die de voorkeur geven aan een intiemere woning, zijn er prachtige huizen te koop aan de Costa Blanca, sommige met privézwembad en adembenemend uitzicht.</p><p>Een huis kopen in Alicante betekent ook genieten van een unieke levenskunst. Met de lokale gastronomie, waaronder de beroemde paella en de zoete wijn van Alicante, en het milde klimaat het hele jaar door, biedt deze regio een onvergelijkbare leefomgeving voor zowel investeerders als bewoners.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>De provincie Alicante, gelegen aan de beroemde Costa Blanca, heeft een uitzonderlijke natuurlijke omgeving tussen gouden stranden en bergachtig terrein. Met meer dan 200 kilometer kustlijn aan de Middellandse Zee is de vastgoedmarkt van Alicante booming en trekt het veel kopers aan die op zoek zijn naar een idyllische levensstijl.</p><p>De kust staat vol met moderne flats, vooral in Benidorm en Torrevieja, die een ononderbroken uitzicht op zee en eersteklas voorzieningen bieden. Voor degenen die de voorkeur geven aan een intiemere woning, zijn er prachtige huizen te koop aan de Costa Blanca, sommige met privézwembad en adembenemend uitzicht.</p><p>Een huis kopen in Alicante betekent ook genieten van een unieke levenskunst. Met de lokale gastronomie, waaronder de beroemde paella en de zoete wijn van Alicante, en het milde klimaat het hele jaar door, biedt deze regio een onvergelijkbare leefomgeving voor zowel investeerders als bewoners.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/type-eigendom-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Appartementen en huizen te koop in Alicante</a></div></div></div></div></div>
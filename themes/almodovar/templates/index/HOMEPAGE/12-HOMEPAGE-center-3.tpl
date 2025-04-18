<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Ditt nya hem i Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/sv/fastighetshus-lagenhet-nara-havet-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Fastighetshus / lägenhet nära havet" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Lägenhet Nära Havet</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/sv/fastighetshus-lagenhet-pa-golfbana-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Fastighetshus / lägenhet på golfbana" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Lägenhet På Golfbana</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/sv/fastigheter-i-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Fastigheter i Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Behöver du bli kontaktad?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Jag har ett projekt</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Få en värdering av ditt hus i Alicante.</h2><img 
            alt="Få en värdering av ditt hus i Alicante."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Få en värdering av ditt hus i Alicante."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Få en värdering av ditt hus i Alicante.</h2><div class="mw-355"><p>En korrekt värderad fastighet säljs snabbare. Begär en gratis, förbindelsefri värdering.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Få en värdering</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>En korrekt värderad fastighet säljs snabbare. Begär en gratis, förbindelsefri värdering.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Få en värdering</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Våra Fastighetsguider</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Alla våra råd för att hjälpa dig att få ut mesta möjliga av dina fastighetsprojekt i Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="sv/category/vaara-fastighetsguider-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Se våra guider</a></div>{/if}<div class="mt-6 row"></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="sv/category/vaara-fastighetsguider-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Se våra guider</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Fastigheter Alicante: Köp hus och lägenheter</h2><img 
            alt="Fastigheter Alicante: Köp hus och lägenheter"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Fastigheter Alicante: Köp hus och lägenheter"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Fastigheter Alicante: Köp hus och lägenheter</h2><div class="mw-355"><p>Fastighetsmarknaden i Alicante är i stark tillväxt och lockar både internationella investerare och invånare som söker enastående livskvalitet. Medelhavsklimatet, strålande kustlinje och lägre levnadskostnader än i andra större europeiska städer gör det till en främsta destination för fastighetsköp.</p><p>Att köpa fastighet i Alicante har många fördelar. Köpprocedurer är förenklade för utländska köpare, medan attraktiva räntor och en dynamisk marknad erbjuder strategiska investeringsmöjligheter. Oavsett om det är för permanentboende, fritidshus eller investering i uthyrning, erbjuder Alicante ett brett utbud av fastigheter.</p><p>För dem som drömmer om ett hem i Alicante erbjuder marknaden ett stort utbud av fastigheter. Från moderna villor vid havet till traditionella hus inbäddade i omgivande kullar - varje köpare kan hitta en fastighet som passar deras förväntningar och budget. Föredrar du stadens puls är köp av lägenhet i Alicante ett idealiskt alternativ. Det historiska centrumet, moderna stadsdelar och bostadsområden vid havet erbjuder ett varierat utbud av lägenheter, från funktionella studior till takvåningar med panoramautsikt.</p><p>Med sin exceptionella livsmiljö och dynamiska fastighetsmarknad är Alicante en främsta destination för en säker och lönsam investering.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Fastighetsmarknaden i Alicante är i stark tillväxt och lockar både internationella investerare och invånare som söker enastående livskvalitet. Medelhavsklimatet, strålande kustlinje och lägre levnadskostnader än i andra större europeiska städer gör det till en främsta destination för fastighetsköp.</p><p>Att köpa fastighet i Alicante har många fördelar. Köpprocedurer är förenklade för utländska köpare, medan attraktiva räntor och en dynamisk marknad erbjuder strategiska investeringsmöjligheter. Oavsett om det är för permanentboende, fritidshus eller investering i uthyrning, erbjuder Alicante ett brett utbud av fastigheter.</p><p>För dem som drömmer om ett hem i Alicante erbjuder marknaden ett stort utbud av fastigheter. Från moderna villor vid havet till traditionella hus inbäddade i omgivande kullar - varje köpare kan hitta en fastighet som passar deras förväntningar och budget. Föredrar du stadens puls är köp av lägenhet i Alicante ett idealiskt alternativ. Det historiska centrumet, moderna stadsdelar och bostadsområden vid havet erbjuder ett varierat utbud av lägenheter, från funktionella studior till takvåningar med panoramautsikt.</p><p>Med sin exceptionella livsmiljö och dynamiska fastighetsmarknad är Alicante en främsta destination för en säker och lönsam investering.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/sv/fastighet-i-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Fastighet i Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Fastighet i Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/sv/fastighet-i-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Fastighet i Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Fastighet i Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/sv/fastigheter-i-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Fastigheter i Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Fastigheter i Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/sv/fastighet-i-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Fastighet i Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Fastighet i Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Fastigheter Alicante: Mellan hav och berg</h2><img 
            alt="Fastigheter Alicante: Mellan hav och berg"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Fastigheter Alicante: Mellan hav och berg"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Fastigheter Alicante: Mellan hav och berg</h2><div class="mw-355"><p>Alicante-provinsen, belägen vid den berömda Costa Blanca, har en exceptionell naturlig miljö mellan gyllene stränder och bergig terräng. Med över 200 kilometer kustlinje vid Medelhavet är fastighetsmarknaden i Alicante i stark tillväxt och lockar många köpare som söker en idyllisk livsstil.</p><p>Kusten är full av moderna lägenheter, särskilt i Benidorm och Torrevieja, som erbjuder ostörd havsutsikt och förstklassiga bekvämligheter. För de som föredrar ett mer intimt boende finns det fantastiska hus till salu på Costa Blanca, några med privat pool och fantastisk utsikt.</p><p>Att köpa ett hus i Alicante innebär också att njuta av en unik levnadskonst. Med lokal gastronomi, inklusive den berömda paellan och Alicantes söta vin, samt ett milt klimat året runt, erbjuder denna region en oöverträffad livsmiljö för både investerare och boende.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Alicante-provinsen, belägen vid den berömda Costa Blanca, har en exceptionell naturlig miljö mellan gyllene stränder och bergig terräng. Med över 200 kilometer kustlinje vid Medelhavet är fastighetsmarknaden i Alicante i stark tillväxt och lockar många köpare som söker en idyllisk livsstil.</p><p>Kusten är full av moderna lägenheter, särskilt i Benidorm och Torrevieja, som erbjuder ostörd havsutsikt och förstklassiga bekvämligheter. För de som föredrar ett mer intimt boende finns det fantastiska hus till salu på Costa Blanca, några med privat pool och fantastisk utsikt.</p><p>Att köpa ett hus i Alicante innebär också att njuta av en unik levnadskonst. Med lokal gastronomi, inklusive den berömda paellan och Alicantes söta vin, samt ett milt klimat året runt, erbjuder denna region en oöverträffad livsmiljö för både investerare och boende.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Lägenheter och hus till salu i Alicante</a></div></div></div></div></div>
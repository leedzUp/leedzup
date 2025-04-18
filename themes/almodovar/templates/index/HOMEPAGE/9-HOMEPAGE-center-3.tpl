<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Ditt nye hjem i Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/nb/fast-eiendom-hus-leilighet-naer-sjoen-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Fast eiendom hus / leilighet nær sjøen" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Leilighet Nær Sjøen</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/nb/fast-eiendom-hus-leilighet-pa-golfbane-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Fast eiendom hus / leilighet på golfbane" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Leilighet På Golfbane</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/nb/fast-eiendom-i-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Fast eiendom i Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Trenger du å bli kontaktet?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Jeg har et prosjekt</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Få en vurdering af dit hus i Alicante.</h2><img 
            alt="Få en vurdering af dit hus i Alicante."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Få en vurdering af dit hus i Alicante."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Få en vurdering af dit hus i Alicante.</h2><div class="mw-355"><p>En korrekt vurderet ejendom sælges hurtigere. Få en gratis, uforpligtende vurdering.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Få en vurdering</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>En korrekt vurderet ejendom sælges hurtigere. Få en gratis, uforpligtende vurdering.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Få en vurdering</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Våre eiendomsguider</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Alle våre råd for å hjelpe deg med å få mest mulig ut av eiendomsprosjektene dine i Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="no/category/vaare-eiendomsguider-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Se våre guider</a></div>{/if}<div class="mt-6 row"></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="no/category/vaare-eiendomsguider-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Se våre guider</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Eiendom Alicante: Kjøp hus og leiligheter</h2><img 
            alt="Eiendom Alicante: Kjøp hus og leiligheter"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Eiendom Alicante: Kjøp hus og leiligheter"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Eiendom Alicante: Kjøp hus og leiligheter</h2><div class="mw-355"><p>Eiendomsmarkedet i Alicante er i sterk vekst og tiltrekker seg både internasjonale investorer og beboere som søker enestående livskvalitet. Middelhavsklimaet, fantastisk kystlinje og lavere levekostnader enn i andre store europeiske byer gjør det til et førsteklasses valg for eiendomskjøp.</p><p>Å kjøpe eiendom i Alicante har mange fordeler. Kjøpsprosedyrene er forenklet for utenlandske kjøpere, mens attraktive renter og et dynamisk marked gir strategiske investeringsmuligheter. Enten det er for en primærbolig, feriehus eller utleieinvestering, tilbyr Alicante et bredt utvalg av eiendommer.</p><p>For de som drømmer om et hjem i Alicante, tilbyr markedet et stort utvalg av eiendommer. Fra moderne villaer ved sjøen til tradisjonelle hus i de omkringliggende åsene - enhver kjøper kan finne en eiendom som passer til forventningene og budsjettet. Foretrekker du byens pulserende liv, er det å kjøpe leilighet i Alicante et ideelt alternativ. Det historiske sentrumet, moderne nabolag og boligområder ved sjøen tilbyr et variert utvalg av leiligheter, fra funksjonelle studioer til penthouseleiligheter med panoramautsikt.</p><p>Med sitt enestående boområde og dynamiske eiendomsmarked er Alicante et førsteklasses valg for en sikker og lønnsom investering.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Eiendomsmarkedet i Alicante er i sterk vekst og tiltrekker seg både internasjonale investorer og beboere som søker enestående livskvalitet. Middelhavsklimaet, fantastisk kystlinje og lavere levekostnader enn i andre store europeiske byer gjør det til et førsteklasses valg for eiendomskjøp.</p><p>Å kjøpe eiendom i Alicante har mange fordeler. Kjøpsprosedyrene er forenklet for utenlandske kjøpere, mens attraktive renter og et dynamisk marked gir strategiske investeringsmuligheter. Enten det er for en primærbolig, feriehus eller utleieinvestering, tilbyr Alicante et bredt utvalg av eiendommer.</p><p>For de som drømmer om et hjem i Alicante, tilbyr markedet et stort utvalg av eiendommer. Fra moderne villaer ved sjøen til tradisjonelle hus i de omkringliggende åsene - enhver kjøper kan finne en eiendom som passer til forventningene og budsjettet. Foretrekker du byens pulserende liv, er det å kjøpe leilighet i Alicante et ideelt alternativ. Det historiske sentrumet, moderne nabolag og boligområder ved sjøen tilbyr et variert utvalg av leiligheter, fra funksjonelle studioer til penthouseleiligheter med panoramautsikt.</p><p>Med sitt enestående boområde og dynamiske eiendomsmarked er Alicante et førsteklasses valg for en sikker og lønnsom investering.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/nb/eiendom-i-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Eiendom i Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Eiendom i Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/nb/eiendom-i-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Eiendom i Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Eiendom i Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/nb/fast-eiendom-i-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Fast eiendom i Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Fast eiendom i Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/nb/eiendom-i-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Eiendom i Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Eiendom i Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Eiendomsmegling Alicante: Mellom hav og fjell</h2><img 
            alt="Eiendomsmegling Alicante: Mellom hav og fjell"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Eiendomsmegling Alicante: Mellom hav og fjell"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Eiendomsmegling Alicante: Mellom hav og fjell</h2><div class="mw-355"><p>Alicante-provinsen, beliggende ved den berømte Costa Blanca, har et usedvanlig naturlig miljø mellom gyldne strender og fjellterreng. Med over 200 kilometer kystlinje langs Middelhavet er eiendomsmarkedet i Alicante i sterk vekst, og tiltrekker seg mange kjøpere som leter etter en idyllisk livsstil.</p><p>Kysten er full av moderne leiligheter, spesielt i Benidorm og Torrevieja, som tilbyr uforstyrret havutsikt og førsteklasses fasiliteter. For de som foretrekker et mer intimt bosted, finnes det fantastiske hus til salgs på Costa Blanca, noen med privat svømmebasseng og fantastisk utsikt.</p><p>Å kjøpe bolig i Alicante betyr også å nyte en unik levekunst. Med lokal gastronomi, inkludert den berømte paellaen og Alicantes søte vin, og et mildt klima hele året, tilbyr denne regionen en uovertruffen boinvestering for både investorer og beboere.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Alicante-provinsen, beliggende ved den berømte Costa Blanca, har et usedvanlig naturlig miljø mellom gyldne strender og fjellterreng. Med over 200 kilometer kystlinje langs Middelhavet er eiendomsmarkedet i Alicante i sterk vekst, og tiltrekker seg mange kjøpere som leter etter en idyllisk livsstil.</p><p>Kysten er full av moderne leiligheter, spesielt i Benidorm og Torrevieja, som tilbyr uforstyrret havutsikt og førsteklasses fasiliteter. For de som foretrekker et mer intimt bosted, finnes det fantastiske hus til salgs på Costa Blanca, noen med privat svømmebasseng og fantastisk utsikt.</p><p>Å kjøpe bolig i Alicante betyr også å nyte en unik levekunst. Med lokal gastronomi, inkludert den berømte paellaen og Alicantes søte vin, og et mildt klima hele året, tilbyr denne regionen en uovertruffen boinvestering for både investorer og beboere.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Leiligheter og hus til salgs i Alicante</a></div></div></div></div></div>
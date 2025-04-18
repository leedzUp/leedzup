<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">La tua nuova casa ad Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/it/immobile-casa-appartamento-vicino-al-mare-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Immobile casa/appartamento vicino al mare" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Appartamento Vicino Al Mare</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/it/immobile-casa-appartamento-su-campo-da-golf-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Immobile casa/appartamento su campo da golf" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Appartamento Su Campo Da Golf</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/it/immobili-a-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Immobili a Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Vuoi essere contattato?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Ho un progetto</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Ottieni una stima per la tua casa ad Alicante.</h2><img 
            alt="Ottieni una stima per la tua casa ad Alicante."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Ottieni una stima per la tua casa ad Alicante."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Ottieni una stima per la tua casa ad Alicante.</h2><div class="mw-355"><p>Una proprietà valutata correttamente si vende più velocemente. Richiedi una valutazione gratuita e senza impegno.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Richiedi una stima</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Una proprietà valutata correttamente si vende più velocemente. Richiedi una valutazione gratuita e senza impegno.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Richiedi una stima</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Le Nostre Guide Immobiliari</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Tutti i nostri consigli per aiutarti a sfruttare al meglio i tuoi progetti immobiliari ad Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="it/category/guide-immobiliari-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Vedi le nostre guide</a></div>{/if}<div class="mt-6 row"></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="it/category/guide-immobiliari-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Vedi le nostre guide</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Immobiliare Alicante: Compra Case e Appartamenti</h2><img 
            alt="Immobiliare Alicante: Compra Case e Appartamenti"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Immobiliare Alicante: Compra Case e Appartamenti"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Immobiliare Alicante: Compra Case e Appartamenti</h2><div class="mw-355"><p>Il mercato immobiliare di Alicante è in forte crescita, attirando sia investitori internazionali che residenti alla ricerca di una qualità della vita eccezionale. Il suo clima mediterraneo, la splendida costa e un costo della vita più accessibile rispetto ad altre grandi città europee ne fanno una destinazione privilegiata per gli acquisti immobiliari.</p><p>Acquistare una proprietà ad Alicante offre molti vantaggi. Le procedure di acquisto sono semplificate per i compratori stranieri, mentre i tassi di interesse attraenti e un mercato dinamico offrono opportunità di investimento strategiche. Che si tratti di una residenza principale, una casa vacanze o un investimento locativo, Alicante offre un'ampia scelta di proprietà.</p><p>Per chi sogna una casa ad Alicante, il mercato offre un'ampia varietà di immobili. Dalle ville contemporanee sul mare alle case tradizionali annidate tra le colline circostanti, ogni acquirente può trovare una proprietà adatta alle proprie aspettative e budget. Se preferite il trambusto della città, comprare un appartamento ad Alicante è un'alternativa ideale. Il centro storico, i quartieri moderni e le zone residenziali sul mare offrono una gamma varia di appartamenti, dai monolocali funzionali agli attici con vista panoramica.</p><p>Con il suo eccezionale ambiente di vita e un mercato immobiliare dinamico, Alicante è una destinazione privilegiata per un investimento sicuro e redditizio.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Il mercato immobiliare di Alicante è in forte crescita, attirando sia investitori internazionali che residenti alla ricerca di una qualità della vita eccezionale. Il suo clima mediterraneo, la splendida costa e un costo della vita più accessibile rispetto ad altre grandi città europee ne fanno una destinazione privilegiata per gli acquisti immobiliari.</p><p>Acquistare una proprietà ad Alicante offre molti vantaggi. Le procedure di acquisto sono semplificate per i compratori stranieri, mentre i tassi di interesse attraenti e un mercato dinamico offrono opportunità di investimento strategiche. Che si tratti di una residenza principale, una casa vacanze o un investimento locativo, Alicante offre un'ampia scelta di proprietà.</p><p>Per chi sogna una casa ad Alicante, il mercato offre un'ampia varietà di immobili. Dalle ville contemporanee sul mare alle case tradizionali annidate tra le colline circostanti, ogni acquirente può trovare una proprietà adatta alle proprie aspettative e budget. Se preferite il trambusto della città, comprare un appartamento ad Alicante è un'alternativa ideale. Il centro storico, i quartieri moderni e le zone residenziali sul mare offrono una gamma varia di appartamenti, dai monolocali funzionali agli attici con vista panoramica.</p><p>Con il suo eccezionale ambiente di vita e un mercato immobiliare dinamico, Alicante è una destinazione privilegiata per un investimento sicuro e redditizio.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/it/proprieta-in-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Proprietà in Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Proprietà in Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/it/proprieta-a-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Proprietà a Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Proprietà a Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/it/immobili-a-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Immobili a Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobili a Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/it/proprieta-a-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Proprietà a Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Proprietà a Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Immobiliare Alicante: Tra Mare e Montagna</h2><img 
            alt="Immobiliare Alicante: Tra Mare e Montagna"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Immobiliare Alicante: Tra Mare e Montagna"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Immobiliare Alicante: Tra Mare e Montagna</h2><div class="mw-355"><p>La provincia di Alicante, situata sulla famosa Costa Blanca, vanta un ambiente naturale eccezionale tra spiagge dorate e terreno montuoso. Con oltre 200 chilometri di costa che si affacciano sul Mediterraneo, il mercato immobiliare di Alicante è in forte crescita, attirando molti acquirenti alla ricerca di uno stile di vita idilliaco.</p><p>La costa è ricca di appartamenti moderni, in particolare a Benidorm e Torrevieja, che offrono viste mozzafiato sul mare e servizi di prima classe. Per coloro che preferiscono una dimora più intima, ci sono splendide case in vendita sulla Costa Blanca, alcune con piscina privata e viste panoramiche.</p><p>Acquistare una casa ad Alicante significa anche godere di un'arte di vivere unica. Con la gastronomia locale, tra cui la famosa paella e il vino dolce di Alicante, e un clima mite tutto l'anno, questa regione offre un ambiente di vita incomparabile sia per gli investitori che per i residenti.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>La provincia di Alicante, situata sulla famosa Costa Blanca, vanta un ambiente naturale eccezionale tra spiagge dorate e terreno montuoso. Con oltre 200 chilometri di costa che si affacciano sul Mediterraneo, il mercato immobiliare di Alicante è in forte crescita, attirando molti acquirenti alla ricerca di uno stile di vita idilliaco.</p><p>La costa è ricca di appartamenti moderni, in particolare a Benidorm e Torrevieja, che offrono viste mozzafiato sul mare e servizi di prima classe. Per coloro che preferiscono una dimora più intima, ci sono splendide case in vendita sulla Costa Blanca, alcune con piscina privata e viste panoramiche.</p><p>Acquistare una casa ad Alicante significa anche godere di un'arte di vivere unica. Con la gastronomia locale, tra cui la famosa paella e il vino dolce di Alicante, e un clima mite tutto l'anno, questa regione offre un ambiente di vita incomparabile sia per gli investitori che per i residenti.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Appartamenti e case in vendita ad Alicante</a></div></div></div></div></div>
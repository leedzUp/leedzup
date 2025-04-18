<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Uusi kotisi Alicantessa</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/fi/kiinteistot-talo-asunto-lahella-merta-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Kiinteistöt talo / asunto lähellä merta" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Asunto Lähellä Merta</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/fi/kiinteistot-talo-asunto-golfkentalla-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Kiinteistöt talo / asunto golfkentällä" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Asunto Golfkentällä</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/fi/kiinteistot-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Kiinteistöt Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Haluatko että otamme sinuun yhteyttä?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Minulla on projekti</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Saa arvio kotiostasi Alicantessa.</h2><img 
            alt="Saa arvio kotiostasi Alicantessa."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Saa arvio kotiostasi Alicantessa."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Saa arvio kotiostasi Alicantessa.</h2><div class="mw-355"><p>Oikein arvioitu kiinteistö myydään nopeammin. Pyydä ilmainen, sitoutumaton arviointi.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Pyydä arvio</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Oikein arvioitu kiinteistö myydään nopeammin. Pyydä ilmainen, sitoutumaton arviointi.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Pyydä arvio</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Kiinteistöoppaamme</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Kaikki neuvomme, joiden avulla voit hyödyntää Alicanten kiinteistöprojektisi parhaiten.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="fi/category/kiinteistooppaamme-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Katso oppaamme</a></div>{/if}<div class="mt-6 row"></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="fi/category/kiinteistooppaamme-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Katso oppaamme</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Kiinteistöt Alicante: Osta taloja ja asuntoja</h2><img 
            alt="Kiinteistöt Alicante: Osta taloja ja asuntoja"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Kiinteistöt Alicante: Osta taloja ja asuntoja"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Kiinteistöt Alicante: Osta taloja ja asuntoja</h2><div class="mw-355"><p>Alicanten kiinteistömarkkinat ovat kukoistuksessa, ja ne houkuttelevat sekä kansainvälisiä sijoittajia että asukkaita, jotka etsivät erinomaista elämänlaatua. Välimeren ilmasto, upea rantaviiva ja edullisempi elinkustannukset kuin muissa Euroopan suurkaupungeissa tekevät siitä ensisijaisen kohteen kiinteistöostoille.</p><p>Kiinteistön ostamisesta Alicantessa on monia etuja. Ostoprosessit on yksinkertaistettu ulkomaalaisille ostajille, ja houkuttelevat korot sekä dynaaminen markkina tarjoavat strategisia sijoitusmahdollisuuksia. Olipa kyseessä pääasunto, lomakoti tai vuokrasijoitus, Alicante tarjoaa laajan valikoiman kiinteistöjä.</p><p>Niille, jotka haaveilevat kodista Alicantessa, markkinoilla on laaja valikoima kiinteistöjä. Nykyaikaisista merenrannan huviloista perinteisiin koteihin ympäröivillä kukkuloilla, jokainen ostaja löytää kiinteistön, joka vastaa odotuksia ja budjettia. Jos pidät kaupungin vilinästä, asunnon ostaminen Alicantessa on ihanteellinen vaihtoehto. Historiallinen keskusta, modernit kaupunginosat ja merenrantaan sijoittuneet asuinalueet tarjoavat monipuolisen valikoiman asuntoja, toimivista studioista panoraamanäkymillä varustettuihin kattohuoneistoihin.</p><p>Poikkeuksellisen asuinympäristönsä ja dynaamisten kiinteistömarkkinoidensa ansiosta Alicante on ensisijainen kohde turvalliseen ja kannattavaan sijoittamiseen.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Alicanten kiinteistömarkkinat ovat kukoistuksessa, ja ne houkuttelevat sekä kansainvälisiä sijoittajia että asukkaita, jotka etsivät erinomaista elämänlaatua. Välimeren ilmasto, upea rantaviiva ja edullisempi elinkustannukset kuin muissa Euroopan suurkaupungeissa tekevät siitä ensisijaisen kohteen kiinteistöostoille.</p><p>Kiinteistön ostamisesta Alicantessa on monia etuja. Ostoprosessit on yksinkertaistettu ulkomaalaisille ostajille, ja houkuttelevat korot sekä dynaaminen markkina tarjoavat strategisia sijoitusmahdollisuuksia. Olipa kyseessä pääasunto, lomakoti tai vuokrasijoitus, Alicante tarjoaa laajan valikoiman kiinteistöjä.</p><p>Niille, jotka haaveilevat kodista Alicantessa, markkinoilla on laaja valikoima kiinteistöjä. Nykyaikaisista merenrannan huviloista perinteisiin koteihin ympäröivillä kukkuloilla, jokainen ostaja löytää kiinteistön, joka vastaa odotuksia ja budjettia. Jos pidät kaupungin vilinästä, asunnon ostaminen Alicantessa on ihanteellinen vaihtoehto. Historiallinen keskusta, modernit kaupunginosat ja merenrantaan sijoittuneet asuinalueet tarjoavat monipuolisen valikoiman asuntoja, toimivista studioista panoraamanäkymillä varustettuihin kattohuoneistoihin.</p><p>Poikkeuksellisen asuinympäristönsä ja dynaamisten kiinteistömarkkinoidensa ansiosta Alicante on ensisijainen kohde turvalliseen ja kannattavaan sijoittamiseen.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/fi/kiinteisto-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Kiinteistö Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Kiinteistö Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/fi/kiinteisto-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Kiinteistö Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Kiinteistö Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/fi/kiinteistoihin-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Kiinteistöihin Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Kiinteistöihin Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/fi/kiinteisto-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Kiinteistö Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Kiinteistö Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Kiinteistöt Alicante: Meren ja vuorten välissä</h2><img 
            alt="Kiinteistöt Alicante: Meren ja vuorten välissä"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Kiinteistöt Alicante: Meren ja vuorten välissä"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Kiinteistöt Alicante: Meren ja vuorten välissä</h2><div class="mw-355"><p>Alicanten maakunta, joka sijaitsee kuuluisalla Costa Blancalla, tarjoaa poikkeuksellisen luonnonympäristön kultahiekkarantojen ja vuoristoisen maaston välissä. Yli 200 kilometrin pituinen rantaviiva Välimeren rannalla tekee Alicanten kiinteistömarkkinoista vilkkaat, ja ne houkuttelevat monia ostajia, jotka etsivät idyllistä elämäntapaa.</p><p>Rannikolla on runsaasti moderneja asuntoja, erityisesti Benidormissa ja Torreviejassa, ja ne tarjoavat esteettömän merinäköalan ja huippuluokan mukavuudet. Niille, jotka suosivat rauhallisempaa asumista, Costa Blancalla on myynnissä upeita taloja, joista osassa on yksityinen uima-allas ja henkeäsalpaavat näkymät.</p><p>Alicantessa asunnon ostaminen tarkoittaa myös ainutlaatuisen elämäntavan nauttimista. Paikallinen gastronomia, mukaan lukien kuuluisa paella ja Alicanten makea viini, sekä lauhkea ilmasto ympäri vuoden tekevät tästä alueesta vertaansa vailla olevan asuinympäristön sekä sijoittajille että asukkaille.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Alicanten maakunta, joka sijaitsee kuuluisalla Costa Blancalla, tarjoaa poikkeuksellisen luonnonympäristön kultahiekkarantojen ja vuoristoisen maaston välissä. Yli 200 kilometrin pituinen rantaviiva Välimeren rannalla tekee Alicanten kiinteistömarkkinoista vilkkaat, ja ne houkuttelevat monia ostajia, jotka etsivät idyllistä elämäntapaa.</p><p>Rannikolla on runsaasti moderneja asuntoja, erityisesti Benidormissa ja Torreviejassa, ja ne tarjoavat esteettömän merinäköalan ja huippuluokan mukavuudet. Niille, jotka suosivat rauhallisempaa asumista, Costa Blancalla on myynnissä upeita taloja, joista osassa on yksityinen uima-allas ja henkeäsalpaavat näkymät.</p><p>Alicantessa asunnon ostaminen tarkoittaa myös ainutlaatuisen elämäntavan nauttimista. Paikallinen gastronomia, mukaan lukien kuuluisa paella ja Alicanten makea viini, sekä lauhkea ilmasto ympäri vuoden tekevät tästä alueesta vertaansa vailla olevan asuinympäristön sekä sijoittajille että asukkaille.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Asuntoja ja taloja myynnissä Alicantessa</a></div></div></div></div></div>
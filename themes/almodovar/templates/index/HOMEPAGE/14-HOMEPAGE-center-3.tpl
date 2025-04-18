<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Noua ta casă în Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/ro/imobiliare-casa-apartament-langa-mare-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Imobiliare casă / apartament lângă mare" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Apartament Lângă Mare</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/ro/proprietate-imobiliara-casa-apartament-pe-teren-de-golf-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Proprietate imobiliară casă / apartament pe teren de golf" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Apartament Pe Teren De Golf</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/ro/imobiliar-in-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Imobiliar în Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Ai nevoie să fii contactat?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Am un proiect</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Obțineți o estimare pentru casa dvs. în Alicante.</h2><img 
            alt="Obțineți o estimare pentru casa dvs. în Alicante."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Obțineți o estimare pentru casa dvs. în Alicante."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Obțineți o estimare pentru casa dvs. în Alicante.</h2><div class="mw-355"><p>O proprietate evaluată corect se vinde mai repede. Cereți o evaluare gratuită și fără obligații.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Solicită evaluare</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>O proprietate evaluată corect se vinde mai repede. Cereți o evaluare gratuită și fără obligații.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Solicită evaluare</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Ghidurile Noastre Imobiliare</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Toate sfaturile noastre pentru a vă ajuta să profitați la maximum de proiectele dumneavoastră imobiliare în Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="ro/category/ghiduri-imobiliare-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Vedeți ghidurile noastre</a></div>{/if}<div class="mt-6 row"></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="ro/category/ghiduri-imobiliare-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Vedeți ghidurile noastre</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Imobiliare Alicante: Cumpără Case și Apartamente</h2><img 
            alt="Imobiliare Alicante: Cumpără Case și Apartamente"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Imobiliare Alicante: Cumpără Case și Apartamente"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Imobiliare Alicante: Cumpără Case și Apartamente</h2><div class="mw-355"><p>Piața imobiliară din Alicante este în plină expansiune, atrăgând atât investitori internaționali, cât și rezidenți în căutarea unei calități de viață excepționale. Climatul mediteranean, coasta splendidă și un cost de viață mai accesibil decât în alte orașe europene mari o fac o destinație de top pentru achiziții imobiliare.</p><p>Achiziționarea unei proprietăți în Alicante are multe avantaje. Procedurile de cumpărare sunt simplificate pentru cumpărătorii străini, în timp ce ratele atractive ale dobânzilor și o piață dinamică oferă oportunități strategice de investiții. Fie că este vorba despre o reședință principală, o casă de vacanță sau o investiție în chirie, Alicante oferă o gamă largă de proprietăți.</p><p>Pentru cei care visează la o casă în Alicante, piața oferă o varietate largă de proprietăți. De la vile contemporane pe malul mării la case tradiționale ascunse în dealurile din jur, fiecare cumpărător poate găsi o proprietate care să corespundă așteptărilor și bugetului său. Dacă preferați agitația orașului, cumpărarea unui apartament în Alicante este o alternativă ideală. Centrul istoric, cartierele moderne și zonele rezidențiale de pe litoral oferă o gamă variată de apartamente, de la studio-uri funcționale la penthouse-uri cu vedere panoramică.</p><p>Cu mediul său excepțional de viață și piața imobiliară dinamică, Alicante este o destinație de top pentru o investiție sigură și profitabilă.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Piața imobiliară din Alicante este în plină expansiune, atrăgând atât investitori internaționali, cât și rezidenți în căutarea unei calități de viață excepționale. Climatul mediteranean, coasta splendidă și un cost de viață mai accesibil decât în alte orașe europene mari o fac o destinație de top pentru achiziții imobiliare.</p><p>Achiziționarea unei proprietăți în Alicante are multe avantaje. Procedurile de cumpărare sunt simplificate pentru cumpărătorii străini, în timp ce ratele atractive ale dobânzilor și o piață dinamică oferă oportunități strategice de investiții. Fie că este vorba despre o reședință principală, o casă de vacanță sau o investiție în chirie, Alicante oferă o gamă largă de proprietăți.</p><p>Pentru cei care visează la o casă în Alicante, piața oferă o varietate largă de proprietăți. De la vile contemporane pe malul mării la case tradiționale ascunse în dealurile din jur, fiecare cumpărător poate găsi o proprietate care să corespundă așteptărilor și bugetului său. Dacă preferați agitația orașului, cumpărarea unui apartament în Alicante este o alternativă ideală. Centrul istoric, cartierele moderne și zonele rezidențiale de pe litoral oferă o gamă variată de apartamente, de la studio-uri funcționale la penthouse-uri cu vedere panoramică.</p><p>Cu mediul său excepțional de viață și piața imobiliară dinamică, Alicante este o destinație de top pentru o investiție sigură și profitabilă.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/ro/imobiliar-in-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Imobiliar în Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Imobiliar în Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/ro/imobiliar-in-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Imobiliar în Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Imobiliar în Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/ro/imobiliar-in-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Imobiliar în Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Imobiliar în Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/ro/imobiliar-in-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Imobiliar în Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Imobiliar în Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Imobiliare Alicante: Între Mare și Munți</h2><img 
            alt="Imobiliare Alicante: Între Mare și Munți"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Imobiliare Alicante: Între Mare și Munți"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Imobiliare Alicante: Între Mare și Munți</h2><div class="mw-355"><p>Provincia Alicante, situată pe faimoasa Costa Blanca, se mândrește cu un cadru natural excepțional între plaje aurii și teren muntos. Cu peste 200 de kilometri de coastă la Marea Mediterană, piața imobiliară din Alicante este în plină expansiune, atrăgând mulți cumpărători în căutarea unui stil de viață idilic.</p><p>Coasta este plină de apartamente moderne, în special în Benidorm și Torrevieja, care oferă vedere neîntreruptă la mare și facilități de top. Pentru cei care preferă un locuință mai intimă, există case superbe de vânzare pe Costa Blanca, unele cu piscină privată și priveliști uluitoare.</p><p>A cumpăra o casă în Alicante înseamnă și a te bucura de o artă de a trăi unică. Cu gastronomie locală, inclusiv faimoasa paella și vinul dulce din Alicante, și un climat blând tot anul, această regiune oferă un mediu de viață incomparabil atât pentru investitori cât și pentru rezidenți.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Provincia Alicante, situată pe faimoasa Costa Blanca, se mândrește cu un cadru natural excepțional între plaje aurii și teren muntos. Cu peste 200 de kilometri de coastă la Marea Mediterană, piața imobiliară din Alicante este în plină expansiune, atrăgând mulți cumpărători în căutarea unui stil de viață idilic.</p><p>Coasta este plină de apartamente moderne, în special în Benidorm și Torrevieja, care oferă vedere neîntreruptă la mare și facilități de top. Pentru cei care preferă un locuință mai intimă, există case superbe de vânzare pe Costa Blanca, unele cu piscină privată și priveliști uluitoare.</p><p>A cumpăra o casă în Alicante înseamnă și a te bucura de o artă de a trăi unică. Cu gastronomie locală, inclusiv faimoasa paella și vinul dulce din Alicante, și un climat blând tot anul, această regiune oferă un mediu de viață incomparabil atât pentru investitori cât și pentru rezidenți.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Apartamente și case de vânzare în Alicante</a></div></div></div></div></div>
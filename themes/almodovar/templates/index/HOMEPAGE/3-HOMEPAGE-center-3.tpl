<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Ta nouvelle maison à Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/fr/immobilier-maison-appartement-pres-de-la-mer-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Immobilier maison / appartement près de la mer" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Appartement Près De La Mer</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/fr/immobilier-maison-appartement-sur-golf-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Immobilier maison / appartement sur golf" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Appartement Sur Golf</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/fr/immobilier-a-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Immobilier à  Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Besoin d’être contacté(e) ?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">J’ai un projet</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Obtiens une estimation pour ta maison à Alicante</h2><img 
            alt="Obtiens une estimation pour ta maison à Alicante"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Obtiens une estimation pour ta maison à Alicante"
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Obtiens une estimation pour ta maison à Alicante</h2><div class="mw-355"><p>Un bien correctement estimé a plus de chance d'être vendu rapidement. Demandez-nous une évaluation gratuite et sans engagement de votre bien.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Obtenir une évaluation</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Un bien correctement estimé a plus de chance d'être vendu rapidement. Demandez-nous une évaluation gratuite et sans engagement de votre bien.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Obtenir une évaluation</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Nos guides immobiliers</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Tous nos conseils pour réussir tes projets immobiliers sereinement à Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="fr/category/nos-guides-immobiliers-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Voir nos guides</a></div>{/if}<div class="mt-6 row"><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/fr/comment-acheter-un-bien-immobilier-en-espagne-6"><picture>
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
                                    alt="Comment acheter un bien immobilier en Espagne"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/6.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Comment acheter un bien immobilier en Espagne</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/fr/ou-acheter-un-bien-immobilier-en-2025-a-alicante-7"><picture>
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
                                    alt="Où acheter un bien immobilier à alicante en 2025 ?"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/7.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Où acheter un bien immobilier à alicante en 2025 ?</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/fr/le-guide-de-linvestisseur-en-espagne-8"><picture>
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
                                    alt="Le guide de l'investisseur en Espagne	"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/8.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Le guide de l'investisseur en Espagne	</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/fr/5-choses-a-prendre-en-compte-avant-dacheter-a-alicante-9"><picture>
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
                                    alt="5 choses à prendre en compte avant d’acheter à Alicante"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/9.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">5 choses à prendre en compte avant d’acheter à Alicante</span></a></div></li></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="fr/category/nos-guides-immobiliers-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Voir nos guides</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Immobilier Alicante : achat maison et appartement</h2><img 
            alt="Immobilier Alicante : achat maison et appartement"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Immobilier Alicante : achat maison et appartement"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Immobilier Alicante : achat maison et appartement</h2><div class="mw-355"><p>Le marché immobilier à Alicante est en pleine expansion, attirant aussi bien les investisseurs internationaux que les résidents à la recherche d'une qualité de vie exceptionnelle. Son climat méditerranéen, son littoral splendide et son coût de la vie plus accessible que dans d'autres grandes villes européennes en font une destination privilégiée pour l'achat immobilier.</p><p>Acquérir une propriété à Alicante présente de nombreux avantages. Les procédures d'achat sont simplifiées pour les acheteurs étrangers, tandis que les taux d'intérêt attractifs et la dynamique du marché offrent des opportunités d'investissement stratégiques. Que ce soit pour une résidence principale, une maison de vacances ou un placement locatif, Alicante propose un large choix de biens immobiliers.</p><p>Pour ceux qui rêvent d'une maison à Alicante, le marché offre une grande diversité de biens. Des villas contemporaines en bord de mer aux maisons traditionnelles nichées dans les collines environnantes, chaque acheteur peut trouver une propriété correspondant à ses attentes et à son budget. Si vous préférez l'effervescence citadine, l'achat d'un appartement à Alicante est une alternative idéale. Le centre historique, les quartiers modernes ou encore les zones résidentielles en bord de mer offrent une gamme variée d'appartements, du studio fonctionnel au penthouse avec vue panoramique.</p><p>Avec son cadre de vie exceptionnel et un marché immobilier dynamique, Alicante est une destination de choix pour un investissement sûr et rentable.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Le marché immobilier à Alicante est en pleine expansion, attirant aussi bien les investisseurs internationaux que les résidents à la recherche d'une qualité de vie exceptionnelle. Son climat méditerranéen, son littoral splendide et son coût de la vie plus accessible que dans d'autres grandes villes européennes en font une destination privilégiée pour l'achat immobilier.</p><p>Acquérir une propriété à Alicante présente de nombreux avantages. Les procédures d'achat sont simplifiées pour les acheteurs étrangers, tandis que les taux d'intérêt attractifs et la dynamique du marché offrent des opportunités d'investissement stratégiques. Que ce soit pour une résidence principale, une maison de vacances ou un placement locatif, Alicante propose un large choix de biens immobiliers.</p><p>Pour ceux qui rêvent d'une maison à Alicante, le marché offre une grande diversité de biens. Des villas contemporaines en bord de mer aux maisons traditionnelles nichées dans les collines environnantes, chaque acheteur peut trouver une propriété correspondant à ses attentes et à son budget. Si vous préférez l'effervescence citadine, l'achat d'un appartement à Alicante est une alternative idéale. Le centre historique, les quartiers modernes ou encore les zones résidentielles en bord de mer offrent une gamme variée d'appartements, du studio fonctionnel au penthouse avec vue panoramique.</p><p>Avec son cadre de vie exceptionnel et un marché immobilier dynamique, Alicante est une destination de choix pour un investissement sûr et rentable.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/fr/immobilier-a-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Immobilier à Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobilier à Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/fr/immobilier-a-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Immobilier à Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobilier à Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/fr/immobilier-a-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Immobilier à Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobilier à Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/fr/immobilier-a-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Immobilier à Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobilier à Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Immobilier Alicante : entre mer et montagne</h2><img 
            alt="Immobilier Alicante : entre mer et montagne"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Immobilier Alicante : entre mer et montagne"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Immobilier Alicante : entre mer et montagne</h2><div class="mw-355"><p>La province d&#39;Alicante, située sur la célèbre Costa Blanca, bénéficie d&#39;un cadre naturel exceptionnel entre plages dorées et reliefs montagneux. Avec plus de 200 kilomètres de littoral bordé par la Méditerranée, l&#39;immobilier à Alicante est en plein essor, attirant de nombreux acquéreurs en quête d&#39;un cadre de vie idyllique.</p><p>La côte regorge d&#39;appartements modernes, notamment à Benidorm ou Torrevieja, offrant une vue imprenable sur la mer et des commodités de haut standing. Pour ceux qui préfèrent une demeure plus intimiste, de superbes maisons sont à vendre sur la Costa Blanca, certaines avec piscine privée et panoramas à couper le souffle.</p><p>Acheter une maison à Alicante, c&#39;est aussi profiter d&#39;un art de vivre unique. Entre gastronomie locale, avec la fameuse paella et le vin liquoreux d&#39;Alicante, et climat doux toute l&#39;année, cette région offre un cadre de vie incomparable pour les investisseurs et résidents.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>La province d&#39;Alicante, située sur la célèbre Costa Blanca, bénéficie d&#39;un cadre naturel exceptionnel entre plages dorées et reliefs montagneux. Avec plus de 200 kilomètres de littoral bordé par la Méditerranée, l&#39;immobilier à Alicante est en plein essor, attirant de nombreux acquéreurs en quête d&#39;un cadre de vie idyllique.</p><p>La côte regorge d&#39;appartements modernes, notamment à Benidorm ou Torrevieja, offrant une vue imprenable sur la mer et des commodités de haut standing. Pour ceux qui préfèrent une demeure plus intimiste, de superbes maisons sont à vendre sur la Costa Blanca, certaines avec piscine privée et panoramas à couper le souffle.</p><p>Acheter une maison à Alicante, c&#39;est aussi profiter d&#39;un art de vivre unique. Entre gastronomie locale, avec la fameuse paella et le vin liquoreux d&#39;Alicante, et climat doux toute l&#39;année, cette région offre un cadre de vie incomparable pour les investisseurs et résidents.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/type-de-bien-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Appartements et maisons à vendre à Alicante</a></div></div></div></div></div>
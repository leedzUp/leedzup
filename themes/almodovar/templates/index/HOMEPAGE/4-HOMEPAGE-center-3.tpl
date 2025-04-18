<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Dein neues Zuhause in Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/de/immobilien-haus-wohnung-in-der-nahe-des-meeres-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Immobilien Haus / Wohnung in der Nähe des Meeres" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Wohnung In Der Nähe Des Meeres</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/de/immobilien-haus-wohnung-auf-golf-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Immobilien Haus / Wohnung auf Golf" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Wohnung Auf Golf</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/de/immobilien-in-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Immobilien in Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Brauchen Sie eine Kontaktaufnahme?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Ich habe ein Projekt</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Erhalte eine Schätzung für dein Haus in Alicante</h2><img 
            alt="Erhalte eine Schätzung für dein Haus in Alicante"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Erhalte eine Schätzung für dein Haus in Alicante"
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Erhalte eine Schätzung für dein Haus in Alicante</h2><div class="mw-355"><p>Eine richtig bewertete Immobilie hat eine höhere Chance, schnell verkauft zu werden. Fragen Sie uns nach einer kostenlosen und unverbindlichen Bewertung Ihrer Immobilie.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Bewertung anfordern</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Eine richtig bewertete Immobilie hat eine höhere Chance, schnell verkauft zu werden. Fragen Sie uns nach einer kostenlosen und unverbindlichen Bewertung Ihrer Immobilie.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Bewertung anfordern</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Unsere Immobilienführer</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Alle unsere Tipps, um deine Immobilienprojekte in Alicante mit Gelassenheit zum Erfolg zu führen.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="/de/category/unsere-ratgeber-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Unsere Reiseführer ansehen</a></div>{/if}<div class="mt-6 row"><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/de/wie-kaufe-ich-eine-immobilie-in-spanien-6"><picture>
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
                                    alt="Wie kaufe ich eine Immobilie in Spanien?"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/6.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Wie kaufe ich eine Immobilie in Spanien?</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/de/wo-kann-man-im-jahr-2025-eine-immobilie-in-alicante-kaufen-7"><picture>
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
                                    alt="Wo kann man im Jahr 2025 eine Immobilie in alicante kaufen?"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/7.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Wo kann man im Jahr 2025 eine Immobilie in alicante kaufen?</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/de/der-leitfaden-fur-investoren-in-spanien-8"><picture>
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
                                    alt="Der Leitfaden für Investoren in Spanien"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/8.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Der Leitfaden für Investoren in Spanien</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/de/5-dinge-die-sie-vor-dem-kauf-einer-immobilie-in-alicante-beachten-sollten-9"><picture>
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
                                    alt="5 Dinge, die Sie vor dem Kauf einer Immobilie in Alicante beachten sollten"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/9.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">5 Dinge, die Sie vor dem Kauf einer Immobilie in Alicante beachten sollten</span></a></div></li></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="/de/category/unsere-ratgeber-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Unsere Reiseführer ansehen</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Immobilien in Alicante: Kauf von Häusern und Wohnungen</h2><img 
            alt="Immobilien in Alicante: Kauf von Häusern und Wohnungen"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Immobilien in Alicante: Kauf von Häusern und Wohnungen"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Immobilien in Alicante: Kauf von Häusern und Wohnungen</h2><div class="mw-355"><p>Der Immobilienmarkt in Alicante boomt und zieht sowohl internationale Investoren als auch Residenten an, die auf der Suche nach einer außergewöhnlichen Lebensqualität sind. Das mediterrane Klima, die herrliche Küste und die im Vergleich zu anderen europäischen Großstädten erschwinglichen Lebenshaltungskosten machen Alicante zu einem bevorzugten Ziel für den Immobilienkauf.</p><p>Der Erwerb einer Immobilie in Alicante bietet zahlreiche Vorteile. Die Kaufverfahren sind für ausländische Käufer vereinfacht, während die attraktiven Zinssätze und die Marktdynamik strategische Investitionsmöglichkeiten bieten. Ob als Hauptwohnsitz, Ferienhaus oder Mietanlage, Alicante bietet eine große Auswahl an Immobilien.</p><p>Für diejenigen, die von einem Haus in Alicante träumen, bietet der Markt eine große Vielfalt an Immobilien. Von zeitgenössischen Villen am Meer bis hin zu traditionellen Häusern, die sich in die umliegenden Hügel schmiegen, kann jeder Käufer eine Immobilie finden, die seinen Erwartungen und seinem Budget entspricht. Wenn Sie das hektische Treiben in der Stadt bevorzugen, ist der Kauf einer Wohnung in Alicante eine ideale Alternative. Das historische Zentrum, die modernen Viertel oder auch die Wohngebiete am Meer bieten eine vielfältige Auswahl an Wohnungen, vom funktionalen Studio bis zum Penthouse mit Panoramablick.</p><p>Mit seiner außergewöhnlichen Lebensqualität und einem dynamischen Immobilienmarkt ist Alicante ein erstklassiges Ziel für eine sichere und rentable Investition.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Der Immobilienmarkt in Alicante boomt und zieht sowohl internationale Investoren als auch Residenten an, die auf der Suche nach einer außergewöhnlichen Lebensqualität sind. Das mediterrane Klima, die herrliche Küste und die im Vergleich zu anderen europäischen Großstädten erschwinglichen Lebenshaltungskosten machen Alicante zu einem bevorzugten Ziel für den Immobilienkauf.</p><p>Der Erwerb einer Immobilie in Alicante bietet zahlreiche Vorteile. Die Kaufverfahren sind für ausländische Käufer vereinfacht, während die attraktiven Zinssätze und die Marktdynamik strategische Investitionsmöglichkeiten bieten. Ob als Hauptwohnsitz, Ferienhaus oder Mietanlage, Alicante bietet eine große Auswahl an Immobilien.</p><p>Für diejenigen, die von einem Haus in Alicante träumen, bietet der Markt eine große Vielfalt an Immobilien. Von zeitgenössischen Villen am Meer bis hin zu traditionellen Häusern, die sich in die umliegenden Hügel schmiegen, kann jeder Käufer eine Immobilie finden, die seinen Erwartungen und seinem Budget entspricht. Wenn Sie das hektische Treiben in der Stadt bevorzugen, ist der Kauf einer Wohnung in Alicante eine ideale Alternative. Das historische Zentrum, die modernen Viertel oder auch die Wohngebiete am Meer bieten eine vielfältige Auswahl an Wohnungen, vom funktionalen Studio bis zum Penthouse mit Panoramablick.</p><p>Mit seiner außergewöhnlichen Lebensqualität und einem dynamischen Immobilienmarkt ist Alicante ein erstklassiges Ziel für eine sichere und rentable Investition.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/de/immobilien-in-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Immobilien in Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobilien in Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/de/immobilien-in-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Immobilien in Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobilien in Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/de/immobilien-in-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Immobilien in Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobilien in Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/de/immobilien-in-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Immobilien in Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Immobilien in Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Immobilien in Alicante: Zwischen Meer und Bergen</h2><img 
            alt="Immobilien in Alicante: Zwischen Meer und Bergen"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Immobilien in Alicante: Zwischen Meer und Bergen"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Immobilien in Alicante: Zwischen Meer und Bergen</h2><div class="mw-355"><p>Die Provinz Alicante liegt an der berühmten Costa Blanca und profitiert von einer außergewöhnlichen natürlichen Umgebung mit goldenen Stränden und bergigem Gelände. Mit über 200 Kilometern Küstenlinie am Mittelmeer boomt der Immobilienmarkt in Alicante und zieht viele Käufer an, die auf der Suche nach einem idyllischen Lebensumfeld sind.</p><p>Die Küste ist reich an modernen Apartments, vor allem in Benidorm oder Torrevieja, die einen atemberaubenden Blick auf das Meer und hochwertige Annehmlichkeiten bieten. Für diejenigen, die ein intimeres Zuhause bevorzugen, stehen an der Costa Blanca wunderschöne Häuser zum Verkauf, einige davon mit privatem Pool und atemberaubenden Ausblicken.</p><p>Ein Haus in Alicante zu kaufen bedeutet auch, eine einzigartige Lebensart zu genießen. Zwischen der lokalen Gastronomie mit der berühmten Paella und dem süßen Wein von Alicante und dem ganzjährig milden Klima bietet diese Region einen unvergleichlichen Lebensraum für Investoren und Einwohner.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Die Provinz Alicante liegt an der berühmten Costa Blanca und profitiert von einer außergewöhnlichen natürlichen Umgebung mit goldenen Stränden und bergigem Gelände. Mit über 200 Kilometern Küstenlinie am Mittelmeer boomt der Immobilienmarkt in Alicante und zieht viele Käufer an, die auf der Suche nach einem idyllischen Lebensumfeld sind.</p><p>Die Küste ist reich an modernen Apartments, vor allem in Benidorm oder Torrevieja, die einen atemberaubenden Blick auf das Meer und hochwertige Annehmlichkeiten bieten. Für diejenigen, die ein intimeres Zuhause bevorzugen, stehen an der Costa Blanca wunderschöne Häuser zum Verkauf, einige davon mit privatem Pool und atemberaubenden Ausblicken.</p><p>Ein Haus in Alicante zu kaufen bedeutet auch, eine einzigartige Lebensart zu genießen. Zwischen der lokalen Gastronomie mit der berühmten Paella und dem süßen Wein von Alicante und dem ganzjährig milden Klima bietet diese Region einen unvergleichlichen Lebensraum für Investoren und Einwohner.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/art-der-immobilie-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Wohnungen &amp; Häuser zum Verkauf in Alicante</a></div></div></div></div></div>
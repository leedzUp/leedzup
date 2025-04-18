<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Twój nowy dom w Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/pl/nieruchomosc-dom-mieszkanie-blisko-morza-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Nieruchomość dom / mieszkanie blisko morza" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Mieszkanie Blisko Morza</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/pl/nieruchomosc-dom-mieszkanie-na-polu-golfowym-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Nieruchomość dom / mieszkanie na polu golfowym" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Mieszkanie Na Polu Golfowym</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/pl/nieruchomosci-w-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Nieruchomości w Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Potrzebujesz kontaktu?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Mam projekt</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Uzyskaj wycenę swojego domu w Alicante</h2><img 
            alt="Uzyskaj wycenę swojego domu w Alicante"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Uzyskaj wycenę swojego domu w Alicante"
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Uzyskaj wycenę swojego domu w Alicante</h2><div class="mw-355"><p>Prawidłowo wyceniona nieruchomość ma większe szanse na szybką sprzedaż. Zapytaj nas o bezpłatną, niezobowiązującą wycenę Twojej nieruchomości.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Uzyskaj ocenę</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Prawidłowo wyceniona nieruchomość ma większe szanse na szybką sprzedaż. Zapytaj nas o bezpłatną, niezobowiązującą wycenę Twojej nieruchomości.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Uzyskaj ocenę</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Nasze przewodniki nieruchomościowe</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Wszystkie nasze porady, które pomogą Ci jak najlepiej wykorzystać projekty dotyczące nieruchomości w Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="/pl/category/nasze-przewodniki-nieruchomosci-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Zobacz nasze przewodniki</a></div>{/if}<div class="mt-6 row"><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/pl/jak-kupic-nieruchomosc-w-hiszpanii-6"><picture>
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
                                    alt="Jak kupić nieruchomość w Hiszpanii"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/6.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Jak kupić nieruchomość w Hiszpanii</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/pl/gdzie-kupic-nieruchomosc-w-alicante-w-2025-roku-7"><picture>
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
                                    alt="Gdzie kupić nieruchomość w Alicante w 2025 roku?"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/7.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Gdzie kupić nieruchomość w Alicante w 2025 roku?</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/pl/przewodnik-inwestora-po-hiszpanii-8"><picture>
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
                                    alt="Przewodnik inwestora po Hiszpanii"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/8.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Przewodnik inwestora po Hiszpanii</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/pl/5-rzeczy-do-rozwazenia-przed-zakupem-w-alicante-9"><picture>
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
                                    alt="5 rzeczy do rozważenia przed zakupem w Alicante"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/9.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">5 rzeczy do rozważenia przed zakupem w Alicante</span></a></div></li></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="/pl/category/nasze-przewodniki-nieruchomosci-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Zobacz nasze przewodniki</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Nieruchomości w Alicante: zakup domu i mieszkania</h2><img 
            alt="Nieruchomości w Alicante: zakup domu i mieszkania"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Nieruchomości w Alicante: zakup domu i mieszkania"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Nieruchomości w Alicante: zakup domu i mieszkania</h2><div class="mw-355">"<p>Rynek nieruchomości w Alicante kwitnie, przyciągając zarówno międzynarodowych inwestorów, jak i mieszkańców poszukujących wyjątkowej jakości życia. Jego śródziemnomorski klimat, wspaniała linia brzegowa i bardziej przystępne koszty życia niż w innych dużych miastach europejskich sprawiają, że jest to idealne miejsce na zakup nieruchomości.<p>Kupno nieruchomości w Alicante ma wiele zalet. Procedury zakupu są uproszczone dla zagranicznych nabywców, a atrakcyjne stopy procentowe i dynamiczny rynek oferują strategiczne możliwości inwestycyjne. Niezależnie od tego, czy chodzi o podstawową rezydencję, dom wakacyjny czy inwestycję w wynajem, Alicante oferuje szeroki wybór nieruchomości.<p>Dla tych, którzy marzą o domu w Alicante, rynek oferuje szeroki wybór nieruchomości. Od współczesnych willi nad morzem po tradycyjne domy położone na okolicznych wzgórzach, każdy kupujący może znaleźć nieruchomość spełniającą jego oczekiwania i budżet. Jeśli wolisz zgiełk miasta, zakup mieszkania w Alicante jest idealną alternatywą. Historyczne centrum, nowoczesne dzielnice i nadmorskie dzielnice mieszkalne oferują zróżnicowaną gamę mieszkań, od funkcjonalnych studiów po penthouse'y z panoramicznym widokiem.<p>Dzięki wyjątkowemu środowisku życia i dynamicznemu rynkowi nieruchomości, Alicante jest doskonałym miejscem na bezpieczną i dochodową inwestycję.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12">"<p>Rynek nieruchomości w Alicante kwitnie, przyciągając zarówno międzynarodowych inwestorów, jak i mieszkańców poszukujących wyjątkowej jakości życia. Jego śródziemnomorski klimat, wspaniała linia brzegowa i bardziej przystępne koszty życia niż w innych dużych miastach europejskich sprawiają, że jest to idealne miejsce na zakup nieruchomości.<p>Kupno nieruchomości w Alicante ma wiele zalet. Procedury zakupu są uproszczone dla zagranicznych nabywców, a atrakcyjne stopy procentowe i dynamiczny rynek oferują strategiczne możliwości inwestycyjne. Niezależnie od tego, czy chodzi o podstawową rezydencję, dom wakacyjny czy inwestycję w wynajem, Alicante oferuje szeroki wybór nieruchomości.<p>Dla tych, którzy marzą o domu w Alicante, rynek oferuje szeroki wybór nieruchomości. Od współczesnych willi nad morzem po tradycyjne domy położone na okolicznych wzgórzach, każdy kupujący może znaleźć nieruchomość spełniającą jego oczekiwania i budżet. Jeśli wolisz zgiełk miasta, zakup mieszkania w Alicante jest idealną alternatywą. Historyczne centrum, nowoczesne dzielnice i nadmorskie dzielnice mieszkalne oferują zróżnicowaną gamę mieszkań, od funkcjonalnych studiów po penthouse'y z panoramicznym widokiem.<p>Dzięki wyjątkowemu środowisku życia i dynamicznemu rynkowi nieruchomości, Alicante jest doskonałym miejscem na bezpieczną i dochodową inwestycję.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/pl/nieruchomosc-w-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Nieruchomość w Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Nieruchomość w Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/pl/nieruchomosci-w-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Nieruchomości w Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Nieruchomości w Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/pl/nieruchomosci-w-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Nieruchomości w Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Nieruchomości w Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/pl/nieruchomosc-w-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Nieruchomość w Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Nieruchomość w Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Nieruchomości w Alicante: między morzem a górami</h2><img 
            alt="Nieruchomości w Alicante: między morzem a górami"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Nieruchomości w Alicante: między morzem a górami"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Nieruchomości w Alicante: między morzem a górami</h2><div class="mw-355"><p>Prowincja Alicante, położona na słynnym wybrzeżu Costa Blanca, szczyci się wyjątkowym naturalnym otoczeniem między złotymi plażami i górzystym terenem. Z ponad 200 kilometrami wybrzeża graniczącego z Morzem Śródziemnym, rynek nieruchomości w Alicante kwitnie, przyciągając wielu nabywców poszukujących idyllicznego stylu życia.</p><p>Na wybrzeżu znajduje się wiele nowoczesnych mieszkań, szczególnie w Benidorm i Torrevieja, oferujących niezakłócony widok na morze i najwyższej klasy udogodnienia. Dla tych, którzy wolą bardziej intymne miejsce zamieszkania, na Costa Blanca dostępne są wspaniałe domy na sprzedaż, niektóre z prywatnymi basenami i zapierającymi dech w piersiach widokami.</p><p>Kupno domu w Alicante oznacza również cieszenie się wyjątkową sztuką życia. Dzięki lokalnej gastronomii, w tym słynnej paelli i słodkiemu winu Alicante, oraz łagodnemu klimatowi przez cały rok, region ten oferuje niezrównane środowisko życia zarówno dla inwestorów, jak i mieszkańców.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Prowincja Alicante, położona na słynnym wybrzeżu Costa Blanca, szczyci się wyjątkowym naturalnym otoczeniem między złotymi plażami i górzystym terenem. Z ponad 200 kilometrami wybrzeża graniczącego z Morzem Śródziemnym, rynek nieruchomości w Alicante kwitnie, przyciągając wielu nabywców poszukujących idyllicznego stylu życia.</p><p>Na wybrzeżu znajduje się wiele nowoczesnych mieszkań, szczególnie w Benidorm i Torrevieja, oferujących niezakłócony widok na morze i najwyższej klasy udogodnienia. Dla tych, którzy wolą bardziej intymne miejsce zamieszkania, na Costa Blanca dostępne są wspaniałe domy na sprzedaż, niektóre z prywatnymi basenami i zapierającymi dech w piersiach widokami.</p><p>Kupno domu w Alicante oznacza również cieszenie się wyjątkową sztuką życia. Dzięki lokalnej gastronomii, w tym słynnej paelli i słodkiemu winu Alicante, oraz łagodnemu klimatowi przez cały rok, region ten oferuje niezrównane środowisko życia zarówno dla inwestorów, jak i mieszkańców.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/rodzaj-nieruchomosci-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Mieszkania i domy na sprzedaż w Alicante</a></div></div></div></div></div>
<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Ваш новый дом в Аликанте</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/ru/nedvizimost-dom-kvartira-u-mora-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Недвижимость дом/квартира у моря" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Квартира У Моря</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/ru/dom-kvartira-na-pole-dla-gol-fa-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Дом/квартира на поле для гольфа" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Квартира На Поле Для Гольфа</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/ru/nedvizimost-v-alakante-alikante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Недвижимость в Алаканте / Аликанте" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Аликанте</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Нужно связаться?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">У меня есть проект</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Получите оценку вашего дома в Аликанте.</h2><img 
            alt="Получите оценку вашего дома в Аликанте."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Получите оценку вашего дома в Аликанте."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Получите оценку вашего дома в Аликанте.</h2><div class="mw-355"><p>Правильно оцененная недвижимость продается быстрее. Закажите бесплатную оценку без обязательств.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Получить оценку</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Правильно оцененная недвижимость продается быстрее. Закажите бесплатную оценку без обязательств.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Получить оценку</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Наши Гиды по Недвижимости</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Все наши советы, которые помогут вам максимально эффективно реализовать ваши проекты недвижимости в Аликанте.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="ru/category/nedvizhimost-guides-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Смотреть гиды</a></div>{/if}<div class="mt-6 row"></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="ru/category/nedvizhimost-guides-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Смотреть гиды</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Недвижимость Аликанте: Покупка домов и квартир</h2><img 
            alt="Недвижимость Аликанте: Покупка домов и квартир"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Недвижимость Аликанте: Покупка домов и квартир"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Недвижимость Аликанте: Покупка домов и квартир</h2><div class="mw-355"><p>Рынок недвижимости Аликанте переживает бум, привлекая как международных инвесторов, так и жителей, ищущих исключительное качество жизни. Средиземноморский климат, великолепная береговая линия и более доступная стоимость жизни по сравнению с другими крупными европейскими городами делают его приоритетным направлением для покупки недвижимости.</p><p>Покупка недвижимости в Аликанте имеет много преимуществ. Процедуры покупки упрощены для иностранных покупателей, а привлекательные процентные ставки и динамичный рынок предлагают стратегические инвестиционные возможности. Будь то основное место жительства, загородный дом или инвестиции в аренду, Аликанте предлагает широкий выбор объектов недвижимости.</p><p>Для тех, кто мечтает о доме в Аликанте, рынок предлагает широкий выбор недвижимости. От современных вилл у моря до традиционных домов, расположенных в окружающих холмах, каждый покупатель может найти недвижимость, соответствующую его ожиданиям и бюджету. Если вы предпочитаете суету города, покупка квартиры в Аликанте - идеальная альтернатива. Исторический центр, современные районы и прибрежные жилые зоны предлагают разнообразный выбор квартир: от функциональных студий до пентхаусов с панорамным видом.</p><p>Благодаря своей исключительной среде обитания и динамичному рынку недвижимости Аликанте является приоритетным направлением для безопасных и прибыльных инвестиций.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Рынок недвижимости Аликанте переживает бум, привлекая как международных инвесторов, так и жителей, ищущих исключительное качество жизни. Средиземноморский климат, великолепная береговая линия и более доступная стоимость жизни по сравнению с другими крупными европейскими городами делают его приоритетным направлением для покупки недвижимости.</p><p>Покупка недвижимости в Аликанте имеет много преимуществ. Процедуры покупки упрощены для иностранных покупателей, а привлекательные процентные ставки и динамичный рынок предлагают стратегические инвестиционные возможности. Будь то основное место жительства, загородный дом или инвестиции в аренду, Аликанте предлагает широкий выбор объектов недвижимости.</p><p>Для тех, кто мечтает о доме в Аликанте, рынок предлагает широкий выбор недвижимости. От современных вилл у моря до традиционных домов, расположенных в окружающих холмах, каждый покупатель может найти недвижимость, соответствующую его ожиданиям и бюджету. Если вы предпочитаете суету города, покупка квартиры в Аликанте - идеальная альтернатива. Исторический центр, современные районы и прибрежные жилые зоны предлагают разнообразный выбор квартир: от функциональных студий до пентхаусов с панорамным видом.</p><p>Благодаря своей исключительной среде обитания и динамичному рынку недвижимости Аликанте является приоритетным направлением для безопасных и прибыльных инвестиций.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/ru/nedvizimost-v-al-hama-de-mursia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Недвижимость в Альхама-де-Мурсия" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Недвижимость в Альхама-де-Мурсия</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/ru/nedvizimost-v-benidorme-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Недвижимость в Бенидорме" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Недвижимость в Бенидорме</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/ru/nedvizimost-v-torrev-ehe-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Недвижимость в Торревьехе" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Недвижимость в Торревьехе</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/ru/nedvizimost-v-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Недвижимость в Гуардамар-дель-Сегура" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Недвижимость в Гуардамар-дель-Сегура</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Недвижимость Аликанте: Между морем и горами</h2><img 
            alt="Недвижимость Аликанте: Между морем и горами"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Недвижимость Аликанте: Между морем и горами"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Недвижимость Аликанте: Между морем и горами</h2><div class="mw-355"><p>Провинция Аликанте, расположенная на знаменитом Коста-Бланка, может похвастаться исключительной природной обстановкой между золотыми пляжами и горной местностью. Более 200 километров береговой линии Средиземного моря делают рынок недвижимости Аликанте процветающим, привлекая многих покупателей, ищущих идиллический образ жизни.</p><p>На побережье много современных квартир, особенно в Бенидорме и Торревьехе, с беспрепятственным видом на море и первоклассными удобствами. Для тех, кто предпочитает более уединенное жилье, на Коста-Бланка есть прекрасные дома в продаже, некоторые с частным бассейном и захватывающими видами.</p><p>Покупка дома в Аликанте также означает наслаждение уникальным искусством жизни. С местной гастрономией, включая знаменитую паэлью и сладкое вино Аликанте, а также мягким климатом круглый год, этот регион предлагает непревзойденную среду обитания как для инвесторов, так и для жителей.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Провинция Аликанте, расположенная на знаменитом Коста-Бланка, может похвастаться исключительной природной обстановкой между золотыми пляжами и горной местностью. Более 200 километров береговой линии Средиземного моря делают рынок недвижимости Аликанте процветающим, привлекая многих покупателей, ищущих идиллический образ жизни.</p><p>На побережье много современных квартир, особенно в Бенидорме и Торревьехе, с беспрепятственным видом на море и первоклассными удобствами. Для тех, кто предпочитает более уединенное жилье, на Коста-Бланка есть прекрасные дома в продаже, некоторые с частным бассейном и захватывающими видами.</p><p>Покупка дома в Аликанте также означает наслаждение уникальным искусством жизни. С местной гастрономией, включая знаменитую паэлью и сладкое вино Аликанте, а также мягким климатом круглый год, этот регион предлагает непревзойденную среду обитания как для инвесторов, так и для жителей.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Квартиры и дома в продаже в Аликанте</a></div></div></div></div></div>
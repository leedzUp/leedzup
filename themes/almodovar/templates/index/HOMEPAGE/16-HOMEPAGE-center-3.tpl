<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Ваш новий дім у Аліканті</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/uk/neruhomist-budinok-kvartira-bila-mora-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Нерухомість будинок / квартира біля моря" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Квартира Біля Моря</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/uk/neruhomist-budinok-kvartira-na-poli-dla-gol-fu-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Нерухомість будинок / квартира на полі для гольфу" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Квартира На Полі Для Гольфу</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/uk/neruhomist-v-alakanti-alikante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Нерухомість в Алаканті / Аліканте" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Аліканте</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>Потрібен контакт?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">У мене є проект</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Отримайте оцінку вашого будинку в Аліканті.</h2><img 
            alt="Отримайте оцінку вашого будинку в Аліканті."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Отримайте оцінку вашого будинку в Аліканті."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Отримайте оцінку вашого будинку в Аліканті.</h2><div class="mw-355"><p>Правильно оцінена нерухомість продається швидше. Замовте безкоштовну, беззобов’язальну оцінку.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Отримати оцінку</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Правильно оцінена нерухомість продається швидше. Замовте безкоштовну, беззобов’язальну оцінку.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Отримати оцінку</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Наші Гіди з Нерухомості</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Усі наші поради, щоб допомогти вам максимально реалізувати ваші проекти нерухомості в Аліканте.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="uk/category/neruhomist-guides-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Дивитися гіди</a></div>{/if}<div class="mt-6 row"></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="uk/category/neruhomist-guides-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Дивитися гіди</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Нерухомість Аліканте: Купівля будинків та квартир</h2><img 
            alt="Нерухомість Аліканте: Купівля будинків та квартир"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Нерухомість Аліканте: Купівля будинків та квартир"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Нерухомість Аліканте: Купівля будинків та квартир</h2><div class="mw-355"><p>Ринок нерухомості Аліканте стрімко зростає, приваблюючи як міжнародних інвесторів, так і мешканців, які шукають виняткову якість життя. Середземноморський клімат, чудове узбережжя та доступніший рівень життя, ніж у інших великих європейських містах, роблять його пріоритетним напрямком для купівлі нерухомості.</p><p>Купівля нерухомості в Аліканті має багато переваг. Процедури купівлі спрощені для іноземних покупців, а привабливі відсоткові ставки та динамічний ринок пропонують стратегічні інвестиційні можливості. Незалежно від того, чи це основне місце проживання, будинок для відпочинку чи інвестиції в оренду, Аліканте пропонує широкий вибір об'єктів нерухомості.</p><p>Для тих, хто мріє про будинок в Аліканте, ринок пропонує широкий вибір нерухомості. Від сучасних вілл біля моря до традиційних будинків, розташованих серед навколишніх пагорбів, кожен покупець може знайти нерухомість, яка відповідає його очікуванням та бюджету. Якщо ви віддаєте перевагу міському метушливому життю, купівля квартири в Аліканте є ідеальною альтернативою. Історичний центр, сучасні райони та прибережні житлові зони пропонують різноманітний вибір квартир: від функціональних студій до пентхаусів з панорамним видом.</p><p>Завдяки своєму винятковому середовищу проживання та динамічному ринку нерухомості Аліканте є пріоритетним напрямком для безпечних і прибуткових інвестицій.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Ринок нерухомості Аліканте стрімко зростає, приваблюючи як міжнародних інвесторів, так і мешканців, які шукають виняткову якість життя. Середземноморський клімат, чудове узбережжя та доступніший рівень життя, ніж у інших великих європейських містах, роблять його пріоритетним напрямком для купівлі нерухомості.</p><p>Купівля нерухомості в Аліканті має багато переваг. Процедури купівлі спрощені для іноземних покупців, а привабливі відсоткові ставки та динамічний ринок пропонують стратегічні інвестиційні можливості. Незалежно від того, чи це основне місце проживання, будинок для відпочинку чи інвестиції в оренду, Аліканте пропонує широкий вибір об'єктів нерухомості.</p><p>Для тих, хто мріє про будинок в Аліканте, ринок пропонує широкий вибір нерухомості. Від сучасних вілл біля моря до традиційних будинків, розташованих серед навколишніх пагорбів, кожен покупець може знайти нерухомість, яка відповідає його очікуванням та бюджету. Якщо ви віддаєте перевагу міському метушливому життю, купівля квартири в Аліканте є ідеальною альтернативою. Історичний центр, сучасні райони та прибережні житлові зони пропонують різноманітний вибір квартир: від функціональних студій до пентхаусів з панорамним видом.</p><p>Завдяки своєму винятковому середовищу проживання та динамічному ринку нерухомості Аліканте є пріоритетним напрямком для безпечних і прибуткових інвестицій.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/uk/neruhomist-v-al-hama-de-mursia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Нерухомість в Альхама-де-Мурсія" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Нерухомість в Альхама-де-Мурсія</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/uk/neruhomist-v-benidormi-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Нерухомість в Бенідормі" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Нерухомість в Бенідормі</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/uk/neruhomist-v-torrev-eha-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Нерухомість в Торрев&#039;єха" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Нерухомість в Торрев&#039;єха</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/uk/neruhomist-v-gvardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Нерухомість в Гвардамар-дель-Сегура" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Нерухомість в Гвардамар-дель-Сегура</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Нерухомість Аліканте: Між морем та горами</h2><img 
            alt="Нерухомість Аліканте: Між морем та горами"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Нерухомість Аліканте: Між морем та горами"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Нерухомість Аліканте: Між морем та горами</h2><div class="mw-355"><p>Провінція Аліканте, розташована на знаменитому Коста-Бланка, може похвалитися винятковим природним середовищем між золотистими пляжами та гірською місцевістю. Більш ніж 200 кілометрів берегової лінії Середземного моря роблять ринок нерухомості Аліканте процвітаючим, приваблюючи багатьох покупців, які шукають ідилічний спосіб життя.</p><p>На узбережжі багато сучасних квартир, особливо в Бенідормі та Торрев'єсі, з безперешкодним видом на море та першокласними зручностями. Для тих, хто віддає перевагу більш затишному житлу, на Коста-Бланка є чудові будинки у продажу, деякі з приватним басейном і захоплюючими видами.</p><p>Купівля будинку в Аліканте також означає насолоду унікальним мистецтвом життя. З місцевою гастрономією, включаючи знамениту паелью та солодке вино Аліканте, а також м'яким кліматом цілий рік, цей регіон пропонує неперевершене середовище проживання як для інвесторів, так і для мешканців.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Провінція Аліканте, розташована на знаменитому Коста-Бланка, може похвалитися винятковим природним середовищем між золотистими пляжами та гірською місцевістю. Більш ніж 200 кілометрів берегової лінії Середземного моря роблять ринок нерухомості Аліканте процвітаючим, приваблюючи багатьох покупців, які шукають ідилічний спосіб життя.</p><p>На узбережжі багато сучасних квартир, особливо в Бенідормі та Торрев'єсі, з безперешкодним видом на море та першокласними зручностями. Для тих, хто віддає перевагу більш затишному житлу, на Коста-Бланка є чудові будинки у продажу, деякі з приватним басейном і захоплюючими видами.</p><p>Купівля будинку в Аліканте також означає насолоду унікальним мистецтвом життя. З місцевою гастрономією, включаючи знамениту паелью та солодке вино Аліканте, а також м'яким кліматом цілий рік, цей регіон пропонує неперевершене середовище проживання як для інвесторів, так і для мешканців.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Квартири та будинки у продажу в Аліканте</a></div></div></div></div></div>
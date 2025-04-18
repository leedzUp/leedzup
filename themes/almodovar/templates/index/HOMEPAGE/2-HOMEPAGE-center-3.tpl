<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Tu nuevo hogar en Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/es/inmobiliario-casa-piso-cerca-del-mar-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Inmobiliario casa / piso cerca del mar" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Piso Cerca Del Mar</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/es/inmobiliario-casa-piso-en-campo-de-golf-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Inmobiliario casa / piso en campo de golf" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Piso En Campo De Golf</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/es/inmobiliaria-en-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Inmobiliaria en Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>¿Necesita que nos pongamos en contacto con usted?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Tengo un proyecto</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Obtén una estimación para tu casa en Alicante</h2><img 
            alt="Obtén una estimación para tu casa en Alicante"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Obtén una estimación para tu casa en Alicante"
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Obtén una estimación para tu casa en Alicante</h2><div class="mw-355"><p>Una propiedad correctamente valorada tiene más probabilidades de venderse rápidamente. Pídanos una tasación gratuita y sin compromiso de su propiedad.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Obtenga una evaluación</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Una propiedad correctamente valorada tiene más probabilidades de venderse rápidamente. Pídanos una tasación gratuita y sin compromiso de su propiedad.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Obtenga una evaluación</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Nuestros guías inmobiliarios</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Todos nuestros consejos para que saques el máximo partido a tus proyectos inmobiliarios en Alicante.</p>
<p>Todos nuestros consejos para que saques el máximo partido a tus proyectos inmobiliarios en Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="/es/category/nuestras-guias-inmobiliarias-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Ver nuestras guías</a></div>{/if}<div class="mt-6 row"><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/es/como-comprar-una-propiedad-en-espana-6"><picture>
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
                                    alt="Como comprar una propiedad en España"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/6.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">Como comprar una propiedad en España</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/es/donde-comprar-una-propiedad-en-2025-en-alicante-7"><picture>
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
                                    alt="¿Dónde comprar una propiedad en alicante en 2025?"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/7.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">¿Dónde comprar una propiedad en alicante en 2025?</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/es/la-guia-del-inversor-en-espana-8"><picture>
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
                                    alt="La guía del inversor en España"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/8.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">La guía del inversor en España</span></a></div></li><div class="col-12 col-md-3 mb-4"><a href="https://test.leedzup.com/es/5-cosas-a-tener-en-cuenta-antes-de-comprar-en-alicante-9"><picture>
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
                                    alt="5 cosas a tener en cuenta antes de comprar en Alicante"
                                    class="h-535 rounded-2 img-fluid card-img-top"
                                    src="/modules/code_buildhomepage/uploads/cms_images/9.svg"
                                    width="400"
                                    height="535"><span class="mt-4 fs-5">5 cosas a tener en cuenta antes de comprar en Alicante</span></a></div></li></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="/es/category/nuestras-guias-inmobiliarias-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Ver nuestras guías</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Inmobiliaria en Alicante: compra de casas y apartamentos</h2><img 
            alt="Inmobiliaria en Alicante: compra de casas y apartamentos"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Inmobiliaria en Alicante: compra de casas y apartamentos"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Inmobiliaria en Alicante: compra de casas y apartamentos</h2><div class="mw-355"><p>The property market in Alicante is booming, attracting both international investors and residents looking for an exceptional quality of life. Its Mediterranean climate, splendid coastline and more affordable cost of living than in other major European cities make it a prime destination for property purchases.</p><p>Buying a property in Alicante has many advantages. Purchasing procedures are simplified for foreign buyers, while attractive interest rates and a dynamic market offer strategic investment opportunities. Whether for a primary residence, holiday home or rental investment, Alicante offers a wide choice of properties.</p><p>For those dreaming of a home in Alicante, the market offers a wide variety of properties. From contemporary villas by the sea to traditional houses nestled in the surrounding hills, every buyer can find a property to suit their expectations and budget. If you prefer the hustle and bustle of the city, buying a flat in Alicante is an ideal alternative. The historic centre, modern neighbourhoods and seaside residential areas offer a varied range of flats, from functional studios to penthouses with panoramic views.</p><p>With its exceptional living environment and dynamic property market, Alicante is a prime destination for a secure and profitable investment.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>The property market in Alicante is booming, attracting both international investors and residents looking for an exceptional quality of life. Its Mediterranean climate, splendid coastline and more affordable cost of living than in other major European cities make it a prime destination for property purchases.</p><p>Buying a property in Alicante has many advantages. Purchasing procedures are simplified for foreign buyers, while attractive interest rates and a dynamic market offer strategic investment opportunities. Whether for a primary residence, holiday home or rental investment, Alicante offers a wide choice of properties.</p><p>For those dreaming of a home in Alicante, the market offers a wide variety of properties. From contemporary villas by the sea to traditional houses nestled in the surrounding hills, every buyer can find a property to suit their expectations and budget. If you prefer the hustle and bustle of the city, buying a flat in Alicante is an ideal alternative. The historic centre, modern neighbourhoods and seaside residential areas offer a varied range of flats, from functional studios to penthouses with panoramic views.</p><p>With its exceptional living environment and dynamic property market, Alicante is a prime destination for a secure and profitable investment.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/es/propiedad-en-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Propiedad en Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Propiedad en Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/es/inmuebles-en-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Inmuebles en Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Inmuebles en Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/es/inmobiliaria-en-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Inmobiliaria en Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Inmobiliaria en Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/es/propiedad-en-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Propiedad en Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Propiedad en Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Inmobiliaria en Alicante: entre el mar y la montaña</h2><img 
            alt="Inmobiliaria en Alicante: entre el mar y la montaña"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Inmobiliaria en Alicante: entre el mar y la montaña"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Inmobiliaria en Alicante: entre el mar y la montaña</h2><div class="mw-355"><p>La provincia de Alicante, situada en la famosa Costa Blanca, presume de un entorno natural excepcional entre playas doradas y terreno montañoso. Con más de 200 kilómetros de costa bordeando el Mediterráneo, el mercado inmobiliario alicantino está en auge, atrayendo a muchos compradores en busca de un entorno idílico para vivir.<p>La costa está repleta de modernos pisos, sobre todo en Benidorm y Torrevieja, que ofrecen vistas ininterrumpidas al mar y servicios de primera clase. Para los que prefieren una morada más íntima, hay magníficas casas en venta en la Costa Blanca, algunas con piscina privada e impresionantes vistas.</p> <p>Para los que prefieren una morada más íntima, hay magníficas casas en venta en la Costa Blanca, algunas con piscina privada e impresionantes vistas.<p>Comprar una casa en Alicante también significa disfrutar de un arte de vivir único. Con una gastronomía local que incluye la famosa paella y el vino dulce de Alicante, y un clima suave durante todo el año, esta región ofrece un entorno de vida incomparable tanto para inversores como para residentes.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>La provincia de Alicante, situada en la famosa Costa Blanca, presume de un entorno natural excepcional entre playas doradas y terreno montañoso. Con más de 200 kilómetros de costa bordeando el Mediterráneo, el mercado inmobiliario alicantino está en auge, atrayendo a muchos compradores en busca de un entorno idílico para vivir.<p>La costa está repleta de modernos pisos, sobre todo en Benidorm y Torrevieja, que ofrecen vistas ininterrumpidas al mar y servicios de primera clase. Para los que prefieren una morada más íntima, hay magníficas casas en venta en la Costa Blanca, algunas con piscina privada e impresionantes vistas.</p> <p>Para los que prefieren una morada más íntima, hay magníficas casas en venta en la Costa Blanca, algunas con piscina privada e impresionantes vistas.<p>Comprar una casa en Alicante también significa disfrutar de un arte de vivir único. Con una gastronomía local que incluye la famosa paella y el vino dulce de Alicante, y un clima suave durante todo el año, esta región ofrece un entorno de vida incomparable tanto para inversores como para residentes.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/tipo-de-propiedad-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Pisos y casas en venta en Alicante</a></div></div></div></div></div>
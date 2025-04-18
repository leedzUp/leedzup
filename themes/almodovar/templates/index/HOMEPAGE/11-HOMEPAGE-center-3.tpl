<div class="mt-5 container"><h2 class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if} title mb-2">Tu nuevo hogar en Alicante</h2><div class="row"><div class="{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}px-4{/if} col-md-6 card"><div class="shadow rounded-5 card-body d-flex row"><div class="p-3 col-12  col-md-4"><a href="https://test.leedzup.com/pt/imobiliaria-casa-apartamento-perto-do-mar-10.htm"><img src="https://test.leedzup.com/img/c/10.webp" alt="Imobiliária casa / apartamento perto do mar" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Apartamento Perto Do Mar</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/pt/casa-apartamento-no-campo-de-golfe-20.htm"><img src="https://test.leedzup.com/img/c/20.webp" alt="Casa / apartamento no campo de golfe" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Apartamento No Campo De Golfe</h2></a></div><div class="p-3 col-6 col-md-4"><a href="https://test.leedzup.com/pt/imoveis-em-alacant-alicante-15.htm"><img src="https://test.leedzup.com/img/c/15.webp" alt="Imóveis em Alacant / Alicante" class="rounded-5 mb-4 img-fluid"><h2 class="text-center">Alicante</h2></a></div></div><div class="d-flex align-items-center justify-content-between mt-5 mb-5"><div class="fs-4 fw-bold"><p><span>¿Necesitas que te contactemos?</span></p></div><div class="w-100 d-flex justify-content-end"><span data-bs-toggle="modal" data-bs-target="#leadFormModalHome" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Tengo un proyecto</span></div></div></div><div class="col-md-6"><div id="map" style="height: 400px;">ici une carte</div></div></div></div><link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
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
</script>{widget name=ps_featuredproducts}<div class="mt-5 mb-5 pt-5 pb-5" id="target-3"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Obtenha uma estimativa para sua casa em Alicante.</h2><img 
            alt="Obtenha uma estimativa para sua casa em Alicante."
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Obtenha uma estimativa para sua casa em Alicante."
            width="1920" 
            height="1045"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/1.svg?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Obtenha uma estimativa para sua casa em Alicante.</h2><div class="mw-355"><p>Um imóvel corretamente avaliado vende-se mais rápido. Peça uma avaliação gratuita e sem compromisso.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Solicitar avaliação</span></p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>Um imóvel corretamente avaliado vende-se mais rápido. Peça uma avaliação gratuita e sem compromisso.</p>
<p class="mt-4"><span class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Solicitar avaliação</span></p></div>{/if}</div></div></div></div><div id="target-6" class=" container mt-2 xs-mt-2">
      <div class="row">
          <div class="pl-4 col-md-12 mt-4">
              <h2 class="title {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}text-center{/if}">Nuestras Guías Inmobiliarias</h2> {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mw-540"><p>Todos nuestros consejos para ayudarte a aprovechar al máximo tus proyectos inmobiliarios en Alicante.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="mt-4 xs-mt-4"><a href="es/category/guias-inmobiliarias-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Ver nuestras guías</a></div>{/if}<div class="mt-6 row"></div>{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="text-center mt-4 xs-mt-4"><a href="es/category/guias-inmobiliarias-3" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Ver nuestras guías</a></div>{/if}</div>
          </div>
      
      </div>
  </div>  </div><div class="mt-5 mb-5 pt-5 pb-5" id="target-4"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Inmobiliaria Alicante: Comprar Casas y Apartamentos</h2><img 
            alt="Inmobiliaria Alicante: Comprar Casas y Apartamentos"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Inmobiliaria Alicante: Comprar Casas y Apartamentos"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/3.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Inmobiliaria Alicante: Comprar Casas y Apartamentos</h2><div class="mw-355"><p>El mercado inmobiliario de Alicante está en auge, atrayendo tanto a inversores internacionales como a residentes en busca de una calidad de vida excepcional. Su clima mediterráneo, espléndida costa y un coste de vida más asequible que en otras grandes ciudades europeas lo convierten en un destino principal para comprar propiedades.</p><p>Comprar una propiedad en Alicante tiene muchas ventajas. Los procedimientos de compra se simplifican para compradores extranjeros, mientras que los tipos de interés atractivos y un mercado dinámico ofrecen oportunidades de inversión estratégicas. Ya sea para residencia principal, casa de vacaciones o inversión en alquiler, Alicante ofrece una amplia variedad de propiedades.</p><p>Para quienes sueñan con una casa en Alicante, el mercado ofrece una gran variedad de inmuebles. Desde villas contemporáneas junto al mar hasta casas tradicionales enclavadas en las colinas circundantes, cada comprador puede encontrar una propiedad que se ajuste a sus expectativas y presupuesto. Si prefieres el bullicio de la ciudad, comprar un piso en Alicante es una alternativa ideal. El casco histórico, los barrios modernos y las zonas residenciales costeras ofrecen una variada gama de pisos, desde estudios funcionales hasta áticos con vistas panorámicas.</p><p>Con su excepcional entorno de vida y un mercado inmobiliario dinámico, Alicante es un destino principal para una inversión segura y rentable.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>El mercado inmobiliario de Alicante está en auge, atrayendo tanto a inversores internacionales como a residentes en busca de una calidad de vida excepcional. Su clima mediterráneo, espléndida costa y un coste de vida más asequible que en otras grandes ciudades europeas lo convierten en un destino principal para comprar propiedades.</p><p>Comprar una propiedad en Alicante tiene muchas ventajas. Los procedimientos de compra se simplifican para compradores extranjeros, mientras que los tipos de interés atractivos y un mercado dinámico ofrecen oportunidades de inversión estratégicas. Ya sea para residencia principal, casa de vacaciones o inversión en alquiler, Alicante ofrece una amplia variedad de propiedades.</p><p>Para quienes sueñan con una casa en Alicante, el mercado ofrece una gran variedad de inmuebles. Desde villas contemporáneas junto al mar hasta casas tradicionales enclavadas en las colinas circundantes, cada comprador puede encontrar una propiedad que se ajuste a sus expectativas y presupuesto. Si prefieres el bullicio de la ciudad, comprar un piso en Alicante es una alternativa ideal. El casco histórico, los barrios modernos y las zonas residenciales costeras ofrecen una variada gama de pisos, desde estudios funcionales hasta áticos con vistas panorámicas.</p><p>Con su excepcional entorno de vida y un mercado inmobiliario dinámico, Alicante es un destino principal para una inversión segura y rentable.</p></div>{/if}</div></div></div></div><div class="container"><div class="row"><div class="col-6 col-md-3"><a href="https://test.leedzup.com/pt/imovel-em-alhama-de-murcia-59.htm"><img src="https://test.leedzup.com/img/c/59.webp" alt="Imóvel em Alhama de Murcia" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Imóvel em Alhama de Murcia</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/pt/imobiliaria-em-benidorm-28.htm"><img src="https://test.leedzup.com/img/c/28.webp" alt="Imobiliária em Benidorm" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Imobiliária em Benidorm</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/pt/imoveis-em-torrevieja-36.htm"><img src="https://test.leedzup.com/img/c/36.webp" alt="Imóveis em Torrevieja" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Imóveis em Torrevieja</h3></a></div><div class="col-6 col-md-3"><a href="https://test.leedzup.com/pt/imobiliaria-em-guardamar-del-segura-43.htm"><img src="https://test.leedzup.com/img/c/43.webp" alt="Imobiliária em Guardamar del Segura" class="rounded-5 mb-4 img-fluid"><h3 class="text-center">Imobiliária em Guardamar del Segura</h3></a></div></div></div><div class="mt-5 mb-5 pt-5 pb-5" id="target-5"><div class="container {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}p-0{/if}">{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<h2 class="title text-center">Inmobiliaria Alicante: Entre Mar y Montaña</h2><img 
            alt="Inmobiliaria Alicante: Entre Mar y Montaña"
            width="412" 
            height="222"
            loading="lazy"
            style="border-radius: 55px;"
            class="mb-4 px-3 img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622">
        {/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="row align-items-center bg-lightgray rounded-start-8 rounded-end-pill"><div class="text-right col-12 col-md-5 p-0 order-1 order-md-2 xs-mt-6 xs-mb-8"><img 
            alt="Inmobiliaria Alicante: Entre Mar y Montaña"
            width="717" 
            height="752"
            loading="lazy"
            class="img-fluid" 
            src="/modules/code_buildhomepage/uploads/block/4.webp?20250319092622"></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}<div class="px-5 text-block col-12 col-md-7 pl-4 order-2 order-md-1"><h2 class="fs-1">Inmobiliaria Alicante: Entre Mar y Montaña</h2><div class="mw-355"><p>La provincia de Alicante, situada en la famosa Costa Blanca, cuenta con un entorno natural excepcional entre playas doradas y terreno montañoso. Con más de 200 kilómetros de costa bañada por el Mediterráneo, el mercado inmobiliario de Alicante está en auge, atrayendo a muchos compradores en busca de un estilo de vida idílico.</p><p>La costa está llena de apartamentos modernos, especialmente en Benidorm y Torrevieja, que ofrecen vistas al mar ininterrumpidas y comodidades de primera clase. Para quienes prefieren una morada más íntima, hay casas excelentes en venta en la Costa Blanca, algunas con piscina privada y vistas impresionantes.</p><p>Comprar una casa en Alicante también significa disfrutar de un arte de vivir único. Con gastronomía local, incluida la famosa paella y el vino dulce de Alicante, y un clima templado todo el año, esta región ofrece un entorno de vida incomparable tanto para inversores como para residentes.</p></div>{/if}{if Context::getContext()->detectDeviceByUserAgent() == "mobile"}<div class="px-4 text-block col-12"><p>La provincia de Alicante, situada en la famosa Costa Blanca, cuenta con un entorno natural excepcional entre playas doradas y terreno montañoso. Con más de 200 kilómetros de costa bañada por el Mediterráneo, el mercado inmobiliario de Alicante está en auge, atrayendo a muchos compradores en busca de un estilo de vida idílico.</p><p>La costa está llena de apartamentos modernos, especialmente en Benidorm y Torrevieja, que ofrecen vistas al mar ininterrumpidas y comodidades de primera clase. Para quienes prefieren una morada más íntima, hay casas excelentes en venta en la Costa Blanca, algunas con piscina privada y vistas impresionantes.</p><p>Comprar una casa en Alicante también significa disfrutar de un arte de vivir único. Con gastronomía local, incluida la famosa paella y el vino dulce de Alicante, y un clima templado todo el año, esta región ofrece un entorno de vida incomparable tanto para inversores como para residentes.</p></div>{/if}<div class="{if Context::getContext()->detectDeviceByUserAgent() != "mobile"}mt-4 {else} px-5 text-center{/if}"><a href="/property-type-3.htm" class="fw-bold btn btn-primary fs-5 text-white rounded-pill">Pisos y casas en venta en Alicante</a></div></div></div></div></div>

document.addEventListener('DOMContentLoaded', () => {

    const searchFilterToggler = document.getElementById('search_filter_toggler');
    const offcanvas = document.getElementById('offcanvas-faceted');

    // Vérifiez si les éléments existent avant d'ajouter des écouteurs
    if (searchFilterToggler && offcanvas) {
        searchFilterToggler.addEventListener('click', () => {
            offcanvas.classList.add('show');
        });
    } else {
        console.error('Élément introuvable : searchFilterToggler ou offcanvas');
    }

    const productListContainer = document.getElementById('js-product-list');
    const filtersListContainer = document.getElementById('search-filters');

    if (!productListContainer) {
        console.error('Conteneur de la liste des produits introuvable.');
        return;
    }

    if (!filtersListContainer) {
        console.error('Conteneur de la liste des filtres introuvable.');
        return;
    }

    let filtersByCategory = {};

    // Gestion des clics sur les labels
    document.querySelectorAll('.form-check-label').forEach(label => {
        label.addEventListener('click', function (event) {
            event.preventDefault();
            event.stopPropagation();

            const forAttr = this.getAttribute('for');
            if (forAttr) {
                const checkbox = document.getElementById(forAttr);
                if (checkbox) {
                    checkbox.checked = !checkbox.checked; // Toggle checkbox

                    // Réinitialiser les filtres par catégorie
                    filtersByCategory = {};

                    // Ajouter les paramètres des cases à cocher sélectionnées
                    document.querySelectorAll('.form-check-input:checked').forEach(input => {
                        const searchUrl = input.getAttribute('data-search-url');
                        if (searchUrl) {
                            const searchParams = new URL(searchUrl).searchParams;
                            const qValue = searchParams.get('q');
                            if (qValue) {
                                // Extraire la catégorie du filtre et ajouter le filtre à la catégorie correspondante
                                const category = extractCategory(qValue);
                                if (!filtersByCategory[category]) {
                                    filtersByCategory[category] = [];
                                }
                                filtersByCategory[category].push(qValue);
                            }
                        }
                    });

                    // Construire la nouvelle URL avec un seul paramètre q qui combine les valeurs par catégorie
                    const combinedQ = [];
                    for (let category in filtersByCategory) {
                        const categoryFilters = filtersByCategory[category];
                        if (categoryFilters.length > 0) {
                            combinedQ.push(category + '-' + categoryFilters.join('-'));
                        }
                    }

                    let currentUrl = new URL(window.location.href);

                    if (combinedQ.length > 0) {
                        const combinedQuery = encodeURIComponent(combinedQ.join('/'));
                        const baseUrl = currentUrl.origin + currentUrl.pathname;
                        const otherParams = new URLSearchParams(currentUrl.search);

                        otherParams.delete('q'); // Supprime les anciens paramètres q

                        // Mise à jour de l'URL
                        currentUrl.search = `q=${combinedQuery}&${otherParams.toString()}`;
                    }

                    console.log('Nouvelle URL :', currentUrl.toString());
                    refreshProductList(currentUrl.toString());
                } else {
                    console.error('Case à cocher introuvable pour ce label.');
                }
            } else {
                console.error('Attribut for introuvable sur ce label.');
            }
        });
    });

    document.querySelectorAll(".js-faceted-slider-container").forEach(sliderContainer => {
        let sliderId = sliderContainer.getAttribute("id").replace("slider-", "");
        let min = parseFloat(sliderContainer.dataset.sliderMin);
        let max = parseFloat(sliderContainer.dataset.sliderMax);
        let valuesRaw = sliderContainer.dataset.sliderValues;
        let values = (valuesRaw && valuesRaw !== "null") ? JSON.parse(valuesRaw) : [min, max];

        let slider = document.getElementById('slider-' + sliderId);
        noUiSlider.create(slider, {
            start: values,
            connect: true,
            range: { 'min': min, 'max': max },
            step: 1000,
            tooltips: false,
            format: {
                to: value => new Intl.NumberFormat('fr-FR', { 
                    style: 'currency', 
                    currency: 'EUR', 
                    minimumFractionDigits: 0, 
                    maximumFractionDigits: 0  
                }).format(value),
                from: value => Number(value.replace(/[^0-9-]+/g, ""))
            }
        });

        let startInput = document.getElementById(`slider-range-${sliderId}-start`);
        let endInput = document.getElementById(`slider-range-${sliderId}-end`);
        let startValue = document.getElementById(`slider-${sliderId}-start`);
        let endValue = document.getElementById(`slider-${sliderId}-end`);

        // Synchronisation : Mise à jour des inputs quand le slider change
        slider.noUiSlider.on("update", function (values) {
            startValue.textContent = values[0];
            endValue.textContent = values[1];

            startInput.value = parseInt(values[0].replace(/\D/g, ""), 10);
            endInput.value = parseInt(values[1].replace(/\D/g, ""), 10);
        });

        // Synchronisation inverse : Mise à jour du slider quand les inputs sont modifiés
        [startInput, endInput].forEach((input, index) => {
            input.addEventListener("change", function () {
                let minValue = parseInt(startInput.value, 10) || min;
                let maxValue = parseInt(endInput.value, 10) || max;

                // Empêcher les valeurs incorrectes
                if (minValue < min) minValue = min;
                if (maxValue > max) maxValue = max;
                if (minValue > maxValue) minValue = maxValue;

                slider.noUiSlider.set([minValue, maxValue]);
            });
        });

        // Ajout d'un gestionnaire d'événements pour "Enter" dans les champs min et max
[startInput, endInput].forEach((input) => {
    input.addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
            // Empêcher l'événement de se propager pour éviter d'autres actions
            event.preventDefault();

            // Mettre à jour le slider avec les nouvelles valeurs des inputs
            let minValue = parseInt(startInput.value, 10) || min;
            let maxValue = parseInt(endInput.value, 10) || max;

            // Empêcher les valeurs incorrectes
            if (minValue < min) minValue = min;
            if (maxValue > max) maxValue = max;
            if (minValue > maxValue) minValue = maxValue;

            slider.noUiSlider.set([minValue, maxValue]);

            // Rafraîchir la liste des produits
            let currentUrl = new URL(window.location.href);

            let selectedFilters = [];

            // Ajout des villes sélectionnées
            selectedFilters = Array.from(document.querySelectorAll('.form-check-input:checked'))
                .map(input => {
                    const searchUrl = input.getAttribute('data-search-url');
                    if (searchUrl) {
                        const searchParams = new URL(searchUrl).searchParams;
                        return searchParams.get('q');
                    }
                    return null;
                })
                .filter(f => f && !f.startsWith("price-"));

            // Ajout des valeurs du slider de prix (avec suppression des doublons)
            let startPrice = startInput.value || "";
            let endPrice = endInput.value || "";

            if (startPrice && endPrice) {
                let priceFilter = `Prix-%E2%82%AC-${startPrice}-${endPrice}`;
                selectedFilters = selectedFilters.filter(f => !f.startsWith("Price-%E2%82%AC-")); // Supprime les anciens filtres de prix
                selectedFilters.push(priceFilter);
            }

            // Génération de la nouvelle URL (avec un seul `q` et sans doublons)
            let combinedQuery = selectedFilters.length > 0 ? encodeURIComponent(selectedFilters.join('/')) : "";
            let otherParams = new URLSearchParams(currentUrl.search);
            otherParams.delete('q');
            if (selectedFilters.length > 0) {
                otherParams.set('q', combinedQuery);
            }

            otherParams.set('order', 'product.price.asc'); // Ordre par prix croissant

            currentUrl.search = otherParams.toString();
            console.log('Nouvelle URL :', currentUrl.toString());

            refreshProductList(currentUrl.toString());
        }
    });
});


        // Rafraîchir la liste des produits au changement du prix
        slider.noUiSlider.on("change", function () {
            let currentUrl = new URL(window.location.href);

            let selectedFilters = [];

            // Ajout des villes sélectionnées
            selectedFilters = Array.from(document.querySelectorAll('.form-check-input:checked'))
                .map(input => {
                    const searchUrl = input.getAttribute('data-search-url');
                    if (searchUrl) {
                        const searchParams = new URL(searchUrl).searchParams;
                        return searchParams.get('q');
                    }
                    return null;
                })
                .filter(f => f && !f.startsWith("price-"));

            // Ajout des valeurs du slider de prix (avec suppression des doublons)
            let startPrice = startInput.value || "";
            let endPrice = endInput.value || "";

            if (startPrice && endPrice) {
                let priceFilter = `Prix-%E2%82%AC-${startPrice}-${endPrice}`;
                selectedFilters = selectedFilters.filter(f => !f.startsWith("Price-%E2%82%AC-")); // Supprime les anciens filtres de prix
                selectedFilters.push(priceFilter);
            }

            // Génération de la nouvelle URL (avec un seul `q` et sans doublons)
            let combinedQuery = selectedFilters.length > 0 ? encodeURIComponent(selectedFilters.join('/')) : "";
            let otherParams = new URLSearchParams(currentUrl.search);
            otherParams.delete('q');
            if (selectedFilters.length > 0) {
                otherParams.set('q', combinedQuery);
            }

            otherParams.set('order', 'product.price.asc'); // Ordre par prix croissant

            currentUrl.search = otherParams.toString();
            console.log('Nouvelle URL :', currentUrl.toString());

            refreshProductList(currentUrl.toString());
        });
    });

    // Fonction pour extraire la catégorie du filtre
    function extractCategory(qValue) {
        const parts = qValue.split('-');
        return parts.length > 1 ? parts[0] : 'Autre';
    }

    function refreshProductList(url) {
        // Ajoute une classe de chargement pour la transition
        productListContainer.classList.add('loading');
    
        fetch(url, { method: 'GET' })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erreur lors du chargement des produits.');
                }
                return response.text();
            })
            .then(html => {
                const parser = new DOMParser();
                const doc = parser.parseFromString(html, 'text/html');
                const newProductList = doc.querySelector('#js-product-list');
    
                if (newProductList && newProductList.querySelector('section').textContent.trim() !== '') {
                    // Mettre à jour la liste des produits
                    productListContainer.innerHTML = newProductList.innerHTML;
    
                    // Retirer la classe de chargement pour afficher les nouveaux produits avec transition
                    setTimeout(() => {
                        productListContainer.classList.remove('loading');
                        console.log('Liste des produits mise à jour.');
                    }, 500); // Le délai doit correspondre à la durée de la transition
                } else {
                    console.log('Pas de produits trouvés.');
                }
            })
            .catch(error => {
                console.error('Erreur AJAX :', error);
                productListContainer.classList.remove('loading');
            });
    }
});


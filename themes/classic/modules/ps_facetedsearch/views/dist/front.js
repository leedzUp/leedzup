
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

    // Fonction pour extraire la catégorie du filtre
    function extractCategory(qValue) {
        const parts = qValue.split('-');
        return parts.length > 1 ? parts[0] : 'Autre';
    }

    // Fonction pour rafraîchir uniquement la liste des produits
    function refreshProductList(url) {
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
                    productListContainer.innerHTML = newProductList.innerHTML;
                    console.log('Liste des produits mise à jour.');
                } else {
                    console.log('Pas de produits trouvés.');
                }
            })
            .catch(error => console.error('Erreur AJAX :', error));
    }
});


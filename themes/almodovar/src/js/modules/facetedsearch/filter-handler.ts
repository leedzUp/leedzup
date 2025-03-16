/**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import { API } from 'nouislider';
import getQueryParameters from './urlparser';

export default function (values: Array<string | number>, slider: API) {
  const { prestashop, Theme: { events } } = window;

  // Récupération de l'URL encodée suivante
  const nextEncodedFacetsURL = slider.target.dataset.sliderEncodedUrl || '';

  // Séparation de l'URL et de ses paramètres
  const urlsSplitted = nextEncodedFacetsURL.split('?');

  // Récupération des paramètres existants
  let queryParams: { name: string; value: string }[] = urlsSplitted.length > 1 ? getQueryParameters(urlsSplitted[1]) : [];

  // Vérification de la présence du paramètre "q", ajout s'il est manquant
  let qParam = queryParams.find((query) => query.name === 'q');
  if (!qParam) {
    qParam = { name: 'q', value: '' };
    queryParams.push(qParam);
  }

  // Liste des filtres obligatoires avec valeurs par défaut
  const requiredFilters: Record<string, string> = {
    'Prix': '€-0-10000000',  // Valeur par défaut du prix
    'Surface': 'm²-0-1000',  // Valeur par défaut de la surface
    'Room': 'u-0-8',         // Valeur par défaut du nombre de pièces
  };

  // Extraction des filtres existants
  const existingFilters: Record<string, string> = {};
  if (qParam.value) {
    qParam.value.split('/').forEach((filter) => {
      const parts = filter.split('-');
      if (parts.length > 2) {
        existingFilters[parts[0]] = filter; // Stocke les filtres existants
      }
    });
  }

  // Assurer que les filtres obligatoires sont toujours présents
  Object.entries(requiredFilters).forEach(([label, defaultValue]) => {
    if (!existingFilters[label]) {
      existingFilters[label] = defaultValue;
    }
  });

  // Vérification et mise à jour du filtre actuel
  const sliderLabel = slider.target.dataset.sliderLabel;
  if (sliderLabel) {
    const newFilter = `${sliderLabel}-${slider.target.dataset.sliderUnit}-${values[0]}-${values[1]}`;
    existingFilters[sliderLabel] = newFilter;
  }

  // 🔥 Correction : Ne pas réécrire complètement qParam.value
  qParam.value = Object.keys(requiredFilters)
    .map(label => existingFilters[label] || requiredFilters[label]) // Garde les filtres existants ou met la valeur par défaut
    .join('/');

  // Construction de la nouvelle URL
  const newUrl = `${urlsSplitted[0]}?${new URLSearchParams(queryParams.map(({ name, value }) => [name, value])).toString()}`;

  prestashop.emit(events.updateFacets, newUrl);
}

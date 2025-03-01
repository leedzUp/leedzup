/**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import { API } from 'nouislider';
import getQueryParameters from './urlparser';

export default function (values: Array<string | number>, slider: API) {
  const { prestashop, Theme: { events } } = window;

  // Préparation des paramètres de requête
  let queryParams: { name: string; value: string }[] = [];

  // Récupération de l'URL encodée suivante
  const nextEncodedFacetsURL = slider.target.dataset.sliderEncodedUrl || '';

  // Séparation de l'URL et de ses paramètres
  const urlsSplitted = nextEncodedFacetsURL.split('?');

  // Récupération des paramètres s'ils existent
  if (urlsSplitted.length > 1) {
    queryParams = getQueryParameters(urlsSplitted[1]);
  }

  // Vérification de la présence du paramètre "q", ajout s'il est manquant
  if (!queryParams.some((query) => query.name === 'q')) {
    queryParams.push({ name: 'q', value: '' });
  }

  // Mise à jour du paramètre "q"
  queryParams = queryParams.map((query) => {
    if (query.name === 'q') {
      return {
        ...query,
        value: [
          query.value.length > 0 ? '/' : '',
          slider.target.dataset.sliderLabel,
          '-',
          slider.target.dataset.sliderUnit,
          '-',
          values[0],
          '-',
          values[1],
        ].join(''),
      };
    }
    return query;
  });

  // Construction de la nouvelle URL
  const newUrl = `${urlsSplitted[0]}?${new URLSearchParams(queryParams.map(({ name, value }) => [name, value])).toString()}`;

  prestashop.emit(events.updateFacets, newUrl);
}

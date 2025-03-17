/**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import noUiSlider, {target, API} from 'nouislider';
import wNumb from 'wnumb';
import initFacets from './update';
import filterHandler from './filter-handler';

// eslint-disable-next-line import/prefer-default-export
export const initSliders = () => {
  const {Theme} = window;

  // Get all slider configurations found in the DOM
  document.querySelectorAll(Theme.selectors.facetedsearch.filterSlider).forEach((filter: HTMLElement) => {
    const container = <target>filter.querySelector(Theme.selectors.facetedsearch.rangeContainer);

    // Init basic slider data
    let unitPosition = 'suffix';
    let unitSymbol = container.dataset.sliderUnit;
    let decimalCount = 0;
    let decimalSeparator = '.';
    let thousandsSeparator = ' ';

    // Specify further if there are more options, currently used for price slider,
    // which is the only one providing price specifications.
    const options = JSON.parse(<string>container.dataset.sliderSpecifications);

    if (options !== null) {
      // Sign position
      if (options.positivePattern !== undefined && options.positivePattern.indexOf('¤') === 0) {
        unitPosition = 'prefix';
      }

      // Unit
      if (options.currencySymbol !== undefined) {
        unitSymbol = options.currencySymbol;
      }

      // Separators
      if (options.numberSymbols !== undefined) {
        decimalSeparator = options.numberSymbols[0];
        thousandsSeparator = ' ';
      }

      // Decimals
      if (options.minFractionDigits !== undefined) {
        decimalCount = options.minFractionDigits;
      }
    }

    // Minimum and maximum values
    const min = parseInt(<string>container.dataset.sliderMin ?? "0", 10) || 0;
    const max = parseInt(<string>container.dataset.sliderMax ?? "1000000", 10) || 1000000;

    const originalMin = min;
    const originalMax = max;

    // const sliderType = container.dataset.sliderSpecifications ? 'price' : 'weight';
    const sliderDirection = container.dataset.sliderDirection === '1' ? 'rtl' : 'ltr';

    // let format;
    let initiatedSlider: API;

    // Initialize tooltip format
    const tooltipsFormat = wNumb({
      thousand: thousandsSeparator,
      decimals: 0, // Force l'affichage sans décimales
      [unitPosition]: unitPosition === 'prefix' ? unitSymbol : ` ${unitSymbol}`,
    });

    const rawValues = container.dataset.sliderValues ? JSON.parse(container.dataset.sliderValues) : [];
    const sliderValues = (Array.isArray(rawValues) && rawValues.length === 2)
    ? [
        Math.max(min, Math.round(Number(rawValues[0]))),
        Math.min(max, Math.round(Number(rawValues[1]))),
      ]
    : [min, max];

    const inputStart = document.getElementById(`slider-range_${container.dataset.sliderId}-start`) as HTMLInputElement;
    const inputEnd = document.getElementById(`slider-range_${container.dataset.sliderId}-end`) as HTMLInputElement;
    
    if (!container.noUiSlider) {
      // if we initiate slider with noUiBase he create another one we have to delete it before.
      const noUiBase = container.querySelector('.noUi-base');

      if (noUiBase) {
        noUiBase.remove();
      }
      initiatedSlider = noUiSlider.create(container, {
        start: sliderValues.length === 2 ? sliderValues : [min, max],
        tooltips: [tooltipsFormat, tooltipsFormat],
        direction: sliderDirection,
        connect: [false, true, false],
        range: {
          min: Math.floor(min), 
          max: Math.ceil(max),
        },
        format: wNumb({ 
          decimals: 0 
        }) // Ajouté pour forcer l'affichage sans décimales
      });

      // Remove tooltips:
      initiatedSlider.removeTooltips();

     

      initiatedSlider.on('change', (values, handle, unencoded, tap, positions, instance) => {
        filterHandler(values, instance);
      });

      [inputStart, inputEnd].forEach((input, index) => {
        if (input) {
          input.addEventListener('keypress', (event) => {
            if (event.key === 'Enter') {
              // Supprime les espaces avant la conversion
              let valStart = parseInt(inputStart.value.replace(/\s/g, ''), 10) || min;
              let valEnd = parseInt(inputEnd.value.replace(/\s/g, ''), 10) || max;
      
              if (valStart < min) valStart = min;
              if (valEnd > max) valEnd = max;
              if (valStart > valEnd) {
                let temp = valStart;
                valStart = valEnd;
                valEnd = temp;
              }      
              // Vérifie que le slider existe avant d'appliquer la mise à jour
              if (initiatedSlider) {
                initiatedSlider.set([valStart, valEnd]);
              }
            }
          });
        }
      });
      

      

      initiatedSlider.on('update', (values) => {

        if (inputStart && inputEnd) {
          inputStart.value = wNumb({ thousand: ' ', decimals: 0 }).to(Number(values[0]));
          inputEnd.value = wNumb({ thousand: ' ', decimals: 0 }).to(Number(values[1]));
        }
        const formattedValues: string[] = values.map((value) => {
          const numValue = typeof value === 'string' ? parseFloat(value) : value;
          return unitPosition === 'suffix'
            ? `${wNumb({ thousand: ' ', decimals: 0 }).to(numValue)}${unitSymbol}`
            : `${unitSymbol}${wNumb({ thousand: ' ', decimals: 0 }).to(numValue)}`;
        });

        const parentFacet = initiatedSlider.target.closest(Theme.selectors.facetedsearch.filterSlider) as HTMLElement;
        const showValues = parentFacet.querySelector(Theme.selectors.facetedsearch.rangeValues) as HTMLElement;
        showValues.innerHTML = formattedValues.join(' - ');
      });
    } else {
      container.noUiSlider.set(sliderValues);


      // Remove tooltips:
      container.noUiSlider.removeTooltips();

      container.noUiSlider.on('set', (values, handle, unencoded, tap, positions, instance) => {
        filterHandler(values, instance);
      });

      container.noUiSlider.on('update', (values) => {
        const formattedValues: string[] = values.map((value) => (
          unitPosition === 'suffix' ? `${value}${unitSymbol}` : `${unitSymbol}${value}`),
        );

        const parentFacet = initiatedSlider.target.closest(Theme.selectors.facetedsearch.filterSlider) as HTMLElement;
        const showValues = parentFacet.querySelector(Theme.selectors.facetedsearch.rangeValues) as HTMLElement;
        showValues.innerHTML = formattedValues.join(' - ');
      });
    }
  });
};

const toggleLoader = (toggle: boolean) => {
  const {Theme} = window;
  const loader = document.querySelector(Theme.selectors.pageLoader);

  if (loader) {
    loader.classList.toggle('d-none', toggle);
  }
};

document.addEventListener('DOMContentLoaded', () => {
  const {prestashop, Theme: {events}} = window;
  initFacets();
  prestashop.on(events.updateProductList, () => {
    toggleLoader(true);
    initSliders();
  });

  initSliders();

  prestashop.on(events.updateFacets, () => {
    toggleLoader(false);
  });
});

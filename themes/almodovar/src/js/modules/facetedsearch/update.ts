/**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import useQuantityInput, { populateMinQuantityInput } from '@js/components/useQuantityInput';

// @TODO(NeOMakinG): Refactor this file, it comes from facetedsearch or classic
export const parseSearchUrl = function (event: { target: HTMLElement }) {
  const target = event.target as HTMLElement;
  if (target.dataset.searchUrl !== undefined) {
    return target.dataset.searchUrl;
  }

  const parent = target.parentElement;
  if (!parent || parent.dataset.searchUrl === undefined) {
    throw new Error('Cannot parse search URL');
  }

  return parent.dataset.searchUrl;
};

export function updateProductListDOM(data: Record<string, never>) {
  const { Theme } = window;

  document.querySelector(Theme.selectors.listing.searchFilters)?.replaceWith(
    new DOMParser().parseFromString(data.rendered_facets, 'text/html').body.firstChild!,
  );

  document.querySelector(Theme.selectors.listing.activeSearchFilters)?.replaceWith(
    new DOMParser().parseFromString(data.rendered_active_filters, 'text/html').body.firstChild!,
  );

  document.querySelector(Theme.selectors.listing.listTop)?.replaceWith(
    new DOMParser().parseFromString(data.rendered_products_top, 'text/html').body.firstChild!,
  );

  const renderedProducts = new DOMParser().parseFromString(data.rendered_products, 'text/html').body;
  const productSelectors = renderedProducts.querySelectorAll(Theme.selectors.listing.product);
  const firstProduct = document.querySelector(Theme.selectors.listing.product);

  if (productSelectors.length > 0 && firstProduct) {
    const firstProductClasses = firstProduct.getAttribute('class');
    productSelectors.forEach((product) => {
      product.setAttribute('class', firstProductClasses || '');
    });
  }

  document.querySelector(Theme.selectors.listing.list)?.replaceWith(renderedProducts.firstChild!);

  document.querySelector(Theme.selectors.listing.listBottom)?.replaceWith(
    new DOMParser().parseFromString(data.rendered_products_bottom, 'text/html').body.firstChild!,
  );

  if (data.rendered_products_header) {
    document.querySelector(Theme.selectors.listing.listHeader)?.replaceWith(
      new DOMParser().parseFromString(data.rendered_products_header, 'text/html').body.firstChild!,
    );
  }
}

export default () => {
  const { prestashop, Theme } = window;
  const { events } = Theme;

  document.body.addEventListener('change', (event) => {
    const target = event.target as HTMLElement;
    if (target.matches(`${Theme.selectors.listing.searchFilters} input[data-search-url]`)) {
      prestashop.emit(events.updateFacets, parseSearchUrl({ target }));
    }
  });

  document.body.addEventListener('click', (event) => {
    const target = event.target as HTMLElement;

    if (target.matches(Theme.selectors.listing.searchFiltersClearAll)) {
      prestashop.emit(events.updateFacets, parseSearchUrl({ target }));
    }

    if (target.matches(Theme.selectors.listing.searchLink)) {
      event.preventDefault();
      const link = target.closest('a');
      if (link) {
        prestashop.emit(events.updateFacets, link.getAttribute('href'));
      }
    }

    if (target.matches(Theme.selectors.listing.pagerLink)) {
      event.preventDefault();
      document.querySelector(Theme.selectors.listing.listTop)?.scrollIntoView({ block: 'start', behavior: 'auto' });
      const link = target.closest('a');
      if (link) {
        prestashop.emit(events.updateFacets, link.getAttribute('href'));
      }
    }
  });

  if (document.querySelector(Theme.selectors.listing.list)) {
    window.addEventListener('popstate', (e) => {
      const { state } = e;
      window.location.href = state && state.current_url ? state.current_url : history.state;
    });
  }

  document.body.addEventListener('change', (event) => {
    const target = event.target as HTMLSelectElement;
    if (target.matches(`${Theme.selectors.listing.searchFilters} select`)) {
      const form = target.closest('form');
      if (form) {
        const formData = new URLSearchParams(new FormData(form) as any).toString();
        prestashop.emit(events.updateFacets, `?${formData}`);
      }
    }
  });

  prestashop.on(events.updateProductList, (data: Record<string, never>) => {
    updateProductListDOM(data);
    useQuantityInput();
    populateMinQuantityInput();
  });
};

/**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import { Modal } from 'bootstrap'; // ✅ Import explicite de Bootstrap Modal
import selectorsMap from './constants/selectors-map';

export default function initQuickviews() {
  const { prestashop, Theme: { events } } = window;

  prestashop.on(events.clickQuickview, (elm: HTMLElement) => {
    const data = {
      action: 'quickview',
      id_product: elm.dataset.idProduct,
      id_product_attribute: elm.dataset.idProductAttribute,
    };

    fetch(prestashop.urls.pages.product, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),
    })
      .then(response => response.json())
      .then((resp) => {
        document.body.insertAdjacentHTML('beforeend', resp.quickview_html);
        
        const productModal = document.getElementById(
          `quickview-modal-${resp.product.id}-${resp.product.id_product_attribute}`
        ) as HTMLElement | null;

        if (productModal) {
          const modalInstance = new Modal(productModal); // ✅ Utilisation correcte de Bootstrap Modal
          modalInstance.show();

          productModal.addEventListener('hidden.bs.modal', () => {
            productModal.remove();
          });

          prestashop.emit(events.quickviewOpened);
        }
      })
      .catch((resp) => {
        prestashop.emit(events.handleError, {
          eventType: 'clickQuickView',
          resp,
        });
      });
  });

  document.addEventListener('DOMContentLoaded', () => {
    document.body.addEventListener('click', (event) => {
      const target = event.target as HTMLElement;
      const productMiniature = target.closest(selectorsMap.product.miniature) as HTMLElement | null;

      if (productMiniature) {
        prestashop.emit(events.clickQuickview, {
          dataset: productMiniature.dataset, // ✅ `dataset` reconnu sur `HTMLElement`
        });
      }
      event.preventDefault();
    });

    prestashop.on('updateCart', () => {
      document.querySelectorAll(selectorsMap.quickviewModal).forEach((modal) => {
        const modalElement = modal as HTMLElement;
        const modalInstance = Modal.getInstance(modalElement); // ✅ Utilisation correcte de Bootstrap Modal

        if (modalInstance) {
          modalInstance.hide();
        }
      });
    });
  });
}

import prestashop from 'prestashop';

document.addEventListener('DOMContentLoaded', () => {
  document.body.addEventListener('click', (event) => {
    const quickviewSelector = prestashop.selectors.listing.quickview;
    const productMiniatureSelector = prestashop.selectors.product.miniature;

    if (event.target.closest(quickviewSelector)) {
      const productElement = event.target.closest(productMiniatureSelector);
      if (productElement) {
        prestashop.emit('clickQuickView', {
          dataset: productElement.dataset,
        });
      }
      event.preventDefault();
    }
  });
});

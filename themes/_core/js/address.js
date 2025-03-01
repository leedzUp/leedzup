import prestashop from 'prestashop';

/**
 * Update address form on country change
 * Emit "addressFormUpdated" event
 *
 * @param selectors
 */
function handleCountryChange(selectors) {
  document.body.addEventListener('change', (event) => {
    if (!event.target.matches(selectors.country)) return;

    const countryElement = document.querySelector(selectors.country);
    const addressForm = document.querySelector(`${selectors.address} form`);

    if (!countryElement || !addressForm) return;

    const requestData = {
      id_country: countryElement.value,
      id_address: addressForm.dataset.idAddress,
    };

    const getFormViewUrl = addressForm.dataset.refreshUrl;
    const formFieldsSelector = `${selectors.address} input`;
    const inputs = {};

    // Store field values before updating form
    document.querySelectorAll(formFieldsSelector).forEach((input) => {
      inputs[input.name] = input.value;
    });

    // Fetch updated form via AJAX
    fetch(getFormViewUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams(requestData),
    })
      .then((response) => response.json())
      .then((resp) => {
        const addressContainer = document.querySelector(selectors.address);
        if (addressContainer) {
          addressContainer.innerHTML = resp.address_form;

          // Restore field values
          document.querySelectorAll(formFieldsSelector).forEach((input) => {
            if (inputs[input.name] !== undefined) {
              input.value = inputs[input.name];
            }
          });

          prestashop.emit('updatedAddressForm', {
            target: addressContainer,
            resp,
          });
        }
      })
      .catch((error) => {
        console.error('Error updating address form:', error);
        prestashop.emit('handleError', {
          eventType: 'updateAddressForm',
          error,
        });
      });
  });
}

// Equivalent de $(document).ready()
document.addEventListener('DOMContentLoaded', () => {
  handleCountryChange({
    country: '.js-country',
    address: '.js-address-form',
  });
});

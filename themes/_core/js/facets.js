import prestashop from 'prestashop';

let currentRequest = null;

function updateResults(data) {
  prestashop.emit('updateProductList', data);
  window.history.pushState(data, document.title, data.current_url);
}

function handleError(error) {
  if (error.name === 'AbortError') {
    return false;
  }
  console.error('Error fetching data:', error);
  return true;
}

function makeQuery(url) {
  if (currentRequest) {
    currentRequest.abort();
  }

  const separator = url.includes('?') ? '&' : '?';
  const slightlyDifferentURL = `${url + separator}from-xhr`;

  const controller = new AbortController();
  currentRequest = controller;
  
  fetch(slightlyDifferentURL, {
    method: 'GET',
    headers: {
      'Accept': 'application/json',
    },
    signal: controller.signal,
  })
    .then(response => response.json())
    .then(updateResults)
    .catch(handleError)
    .finally(() => {
      if (currentRequest === controller) {
        currentRequest = null;
      }
    });
}

// Équivalent de $(document).ready()
document.addEventListener('DOMContentLoaded', () => {
  prestashop.on('updateFacets', (param) => {
    makeQuery(param);
  });
});

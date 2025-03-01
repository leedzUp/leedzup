import punycode from 'punycode';

const initEmailFields = function (selector) {
  const emailFields = document.querySelectorAll(selector);

  emailFields.forEach(field => {
    if (!field.checkValidity()) {
      const parts = field.value.split('@');

      if (punycode.toASCII(parts[0]) === parts[0]) {
        field.value = punycode.toASCII(field.value);
      }
    }
  });
};

export default initEmailFields;

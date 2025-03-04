<!-- Product List wishlist Button -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var wishlistButtons = document.querySelectorAll('.productlist-wish');

        wishlistButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                var id_customer = "{$id_customer}";
                var id_product = this.dataset.idProduct;
                var action = this.dataset.action;

                var xhr = new XMLHttpRequest();
                xhr.open('POST', '/modules/cafe_wishlist/ajax/submit.php', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4) {
                        console.log('XHR Status:', xhr.status);
                        console.log('XHR Response:', xhr.responseText);

                        if (xhr.status === 200) {
                            var response = JSON.parse(xhr.responseText);
                            var alertMessage = document.getElementById('wishMessage-' +
                                id_product);

                            if (response.status === 'success1') {
                                console.log('Adding to wishlist success');
                                alertMessage.style.opacity = '1';
                                alertMessage.innerHTML =
                                    '<span class="absolute alert wish-alert text-green-500">Dans ma wishlist !</span>';
                                setTimeout(function() {
                                    alertMessage.style.opacity = '0';
                                }, 3000);

                                var heartPath = document.getElementById('svg-' +
                                id_product);

                                if (heartPath) {
                                    heartPath.setAttribute('fill', 'currentColor');
                                }
                                button.dataset.action = 'removeWishlist';

                            } else if (response.status === 'success2') {
                                console.log('Removing from wishlist success');
                                alertMessage.style.opacity = '1';
                                alertMessage.innerHTML =
                                    '<span class="absolute wish-alert alert text-red-500" role="alert">Retiré de la wishlist !</span>';
                                setTimeout(function() {
                                    alertMessage.style.opacity = '0';
                                }, 3000);

                                var heartPath2 = document.getElementById('svg-' +
                                    id_product);

                                console.log(heartPath2);

                                if (heartPath2) {
                                    heartPath2.setAttribute('fill', 'none');
                                }
                                button.dataset.action = 'addWishlist';
                                var productElement = document.getElementById('id-' +
                                    id_product);
                                if (productElement) {
                                    productElement.remove();
                                }

                            } else if (response.status === 'error') {
                           
                                // set the modal menu element
                                const authenticationModal = document.getElementById(
                                    'authentication-modal');

                                // options with default values
                                const options = {
                                    backdrop: 'dynamic',
                                    backdropClasses: 'bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40',
                                    closable: true,
                                    onHide: () => {
                                        console.log('modal is hidden');
                                    },
                                    onShow: () => {
                                        console.log('modal is shown');
                                    },
                                    onToggle: () => {
                                        console.log('modal has been toggled');
                                    },
                                };

                                // instance options object
                                const instanceOptions = {
                                    id: 'modalEl',
                                    override: true
                                };


                                /*
                                * $targetEl: required
                                * options: optional
                                */
                                const modal = new Modal(authenticationModal, options, instanceOptions);
                                modal.show();

                            }
                        }
                    }
                };

                var data = 'id_customer=' + id_customer + '&id_product=' + id_product +
                    '&action=' + action;
                xhr.send(data);
            });
        });
    });
</script>
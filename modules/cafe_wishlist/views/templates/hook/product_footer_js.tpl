{if !$isCustomerLoggedIn and !$id_customer}

    <script>
        $(document).ready(function() {
            $('button[name="submitWishlist"]').on('click', function(event) {
                event.preventDefault(); // Empêche la soumission normale du formulaire
                var productId = $(this).data('id-product');
                $('input[name="modalProductId"]').val(productId); // Set the productId value in the modal
                $('#loginModalWishProduct').modal('show');
            });

            $('button[name="urlWishlist"]').on('click', function(event) {
                event.preventDefault();
                $('#loginModalWish').modal('show');
                $('#wish-login').attr('data-action', 'goto-wishlist');

            });


           // When the button with the ID 'showRegisterForm' is clicked
           $('#showRegisterForm').on('click', function(event) {
                    event.preventDefault();

                    // Toggle the visibility of the #registerFormContent div
                    $('#registerFormContent').toggle();

                    // Show the modal
                    $('#loginModalWish').modal('show');

                    $('#login-form-wishlist').hide(); 

        
                });
                $('#showLoginForm').on('click', function(event) {
                    event.preventDefault();
                    $('#registerFormContent').toggle();
                    $('#login-form-wishlist').show(); 
                    
        
                });

            $('#wish-register').on('click', function() {
                // Get the values of email and password input fields

                var lastname = $('input[name="register-lastname-wishlist"]').val();
                var firstname = $('input[name="register-firstname-wishlist"]').val();

                var email = $('input[name="register-email-wishlist"]').val();
                var password = $('input[name="register-password-wishlist"]').val();
                var productId = $('input[name="modalProductId"]').val();
                var termsCheckbox = $('#termsCheckbox').prop('checked');
                var newsletterCheckbox = $('#newsletterCheckbox').prop('checked');

                // AJAX request to handle the login action
                $.ajax({
                    type: 'POST',
                    url: "/modules/cafe_wishlist/ajax/register.php",
                    data: {
                        lastname: lastname,
                        firstname: firstname,
                        email: email,
                        password: password,
                        id_product: productId,
                        termsCheckbox: termsCheckbox,
                        newsletterCheckbox: newsletterCheckbox,
                    },
                    dataType: 'json',
                    success: function(response) {
                        // Handle the response here
                        console.log(
                            response); // Check the response object in the browser console

                        var alertMessageModal = $('#wishMessageModal');
                        var alertMessage = $('#alertMsg');

                        if (response.status === 'success3') {

                        alertMessage.text(' Dans ma wishlist !');
                        $("#alertMsg").css("display", "inline-block");;

                            // Perform actions for a successful login, e.g., refresh the page
                            $('#prod-wish-' + response.id_product + ' i').removeClass(
                                'material-icons-outlined').addClass('material-icons').html(
                                'favorite');
                            $('#prod-wish-' + response.id_product).data('action',
                                'removeWishlist'); // Update the data-action attribute
                            $('#loginModalWishProduct').modal('hide');
                            $('#loginModalWishProduct').hide();

                            $('.modal-backdrop').hide();
                            $('#loginModalWishProduct').remove();
                            $('body').removeClass('modal-open');


                            var button = $('#wishlistBtn');
                            // Get the content (i.e., the icon) of the button
                            var icon = button.html();

                            var url = "/module/cafe_wishlist/display?id_customer=" + response
                                .id_customer;

                            // Create the anchor element with the icon and set its href attribute to the desired URL
                            var anchor = $('<a></a>', {
                                href: url,
                                class: 'btn',
                                style: 'background: transparent; padding: 0;'
                            }).html(icon);
                            // Replace the button with the newly created anchor element
                            button.replaceWith(anchor);


                        } else if (response.status === 'success4') {
                            
                            alertMessage.text(' Retiré de la wishlist !');
                            $("#alertMsg").css("display", "inline-block");;

                            // Perform actions for a successful login, e.g., refresh the page
                            $('#prod-wish-' + response.id_product + ' i').removeClass(
                                'material-icons-outlined').addClass('material-icons').html(
                                'favorite');
                            $('#prod-wish-' + response.id_product).data('action',
                                'removeWishlist'); // Update the data-action attribute
                            $('#loginModalWishProduct').modal('hide');
                            $('#loginModalWishProduct').hide();
                            $('.modal-backdrop').hide();
                            $('#loginModalWishProduct').remove();
                            $('body').removeClass('modal-open');
                            var button = $('#wishlistBtn');
                            // Get the content (i.e., the icon) of the button
                            var icon = button.html();
                            var url = "/module/cafe_wishlist/display?id_customer=" + response
                                .id_customer;
                            // Create the anchor element with the icon and set its href attribute to the desired URL
                            var anchor = $('<a></a>', {
                                href: url,
                                class: 'btn',
                                style: 'background: transparent; padding: 0;'
                            }).html(icon);
                            // Replace the button with the newly created anchor element
                            button.replaceWith(anchor);

                        } else if (response.status === 'error') {
                            alertMessageModal.text(response.error);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        // Handle errors here
                        console.log('AJAX Error: ' + textStatus);
                        console.log('Error Thrown: ' + errorThrown);
                    }
                });

            });

            $('#wish-login').on('click', function() {

                var email = $('input[name="email-wishlist"]').val();
                var password = $('input[name="password-wishlist"]').val();
                var productId = $('input[name="modalProductId"]').val();
                var action = $(this).data('action');

                $.ajax({
                    type: 'POST',
                    url: "/modules/cafe_wishlist/ajax/login.php",
                    data: {
                        email: email,
                        password: password,
                        id_product: productId,
                        action: action
                    },
                    dataType: 'json',
                    success: function(response) {

                        var alertMessageModalSignIn = $('#wishMessageModalSignIn');

                        var alertMessage = $('#alertMsg');


                        if (response.status === 'success3') {

                            alertMessage.text(' Dans ma wishlist !');
                            $("#alertMsg").css("display", "inline-block");;


                            $('#prod-wish-' + response.id_product + ' i').removeClass(
                                'material-icons-outlined').addClass('material-icons').html(
                                'favorite');
                            $('#prod-wish-' + response.id_product).data('action', 'removeWishlist');
                            $('#loginModalWishProduct').modal('hide');
                            $('#loginModalWishProduct').hide();
                            $('.modal-backdrop').hide();
                            $('#loginModalWishProduct').remove();
                            $('body').removeClass('modal-open');

                            var button = $('#wishlistBtn');
                            var icon = button.html();
                            var url = "/module/cafe_wishlist/display?id_customer=" + response
                                .id_customer;
                            var anchor = $('<a></a>', {
                                href: url,
                                class: 'btn',
                                style: 'background: transparent; padding: 0;'
                            }).html(icon);
                            button.replaceWith(anchor);


                        } else if (response.status === 'success4') {

                            alertMessage.text(' Retiré de la wishlist !');
                            $("#alertMsg").css("display", "inline-block");;

                            $('#prod-wish-' + response.id_product + ' i').removeClass(
                                'material-icons-outlined').addClass('material-icons').html(
                                'favorite');
                            $('#prod-wish-' + response.id_product).data('action', 'removeWishlist');
                            $('#loginModalWishProduct').modal('hide');
                            $('#loginModalWishProduct').hide();
                            $('.modal-backdrop').hide();
                            $('body').removeClass('modal-open');

                        } else if (response.status === 'goto-wishlist') {

                            $('#loginModalWish').modal('hide');
                            $('#loginModalWish').hide();
                            $('.modal-backdrop').hide();
                            $('#loginModalWish').remove();
                            $('body').removeClass('modal-open');

                            window.location.href =
                                '/module/cafe_wishlist/display?id_customer=' + response
                                .id_customer;




                        } else if (response.status === 'error') {

                            alertMessageModalSignIn.html(
                                '<div class="mb-2 mt-1 alert alert-danger" role="alert">' +
                                response.error + '</div>'
                            );
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        // Handle errors here
                        console.log('AJAX Error: ' + textStatus);
                        console.log('Error Thrown: ' + errorThrown);
                    }
                });
            });

            $('.btn').click(function() {
                const button = $(this);
                const action = button.data('action');
                const icon = button.find('i');

                if (action === 'show-password') {
                    // Toggle visibility icon
                    const currentIcon = icon.text();
                    const showIcon = 'visibility_off';
                    const hideIcon = 'visibility';

                    if (currentIcon === showIcon) {
                        icon.text(hideIcon);
                    } else {
                        icon.text(showIcon);
                    }

                    // Toggle password visibility (Implement your logic here)
                    togglePasswordVisibility();
                }
            });
        });



        function togglePasswordVisibility() {
            // Implement your logic to toggle password visibility
            // For example, you can use jQuery to add/remove "password" attribute on input fields.
            const passwordInput = $('#password-input');
            if (passwordInput.attr('type') === 'password') {
                passwordInput.attr('type', 'text');
            } else {
                passwordInput.attr('type', 'password');
            }
        }
    </script>
{/if}

<script>
    $(document).ready(function() {
                $('.productlist-wish').on('click', function() {
                    var id_customer = "{$id_customer}";
                    var id_product = $(this).data('id-product')
                    var action = $(this).data('action');

                    $.ajax({
                        type: 'POST',
                        url: "/modules/cafe_wishlist/ajax/submit.php",
                        data: {
                            id_customer: id_customer,
                            id_product: id_product,
                            action: action
                        },
                        dataType: 'json',
                        success: function(response) {

                        var alertMessage = $('#wishMessage-' + response.id_product);

                            if (response.status === 'success1') {

                            alertMessage.text(' Dans ma wishlist !');

                            setTimeout(function() {
                                alertMessage.css('opacity', '0');
                            }, 3000);
                            
                                $('#wish-' + response.id_product + ' i').removeClass(
                                    'material-icons').addClass('material-icons').html(
                                    'favorite');
                                $('#wish-' + response.id_product).data('action',
                                    'removeWishlist'); // Update the data-action attribute


                            } else if (response.status === 'success2') {

                                
                                alertMessage.text(' Retiré de la wishlist !');
                                setTimeout(function() {
                                alertMessage.css('opacity', '0');
                            }, 3000);

                                $('#wish-' + response.id_product + ' i').removeClass(
                                    'material-icons-outlined').addClass('material-icons').html(
                                    'favorite_border');
                                $('#wish-' + response.id_product).data('action',
                                    'addWishlist'); // Update the data-action attribute
                                $('#id-' + response.id_product).remove();

                            } else if (response.status === 'error') {
                                alertMessage.html(
                                    '<span class="alert wish-alert" role="alert">Veuillez vous connecter pour ajouter ce produit à votre wishlist !</span>'
                                );
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            // Handle errors here
                            console.log('AJAX Error: ' + textStatus);
                            console.log('Error Thrown: ' + errorThrown);
                        }
                    });
                });
                });
</script>
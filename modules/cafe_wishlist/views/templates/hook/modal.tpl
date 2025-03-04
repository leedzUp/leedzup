{if !$isCustomerLoggedIn}
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var submitWishlistButtons = document.querySelectorAll('button[name="submitWishlist"]');
        var urlWishlistButton = document.querySelector('button[name="urlWishlist"]');
        
        submitWishlistButtons.forEach(function(button) {
            button.addEventListener('click', function(event) {
                event.preventDefault();
                var productId = this.dataset.idProduct;
                document.querySelector('input[name="modalProductId"]').value = productId;
                document.getElementById('authentication-modal').modal('show');
            });
        });

        urlWishlistButton.addEventListener('click', function(event) {
            event.preventDefault();
            document.getElementById('authentication-modal').modal('show');
            document.getElementById('wish-login').setAttribute('data-action', 'goto-wishlist');
        });
    });
</script>
    <!-- Modal -->


<!-- Main modal -->
<div id="authentication-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
<div class="relative p-4 w-full max-w-md max-h-full">
    <!-- Modal content -->
    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
        <!-- Modal header -->
        <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
            <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                Sign in to our platform
            </h3>
            <button type="button" class="end-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="authentication-modal">
                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                </svg>
                <span class="sr-only">Close modal</span>
            </button>
        </div>
        <!-- Modal body -->
        <div class="p-4 md:p-5">
            <form class="space-y-4" action="#">
                <div>
                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
                    <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="name@company.com" required>
                </div>
                <div>
                    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your password</label>
                    <input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required>
                </div>
                <div class="flex justify-between">
                    <div class="flex items-start">
                        <div class="flex items-center h-5">
                            <input id="remember" type="checkbox" value="" class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-600 dark:border-gray-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800" required>
                        </div>
                        <label for="remember" class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Remember me</label>
                    </div>
                    <a href="#" class="text-sm text-blue-700 hover:underline dark:text-blue-500">Lost Password?</a>
                </div>
                <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Login to your account</button>
                <div class="text-sm font-medium text-gray-500 dark:text-gray-300">
                    Not registered? <a href="#" class="text-blue-700 hover:underline dark:text-blue-500">Create account</a>
                </div>
            </form>
        </div>
    </div>
</div>
</div> 
{*
    <div class="modal fade" id="loginModalWishProduct" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="loginModalLabel">Vous devez vous connecter !</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {block name='login_form'}

                        <div>

                            <div class="form-group row ">
                                <label class="col-md-3 form-control-label required" for="field-email">
                                    E-mail
                                </label>
                                <div class="col-md-8">
                                    <input class="form-control" name="email-wishlist" type="email" value="" required="">
                                </div>

                                <input type="hidden" name="modalProductId" value="">


                            </div>
                            <!-- end _partials/form-fields.tpl -->
                            <!-- begin _partials/form-fields.tpl -->
                            <div class="form-group row ">
                                <label class="col-md-3 form-control-label required" for="field-password">
                                    Mot de passe
                                </label>
                                <div class="col-md-6">
                                    <div class="input-group js-parent-focus">
                                        <input class="form-control js-child-focus js-visible-password" name="password-wishlist"
                                            title="Au moins 5 caractères"
                                            aria-label="Saisie d'un mot de passe d'au moins 5 caractères" type="password"
                                            autocomplete="current-password" value="" required="">
                                        <span class="input-group-btn">
                                            <button class="btn" type="button" data-action="show-password"
                                                data-text-show="Montrer" data-text-hide="Cacher">
                                                Montrer
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>


                            <!-- end _partials/form-fields.tpl -->


                            <div class="mt-2 mb-2  text-center forgot-password">
                                <small>
                                    <a href="{$urls.pages.password}" rel="nofollow">
                                        {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
                                    </a>
                                </small>
                            </div>
                        </div>

                        {block name='login_form_footer'}
                            <footer class="form-footer text-sm-center clearfix text-right">
                                <input type="hidden" name="submitLogin" value="1">
                                {block name='form_buttons'}
                                    <button id="wish-login" name="submit-cafelogin" class="boutonstyle" data-action="sign-in"
                                        type="submit" class="form-control-submit">
                                        {l s='Sign in' d='Shop.Theme.Actions'}
                                    </button>
                                {/block}

                                <div class="mt-2 no-account"> <a href="/connexion?create_account=1"
                                        data-link-action="display-register-form"> Pas encore inscrit ? <span>Créez votre
                                            compte</span> </a></div>
                            </footer>
                        {/block}

                        <input type="hidden" name="submitLogin" value="1">
                        <input type="hidden" class="hidden" name="back" value="{$urls.current_url|escape:'htmlall':'UTF-8'}" />

                    {/block}
                </div>
            </div>
        </div>
    </div>

*}
{*}
    <script>
        $(document).ready(function() {

            $('#wish-login').on('click', function() {
                // Get the values of email and password input fields
                var email = $('input[name="email-wishlist"]').val();
                var password = $('input[name="password-wishlist"]').val();
                var productId = $('input[name="modalProductId"]').val();
                var action = $(this).data('action');

                // AJAX request to handle the login action
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
                        // Handle the response here
                        console.log(
                            response); // Check the response object in the browser console

                        console.log('success-3 modal');

                        var alertMessage = $('#wishMessage-' + response.id_product);

                        if (response.status === 'success3') {
                            alertMessage.css('opacity', '1');

                            alertMessage.html(
                                '<span  style="top: -15px;left: -45px;position: relative;" class="alert">Ajouté à la wishlist !</span>'
                            );

                            setTimeout(function() {
                                alertMessage.css('opacity', '0');
                            }, 3000);

                            // Perform actions for a successful login, e.g., refresh the page
                            $('#wish-' + response.id_product + ' i').removeClass(
                                'material-icons-outlined').addClass('material-icons').html(
                                'favorite');
                            $('#wish-' + response.id_product).data('action',
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
                            alertMessage.css('opacity', '1');

                            alertMessage.html(
                                '<span  style="top: -15px;left: -45px;position: relative;"  class="alert" role="alert">Retiré de la wishlist !</span>'
                            );
                            setTimeout(function() {
                                alertMessage.css('opacity', '0');
                            }, 3000);
                            $('#wish-' + response.id_product + ' i').removeClass(
                                'material-icons-outlined').addClass('material-icons').html(
                                'favorite');
                            $('#wish-' + response.id_product).data('action',
                                'removeWishlist'); // Update the data-action attribute
                            $('#loginModalWishProduct').modal('hide');
                            $('#loginModalWishProduct').hide();
                            $('.modal-backdrop').hide();
                            $('body').removeClass('modal-open');



                        } else if (response.status === 'error') {
                            alertMessage.html(
                                '<span class="alert alert-danger" role="alert">Error</span>'
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

*}
{/if}
{if !$isCustomerLoggedIn}

<!-- Main modal -->
<div id="authentication-modal-2" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
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
    <!-- Modal -->
    <div class="modal fade" id="loginModalWish" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                <h3 class="text-center">CONNECTION / INSCRIPTION </h3>

                        <div id="login-form-wishlist">
                            <div class="mb-2 text-center no-account">
                                <span>Déjà client ? <br />Connectez-vous</span>
                            </div>
                            <div class="form-group row ">
                                <label class="col-md-3 form-control-label required" for="field-email">
                                    E-mail <sup>*</sup>
                                </label>
                                <div class="col-md-8">
                                    <input class="form-control" name="email-wishlist" type="email" value="" required="">
                                </div>
                                <input type="hidden" name="modalProductId" value="">
                            </div>
                           
                            <div class="form-group row ">
                                <label class="col-md-3 form-control-label required" for="field-password">
                                    Mot de passe <sup>*</sup>
                                </label>
                                <div class="col-md-6">
                                    <div class="input-group js-parent-focus">
                                        <input class="form-control js-child-focus js-visible-password" name="password-wishlist"
                                            title="Au moins 5 caractères"
                                            aria-label="Saisie d'un mot de passe d'au moins 5 caractères" type="password"
                                            autocomplete="current-password" value="" required="">
                                        <span class="input-group-btn">
                                            <button class="btn" type="button" data-action="show-password">
                                                <i class='material-icons'>visibility</i> </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2 mb-2 text-center forgot-password">
                                <div class="mt-2 mb-2 text-center">
                                    <small>
                                        <a href="{$urls.pages.password}" rel="nofollow">
                                            {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
                                        </a>
                                    </small>
                                </div>
                                <input type="hidden" name="submitLogin" value="1">
                                    <div id="wishMessageModalSignIn"></div>

                                    <button id="wish-login" name="submit-cafelogin" class="boutonstyle" data-action="sign-in"
                                        type="submit" class="form-control-submit">
                                        {l s='Sign in' d='Shop.Theme.Actions'}
                                    </button>

                                    <div class="text-center mt-2 no-account">
                                    <span style="cursor:pointer;" id="showRegisterForm" data-link-action="display-register-form">ou
                                        <u>créez votre compte en 1 clic</u></span>
                                </div>
                            </div>
                        </div>

                            <footer class="form-footer text-sm-center clearfix text-right">
                               

                                <div class="mt-2" id="registerFormContent" style="display: none;">
                                <div class="text-center mt-2 mb-2 no-account">
                                    <span style="cursor:pointer;" id="showLoginForm" data-link-action="display-login-form">ou
                                        <u>se connecter</u></span>
                                </div>
                                    <div class="form-group row "> <label class="col-md-3 form-control-label required"
                                            for="field-lastname"> Votre nom <sup>*</sup></label>
                                        <div class="col-md-8">
                                            <input class="form-control" id="field-lastname" name="register-lastname-wishlist"
                                                type="text" value="" required="">
                                        </div>
                                    </div>

                                    <div class="form-group row "> <label class="col-md-3 form-control-label required"
                                            for="field-firstname"> Votre prénom <sup>*</sup></label>
                                        <div class="col-md-8">
                                            <input class="form-control" id="field-firstname" name="register-firstname-wishlist"
                                                type="text" value="" required="">
                                        </div>
                                    </div>

                                    <div class="form-group row "> <label class="col-md-3 form-control-label required"
                                            for="field-email"> Votre e-mail <sup>*</sup></label>
                                        <div class="col-md-8">
                                            <input class="form-control" name="register-email-wishlist" type="email" value=""
                                                required="">
                                        </div>
                                        <input type="hidden" name="modalProductId" value="">
                                    </div>
                                    <div class="form-group row "> <label class="col-md-3 form-control-label required"
                                            for="field-password"> Choisir un mot de passe <sup>*</sup></label>
                                        <div class="col-md-6">
                                            <div class="input-group js-parent-focus"> <input
                                                    class="form-control js-child-focus js-visible-password"
                                                    name="register-password-wishlist" title="Au moins 5 caractères"
                                                    aria-label="Saisie d'un mot de passe d'au moins 5 caractères" type="text"
                                                    autocomplete="current-password" value="" required=""> <span
                                                    class="input-group-btn"> <button class="btn" type="button"
                                                        data-action="show-password">
                                                        <i class='material-icons'>visibility</i> </button> </span></div>
                                        </div>
                                    </div>
                                    <div class="form-check mb-2">
                                        <span class="custom-checkbox">
                                            <label class="form-check-label" for="newsletterCheckbox">
                                                <input class="form-check-input" type="checkbox" id="newsletterCheckbox"
                                                    name="newsletterCheckbox">
                                                <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
                                                Recevoir notre newsletter
                                            </label>
                                        </span>
                                    </div>
                                    <div class="form-check mb-2">
                                        <span class="custom-checkbox">
                                            <label class="form-check-label" for="termsCheckbox">

                                                <input class="form-check-input" type="checkbox" id="termsCheckbox"
                                                    name="termsCheckbox" required>
                                                <span><i class="material-icons rtl-no-flip checkbox-checked"></i></span>
                                            J'accepte les conditions générales et la politique de confidentialité
                                        </label>
                                    </span>
                                </div>
                                <div class="text-center">
                                    <div id="wishMessageModal"></div>
                                    <button id="wish-register" name="submit-register-whislist" class="boutonstyle"
                                        data-action="register-wishlist" type="submit" class="form-control-submit">
                                        {l s='Créer mon compte' d='Shop.Theme.Actions'}
                                    </button>
                                </div>
                            </div>
                        </footer>
            </div>
        </div>
    </div>
</div>*}

{/if}
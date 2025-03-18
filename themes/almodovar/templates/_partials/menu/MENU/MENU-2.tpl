
                        <div id="desktopMenu" class="p-0 container">
                                <div class="">
                                    <div class="row" style="
                                    justify-content: space-between;
                                    align-items: center;">
                                        <div id="MENU_left" class="text-center  p-0 col-md-4" data-drop-zone="MENU_left">
                                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/{$language.id}-MENU-left-2.tpl"}
                                        </div>
                                        <div id="MENU_center" class="text-center p-0 col-md-4" data-drop-zone="MENU_center">
                                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/{$language.id}-MENU-center-2.tpl"}
                                        </div>
                                        <div id="MENU_right" class="text-center p-0 col-md-4" data-drop-zone="MENU_right">
                                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/{$language.id}-MENU-right-2.tpl"}
                                        </div>
                                    </div>
                                </div>
                                
                                {assign var="menu_id_submenu_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/{$language.id}-MENU-2-submenu.tpl"}
                                {include file=$menu_id_submenu_tpl}
                        
                {block name='hook_before_body_closing_tag'}
                <script>
                    document.addEventListener('DOMContentLoaded', () => {
                        const menuItems = document.querySelectorAll('.menu-item-submenu');

                        menuItems.forEach(item => {
                            const targetId = item.getAttribute('data-target');
                            const submenu = document.getElementById(targetId);

                            // Vérifiez si le sous-menu existe avant d'ajouter des écouteurs d'événements
                            if (!submenu) {
                                console.warn('Sous-menu introuvable pour ID' + targetId);
                                return; // Passe à l'élément suivant si le sous-menu est introuvable
                            }

                            // Ajouter les événements pour le menu principal
                            item.addEventListener('mouseenter', () => {
                                submenu.style.display = 'block'; // Afficher le sous-menu
                            });

                            item.addEventListener('mouseleave', () => {
                                setTimeout(() => { 
                                    if (!submenu.matches(':hover')) { 
                                        submenu.style.display = 'none'; // Cacher le sous-menu
                                    }
                                }, 10); // Délai de 300ms pour éviter un clic accidentel
                            });

                            // Ajouter les événements pour le sous-menu
                            submenu.addEventListener('mouseenter', () => {
                                submenu.style.display = 'block'; // Garder visible
                            });

                            submenu.addEventListener('mouseleave', () => {
                                submenu.style.display = 'none'; // Masquer le sous-menu
                            });

                        });
                        // Sélectionner tous les éléments obfusqués
                        const obfuscatedLinks = document.querySelectorAll('.obfuscated-link');

                        obfuscatedLinks.forEach(link => {
                            const encodedUrl = link.getAttribute('data-obf'); // Récupération de l'URL encodée
                            const decodedUrl = atob(encodedUrl); // Décodage Base64
                            link.addEventListener('click', () => {
                                window.location.href = decodedUrl; // Redirection lors du clic
                            });
                        });
                    });
                </script>
                {/block}

                </div>
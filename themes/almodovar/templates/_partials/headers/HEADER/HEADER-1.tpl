
            <div class="" id="HEADER_top" data-drop-zone="top">
                {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-top-1.tpl"}
            </div>
            {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}
                <div class="container-fluid mt-2 mb-2 ">
                    <div class="row">
                        <div class=" col-md-3 d-flex align-items-center gap-5" id="HEADER_left" data-drop-zone="left">
                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-left-1.tpl"}
                        </div>
                        <div class="col-12 col-md-6 d-flex align-items-center" id="HEADER_center" data-drop-zone="center">
                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-center-1.tpl"}
                        </div>
                        <div class=" col-md-3 gap-4 d-flex align-items-center justify-content-end" id="HEADER_right" data-drop-zone="right">
                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-right-1.tpl"}
                        </div>
                    </div>
                </div>
            {else}
            <div class="container">
                <div class="row  d-flex align-items-center">
                    <div class="col-10">
                        <a href="{$link->getPageLink(index)}" aria-label="Logo">
                            {if $shop.logo_details}
                                {renderLogo}
                            {/if}
                        </a>
                    </div>
                    <div class="col-2">
                        <span data-bs-toggle="offcanvas" data-bs-target="#offcanvasMainMenu" aria-controls="offcanvasMainMenu">
                            <svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="#000"><path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z"/></svg>
                        </span>

                        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasMainMenu" aria-labelledby="offcanvasMainMenuLabel">
                            <div class="offcanvas-header">
                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                            </div>
                            <div class="offcanvas-body">
                                {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/{$language.id}-MENU-2-menu-mobile.tpl"}

                            </div>
                        </div>
                    </div>
                    
                </div>

            </div>
             {/if}

                <div class="" id="HEADER_bottom" data-drop-zone="bottom">
                {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-bottom-1.tpl"}
                </div>
            {block name="hook_before_body_closing_tag"}
                  {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/HEADER-1-script.tpl"}
       
            {/block}
            
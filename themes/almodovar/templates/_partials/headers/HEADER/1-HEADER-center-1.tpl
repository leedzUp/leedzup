
            {* Menu Principal *}
           {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}
               {* {assign var="id_menu_simulate" value="{hook h="displayIdMenuSimulation"}"}
                {assign var="url_menu_simulate" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/{$id_menu_simulate}-menu-desktop-{$language.id}.tpl"}
                    {if !empty($id_menu_simulate)}
                    {include file=$url_menu_simulate}
                    {else}
                        {assign var="id_menu_default" value="{hook h="displayIdIndexDefault" value="MENU"}"}
                        {assign var="menu_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/{$id_menu_default}-menu-desktop-{$language.id}.tpl"}
                        {include file=$menu_id_default_tpl}

                    {/if}*}
                    
                    {include file=$smarty.const._PS_THEME_DIR_|cat:"templates/_partials/menu/menu.tpl"}
            {else}
           
                 {assign var="id_menu_default" value="{hook h="displayGetDefaultMenuId"}"}
                 {assign var="url_menu_default" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/1-MENU-5-menu-mobile.tpl"}
                 {if !empty(id_menu_default)}
                        <div style="margin-top: -10px;" class="d-flex justify-content-between align-items-center">
                            <div style="width:20%;">
                                {include file=$url_menu_default}
                            </div>
                            <div style="width:60%;text-align: center;">
                                {assign var="logo_landing_mobile" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/logo-landing-mobile.tpl"}
                                {include file=$logo_landing_mobile}
                            </div>

                           {* SEARCH CART*}
                            <div style="width:20%;margin-top: -10px;" class="xs-pr-4 d-flex justify-content-end align-items-center">
                                
                                    <div class="header-block">
                                        <a href="#" role="button" data-bs-toggle="offcanvas"
                                            data-bs-target="#searchCanvas" aria-controls="searchCanvas"
                                            aria-label="{l s="Show search bar" d="Shop.Theme.Global"}">
                                            <svg class="ml-4 js-search-icon" width="24" height="24" id="Calque_search" data-name="Calque search" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18.64 18.64">
                                            <defs>
                                                <style>
                                                .cls-search {
                                                    fill: none;
                                                    stroke: #4c4c4c;
                                                    stroke-miterlimit: 10;
                                                    stroke-width: .75px;
                                                }
                                                </style>
                                            </defs>
                                            <g data-name="Calque_search">
                                                <g>
                                                <circle class="cls-search" cx="7.82" cy="7.82" r="7.45"></circle>
                                                <line class="cls-search" x1="13.41" y1="13.41" x2="18.38" y2="18.38"></line>
                                                </g>
                                            </g>
                                            </svg>
                                        </a>

                                        <div class="search__offcanvas js-search-offcanvas offcanvas offcanvas-top h-auto" data-bs-backdrop="false" data-bs-scroll="true" tabindex="-1" id="searchCanvas" aria-labelledby="offcanvasTopLabel">
                                            <div class="offcanvas-header">
                                                <div id="search_widget" class="search-widgets js-search-widget" data-search-controller-url="{$link->getPageLink(search)}">
                                                    <form method="get" action="{$link->getPageLink(search)}">
                                                        <input type="hidden" name="controller" value="search">
                                                        <input class="js-search-input" type="search" name="s" value="" placeholder="{l s="Type your search and press enter" d="Modules.Codemyshop.Block_search"}" aria-label="{l s="Search" d="Shop.Theme.Catalog"}">
                                                    </form>
                                                    <span class="btn-close text-reset ms-1" data-bs-dismiss="offcanvas" aria-label="Close">
                                                    <svg width="24" height="24" viewBox="0 0 16 16"><path d="M.293.293a1 1 0 0 1 1.414 0L8 6.586 14.293.293a1 1 0 1 1 1.414 1.414L9.414 8l6.293 6.293a1 1 0 0 1-1.414 1.414L8 9.414l-6.293 6.293a1 1 0 0 1-1.414-1.414L6.586 8 .293 1.707a1 1 0 0 1 0-1.414z"/></svg>
                                                    </span>

                                                    <div class="search-widgets__dropdown js-search-dropdown d-none">
                                                        <ul class="search-widgets__results js-search-results">
                                                        </ul>
                                                    </div>

                                                    <template id="search-products" class="js-search-template">
                                                    <li class="search-result">
                                                        <a class="search-result__link" href="">
                                                        <img src="" alt="" class="search-result__image">
                                                        <p class="search-result__name"></p>
                                                        </a>
                                                    </li>
                                                    </template>


                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                    
                                    <div class="xs-ml-2 mr-2">{widget name="ps_shoppingcart"}</div>
                            </div>
                         {* SEARCH CART*}

                        </div>
                {/if}

            {/if}
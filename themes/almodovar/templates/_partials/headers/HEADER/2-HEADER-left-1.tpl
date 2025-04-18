{include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/helpers.tpl"}<div class="p-3 logo text-left"><a href="{$link->getPageLink(index)}" aria-label="Logo">
                {if $shop.logo_details}
                    {renderLogo}
                {/if}
                </a></div>
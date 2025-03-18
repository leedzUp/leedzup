
        <div class="container">
        <div id="js-product-list">
                <section>

                    {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}
                        {include file="catalog/_partials/productlist-mobile.tpl" products=$listing.products}
                    {else}
                        {include file="{$smarty.const._PS_THEME_DIR_}templates/catalog/_partials/productlist.tpl" products=$listing.products}
                    {/if}
                    {block name="pagination"}
                        {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/pagination.tpl" pagination=$listing.pagination}
                    {/block}
                            </section>

                </div></div>
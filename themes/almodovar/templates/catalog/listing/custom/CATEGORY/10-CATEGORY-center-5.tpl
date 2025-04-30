
        <div class="container">
        <div id="js-product-list">
                <section>
                        {include file="{$smarty.const._PS_THEME_DIR_}templates/catalog/_partials/productlist.tpl" products=$listing.products}
                    {block name="pagination"}
                        {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/pagination.tpl" pagination=$listing.pagination}
                    {/block}
                            </section>

                </div></div>

                <div class="" id="HOMEPAGE_top" data-drop-zone="HOMEPAGE_top">
                    {include file="{$smarty.const._PS_THEME_DIR_}templates/index/HOMEPAGE/{$language.id}-HOMEPAGE-top-3.tpl"}

                    {if isset($category) && $category}
                        {if $category.description}
                            <div id="category-description" class="rich-text mb-4">{$category.description nofilter}</div>
                        {/if}
                        {hook h="displayProductListMap" category=$category}
                    {/if}


                </div>
                <div class="" id="HOMEPAGE_center" data-drop-zone="HOMEPAGE_center">
                            {include file="{$smarty.const._PS_THEME_DIR_}templates/index/HOMEPAGE/{$language.id}-HOMEPAGE-center-3.tpl"}
                </div>
                <div class="" id="HOMEPAGE_bottom" data-drop-zone="HOMEPAGE_bottom">
                    {include file="{$smarty.const._PS_THEME_DIR_}templates/index/HOMEPAGE/{$language.id}-HOMEPAGE-bottom-3.tpl"}
                </div>
                {block name="hook_before_body_closing_tag"}
                    {include file="{$smarty.const._PS_THEME_DIR_}templates/index/HOMEPAGE/HOMEPAGE-3-script.tpl"}
                {/block}
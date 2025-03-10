
                <div class="" id="CATEGORY_top" data-drop-zone="CATEGORY_top">
                    {include file="{$smarty.const._PS_THEME_DIR_}templates/catalog/listing/custom/CATEGORY/{$language.id}-CATEGORY-top-5.tpl"}
                </div>
                <div class="" id="CATEGORY_center" data-drop-zone="CATEGORY_center">
                            {include file="{$smarty.const._PS_THEME_DIR_}templates/catalog/listing/custom/CATEGORY/{$language.id}-CATEGORY-center-5.tpl"}
                </div>
                <div class="" id="CATEGORY_bottom" data-drop-zone="CATEGORY_bottom">
                    {include file="{$smarty.const._PS_THEME_DIR_}templates/catalog/listing/custom/CATEGORY/{$language.id}-CATEGORY-bottom-5.tpl"}
                </div>
                {block name="hook_before_body_closing_tag"}
                    {include file="{$smarty.const._PS_THEME_DIR_}templates/catalog/listing/custom/CATEGORY/CATEGORY-5-script.tpl"}
                {/block}
{if empty($smarty.get.landing)}
    {block name="hook_footer"}
        {hook h="displayFooter"}
    {/block}
    {if isset($smarty.get.simulation) && $smarty.get.simulation == 1}
                                       {* SIMULATION *}
                                         {assign var="id_footer_simulation" value="{hook h="displayIdIndexSimulation" var="id_footer_simulation"}"}
                                         {if !empty($id_footer_simulation)}
                                           {assign var="footer_id_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/footers/FOOTER/FOOTER-{$id_footer_simulation}.tpl"}
                                           {include file=$footer_id_tpl}
                                         {else}
                                           {assign var="id_footer_default" value="{hook h="displayIdIndexDefault" value="FOOTER"}"}
                                           {assign var="footer_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/footers/FOOTER/FOOTER-{$id_footer_default}.tpl"}
                                           {include file=$footer_id_default_tpl}
                                         {/if}
                                     {else}
                                       {* PRODUCTION *}
                                         {assign var="id_footer_default" value="{hook h="displayIdIndexDefault" value="FOOTER"}"}
                                         {assign var="footer_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/footers/FOOTER/FOOTER-{$id_footer_default}.tpl"}
                                       {include file=$footer_id_default_tpl}
                                     {/if}
    {/if}
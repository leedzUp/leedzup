{if empty($smarty.get.landing)}    
        {if isset($smarty.get.simulation) && $smarty.get.simulation == 1}
                                           {* SIMULATION *}
                                             {assign var="id_menu_simulation" value="{hook h="displayIdIndexSimulation" var="id_menu_simulation"}"}
                                             {if !empty($id_menu_simulation)}
                                               {assign var="menu_id_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/MENU-{$id_menu_simulation}.tpl"}
                                               {include file=$menu_id_tpl}
                                             {else}
                                               {assign var="id_menu_default" value="{hook h="displayIdIndexDefault" value="MENU"}"}
                                               {assign var="menu_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/MENU-{$id_menu_default}.tpl"}
                                               {include file=$menu_id_default_tpl}
                                             {/if}
                                         {else}
                                           {* PRODUCTION *}
                                             {assign var="id_menu_default" value="{hook h="displayIdIndexDefault" value="MENU"}"}
                                             {assign var="menu_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/menu/MENU/MENU-{$id_menu_default}.tpl"}
                                             {include file=$menu_id_default_tpl}
                                         {/if}
        {/if}
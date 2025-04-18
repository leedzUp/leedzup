{extends file=$layout}
                    {block name="breadcrumb"}{/block}
                                {block name="content"}
                                    {if isset($smarty.get.simulation) && $smarty.get.simulation == 1}
                                        {* SIMULATION *}
                                          {assign var="id_homepage_simulation" value="{hook h="displayIdIndexSimulation" var="id_homepage_simulation"}"}
                                          {if !empty($id_homepage_simulation)}
                                          
                                            {assign var="homepage_id_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/index/HOMEPAGE/HOMEPAGE-{$id_homepage_simulation}.tpl"}
                                            {include file=$homepage_id_tpl}
                                          {else}
                                            {assign var="id_homepage_default" value="{hook h="displayIdIndexDefault" value="HOMEPAGE"}"}
                                            {assign var="homepage_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/index/HOMEPAGE/HOMEPAGE-{$id_homepage_default}.tpl"}
                                            {include file=$homepage_id_default_tpl}
                                          {/if}
                                      {else}
                                        {* PRODUCTION *}
                                          {assign var="id_homepage_default" value="{hook h="displayIdIndexDefault" value="HOMEPAGE"}"}
                                          {assign var="homepage_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/index/HOMEPAGE/HOMEPAGE-{$id_homepage_default}.tpl"}
                                        {include file=$homepage_id_default_tpl}
                                      {/if}
                                      {/block}
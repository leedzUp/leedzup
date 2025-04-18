
 {extends file=$layout}
{*CODE MY SHOP*}
 {block name="head_microdata_special"}
   {include file="_partials/microdata/product-list-jsonld.tpl" listing=$listing}
 {/block}

{block name="content"}
  
  <div class="container  mt-4">
   {block name="product_list_top"}
          {include file="catalog/_partials/products-top.tpl" listing=$listing}
        {/block}
        {hook h="displayLeftColumn"}
         {block name="product_list_active_filters"}
          {$listing.rendered_active_filters nofilter}
        {/block}

       
</div>

{if $page.page_name == "category"}
{hook h="displayProductListMap" category=$listing}

  {if isset($smarty.get.simulation) && $smarty.get.simulation == 1}
    {* SIMULATION *}
      {assign var="id_category_simulation" value="{hook h="displayIdIndexSimulation" var="id_category_simulation"}"}

      {if !empty($id_category_simulation)}
        {assign var="category_id_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/catalog/listing/custom/CATEGORY/CATEGORY-{$id_category_simulation}.tpl"}
        {include file=$category_id_tpl}
      {else}
        
        {assign var="id_category_default" value="{hook h="displayIdIndexDefault" value="CATEGORY"}"}
        {assign var="category_id_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/catalog/listing/custom/CATEGORY/CATEGORY-{$id_category_default}.tpl"}
        {include file=$category_id_tpl}

      {/if}
  {else}

    {assign var="specific_category" value="{hook h="displayIdIndexSpecific" id_entity=$category.id entity_type="CATEGORY"}"}
    
    {if $specific_category}
      {assign var="category_id_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/catalog/listing/custom/CATEGORY/CATEGORY-{$specific_category}.tpl"}
    {else}
      {assign var="id_category_default" value="{hook h="displayIdIndexDefault" value="CATEGORY"}"}
      {assign var="category_id_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/catalog/listing/custom/CATEGORY/CATEGORY-{$id_category_default}.tpl"}

    {/if}

        {include file=$category_id_tpl}
  {/if}

{else}
{hook h="displayProductListMap" category=$listing_search}

 <div class="container  mt-4">
   {block name="product_list_top"}
          {include file="catalog/_partials/products-top.tpl" listing=$listing_search}
        {/block}
        {hook h="displayLeftColumn"}
       

       
</div>
  <div class="container  mt-4">

  {include file="catalog/_partials/products.tpl" listing=$listing_search}
  </div>

{/if}
{/block}
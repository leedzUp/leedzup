
            {if isset($smarty.get.simulation) && $smarty.get.simulation == 1}
            {* SIMULATION *}
            {if empty($smarty.get.landing)}
          {assign var="id_header_simulate" value="{hook h="displayIdHeaderSimulation"}"}
          {assign var="url_header_simulate" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/HEADER-{$id_header_simulate}.tpl"}
          
          {if !empty(id_header_simulate)}
                   {include file=$url_header_simulate}
          {else}
                {assign var="id_header_default" value="{hook h="displayIdIndexDefault" value="HEADER"}"}
                {assign var="header_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/HEADER-{$id_header_default}.tpl"}
                {include file=$header_id_default_tpl}

          {/if}
        {else}
        {* LANDING ONLY LOGO *}
    
                {assign var="logo_landing" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/logo-landing.tpl"}
                {include file=$logo_landing}
        {/if}
            {else}
        {* PAS DE SIMULATION *}
        {if empty($smarty.get.landing)}
            {assign var="id_header_default" value="{hook h="displayGetDefaultHeaderId"}"}
            {assign var="url_header_simulate" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/HEADER-{$id_header_default}.tpl"}
    
            {if !empty(id_header_default)}
              {include file=$url_header_simulate}
             {else}
                {assign var="id_header_default" value="{hook h="displayIdIndexDefault" value="HEADER"}"}
                {assign var="header_id_default_tpl" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/HEADER-{$id_header_default}.tpl"}
                {include file=$header_id_default_tpl}
         
            {/if}
            
        {else} {*Landing page*}
            {assign var="logo_landing" value="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/logo-landing.tpl"}
            {include file=$logo_landing}
        {/if}
      {/if}
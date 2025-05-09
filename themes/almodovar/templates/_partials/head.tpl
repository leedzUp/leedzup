
{block name='head_charset'}<meta charset="utf-8"><title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
{/block}
{block name='head_ie_compatibility'}<meta http-equiv="x-ua-compatible" content="ie=edge">{/block}
{block name='head_seo'}
  {block name='head_preload'}
    {include file='_partials/preload.tpl'}
  {/block}

  {block name='hook_after_title_tag'}
    {hook h='displayAfterTitleTag'}
  {/block}
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="site_name" content="{$shop.name|escape:'htmlall':'UTF-8'}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    {assign var='canonical_url' value=$page.canonical|regex_replace:"/\?.*/":""}
    <link rel="canonical" href="{$canonical_url}">
  {/if}
  {block name='head_hreflang'}
   
    {foreach from=$urls.alternative_langs item=pageUrl key=code}
      <link rel="alternate" href="{$pageUrl}" hreflang="{if $code == 'fr'}fr-FR{else}{$code}{/if}">
    {/foreach}
  {/block}

  {block name='head_microdata'}
    {include file='_partials/microdata/head-jsonld.tpl'}
  {/block}

  {block name='head_microdata_special'}{/block}

  {block name='head_pagination_seo'}
    {include file='_partials/pagination-seo.tpl'}
  {/block}

  {block name='head_open_graph'}
    <meta property="og:locale" content="{$language.locale|replace:'-':'_'}" />
    <meta property="og:title" content="{$page.meta.title|escape:'htmlall':'UTF-8'}" />
    <meta property="og:description" content="{$page.meta.description|escape:'htmlall':'UTF-8'}" />
    <meta property="og:url" content="{$urls.current_url|escape:'htmlall':'UTF-8'}" />
    <meta property="og:site_name" content="{$shop.name|escape:'htmlall':'UTF-8'}" />
    <meta property="og:type" content="{if $page.page_name == 'product'}product{else}website{/if}" />
    {if $page.page_name == 'product' && isset($product.cover)}
      <meta property="og:image" content="{$link->getImageLink($product.link_rewrite, $product.cover.id_image, 'large_default')|escape:'htmlall':'UTF-8'}" />
    {else}
      <meta property="og:image" content="{$shop.logo|escape:'htmlall':'UTF-8'}" />
    {/if}
  {/block}
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1">
{/block}

{block name='head_icons'}
  <link rel="icon" href="/img/favicon.svg" type="image/svg+xml">
  <link rel="icon" href="/img/favicon.ico" sizes="any">
  <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon-16x16.png">
  <link rel="apple-touch-icon" sizes="180x180" href="/img/apple-touch-icon.png">
{/block}

{block name='stylesheets'}
  {include file='_partials/stylesheets.tpl' stylesheets=$stylesheets}
{/block}

{block name='javascript_head'}
  {include file='_partials/javascript.tpl' javascript=$javascript.head vars=$js_custom_vars}
{/block}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}

{block name='hook_extra'}


{/block}

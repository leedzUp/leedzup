{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
<section id="content" class="container page-content page-not-found">
  {block name='page_content'}
    {block name='error_content'}
      {if isset($errorContent)}
          {$errorContent nofilter}
         
      {else}
        <h1 class="h4">{l s='The page you are looking for is no longer available' d='Shop.Theme.Catalog'}</h1>
        <p>{l s='It can not be reached anymore. Can we still attract you into our shop?' d='Shop.Theme.Catalog'}</p>
        
      {/if}
    {/block}

    {block name='hook_not_found'}
      {hook h='displayNotFound'}
    {/block}
  {/block}
</section>

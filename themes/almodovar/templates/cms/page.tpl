{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}

 {extends file='page.tpl'}



 {block name='page_content_container'}
   <div id="content" class="container page-content page-cms rich-text px-3 px-md-5">
   {block name='page_title'}
     <h1>{$cms.meta_title}</h1>
   {/block}
     {block name='cms_content'}
       {$cms.content nofilter}
     {/block}
 
     {block name='hook_cms_dispute_information'}
       {hook h='displayCMSDisputeInformation'}
     {/block}
 
     {block name='hook_cms_print_button'}
       {hook h='displayCMSPrintButton'}
     {/block}
   </div>
 {/block}
 
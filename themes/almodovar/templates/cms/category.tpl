{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}

 {extends file='page.tpl'}


 {block name='page_content'}
   {block name='cms_sub_categories'}
     {if $sub_categories}
       <p>
         {l s='List of sub categories in %name%:' d='Shop.Theme.Global' sprintf=['%name%' => $cms_category.name]}
       </p>
 
       <ul>
         {foreach from=$sub_categories item=sub_category}
           <li>
             <a href="{$sub_category.link}">
               {$sub_category.name}
             </a>
           </li>
         {/foreach}
       </ul>
     {/if}
   {/block}
 
   {block name='cms_sub_pages'}
     {if $cms_pages}
       <div class="container">
        <h1 class="fs-1 mb-4">{$cms_category.name}</h1>
       
       <div class="row">
           {foreach from=$cms_pages item=cms_page name=cmsPages}
                       <div class="col-md-3">
                       <a href="{$cms_page.link}">
                       <img class="img-fluid" src="/modules/code_buildhomepage/uploads/cms_images/{$cms_page.id_cms}.webp" alt="{$cms_page.meta_title}">
                           <p class="fs-5 fw-bold mt-4">{$cms_page.meta_title}</p></a>
                           <p>{hook h="displayCmsResume" params=$cms_page.id_cms}</p>
                       </div>
           {/foreach}
           </div>
       </div>
       {if isset($categoryCms.pagination) && $categoryCms.pagination.total_pages >1}
           <nav class="pagination-container">
               <div class="pagination-list-container d-flex justify-content-center">
                   <ul class="pagination pagination--custom">{if $categoryCms.pagination.current_page > 1}<li class="page-item"><a
                                   href="?pagination_page={$categoryCms.pagination.current_page - 1}" class="page-link">Previous</a>
                       </li>{/if}
                       {for $i = 1 to $categoryCms.pagination.total_pages}<li
                               class="page-item{if $i == $categoryCms.pagination.current_page} active{/if}"><a
                                   href="?pagination_page={$i}" class="page-link">{$i}</a></li>
                       {/for}
                       {if $categoryCms.pagination.current_page < $categoryCms.pagination.total_pages}<li class="page-item">
                               <a href="?pagination_page={$categoryCms.pagination.current_page + 1}" class="page-link">Next</a>
                           </li>
                       {/if}</ul>
               </div>
       </nav>{/if}
     {/if}
   {/block}
 {/block}
 
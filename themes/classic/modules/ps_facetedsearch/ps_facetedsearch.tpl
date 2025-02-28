{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}

{if isset($listing.rendered_facets) && !empty($listing.rendered_facets)}
  <div class="bg-gray-medium offcanvas offcanvas-start" tabindex="-1" id="offcanvas-faceted" aria-labelledby="faceted-offcanvas-label">
  <div class="offcanvas-header">
    <p class="pt-0 mb-0 title h5 offcanvas-title" id="faceted-offcanvas-label"> {l s="Filters" d="Modules.Codemyshop.Block_filter"}</p>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="pt-0 offcanvas-body offcanvas-body-faceted">
    {$listing.rendered_facets nofilter}
  </div>
</div>

{/if}

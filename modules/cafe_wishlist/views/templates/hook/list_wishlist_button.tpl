{if !$ifExist}
    <button name="submitWishlist" type="button" id="wish-{$id_product}" class="absolute right-0 productlist-wish whishlist btn"
        data-id-product="{$id_product}" data-action="addWishlist">
        <svg id="svg-{$id_product}" class="ml-2 w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 21 19">
        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4C5.5-1.5-1.5 5.5 4 11l7 7 7-7c5.458-5.458-1.542-12.458-7-7Z"></path>
    </svg>
    </button>
{else}
    <button name="submitWishlist" type="button" id="wish-{$id_product}" class="absolute right-0 productlist-wish whishlist btn"
        data-id-product="{$id_product}" data-action="removeWishlist">
        <svg  id="svg-{$id_product}" class="ml-2 w-6 h-6 text-gray-800 dark:text-white" aria-hidden="true"  fill="black"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 21 19">
        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4C5.5-1.5-1.5 5.5 4 11l7 7 7-7c5.458-5.458-1.542-12.458-7-7Z"></path>
    </svg>
    
    </button>
{/if}
<div class="wishMessage mt-2 mb-2" id="wishMessage-{$id_product}"></div>

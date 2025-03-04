<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
{if !$isCustomerLoggedIn}
    
    <button name="submitWishlist" type="button" id="prod-wish-{$id_product}"
    data-id-product="{$id_product}" class="bg-trans product-whishlist btn" data-action="removeWishlist">
        <i class="material-icons">favorite_border</i> <span id="alertMsg" class="product-whishlist-text"> Ajouter à ma wishlist</span>
    </button>
    {else}


    {if !$ifExist}

        <button name="submitWishlist" type="button" id="prod-wish-{$id_product}"
            data-id-product="{$id_product}" class="bg-trans product-whishlist btn" data-action="addWishlist">
            <i class="material-icons">favorite_border</i><span id="alertMsg" class="product-whishlist-text"> Ajouter à ma wishlist !</span>
        </button>
    {else}

        <button name="submitWishlist" type="button" id="prod-wish-{$id_product}"
            data-id-product="{$id_product}" class="bg-trans product-whishlist btn" data-action="removeWishlist">
            <i class="material-icons">favorite</i> <span id="alertMsg" class="product-whishlist-text"> Dans ma wishlist</span>
        </button>
    {/if}

{/if}

<script>
    $(document).ready(function() {
    $('#prod-wish-{$id_product}').on('click', function() {
    var id_customer = "{$id_customer}";
    var id_product = "{$id_product}";
    var action = $(this).data('action');

    // AJAX request to handle the add/remove action
    $.ajax({
        type: 'POST',
        url: "/modules/cafe_wishlist/ajax/submit.php",
        data: {
            id_customer: id_customer,
            id_product: id_product,
            action: action
        },
        dataType: 'json',
        success: function(response) {
            // Handle the response here
            console.log(response); // Check the response object in the browser console

            var alertMessage = $('#alertMsg');

            if (response.status === 'success1') {
                
            $("#alertMsg").css("display", "inline-block");;

                alertMessage.text(
                    ' Dans ma wishlist !'
                );


                $('#prod-wish-{$id_product} i').removeClass('material-icons').addClass('material-icons').html('favorite');
                $('#prod-wish-' + response.id_product).data('action',
                'removeWishlist'); // Update the data-action attribute
               


            } else if (response.status === 'success2') {

            $("#alertMsg").css("display", "inline-block");

                alertMessage.text(
                    ' Retiré de la wishlist !'
                );
                


                $('#prod-wish-{$id_product} i').removeClass('material-icons-outlined').addClass('material-icons').html('favorite_border');
                $('#prod-wish-' + response.id_product).data('action',
                'addWishlist'); // Update the data-action attribute


            } else if (response.status === 'error') {
               
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // Handle errors here
            console.log('AJAX Error: ' + textStatus);
            console.log('Error Thrown: ' + errorThrown);
        }
    });
    });
    });
</script>
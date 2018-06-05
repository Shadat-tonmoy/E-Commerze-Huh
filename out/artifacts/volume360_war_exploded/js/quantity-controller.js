$(document).ready(function () {
    // alert("JH")
    var selectedAmount = 0
    var stockAmount = $("#stock-amount").html()
    var quantityValue = $("#quantity-value").html()

    $("#stock-out-alert").hide()
    $("#add-success-msg").hide()
    $("#add-to-cart-button").prop('disabled',true)

    $("#quantity-plus").click(function () {
        // console.log("StockA "+stockAmount+" "+selectedAmount)
        if(selectedAmount<stockAmount)
        {
            selectedAmount++
            $("#add-to-cart-button").prop('disabled',false)
        }
        else
        {
            console.log("StockA "+stockAmount+" "+selectedAmount)
            // $("#stock-out-alert").fadeIn()
            $("#stock-out-alert").show()
        }
        $("#quantity-value").html(selectedAmount)
        $("#quantity-minus").prop('disabled',false)

    })

    $("#quantity-minus").click(function () {
        if(selectedAmount>0 && selectedAmount<=stockAmount){
            selectedAmount--
            if(selectedAmount<=0)
                $("#add-to-cart-button").prop('disabled',true)
            $("#stock-out-alert").hide()
        }
        else {
            $(this).prop('disabled', true)
            // $("#add-to-cart-button").prop('disabled',true)
        }

        $("#quantity-value").html(selectedAmount)
    })

    $("#add-to-cart-button").click(function () {
        var productId = $("#product-id").html().trim();
        var quantity = selectedAmount
        alert("Sending for "+productId+" WIth "+quantity)
        $.ajax({
            type:"POST",
            cache:false,
            async:false,
            url:"updatecart",
            data : { id : productId, quantity: quantity},
            success: function (result) {
                if(result == 1)
                {
                    $("#add-success-msg").show()
                    $("#cart_msg").text(quantity+" items in cart")
                }
            }
        });

    })
    
})
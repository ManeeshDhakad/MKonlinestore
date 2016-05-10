
function goToPayment() {
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	$("#div_successMessage").html(successTitle + "Order Summary Edited Successfully. Please fill payment details.");
	$("#checkoutOrderSummaryCompleted").removeAttr('style');
	
	// Switch to Payment 
	$('#checkoutPaymentBody').collapse('show');
	$('#checkoutAddresBody').collapse('hide');
	$('#checkoutOrderSummaryBody').collapse('hide');
	$("#checkoutPaymentLink").removeClass("href-not-active");
}

function makeDeliveryAddress(addressId) {
	addressId = addressId.replace(/['"]+/g, '');
	var json = addressId;	
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "make-delivery-address",
		data : JSON.stringify(json),
		success : function(data) {	
			if(data.indexOf("fa-check") > -1) {
				$("#div_successMessage").css('display','block');
				$("#div_errorMessage").css('display','none');
				$("#div_successMessage").html( data);
				$("#checkoutAddressCompleted").removeAttr('style');
								
				// Switch to Order Summary
				$('#checkoutOrderSummaryBody').collapse('show');
				$('#checkoutAddresBody').collapse('hide');
				$('#checkoutPaymentBody').collapse('hide');
				$("#checkoutOrderSummaryLink").removeClass("href-not-active");
			}
			else {
				$("#div_successMessage").css('display','none');
				$("#div_errorMessage").css('display','block');
				$("#div_errorMessage").html(data);
			}
		}
	});
}


function updateCheckoutProductQunatity(code, price, qty) {
	var productCode = code.replace(/['"]+/g, '');
	var productPrice = price.replace(/['"]+/g, '');
	var oldQTY = qty.replace(/['"]+/g, '');
	
	var estimatedTotal = parseFloat($("#cartEstimatedTotal").html());
	var productSubTotal = parseFloat($("#productSubTotal" + productCode).html());
	
	// New qty
	var selectQTY = document.getElementById('select_' + productCode);
    var productQTYIndex = selectQTY.selectedIndex;
    var newQTY = selectQTY[productQTYIndex].text;
    
    if(newQTY > oldQTY) {
    	var remainQTY = newQTY - oldQTY;
    	estimatedTotal = estimatedTotal + (productPrice * remainQTY);
    	productSubTotal = productSubTotal + (productPrice * remainQTY);
    }
    else {
    	var remainQTY = oldQTY - newQTY;
    	estimatedTotal = estimatedTotal - (productPrice * remainQTY);
    	productSubTotal = productSubTotal - (productPrice * remainQTY);
    }
    
    var json = getParameterByName('productCode') + "####@@@@####" + productCode + "####@@@@####" + newQTY;
   
    $.ajax({
		type : "POST",
		contentType : "application/json",
		url : "checkout-update-product-qty",   
		data : JSON.stringify(json),
		success : function(data) {
			if(data.indexOf("fa-check") > -1) {
				$("#productSubTotal" + productCode).html(productSubTotal);
				$("#cartEstimatedTotal").html(estimatedTotal);
				document.getElementById("paymentCardAmount").value = "Amount Payable :" + estimatedTotal;
				$("#div_successMessage").css('display','block');
				$("#div_errorMessage").css('display','none');
				$("#div_successMessage").html( data);
			}
			else {
				$("#div_successMessage").css('display','none');
				$("#div_errorMessage").css('display','block');
				$("#div_errorMessage").html(data);
				$('#select_' + productCode +   ' option[value='+ oldQTY +']').attr('selected','selected');
			}
		}
	});
}



function removeProductFromCheckout(code) {
	var productCode = code.replace(/['"]+/g, '');
	
	var estimatedTotal = parseFloat($("#cartEstimatedTotal").html());
	var productSubTotal = parseFloat($("#productSubTotal" + productCode).html());
	estimatedTotal = estimatedTotal - productSubTotal;
	
    var json = getParameterByName('productCode') + "####@@@@####" + productCode;
		
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "checkout-remove-product",
		data : JSON.stringify(json),
		success : function(data) {
			if(data.indexOf("fa-check") > -1) {
				$("#cart_tr_" + productCode).css('display','none');
				$("#cartEstimatedTotal").html(estimatedTotal);
				document.getElementById("paymentCardAmount").value = "Amount Payable :" + estimatedTotal;
				if(estimatedTotal == 0) {
					window.location = "view-cart";
				}
				$("#div_successMessage").css('display','block');
				$("#div_errorMessage").css('display','none');
				$("#div_successMessage").html( data);
			}
			else {
				$("#div_successMessage").css('display','none');
				$("#div_errorMessage").css('display','block');
				$("#div_errorMessage").html(data);
			}
		}
	});
}

function orderCompletion() { 
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	var cardName = document.getElementById('paymentCardName').value;
	var cardNumber = document.getElementById('paymentCardNumber').value;
	var cardCVV = document.getElementById('paymentCardCVV').value;
	  
    var message = "";
    
	if(cardName == "" || cardNumber == "" || cardCVV == "") {
	     message = "<i class=\"fa fa-warning\"></i> Please fill payment details before you proceed.";
	     $("#div_successMessage").css('display','none');
	     $("#div_errorMessage").css('display','block');
	     $("#div_errorMessage").html(message);
	     return false;
	}    
	else {
		window.location = "order?productCode=" + getParameterByName('productCode');
	}

}


$(document).ready(function(){
	    
	//Refresh page on back button
	var $input = $('#refresh');
	$input.val() == 'yes' ? location.reload(true) : $input.val('yes');
	
	// Success and error messages
	
	var msgStatus = document.getElementById('messageStatus').value;
	if(msgStatus != "" || msgStatus != null || msgStatus != NaN || msgStatus.length > 0) {
		
		if(msgStatus.indexOf("SUCCESS") > -1) {
			$(".isa_success").css('display','block');
			$(".isa_error").css('display','none');
		}
		else if(msgStatus.indexOf("ERROR") > -1) {
			$(".isa_error").css('display','block');
			$(".isa_success").css('display','none');
		}
	}
		
});


var modalLoadingState = false;

$(window).load(function() {
	$("#loading").css('display','none'); 
	$("#modal-loading").css('display','none');
});

$(document).ajaxSend(function(event, request, settings) {
	if(modalLoadingState == true)
		$("#modal-loading").css('display','block');
	else
		$("#loading").css('display','block');  
});

$(document).ajaxComplete(function(event, request, settings) {
	setTimeout(function(){
		if(modalLoadingState == true)
			$("#modal-loading").css('display','none');
		else
			$("#loading").css('display','none');
		
	}, 1000);
});

function closeSuccessMessageDiv() {
	$("#loading").css('display','none');
}

$(".close").click(function(){
	if(modalLoadingState == true) {
		$(".isa_success_modal").css('display','none');
	  	$(".isa_error_modal").css('display','none');
	}
	else {
		$(".isa_success").css('display','none');
	  	$(".isa_error").css('display','none');
	}
});


function closeLoginModal() {
	// Clear login form
	$("#loginEmail").val('');
	$("#loginPassword").val('');
		
	// Clear signup form
	$("#signupName").val('');
	$("#signupEmail").val('');
	$("#signupPassword").val('');
	$("#signupPasswordConfirm").val('');
	
	// Close login modal
	$('#login-modal').modal('hide');
	
	modalLoadingState = false;
	
	return false;
}



// Back to top 
var amountScrolled = 300;

$(window).scroll(function() {
	if ( $(window).scrollTop() > amountScrolled ) {
		$('a.back-to-top').fadeIn('slow');
	} else {
		$('a.back-to-top').fadeOut('slow');
	}
});
$('a.back-to-top').click(function() {
	$('html, body').animate({
		scrollTop: 0
	}, 700);
	return false;
});

//Login modal
$(".email-signup").hide();

$("#signup-box-link").click(function(){
	$(".isa_success_modal").css('display','none');
  	$(".isa_error_modal").css('display','none');
  	
  	$(".email-login").fadeOut(100);
  	$(".email-signup").delay(100).fadeIn(100);
  	$("#login-box-link").removeClass("active");
  	$("#signup-box-link").addClass("active");
  	
  	
});

$("#login-box-link").click(function(){
	$(".isa_success_modal").css('display','none');
  	$(".isa_error_modal").css('display','none');
  	
  	$(".email-login").delay(100).fadeIn(100);;
  	$(".email-signup").fadeOut(100);
  	$("#login-box-link").addClass("active");
  	$("#signup-box-link").removeClass("active");
});


// Swap image on product detail page
function swapImageProductDetail(image) {
    document.getElementById("main-img").src = image.href;
}


function goToHomePage() {
	window.location = "home";
}

function goToViewCart() {
	window.location = "view-cart";
}

var warningTitle = "<i class=\"fa fa-warning\"></i> ";
var errorTitle = "<i class=\"fa fa-warning\"></i> ";
var successTitle = "<i class=\"fa fa-check\"></i> ";


function addProductToCart(code) {
	var productCode = code.replace(/['"]+/g, '');
	var productCount = $(".crtProductCount").html();
	var crtProductCount;

	if(productCount == null || productCount == "NaN" || productCount == NaN || productCount == "") {
		crtProductCount = 0;
	}
	else 
		crtProductCount = parseInt(productCount);
	
	crtProductCount = crtProductCount + 1;
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "add-to-cart",
		data : JSON.stringify(productCode),
		success : function(data) {
						
			if(data.indexOf("fa-check") > -1) {
				$(".crtProductCount").html(crtProductCount);
				
				// Product detail page
				$("#btn_addToCart").prop('title', "This product is added to cart").
				text("ADDED TO CART").prop('class','common-btn-disabled').attr("disabled", true);
				
				
				// User profile page
				$("#btn_addToCart" + productCode).prop('title', "This product is added to cart").
				text("ADDED TO CART").prop('class','common-btn-disabled').attr("disabled", true);			
								
				$("#btn_addToCart").prop('data-toggle','tooltip');
				$("#btn_addToCart").prop('data-placement','top');
				$(".isa_success").css('display','block');
				$(".isa_error").css('display','none');
				$("#successMessage").html(data);
			}
			else {
				$(".isa_error").css('display','block');
				$(".isa_success").css('display','none');
				$("#errorMessage").html(data);
			}
		}
	});
	
}

function addProductToWishList(code) {
	var productCode = code.replace(/['"]+/g, '');
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "add-to-wishlist",
		data : JSON.stringify(productCode),
		success : function(data) {
			if(data.indexOf("fa-check") > -1) {
				$(".isa_success").css('display','block');
				$(".isa_error").css('display','none');
				$("#successMessage").html(data);
				$("#addToWishListLink").html("<span class=\"glyphicon glyphicon-heart-empty\"></span>" + "ADDED TO WISHLIST");
				
				$('#addToWishListLink').prop('class', "href-not-active");
			}
			else if(data == "Login Required") {
				$('#login-modal').modal('show');
			}
			else {
				$(".isa_error").css('display','block');
				$(".isa_success").css('display','none');
				$("#errorMessage").html(data);
			}
		}
	});
}

function deleteProductFromWishlist(code) {
	var productCode = code.replace(/['"]+/g, '');
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "delete-from-wishlist",
		data : JSON.stringify(productCode),
		success : function(data) {
			if(data.indexOf("fa-check") > -1) {
				$(".isa_success").css('display','block');
				$(".isa_error").css('display','none');
				$("#successMessage").html(data);
				$("#tr_wishlist" + productCode).css('display','none');
			}
			else {
				$(".isa_error").css('display','block');
				$(".isa_success").css('display','none');
				$("#errorMessage").html(data);
			}
		}
	});
}

function updateProductQunatity(code, price, qty) {
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
    
    var json = productCode + "####@@@@####" + newQTY;
   
    $.ajax({
		type : "POST",
		contentType : "application/json",
		url : "update-product-qty",
		data : JSON.stringify(json),
		success : function(data) {
			if(data.indexOf("fa-check") > -1) {
				$("#productSubTotal" + productCode).html(productSubTotal);
				$("#cartEstimatedTotal").html(estimatedTotal);
				$(".isa_success").css('display','block');
				$(".isa_error").css('display','none');
				$("#successMessage").html(data);
			}
			else {
				$(".isa_error").css('display','block');
				$(".isa_success").css('display','none');
				$("#errorMessage").html(data);
				$('#select_' + productCode +   ' option[value='+ oldQTY +']').attr('selected','selected');
			}
		}
	});
}



function removeProductFromCart(code) {
	var productCode = code.replace(/['"]+/g, '');
		
	var estimatedTotal = parseFloat($("#cartEstimatedTotal").html());
	var productSubTotal = parseFloat($("#productSubTotal" + productCode).html());
	estimatedTotal = estimatedTotal - productSubTotal;
		
	var crtProductCount = parseInt($(".crtProductCount").html());
	
	if(crtProductCount  >= 0)
		crtProductCount = crtProductCount - 1;
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "remove-product",
		data : JSON.stringify(productCode),
		success : function(data) {
			if(data.indexOf("fa-check") > -1) {
				$("#cart_tr_" + productCode).css('display','none');
				$("#cartEstimatedTotal").html(estimatedTotal);
				$(".crtProductCount").html(crtProductCount);
				if(estimatedTotal == 0) {
					window.location = "view-cart";
				}
				$(".isa_success").css('display','block');
				$(".isa_error").css('display','none');
				$("#successMessage").html(data);
			}
			else {
				$(".isa_error").css('display','block');
				$(".isa_success").css('display','none');
				$("#errorMessage").html(data);
			}
		}
	});
}


function loginUser() {
	modalLoadingState = true;
		
	var email = document.getElementById('loginEmail').value;
	var password = document.getElementById('loginPassword').value;
		
	var message = "";
	if(email == "" || password == "")
		message = "Please fill valid email and password before you proceed. <br>";
	else
		message = validateEmail(email);
	
	if(message != "") {
		$(".isa_success_modal").css('display','none');
		$(".isa_error_modal").css('display','block');
		$("#loginModelErrorMessage").html(warningTitle + message);
				
	}
	else {
		var json = email + "####@@@@####" + password;
		
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "login-user",
			data : JSON.stringify(json),
			success : function(data) {	
				if(data.indexOf("fa-check") > -1) {
					var pathName = window.location.pathname; // Returns path only
					pathName = pathName.replace("/MKonlinestore/", "");
				
					if(pathName == "logout" || pathName == "forgot-password")
						window.location = "home";
					else
						window.location.reload();
				}
				else {
					$(".isa_success_modal").css('display','none');
					$(".isa_error_modal").css('display','block');
					$("#loginModelErrorMessage").html(data);
				}
			}
		});
	}
	
}

function signupUser() {
	modalLoadingState = true;
	
	var name = document.getElementById('signupName').value;
	var email = document.getElementById('signupEmail').value;
	var password = document.getElementById('signupPassword').value;
	var confirmPassword = document.getElementById('signupPasswordConfirm').value;
	var message = "";
	
	if(name == "" || email == "" || password == "" || confirmPassword == "")
		message = "All Fields are required. Please fill valid details before you proceed.";
	else {
		message = message + validateEmail(email);
		message = message + validatePassword(password, confirmPassword);
	}

	if(message != "") {
		$(".isa_success_modal").css('display','none');
		$(".isa_error_modal").css('display','block');
		$("#loginModelErrorMessage").html(warningTitle + message);
		
	}
	else {
		var json = name + "####@@@@####" + email + "####@@@@####" + password;
	
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "signup-user",
			data : JSON.stringify(json),
			success : function(data) {	
				if(data.indexOf("fa-check") > -1) {
					$("#signupName").val('');
					$("#signupEmail").val('');
					$("#signupPassword").val('');
					$("#signupPasswordConfirm").val('');
					
					$(".isa_success_modal").css('display','block');
					$(".isa_error_modal").css('display','none');
					$("#loginModelSuccessMessage").html(data);
					
					
				}
				else {
					$(".isa_success_modal").css('display','none');
					$(".isa_error_modal").css('display','block');
					$("#loginModelErrorMessage").html(data);
				}
			}
		});
	}
	
}


function checkoutPage(code) {
	var productCode = code.replace(/['"]+/g, '');
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "check-user-login",
		success : function(data) {
			if(data == "Login Required") {
				$('#login-modal').modal('show');
				return false;
				
			}
			else {
				window.location = "checkout?productCode=" + productCode;
			}
			
		}
	});
}


function forgotPassword() {
	window.location = "forgot-password";
}


function sendFeedbackMail() {
	 				

	var name = document.getElementById('feedbackMailName').value;
	var email = document.getElementById('feedbackMailEmail').value;
	var subject = document.getElementById('feedbackMailSubject').value;
	var mailBody = document.getElementById('feedbackMailMessage').value;
	var message = "";
	
	if(name == "" || email == "" || subject == "" || mailBody == "") {
		message = "All Fields are required. Please fill valid details before you proceed.";
	}
	else {
		message = validateEmail(email);
	}
	
	if(message != "") {
		$("#div_successMessage").css('display','none');
	     $("#div_errorMessage").css('display','block');
	     $("#div_errorMessage").html(errorTitle + message);
	     return false;
	}
	else {
		var json = name + "####@@@@####" + email + "####@@@@####" + subject + "####@@@@####" + mailBody;
	
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "send-feedbackmail",
			data : JSON.stringify(json),
			success : function(data) {	
				if(data.indexOf("fa-check") > -1) {
					$("#feedbackMailName").val('');
					$("#feedbackMailEmail").val('');
					$("#feedbackMailSubject").val('');
					$("#feedbackMailMessage").val('');
					
					$(".isa_success").css('display','block');
					$(".isa_error").css('display','none');
					$("#successMessage").html(data);
				}
				else {
					$(".isa_error").css('display','block');
					$(".isa_success").css('display','none');
					$("#errorMessage").html(data);
				}
			}
		});
	}
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}


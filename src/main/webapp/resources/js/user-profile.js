$(document).ready(function(){
	    
	// Profile page
	var type = $('#profileType').val();
	if(type != "" || type != null || type != NaN || type.length > 0) {
		if(type.indexOf("2") > -1) {
			$("#div_userPersonalInfo").css('display','none');
			$("#div_userPasswordUpdate").css('display','none');
			$("#div_userAddressInfo").css('display','none');
			$("#div_userOrderHistory").css('display','block');
			$("#div_userWishList").css('display','none');
			
			$("#userOrderLink").addClass("active");
			$("#userWishlistLink").removeClass("active");
			$("#userPasswordLink").removeClass("active");
			$("#userAddressLink").removeClass("active");
			$("#userProfileLink").removeClass("active");
			
			$(".isa_success").css('display','none');
			$(".isa_error").css('display','none');
		}
		else if(type.indexOf("3") > -1) {
			$("#div_userPersonalInfo").css('display','none');
			$("#div_userPasswordUpdate").css('display','none');
			$("#div_userAddressInfo").css('display','none');
			$("#div_userOrderHistory").css('display','none');
			$("#div_userWishList").css('display','block');
			
			$("#userWishlistLink").addClass("active");
			$("#userOrderLink").removeClass("active");
			$("#userPasswordLink").removeClass("active");
			$("#userAddressLink").removeClass("active");
			$("#userProfileLink").removeClass("active");
			
			$(".isa_success").css('display','none');
			$(".isa_error").css('display','none');
		}
	}
	
	
});


// Hide add new address collapse button
$("#div_addNewAddress").on("show.bs.collapse", function(){
	$("#btn_addNewAddressCollapse").css('display','none');
});


// User profile
$("#div_userPasswordUpdate").css('display','none');
$("#div_userAddressInfo").css('display','none');
$("#div_userOrderHistory").css('display','none');
$("#div_userWishList").css('display','none');

$("#userProfileLink").click(function(){     
	$("#loading").css('display','block');
	setInterval(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	
	$("#div_userPasswordUpdate").css('display','none');
	$("#div_userAddressInfo").css('display','none');
	
	$("#div_userOrderHistory").css('display','none');
	$("#div_userWishList").css('display','none');
	
	$("#userProfileLink").addClass("active");
	$("#userWishlistLink").removeClass("active");
	$("#userOrderLink").removeClass("active");
	$("#userPasswordLink").removeClass("active");
	$("#userAddressLink").removeClass("active");
	
	$(".isa_success").css('display','none');
	$(".isa_error").css('display','none');
	
	$("#div_userPersonalInfo").css('display','block');
	
});

	
$("#userAddressLink").click(function(){    
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	$("#div_userPersonalInfo").css('display','none');
	$("#div_userPasswordUpdate").css('display','none');
	$("#div_userOrderHistory").css('display','none');
	$("#div_userWishList").css('display','none');
	
	$("#userAddressLink").addClass("active");
	$("#userWishlistLink").removeClass("active");
	$("#userOrderLink").removeClass("active");
	$("#userPasswordLink").removeClass("active");
	$("#userProfileLink").removeClass("active");
	
	$(".isa_success").css('display','none');
	$(".isa_error").css('display','none');
	
	$("#div_userAddressInfo").css('display','block');
});  

$("#userPasswordLink").click(function(){       
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	$("#div_userPersonalInfo").css('display','none');
	
	$("#div_userAddressInfo").css('display','none');
	$("#div_userOrderHistory").css('display','none');
	$("#div_userWishList").css('display','none');
	
	$("#userPasswordLink").addClass("active");
	$("#userWishlistLink").removeClass("active");
	$("#userOrderLink").removeClass("active");
	$("#userAddressLink").removeClass("active");
	$("#userProfileLink").removeClass("active");
	
	$(".isa_success").css('display','none');
	$(".isa_error").css('display','none');
	
	$("#div_userPasswordUpdate").css('display','block');
});

$("#userOrderLink").click(function(){       
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	$("#div_userPersonalInfo").css('display','none');
	$("#div_userPasswordUpdate").css('display','none');
	$("#div_userAddressInfo").css('display','none');
	
	$("#div_userWishList").css('display','none');
	
	$("#userOrderLink").addClass("active");
	$("#userWishlistLink").removeClass("active");
	$("#userPasswordLink").removeClass("active");
	$("#userAddressLink").removeClass("active");
	$("#userProfileLink").removeClass("active");
	
	$(".isa_success").css('display','none');
	$(".isa_error").css('display','none');
	
	$("#div_userOrderHistory").css('display','block');
});

$("#userWishlistLink").click(function(){     
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	$("#div_userPersonalInfo").css('display','none');
	$("#div_userPasswordUpdate").css('display','none');
	$("#div_userAddressInfo").css('display','none');
	$("#div_userOrderHistory").css('display','none');
	
	
	$("#userWishlistLink").addClass("active");
	$("#userOrderLink").removeClass("active");
	$("#userPasswordLink").removeClass("active");
	$("#userAddressLink").removeClass("active");
	$("#userProfileLink").removeClass("active");
	
	$(".isa_success").css('display','none');
	$(".isa_error").css('display','none');
	
	$("#div_userWishList").css('display','block');
});


function saveUsersPersonalInfo(name, email, mobile) {
	try {
	name = name.replace(/['"]+/g, '');
	email = email.replace(/['"]+/g, '');
	mobile = mobile.replace(/['"]+/g, '');
	
	var newName = document.getElementById('profileUserName').value;
	var newEmail = document.getElementById('profileUserEmail').value;
	var newMobile = document.getElementById('profileUserMobile').value;
	var message = "";
	
	if(name == newName && email == newEmail && mobile == newMobile) {
		return false;
	}
	
	if(name == "" ||  email == "") 
		message = "Please fill name and email before you proceed.";
	else {
		message = validateName(newName);
		message = message + validateEmail(newEmail);
		message = message + validatePhone(newMobile);
	}
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#errorMessage").html(warningTitle + message);
		return false;
	}
	else {
		var json = newName + "####@@@@####" + newEmail + "####@@@@####" + newMobile;
		
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "save-personal-info",
			data : JSON.stringify(json),
			success : function(data) {	
				if(data.indexOf("fa-check") > -1) {
					if(name != newName)
						$("#headerUserName").html(newName);
					$("#div_errorMessage").css('display','none');
					$("#div_successMessage").css('display','block');
					$("#successMessage").html(data);
				} 
				else {
					$("#div_errorMessage").css('display','block');
					$("#div_successMessage").css('display','none');
					$("#errorMessage").html(data);
				}
			}
		});
	}
		
	}
	catch (e) {
		console.error(e.message);
	}
}

function updateUserPassword() {
	try {
	var oldPassword = document.getElementById('profileUserOldPassword').value;
	var newPassword = document.getElementById('profileUserNewPassword').value;
	var confirmNewPassword = document.getElementById('profileUserConfirmNewPassword').value;
	
	var message = "";
	
	if(oldPassword == "" || newPassword == "" || confirmNewPassword == "")
		message = "All Fields are required. Please fill valid details before you proceed.";
	else 
		message = message + validateNewPassword(newPassword, confirmNewPassword);
	
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#errorMessage").html(warningTitle + message);
		return false;
	}
	else {
		var json = oldPassword + "####@@@@####" + newPassword;
	
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "update-user-password",
			data : JSON.stringify(json),
			success : function(data) {	
				if(data.indexOf("fa-check") > -1) {
					$("#div_successMessage").css('display','block');
					$("#div_errorMessage").css('display','none');
					$("#successMessage").html(data);
					
					// Clear all fields
					$("#profileUserOldPassword").val('');
					$("#profileUserNewPassword").val('');
					$("#profileUserConfirmNewPassword").val('');
					
				}
				else {
					$("#div_successMessage").css('display','none');
					$("#div_errorMessage").css('display','block');
					$("#errorMessage").html(data);
				}
			}
		});
	}
	
	}
	catch (e) {
		console.error(e.message);
	}
}

function addUserAddress(page) {
	try {
	var name = document.getElementById('userAddressName').value;
	var streetAddress = document.getElementById('userStreetAddress').value;
	var landmark = document.getElementById('userAddressLandmark').value;
	var city = document.getElementById('userAddressCity').value;
	var state = document.getElementById('userAddressState').value;
	var country = document.getElementById('userAddressCounty').value;
	var mobile = document.getElementById('userAddressMobile').value;
	
	var message = "";
	message = validateUserAddress(name, streetAddress, landmark, city, state, country, mobile);
	
	if(message == "")
		message = message + validatePhone(mobile);
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#errorMessage").html(warningTitle + message);
		return false;
	}
	else {
		var json = name + "####@@@@####" + streetAddress + "####@@@@####" + landmark + "####@@@@####" + city + "####@@@@####" + state + "####@@@@####" + country + "####@@@@####" + mobile + "####@@@@####" + page;
	
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "add-user-address",
			data : JSON.stringify(json),
			success : function(data) {	
				if(data.indexOf("fa-check") > -1) {
					$("#div_successMessage").css('display','block');
					$("#div_errorMessage").css('display','none');
					$("#checkoutAddressCompleted").removeAttr('style');
					
					// Clear all fields
					$("#userAddressName").val('');
					$("#userStreetAddress").val('');
					$("#userAddressLandmark").val('');
					$("#userAddressCity").val('');
					$("#userAddressState").val('');
					$("#userAddressCounty").val('');
					$("#userAddressMobile").val('');
					
					// Collapse address form
					$("#div_addNewAddress").collapse('hide');
					$("#btn_addNewAddressCollapse").css('display','block');
					
					var  addressDetail = "";
					var addressId = data.replace( /^\D+/g, '');
					addressDetail = "<div id=\"div_address" + addressId + "\" class=\"col-md-3 alert alert-info\" role=\"alert\" " +
						" style=\"margin-left: 10px; width: 185px; height: 250px\">" +
						" <strong>" + name + "</strong><br>" +
						streetAddress + "<br>" + landmark + "<br>" + city + " " + state + "&nbsp;" + country + "<br>" +
						"Mobile:&nbsp;" + mobile + "<br><br>" + 
						"<button type=\"button\" class=\"common-btn-border-no-padding\" style=\"text-align: center;\" " +
						"onclick=\"deleteUserAddress('" + addressId + "'); return false;\">Delete Address</button> </div> ";
					
					
					$("#div_addressList").append(addressDetail);
					
					data = data.replace(addressId, '');
					$("#successMessage").html(data);
										
					// Switch to Order Summary
					$('#checkoutOrderSummaryBody').collapse('show');
					$('#checkoutAddresBody').collapse('hide');
					$('#checkoutPaymentBody').collapse('hide');
					$("#checkoutOrderSummaryLink").removeClass("href-not-active");
				}
				else {
					$("#div_successMessage").css('display','none');
					$("#div_errorMessage").css('display','block');
					$("#errorMessage").html(data);
				}
			}
		});
	}
	
	}
	catch (e) {
		console.error(e.message);
	}
}

function cancelAddNewAddress() {
	// Clear all fields
	$("#userAddressName").val('');
	$("#userStreetAddress").val('');
	$("#userAddressLandmark").val('');
	$("#userAddressCity").val('');
	$("#userAddressState").val('');
	$("#userAddressCounty").val('');
	$("#userAddressMobile").val('');
	
	// Collapse address form
	$("#div_addNewAddress").collapse('hide');
	$("#btn_addNewAddressCollapse").css('display','block');
}

function deleteUserAddress(addresId) {
	try {
	addresId = addresId.replace(/['"]+/g, '');

	var json = addresId;
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "delete-user-address",
		data : JSON.stringify(json),
		success : function(data) {	
			if(data.indexOf("fa-check") > -1) {
				$("#div_successMessage").css('display','block');
				$("#div_errorMessage").css('display','none');
				$("#successMessage").html(data);
				$("#div_address" + addresId).css('display','none');
			}
			else {
				$("#div_successMessage").css('display','none');
				$("#div_errorMessage").css('display','block');
				$("#errorMessage").html(data);
			}
		}
	});
	
	}
	catch (e) {
		console.error(e.message);
	}
}

function saveForgotPassword() {
	try {
	var email = document.getElementById('forgotPasswordEmail').value; 
	var newPassword = document.getElementById('forgotNewPassword').value;
	var confirmNewPassword = document.getElementById('forgotConfirmNewPassword').value;
	
	var message = "";
	if(email == "" || newPassword == "" || confirmNewPassword == "") 
		message = "All Fields are required. Please fill valid details before you proceed.";
	else {
		message = validateEmail(email);
		message = message + validateNewPassword(newPassword, confirmNewPassword);
	}
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#errorMessage").html(warningTitle + message);
		return false;
	}
	else {
		var json = email + "####@@@@####" + newPassword;
	
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "save-forgot-password",
			data : JSON.stringify(json),
			success : function(data) {	
				if(data.indexOf("fa-check") > -1) {
					$("#div_successMessage").css('display','block');
					$("#div_errorMessage").css('display','none');
					$("#successMessage").html(data);
					
					// Clear all fields
					$("#forgotNewPassword").val('');
					$("#forgotConfirmNewPassword").val('');
					
				}
				else {
					$("#div_successMessage").css('display','none');
					$("#div_errorMessage").css('display','block');
					$("#errorMessage").html(data);
				}
			}
		});
	}
	
	}
	catch (e) {
		console.error(e.message);
	}
}


function cancelOrder(productCode, orderId) {
	try {
	productCode = productCode.replace(/['"]+/g, '');
	orderId = orderId.replace(/['"]+/g, '');

	var json =  productCode + "####@@@@####" + orderId;
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "cancel-order",
		data : JSON.stringify(json),
		success : function(data) {	
			if(data.indexOf("fa-check") > -1) {
				$("#div_successMessage").css('display','block');
				$("#div_errorMessage").css('display','none');
				$("#successMessage").html(data);
				$("#orderStatus" + productCode).html("Cancelled");
				$("#link_cancelOrder" + productCode).css('display','none');
			}
			else {
				$("#div_successMessage").css('display','none');
				$("#div_errorMessage").css('display','block');
				$("#errorMessage").html(data);
			}
		}
	});
	
	}
	catch (e) {
		console.error(e.message);
	}
}
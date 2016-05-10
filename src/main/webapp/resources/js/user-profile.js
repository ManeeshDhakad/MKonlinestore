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



// User profile
$("#div_userPasswordUpdate").css('display','none');
$("#div_userAddressInfo").css('display','none');
$("#div_userOrderHistory").css('display','none');
$("#div_userWishList").css('display','none');

$("#userProfileLink").click(function(){     
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	$("#div_userPasswordUpdate").css('display','none');
	$("#div_userAddressInfo").css('display','none');
	$("#div_userPersonalInfo").css('display','block');
	$("#div_userOrderHistory").css('display','none');
	$("#div_userWishList").css('display','none');
	
	$("#userProfileLink").addClass("active");
	$("#userWishlistLink").removeClass("active");
	$("#userOrderLink").removeClass("active");
	$("#userPasswordLink").removeClass("active");
	$("#userAddressLink").removeClass("active");
	
	$(".isa_success").css('display','none');
	$(".isa_error").css('display','none');
});

	
$("#userAddressLink").click(function(){    
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	$("#div_userPersonalInfo").css('display','none');
	$("#div_userPasswordUpdate").css('display','none');
	$("#div_userAddressInfo").css('display','block');
	$("#div_userOrderHistory").css('display','none');
	$("#div_userWishList").css('display','none');
	
	$("#userAddressLink").addClass("active");
	$("#userWishlistLink").removeClass("active");
	$("#userOrderLink").removeClass("active");
	$("#userPasswordLink").removeClass("active");
	$("#userProfileLink").removeClass("active");
	
	$(".isa_success").css('display','none');
	$(".isa_error").css('display','none');
});  

$("#userPasswordLink").click(function(){       
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
	$("#div_userPersonalInfo").css('display','none');
	$("#div_userPasswordUpdate").css('display','block');
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
});

$("#userOrderLink").click(function(){       
	$("#loading").css('display','block');
	setTimeout(function(){
		$("#loading").css('display','none');
	}, 1000);
	
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
	$("#div_userWishList").css('display','block');
	
	$("#userWishlistLink").addClass("active");
	$("#userOrderLink").removeClass("active");
	$("#userPasswordLink").removeClass("active");
	$("#userAddressLink").removeClass("active");
	$("#userProfileLink").removeClass("active");
	
	$(".isa_success").css('display','none');
	$(".isa_error").css('display','none');
});


function saveUsersPersonalInfo(name, email, mobile) {
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
	
	message = validateName(newName);
	message = message + validateEmail(newEmail);
	message = message + validatePhone(newMobile);
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#div_errorMessage").html(warningTitle + message);
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
					$("#div_successMessage").html(data);
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

function updateUserPassword() {
	var oldPassword = document.getElementById('profileUserOldPassword').value;
	var newPassword = document.getElementById('profileUserNewPassword').value;
	var confirmNewPassword = document.getElementById('profileUserConfirmNewPassword').value;
	
	var message = "";
	message = validateOldPassword(oldPassword);
	message = message + validateNewPassword(newPassword, confirmNewPassword);
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#div_errorMessage").html(warningTitle + message);
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
					$("#div_successMessage").html(data);
					
					// Clear all fields
					$("#profileUserOldPassword").val('');
					$("#profileUserNewPassword").val('');
					$("#profileUserConfirmNewPassword").val('');
					
				}
				else {
					$("#div_successMessage").css('display','none');
					$("#div_errorMessage").css('display','block');
					$("#div_errorMessage").html(data);
				}
			}
		});
	}
}

function addUserAddress(page) {
		
	var name = document.getElementById('userAddressName').value;
	var streetAddress = document.getElementById('userStreetAddress').value;
	var landmark = document.getElementById('userAddressLandmark').value;
	var city = document.getElementById('userAddressCity').value;
	var state = document.getElementById('userAddressState').value;
	var country = document.getElementById('userAddressCounty').value;
	var mobile = document.getElementById('userAddressMobile').value;
	
	var message = "";
	message = validateUserAddress(name, streetAddress, landmark, city, state, country, mobile);
	message = message + validatePhone(mobile);
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#div_errorMessage").html(warningTitle + message);
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
					$("#div_successMessage").html(data);
					$("#checkoutAddressCompleted").removeAttr('style');
					
					// Clear all fields
					$("#userAddressName").val('');
					$("#userStreetAddress").val('');
					$("#userAddressLandmark").val('');
					$("#userAddressCity").val('');
					$("#userAddressState").val('');
					$("#userAddressCounty").val('');
					$("#userAddressMobile").val('');
					
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
}

function deleteUserAddress(addresId) {
	
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
				$("#div_successMessage").html(data);
				$("#div_address" + addresId).css('display','none');
			}
			else {
				$("#div_successMessage").css('display','none');
				$("#div_errorMessage").css('display','block');
				$("#div_errorMessage").html(data);
			}
		}
	});
}

function saveForgotPassword() {
	
	var email = document.getElementById('forgotPasswordEmail').value; 
	var newPassword = document.getElementById('forgotNewPassword').value;
	var confirmNewPassword = document.getElementById('forgotConfirmNewPassword').value;
	
	var message = "";
	message = validateEmail(email);
	message = message + validateNewPassword(newPassword, confirmNewPassword);
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#div_errorMessage").html(warningTitle + message);
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
					$("#div_successMessage").html(data);
					
					// Clear all fields
					$("#forgotNewPassword").val('');
					$("#forgotConfirmNewPassword").val('');
					
				}
				else {
					$("#div_successMessage").css('display','none');
					$("#div_errorMessage").css('display','block');
					$("#div_errorMessage").html(data);
				}
			}
		});
	}
}


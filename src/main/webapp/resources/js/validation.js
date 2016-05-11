function validateName(name) {
	var message = "";
	var nameRegex = /^[A-Za-z\s]+$/;
	
	if(!nameRegex.test(name)) {
		message = "Name should contain only alphabates.<br>";
	}
	
	return message;
}


function validateEmail(email) { 
    var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var message = "";
    
	if(!emailRegex.test(email)) {
		message = "Email is not valid. Please enter valid email.<br>";
	}
	
	return message;
}

function validatePhone(mobile) { 
    var mobileRegex = /^[789]\d{9}$/; 
    var message = "";
    
	if(!mobileRegex.test(mobile)) {
		message = "Mobile number is not valid . Please enter valid 10 digit mobile number.<br>";
	}
	
	return message;
}

function validatePassword(password, confirmPassword) { 
	var message = "";
    
    if( password != confirmPassword) {
    	message = "Password and Confirm Password field not matched.<br>";
    }
    else if(password.length < 6) {
		message = "Password and Confirm Password should be greater than or equal to 6 digit.<br>";
	}
	
	return message;
}


function validateNewPassword(newPassword, confirmNewPassword) { 
	var message = "";
    
    if( newPassword != confirmNewPassword) {
    	message = "New Password and Confirm New Password field not matched.<br>";
    }
    else if(newPassword.length < 6) {
		message = "New Password and Confirm New Password should be greater than or equal to 6 digit.<br>";
	}
	
	return message;
}

function validateUserAddress(name, streetAddress, landmark, city, state, country, mobile) {
	var message = "";
    
    if(name == "" || streetAddress == "" || landmark =="" || city == "" || state == "" || country == "" || mobile == "") {
    	message = "All Fields are required. Please fill valid address details.";
    }
    
    return message;
}
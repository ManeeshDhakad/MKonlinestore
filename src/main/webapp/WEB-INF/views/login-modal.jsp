<div id="login-modal" class="modal fade " tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" >
	<div class="modal-dialog ">
		
			<div class="modal-body">	
				<div id="modal-loading">
  					<img id="modal-loading-image" class="img-responsive" src="<%=request.getContextPath()%>/resources/images/loading.gif" alt="Loading..." />
				</div>
					
  				<div class="login-box">
  					<a href="#" style="float: right; color: black; font-size: 20px;" onclick="closeLoginModal(); return false;"><span class="glyphicon glyphicon-remove-circle"> </span></a>
					<br>
					<div id="div_loginModelSuccessMessage" class="isa_success_modal" style="display: none">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    					<span id="loginModelSuccessMessage"></span>
					</div>
					<div id="div_loginModelErrorMessage" class="isa_error_modal" style="display: none">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    					<span id="loginModelErrorMessage"></span>
					</div>
				
  					<h2 style="margin-top: 5px;"><center>Login to your account</center></h2>
    				<div class="lb-header">
      					<a href="#" class="active" id="login-box-link">Login</a>
      					<a href="#" id="signup-box-link">Sign Up</a>
    				</div>
    				
    				
    				
    				<div class="social-login">
  
    				<div class="email-login" >
 						<center>
      					<div class="input-group">
      						<span class="input-group-addon glyphicon glyphicon-envelope" id="icon_loginEmail"></span>
      						<input id="loginEmail" name="loginEmail" type="text" class="form-control common-input-transparent" aria-describedby="icon_loginEmail" placeholder="Enter Email*" />
      					</div>
      					
      					
      					<div class="input-group">
      						<span class="input-group-addon glyphicon glyphicon-lock" id="icon_loginPassword"></span>
      						<input id="loginPassword" name="loginPassword" type="password" class="form-control common-input-transparent" placeholder="Enter Password*" aria-describedby="icon_loginPassword" />
      					</div>
      					
      					<div>
      						<button id="loginBTN" class="common-btn" onclick="loginUser(); return false;" style="width: 50%" > 
      							Log in
      						</button>
      					</div>
      
      					<button type="button" class="btn btn-link" onclick="forgotPassword()">Forgot password?</button>
      					</center>
    				</div>
    
    				<div class="email-signup" >
    					<center>
    					<div class="input-group">
    						<span class="input-group-addon glyphicon glyphicon-user" id="icon_signupName"></span>
    						<input id="signupName" name="signupName" type="text" class="form-control common-input-transparent" placeholder="Enter Name*" aria-describedby="icon_signupName" />
    					</div>
    					
      					<div class="input-group">
      						<span class="input-group-addon glyphicon glyphicon-envelope" id="icon_signupEmail"></span>
      						<input id="signupEmail" name="signupEmail" type="text" class="form-control common-input-transparent" placeholder="Enter Email*" aria-describedby="icon_signupEmail" />
      					</div>
      					
      					<div class="input-group">
      						<span class="input-group-addon glyphicon glyphicon-lock" id="icon_signupPassword"></span>
      						<input id="signupPassword" name="signupPassword" type="password" class="form-control common-input-transparent" placeholder="Enter Password*" aria-describedby="icon_signupPassword" />
      					</div>
      					
      					<div class="input-group">
      						<span class="input-group-addon glyphicon glyphicon-lock" id="icon_signupCofirmPassword"></span>
      						<input id="signupPasswordConfirm" name="signupPasswordConfirm" type="password" class="form-control common-input-transparent" placeholder="Enter Confirm Password*" saria-describedby="icon_signupCofirmPassword" />
      					</div>
            					
      					<div>
      						<button id="signupBTN" class="common-btn" onclick="signupUser(); return false;" style="width: 50%" >
      							Sign Up
      						</button> 
      					</div>
      					</center>
    				</div>
  				</div>
				<div class="clearfix"></div>

		</div>
	</div>
</div>

 
<div id="login-modal" class="modal fade " tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" >
	<div class="modal-dialog ">
		
			<div class="modal-body">	
			
  				<div class="login-box">
  					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"> </span></button>
					<br>
					<div id="div_loginModelSuccessMessage" class="isa_success_modal" style="display: none">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    					<span id="successMessage"></span>
					</div>
					<div id="div_loginModelErrorMessage" class="isa_error_modal" style="display: none">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    					<span id="errorMessage"></span>
					</div>
				
  					<h3><center>Login to your account</center></h3>
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
      						<input type="submit" class="common-btn" value="Log in" onclick="loginUser(); return false;" style="width: 50%" /> 
      					</div>
      
      					<button type="button" class="btn btn-link" onclick="forgotPassword()">Forgot password?</button>
      					</center>
    				</div>
    
    				<div class="email-signup" >
    					<center>
    					<div class="input-group">
    						<span class="input-group-addon glyphicon glyphicon-user" id="icon_signupName"></span>
    						<input id="signupName" name="signupName" type="text" class="form-control common-input-transparent" placeholder="Enter Name*" aria-describedby="icon_signupName"/>
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
            					
      					<div><input type="submit" class="common-btn" value="Sign Up" onclick="signupUser(); return false;" style="width: 50%" /> </div>
      					</center>
    				</div>
  				</div>
				<div class="clearfix"></div>

		</div>
	</div>
</div>

 
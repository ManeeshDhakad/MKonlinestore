<div id="login-modal" class="modal fade " tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog ">
		
			<div class="modal-body">			
  				<div class="login-box">
  					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"> </span></button>
					<br>
					<div id="div_loginModelSuccessMessage" class="isa_success_modal" style="display: none">
    					<span id="successMessage"></span>
					</div>
					<div id="div_loginModelErrorMessage" class="isa_error_modal" style="display: none">
    					<span id="errorMessage"></span>
					</div>
				
  					<h3><center>Login to your account</center></h3>
    				<div class="lb-header">
      					<a href="#" class="active" id="login-box-link">Login</a>
      					<a href="#" id="signup-box-link">Sign Up</a>
    				</div>
    				
    				<div class="social-login">
    				
<!--     				<div> -->
    		
<!--     					<div id="status"> -->
<!-- 						</div> -->
<!-- 						<a href="#" class="common-btn-fb" onclick='FB.login(function(response){});'><i class="fa fa-facebook fa-lg"></i>Facebook</a> -->
<!--       					<a href="#" onclick="handleAuthClick(event)"><i class="fa fa-google-plus fa-lg"></i>Google+</a> -->
<!--     				</div> -->
    
    				<div class="email-login" >
      					<div class="u-form-group"><input id="loginEmail" name="loginEmail" type="text" class="email" placeholder="Email" /></div>
      					
      					<div class="u-form-group"><input id="loginPassword" name="loginPassword" type="password" class="password" placeholder="Password" /></div>
      					
      					<div class="u-form-group"><input type="submit" class="signin-btn" value="Log in" onclick="loginUser(); return false;"/> </div>
      
      					<button type="button" class="btn btn-link" onclick="forgotPassword()">Forgot password?</button>
    				</div>
    
    				<div class="email-signup" >
    					<div class="u-form-group"><input id="signupName" name="signupName" type="text" class="name" placeholder="Name"/></div>
    					
      					<div class="u-form-group"><input id="signupEmail" name="signupEmail" type="text" class="email" placeholder="Email" /></div>
      					
      					<div class="u-form-group"><input id="signupPassword" name="signupPassword" type="password" class="password" placeholder="Password" /></div>
      					
      					<div class="u-form-group"><input id="signupPasswordConfirm" name="signupPasswordConfirm" type="password" class="password" placeholder="Confirm Password" /></div>
            					
      					<div class="u-form-group"><input type="submit" class="signin-btn" value="Sign Up" onclick="signupUser(); return false;" /> </div>
    				</div>
  				</div>
				<div class="clearfix"></div>
			

		</div>
	</div>
</div>

 
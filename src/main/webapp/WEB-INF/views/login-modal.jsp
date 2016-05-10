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
					</div><br>
				
  					<h3><center>Login to your account</center></h3>
    				<div class="lb-header">
      					<a href="#" class="active" id="login-box-link">Login</a>
      					<a href="#" id="signup-box-link">Sign Up</a>
    				</div>
    				
    				<div class="social-login">
    				
    				<div>
    		
    					<div id="status">
						</div>
						<a href="#" class="common-btn-fb" onclick='FB.login(function(response){});'><i class="fa fa-facebook fa-lg"></i>Facebook</a>
      					<a href="#" onclick="handleAuthClick(event)"><i class="fa fa-google-plus fa-lg"></i>Google+</a>
    				</div>
    
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


<script type="text/javascript">
//This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    testAPI();
  } else if (response.status === 'not_authorized') {
    // The person is logged into Facebook, but not your app.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  } else {
    // The person is not logged into Facebook, so we're not sure if
    // they are logged into this app or not.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into Facebook.';
  }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

window.fbAsyncInit = function() {
FB.init({
  appId      : '{your-app-id}',
  cookie     : true,  // enable cookies to allow the server to access 
                      // the session
  xfbml      : true,  // parse social plugins on this page
  version    : 'v2.5' // use graph api version 2.5
});

// Now that we've initialized the JavaScript SDK, we call 
// FB.getLoginStatus().  This function gets the state of the
// person visiting this page and can return one of three states to
// the callback you provide.  They can be:
//
// 1. Logged into your app ('connected')
// 2. Logged into Facebook, but not your app ('not_authorized')
// 3. Not logged into Facebook and can't tell if they are logged into
//    your app or not.
//
// These three cases are handled in the callback function.

FB.getLoginStatus(function(response) {
  statusChangeCallback(response);
});

};

// Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', function(response) {
    console.log('Successful login for: ' + response.name);
    document.getElementById('status').innerHTML =
      'Thanks for logging in, ' + response.name + '!';
  });
}



</script>


<script type="text/javascript">
      // Your Client ID can be retrieved from your project in the Google
      // Developer Console, https://console.developers.google.com
      var CLIENT_ID = '935100684627-ohh4tutqkevubi138q6fo00opgnc9m35.apps.googleusercontent.com';

      var SCOPES = ['https://www.googleapis.com/auth/drive.metadata.readonly'];

      /**
       * Check if current user has authorized this application.
       */
      function checkAuth() {
        gapi.auth.authorize(
          {
            'client_id': CLIENT_ID,
            'scope': SCOPES.join(' '),
            'immediate': true
          }, handleAuthResult);
      }

      /**
       * Handle response from authorization server.
       *
       * @param {Object} authResult Authorization result.
       */
      function handleAuthResult(authResult) {
        var authorizeDiv = document.getElementById('authorize-div');
        if (authResult && !authResult.error) {
          // Hide auth UI, then load client library.
          authorizeDiv.style.display = 'none';
          loadDriveApi();
        } else {
          // Show auth UI, allowing the user to initiate authorization by
          // clicking authorize button.
          authorizeDiv.style.display = 'inline';
        }
      }

      /**
       * Initiate auth flow in response to user clicking authorize button.
       *
       * @param {Event} event Button click event.
       */
      function handleAuthClick(event) {
        gapi.auth.authorize(
          {client_id: CLIENT_ID, scope: SCOPES, immediate: false},
          handleAuthResult);
        return false;
      }

      /**
       * Load Drive API client library.
       */
      function loadDriveApi() {
        gapi.client.load('drive', 'v3', listFiles);
      }

      /**
       * Print files.
       */
      function listFiles() {
        var request = gapi.client.drive.files.list({
            'pageSize': 10,
            'fields': "nextPageToken, files(id, name)"
          });

          request.execute(function(resp) {
            appendPre('Files:');
            var files = resp.files;
            if (files && files.length > 0) {
              for (var i = 0; i < files.length; i++) {
                var file = files[i];
                appendPre(file.name + ' (' + file.id + ')');
              }
            } else {
              appendPre('No files found.');
            }
          });
      }

      /**
       * Append a pre element to the body containing the given message
       * as its text node.
       *
       * @param {string} message Text to be placed in pre element.
       */
      function appendPre(message) {
        var pre = document.getElementById('output');
        var textContent = document.createTextNode(message + '\n');
        pre.appendChild(textContent);
      }

    </script>
    <script src="https://apis.google.com/js/client.js?onload=checkAuth">
    </script>
    
 
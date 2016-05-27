
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>MKonlinestore</title>

<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/mk-logo.png">
</head>

<body>

	<div id="header-container">
		<jsp:include page="header-navbar.jsp" />
	</div>

	<div>
		<div class="col-md-2 hidden-xs hidden-sm"></div>
		<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
			<div class="panel panel-success" align="center">
				<div class="panel-heading" >
					<h1 class="panel-title">
						<strong>Update new password</strong>
					</h1>
				</div>

				<div class="panel-body">
					<div id="div_successMessage" class="isa_success"
						style="display: none">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span id="successMessage">${message}</span>
					</div>
					<div id="div_errorMessage" class="isa_error" style="display: none">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span id="errorMessage">${message}</span>
					</div>

					<div align="center">

      					<div class="input-group" style="margin-left: 9%">
      						<span class="input-group-addon glyphicon glyphicon-envelope" id="icon_forgotPasswordEmail"></span>
							<input type="text" id="forgotPasswordEmail" name="forgotPasswordEmail" aria-describedby="icon_forgotPasswordEmail" style="width: 80%" class="form-control common-input-transparent" placeholder="Enter Email*" />
						</div>

						<div class="input-group" style="margin-left: 9%">
      						<span class="input-group-addon glyphicon glyphicon-lock" id="icon_forgotNewPassword"></span>
							<input type="password" id="forgotNewPassword" aria-describedby="icon_forgotNewPassword" style="width: 80%"
									name="forgotNewPassword" class="form-control common-input-transparent" placeholder="Enter New Password*" />
						</div>

						<div class="input-group" style="margin-left: 9%">
      						<span class="input-group-addon glyphicon glyphicon-lock" id="icon_forgotConfirmNewPassword"></span>
							<input type="password" id="forgotConfirmNewPassword" aria-describedby="icon_forgotConfirmNewPassword" style="width: 80%"
									name="forgotConfirmNewPassword" class="form-control common-input-transparent"
									placeholder="Enter Confirm New Password*" />
							
						</div>

						<div class="input-group" style="margin-left: 9%">
      						<span class="input-group-addon glyphicon glyphicon-send" id="icon_savePasswordBTN" style="display: none"></span>
							<input type="submit" style="height: 45px; width: 82%" id="savePasswordBTN" class="form-control common-btn" value="Save Changes" aria-describedby="icon_savePasswordBTN" onclick="saveForgotPassword(); return false;" />
						
						</div>

					</div>


				</div>
			</div>

		</div>

		<div class="col-md-2 hidden-xs hidden-sm"></div>
	</div>

	
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 padding-zero" id="footer-container">
		<jsp:include page="footer.jsp" />
	</div>
	
	<jsp:include page="login-modal.jsp" />
	
	<!-- JavaScript -->
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/validation.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/user-profile.js"></script>

</body>
</html>

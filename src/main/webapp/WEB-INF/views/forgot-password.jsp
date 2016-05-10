
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />

<title>MKonlinestore</title>

<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/mk-logo.png">
</head>

<body>

	<div id="header-container">
		<jsp:include page="header-navbar.jsp" />
	</div>

	<div>
		<div id="body-area-left-container" class="col-md-2"></div>

		<div id="body-area-middle-container" class="col-md-8">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h1 class="panel-title">
						<strong>Forgot Password? Update new password!</strong>
					</h1>
				</div>

				<div class="panel-body">
					<div id="div_successMessage" class="isa_success"
						style="display: none">
						<span id="successMessage">${message}</span>
					</div>
					<div id="div_errorMessage" class="isa_error" style="display: none">
						<span id="errorMessage">${message}</span>
					</div>

					<div>

						<div class="row">
							<div class="col-md-4">Email</div>

							<div class="col-md-4">
								<input type="text" id="forgotPasswordEmail"
									name="forgotPasswordEmail" class="common-input-text"
									placeholder="Email" />
							</div>
						</div>

						<div class="row">
							<div class="col-md-4">New Password</div>   

							<div class="col-md-4">
								<input type="password" id="forgotNewPassword"
									name="forgotNewPassword" class="common-input-text"
									placeholder="New Password" "/>
							</div>
						</div>

						<div class="row">
							<div class="col-md-4">Confirm New Password</div>

							<div class="col-md-4">
								<input type="password" id="forgotConfirmNewPassword"
									name="forgotConfirmNewPassword" class="common-input-text"
									placeholder="Confirm New Password" />
							</div>
						</div>

						<div class="row">
							<div class="col-md-4"></div>

							<div class="col-md-4">
								<input type="submit" class="common-btn" value="Save Changes"
									onclick="saveForgotPassword(); return false;" />
							</div>
						</div>

					</div>


				</div>
			</div>

		</div>

		<div id="body-area-left-container" class="col-md-2"></div>
	</div>

	
	<div class="col-md-12 padding-zero" id="footer-container">
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

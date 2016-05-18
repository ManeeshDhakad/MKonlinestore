
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

<body >

	<div id="header-container">
		<jsp:include page="header-navbar.jsp" />
	</div>

	<div >
		<div class="col-md-2 hidden-xs hidden-sm"></div>
		<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
			<div class="panel panel-success">
				<div class="panel-heading">
   					<h1 class="panel-title"><strong>Contact us</strong></h1>
  				</div>
  				
  				<div class="panel-body">
				<div id="div_successMessage" class="isa_success" style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    				<span id="successMessage">${message}</span>
				</div>
				<div id="div_errorMessage" class="isa_error" style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    				<span id="errorMessage">${message}</span>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="panel panel-info">
							<div class="panel-heading">
   							 	<h1 class="panel-title">MKonlinestore.com Contact Details</h1>
  							</div>
 						 	<div class="panel-body">
								Phone : 08010101010 <br /> 
								Email : mkonlinestore@gmail.com <br />
								Address : Bangalore Karnataka, India
								
								</p>
  							</div>
  						</div>
						
					</div>

					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="panel panel-info">
							<div class="panel-heading">
   							 	<h1 class="panel-title">Send your feedback</h1>
  							</div>
 						 	
 						 	<div class="panel-body">
 						 		<div class="row">
									<div class="col-md-4">Name</div>

									<div class="col-md-8">
										<input type="text" id="feedbackMailName" name="feedbackMailName" class="common-input-text" placeholder="Name" />
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-4">Email</div>

									<div class="col-md-8">
										<input type="text" id="feedbackMailEmail" name="feedbackMailEmail" class="common-input-text" placeholder="Email" />
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-4">Subject</div>

									<div class="col-md-8">
										<input type="text" id="feedbackMailSubject" name="feedbackMailSubject" class="common-input-text" placeholder="Subject" />
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-4">Message</div>

									<div class="col-md-8">
										<textarea id="feedbackMailMessage" name="feedbackMailMessage" class="common-input-textarea" placeholder="Messages" style="height : 100px;" ></textarea>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-4"></div>

									<div class="col-md-8">
										<input type="submit" class="common-btn" onclick="sendFeedbackMail(); return false;" value="Send Mail" />
									</div>
								</div>
								 
								
								
								
								
							</div>
						</div>
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
	

</body>
</html>

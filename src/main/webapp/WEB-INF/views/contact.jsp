
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
				<div class="panel-heading" align="center">
   					<h3>Contact us</h3>  
   					<p>Phone : +91 7847827212  <br>
   					Email : <a style="color: #848484" href="mailto:mkonlinestore16@gmail.com?subject=Customer%20Feedback">mkonlinestore16@gmail.com</a>
   					</p>
   					
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

				<div align="center" >
								<h4>Send your feedback</h4>
								
  						
 						 		<div class="input-group"    style="margin-left: 12%">
									<span class="input-group-addon glyphicon glyphicon-user" id="icon_feedbackMailName"></span>
									<input type="text" id="feedbackMailName" name="feedbackMailName" class="form-control common-input-transparent" aria-describedby="icon_feedbackMailName" placeholder="Enter Name*" style="width: 70%" />
								</div>
								
								<div class="input-group" style="margin-left: 12%">
									<span class="input-group-addon glyphicon glyphicon-envelope" id="icon_feedbackMailEmail"></span>
									<input type="text" id="feedbackMailEmail" name="feedbackMailEmail" class="form-control common-input-transparent" aria-describedby="icon_feedbackMailEmail" placeholder="Enter Email*" style="width: 70%" />
								</div>
								
								<div class="input-group" style="margin-left: 12%">
									<span class="input-group-addon glyphicon glyphicon-header" id="icon_feedbackMailSubject"></span>
									<input type="text" id="feedbackMailSubject" name="feedbackMailSubject" class="form-control common-input-transparent" aria-describedby="icon_feedbackMailSubject" placeholder="Enter Subject*" style="width: 70%"  />
								</div>
								
								<div class="input-group" style="margin-left: 12%">
									<span class="input-group-addon glyphicon glyphicon-edit" id="icon_feedbackMailMessage"></span>
									<textarea id="feedbackMailMessage" name="feedbackMailMessage" class="form-control common-input-transparent" aria-describedby="icon_feedbackMailMessage" placeholder="Enter Messages*" style="height : 100px; width: 70%" ></textarea>
								</div>
								
								<div class="input-group" style="margin-left: 12%">
									<span class="input-group-addon glyphicon glyphicon-send" id="icon_sendMailMessage" style="display: none"></span>
									<input type="submit" class="form-control common-btn" onclick="sendFeedbackMail(); return false;" style="width: 73%; height: 45px" aria-describedby="icon_sendMailMessage" value="send mail" />
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
	
<script>
	$(document).ready(function(){
		$("#menu_contact").addClass("mainmenu-underline");
	});
</script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
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

<body >

	<div id="header-container">
		<jsp:include page="header-navbar.jsp" />
	</div>
	<div >
		<div id="body-area-left-container" class="col-md-2"></div>

		<div id="body-area-middle-container" class="col-md-8">
			<div id="body-container">
				<div id="div_successMessage" class="isa_success" style="display: none">
    				<span id="successMessage">${message}</span>
				</div>
				<div id="div_errorMessage" class="isa_error" style="display: none">
    				<span id="errorMessage">${message}</span>
				</div>
				
				<div class="panel panel-success">
					<div class="panel-heading">
   						<h1 class="panel-title"><strong>About MKonlinestore.com</strong> </h1>
  					</div>
 					<div class="panel-body">
 						<p>MKonlinestore is India's Ultimate Online Shopping
						Destination, MKonlinestore's vision is to create India's most
						impactful digital commerce ecosystem that creates life-changing
						experiences for buyers. In March 2016, Maneesh Dhakad, started
						MKonlinesotre.com. The trend of online shopping is becoming a
						household name and so is MKonlinestore. Once the registration
						process is done, you can start buying your product Doesn't it sound
						thrilling? Of course, it is and the excitement will build up with
						every order you receive.</p>
					</div>
  				</div>
  				
  				<div class="panel panel-success">
					<div class="panel-heading">
   						<h1 class="panel-title"><strong>About Developer</strong> </h1>
  					</div>
 					<div class="panel-body">
 						<strong>Maneesh Dhakad</strong><br>
 						SDE - 2 at Teradata <br/>
 						MCA - NIT Trichy <br/>
 						
 						
						<br /> Follow me on: 
						<a 	href="https://www.facebook.com/maneesh.dhakad"><img
							style="width: 30px; height: 30px"
							src="<%=request.getContextPath()%>/resources/images/facebook.png" /></a>
						<a href="https://in.linkedin.com/in/maneesh-dhakad-525ba485"><img
							style="width: 30px; height: 30px"
							src="<%=request.getContextPath()%>/resources/images/linked-in.png" /></a>
						<a href="https://github.com/ManeeshDhakad"><img
							style="width: 35px; height: 35px"
							src="<%=request.getContextPath()%>/resources/images/github.png" /></a>
					</div>
  				</div>					
			</div>

			<div id="body-area-left-container" class="col-md-2"></div>
		</div>

	</div>

	<div class="col-md-12 padding-zero" id="footer-container">
		<jsp:include page="footer.jsp" />
	</div>

	<jsp:include page="login-modal.jsp" />

	<!-- JavaScript -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js">
		
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
		
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/validation.js"></script>
	
</body>
</html>

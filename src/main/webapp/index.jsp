
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	

<title>MKonlinestore</title>

<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/cart.png">
</head>

<body>

	<div id="header-container">
		<jsp:include page="/WEB-INF/views/header-navbar.jsp" />
	</div>

	<div class="col-md-2 hidden-xs hidden-sm"></div>
	<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
	
			<div id="div_successMessage" class="isa_success"
				style="display: none">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<span id="successMessage">${message}</span>
			</div>
			<div id="div_errorMessage" class="isa_error" style="display: none">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<span id="errorMessage">${message}</span>
			</div>

			<jsp:include page="/WEB-INF/views/offer-slider.jsp" />

			<div id="new-arrivals" class="panel panel-success">
				<div class="panel-heading">
					<h1 class="panel-title">
						<strong>New arrivals</strong>
					</h1>
				</div>

				<div class="panel-body">
					<div class="row product-img-border">
						<c:set var="newArrivalsCount" value="0" scope="page" />
						<c:forEach items="${mansProductList}" var="mansProduct">
						
							<c:if test="${ newArrivalsCount < 3}">
								<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
									<form action="product-details" method="get">
										<input name="productCode" type="text"
											value="${mansProduct.productCode}" style="display: none" /> <input
											type="image" src="<%=request.getContextPath()%>/resources/images/product/300x400/${mansProduct.productCode}.jpg"
											title="${mansProduct.productName}" class="img-responsive"
											alt="Submit"> ${mansProduct.productName} <br /> <strong>Rs.
											${mansProduct.productPrice}</strong>
									</form>
								</div>
							</c:if>

							<c:set var="newArrivalsCount" value="${newArrivalsCount + 1}"
								scope="page" />

						</c:forEach>
					</div>
				</div>
			</div>

			<div id="deals-for-you" class="panel panel-success">
				<div class="panel-heading">
					<h1 class="panel-title">
						<strong>Deals for you</strong>
					</h1>
				</div>

				<div class="panel-body">
				    <div class="row product-img-border">
						<c:set var="dealsForYouCount" value="0" scope="page" />
						<c:forEach items="${womansProductList}" var="womansProduct">
							

							<c:if test="${ dealsForYouCount < 3}">
								<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
									<form action="product-details" method="get">
										<input name="productCode" type="text"
											value="${womansProduct.productCode}" style="display: none" />
										<input type="image"
											src="<%=request.getContextPath()%>/resources/images/product/300x400/${womansProduct.productCode}.jpg"
											title="${womansProduct.productName}" class="img-responsive"
											alt="Submit"> ${womansProduct.productName} <br /> <strong>Rs.
											${womansProduct.productPrice}</strong>
									</form>
								</div>
							</c:if>

							<c:set var="dealsForYouCount" value="${dealsForYouCount + 1}"
								scope="page" />
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	
	<div class="col-md-2 hidden-xs hidden-sm"></div>
   
	<div class="col-md-12 col-xs-12 col-sm-12 padding-zero" id="footer-container">
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>
	
	<jsp:include page="/WEB-INF/views/login-modal.jsp" />
	
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

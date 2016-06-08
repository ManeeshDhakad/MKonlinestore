
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
		<jsp:include page="header-navbar.jsp" />
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

			<div >
				<jsp:include page="offer-slider.jsp" />
			</div>
			
			<div>
			<div id="new-arrivals" class="panel panel-success">
				<div class="panel-heading">
					<h1 class="panel-title">
						<strong>New arrivals</strong>
					</h1>
				</div>

				<div class="panel-body">
					<div>
						<a href="#" style="color: hotpink;" class="new-arrivals-product-prev"><span class="glyphicon glyphicon-chevron-left"></span>  Prev </a>
						<a href="#"  style="color: hotpink; float: right;" class="new-arrivals-product-next">Next <span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					<div class="row product-img-border new-arrivals-product-list">			
						
						<c:set var="newArrivalsCount" value="0" scope="page" />
						<c:forEach items="${mansProductList}" var="mansProduct">
								<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
									<a href="product-details?productCode=${mansProduct.productCode}">
										<img
											src="<%=request.getContextPath()%>/resources/images/product/300x400/${mansProduct.productCode}.jpg"
											title="${mansProduct.productName}" class="img-responsive"
											alt="${mansProduct.productName}"> ${mansProduct.productName} <br /> <strong>Rs.
											${mansProduct.productPrice}</strong>
									</a>
								</div>
							<c:set var="newArrivalsCount" value="${newArrivalsCount + 1}"
								scope="page" />

						</c:forEach>
						
						<c:if test="${newArrivalsCount  == 0}"> 
							<div style="text-align: center">
								<span>New arrivals not yet available!</span>
							</div>
						</c:if>
					</div>
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
					<div>
						<a href="#" style="color: hotpink;" class="deals-for-you-product-prev"><span class="glyphicon glyphicon-chevron-left"></span>  Prev </a>
						<a href="#"  style="color: hotpink; float: right;" class="deals-for-you-product-next">Next <span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					
				    <div class="row product-img-border deals-for-you-product-list">
						<c:set var="dealsForYouCount" value="0" scope="page" />
						<c:forEach items="${womansProductList}" var="womansProduct">
							
								<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
									<a href="product-details?productCode=${womansProduct.productCode}">
										<img 
											src="<%=request.getContextPath()%>/resources/images/product/300x400/${womansProduct.productCode}.jpg"
											title="${womansProduct.productName}" class="img-responsive"
											alt="${womansProduct.productName}"> ${womansProduct.productName} <br /> <strong>Rs.
											${womansProduct.productPrice}</strong>
									</a>
								</div>
							

							<c:set var="dealsForYouCount" value="${dealsForYouCount + 1}"
								scope="page" />
						</c:forEach>
						
						<c:if test="${dealsForYouCount  == 0}"> 
							<div style="text-align: center">
								<span>You don't have any deals for now!</span>
							</div>
						</c:if>
						
					</div>
					
				</div>
				<a href="#" class="back-to-top">Back to Top</a>	
			</div>
		</div>
	
	<div class="col-md-2 hidden-xs hidden-sm"></div>
   
	<div class="col-md-12 col-xs-12 col-sm-12 padding-zero" id="footer-container">
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
		
<script type="text/javascript">
// New arrivals slider
var new_arrivals_start = 0;
var new_arrivals_nb = 3;
var new_arrivals_end = new_arrivals_start + new_arrivals_nb;
var new_arrivals_length = $('.new-arrivals-product-list div').length;
var new_arrivals_list = $('.new-arrivals-product-list div');

new_arrivals_list.hide().filter(':lt('+(new_arrivals_end)+')').show();


$('.new-arrivals-product-prev, .new-arrivals-product-next').click(function(e){
   e.preventDefault();

   if( $(this).hasClass('new-arrivals-product-prev') ){
	   new_arrivals_start -= new_arrivals_nb;
   } else {
	   new_arrivals_start += new_arrivals_nb;
   }

   if( (new_arrivals_start < 0) || (new_arrivals_start >= new_arrivals_length) ) new_arrivals_start = 0;
   	new_arrivals_end = new_arrivals_start + new_arrivals_nb;       

   if( new_arrivals_start == 0 ) new_arrivals_list.hide().filter(':lt('+(new_arrivals_end)+')').show();
   else new_arrivals_list.hide().filter(':lt('+(new_arrivals_end)+'):gt('+(new_arrivals_start-1)+')').show();
});


// Deals for you slider
var deals_for_you_start = 0;
var deals_for_you_nb = 3;
var deals_for_you_end = deals_for_you_start + deals_for_you_nb;
var deals_for_you_length = $('.deals-for-you-product-list div').length;
var deals_for_you_list = $('.deals-for-you-product-list div');

deals_for_you_list.hide().filter(':lt('+(deals_for_you_end)+')').show();


$('.deals-for-you-product-prev, .deals-for-you-product-next').click(function(e){
   e.preventDefault();

   if( $(this).hasClass('deals-for-you-product-prev') ){
	   deals_for_you_start -= deals_for_you_nb;
   } else {
	   deals_for_you_start += deals_for_you_nb;
   }

   if( deals_for_you_start < 0 || deals_for_you_start >= deals_for_you_length ) deals_for_you_start = 0;
   	deals_for_you_end = deals_for_you_start + deals_for_you_nb;       

   if( deals_for_you_start == 0 ) deals_for_you_list.hide().filter(':lt('+(deals_for_you_end)+')').show();
   else deals_for_you_list.hide().filter(':lt('+(deals_for_you_end)+'):gt('+(deals_for_you_start-1)+')').show();
});

</script>

</body>
	
	
</html>

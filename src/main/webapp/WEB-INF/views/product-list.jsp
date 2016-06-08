
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>MKonlinestore</title>

<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/mk-logo.png">
</head>

<body>
<div id="wrapper">
	<div id="header-container">
		<jsp:include page="header-navbar.jsp" />
	</div>
	
	<div class="col-md-2 hidden-xs hidden-sm"></div>
	<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">

		<div class="panel panel-success" id="div_mainBody">
			<div class="panel-heading">
				<ol class="breadcrumb" style="margin-bottom: 5px;">
					<li><a href="home" style="color: hotpink">Home</a></li>
					<c:choose>
						<c:when test="${productCategory == 1}">
							<li class="active">Men's Product</li>
						</c:when>
						<c:when test="${productCategory == 2}">
							<li class="active">Women's Product</li>
						</c:when>

						<c:when test="${productCategory == 3}">
							<li class="active">Kid's Product</li>
						</c:when>
					</c:choose>
				</ol>
			</div>
			
			<!-- Product category -->
			<input type="hidden" id="productCategory" value="${productCategory}">

			<div class="panel-body">
				<div id="div_successMessage" class="isa_success" style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<span id="successMessage">${message}</span>
				</div>
	
				<div id="div_errorMessage" class="isa_error" style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<span id="errorMessage">${message}</span>
				</div>
				
				<c:set var="count" value="0" scope="page" />
				<c:forEach items="${productList}" var="product">
					<c:if test="${ count % 3 == 0}">
						<div class="row product-img-border">
					</c:if>

					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a href="product-details?productCode=${product.productCode}" >
							<img
								src="<%=request.getContextPath()%>/resources/images/product/300x400/${product.productCode}.jpg"
								title="${product.productName}" class="img-responsive"
								alt="${product.productName}"> 
						</a>
								${product.productName} <br /> 
								
								<c:forEach begin="0" end="4" varStatus="loop">
									<c:choose>
										<c:when test="${loop.index < ratings[count]}">
											<span class="glyphicon glyphicon-star review-star"></span>
										</c:when>
										<c:otherwise>
											<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										</c:otherwise>
									</c:choose>
								</c:forEach>(${ reviews[count]})
								&nbsp;&nbsp;&nbsp;
								<strong><span>Rs.	${product.productPrice} &nbsp;&nbsp;</span></strong>
								

						
					</div>

					<c:set var="count" value="${count + 1}" scope="page" />

					<c:if test="${ count % 3 == 0}">
						
						</div>
					</c:if>
				</c:forEach>
				
				<c:if test="${ count % 3 != 0}">
					</div>
				</c:if>
					
				<c:if test="${ count != 0}">
					<div style="text-align: center">
						<br>
						<span>Thats all we have, Enjoy shopping!</span>
					</div>
				</c:if>
				<c:if test="${ count == 0}">
					<div style="text-align: center">
						
						<span>There are no products in this category!</span>
					</div>
				</c:if>
					
				<a href="#" class="back-to-top">Back to Top</a>	
			</div>
		</div>

		
	</div>
	
	<div class="col-md-2 hidden-xs hidden-sm">
	
	</div>
	
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 padding-zero" id="footer-container">
		<jsp:include page="footer.jsp" />
	</div>
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
		var category = document.getElementById('productCategory').value;
		
		if(category == 1) {
			$("#menu_man").addClass("mainmenu-underline");
		}
		else if(category == 2) {
			$("#menu_woman").addClass("mainmenu-underline");
		}
		else if(category == 3) {
			$("#menu_kid").addClass("mainmenu-underline");
		}
		
	});
</script>
</body>
</html>

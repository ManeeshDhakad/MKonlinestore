
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	<div id="body-area-left-container" class="col-md-2"></div>

	<div id="body-area-middle-container" class="col-md-8">

		<div class="panel panel-success">
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

					<div class="col-md-4">
						<form action="product-details" method="get">
							<input name="productCode" type="text"
								value="${product.productCode}" style="display: none" /> <input
								type="image"
								src="<%=request.getContextPath()%>/resources/images/product/300x400/${product.productCode}.jpg"
								title="${product.productName}" class="img-responsive"
								alt="Submit"> ${product.productName} <br /> <strong>Rs.
								${product.productPrice} &nbsp;&nbsp;</strong>

						</form>
					</div>

					<c:set var="count" value="${count + 1}" scope="page" />

					<c:if test="${ count % 3 == 0}">
						</div><br>
					</c:if>
				</c:forEach>
				
				<c:if test="${ count % 3 != 0}">
					</div><br>
				</c:if>
					
				<c:if test="${ count != 0}">
					<div style="text-align: center">
						<br>
						<span>Thats all we have, Enjoy shopping!</span>
					</div>
				</c:if>
					
					
			</div>
		</div>

	
	</div>
	
	<div id="body-area-left-container" class="col-md-2"></div>
	
	<c:if test="${ count == 0}">
		<br><br><br><br><br>
	</c:if>
	
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
</body>
</html>

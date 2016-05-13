
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />
	
	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  
<title>MKonlinestore</title>

<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/mk-logo.png">
</head>

<body >
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
    				<c:when test="${product.productCategory == 1}">
    					<li><a href="product-catelog?category=mens" style="color: hotpink">Men's Product</a></li>
    				</c:when>
    				
    				<c:when test="${product.productCategory == 2}">
    					<li><a href="product-catelog?category=womens" style="color: hotpink">Women's Product</a></li>
    				</c:when>
    					
    				<c:when test="${product.productCategory == 3}">
    					<li><a href="product-catelog?category=kids" style="color: hotpink">Kid's Product</a></li>
    				</c:when>
    			</c:choose>
    			<li class="active">${product.productName}</li>
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
			
			<div class="col-md-7">
					
					
					<div id="product-detail-big-img" class="product-img-grow ">
						<img id="main-img" src="<%=request.getContextPath()%>/resources/images/product/600x800/${product.productCode}.jpg" class="img-responsive product-img-big" alt="Responsive image" />
					</div>
					<br>
					<div >
						<div class="col-md-3"><a href="<%=request.getContextPath()%>/resources/images/product/600x800/${product.productCode}.jpg"  onmouseover="swapImageProductDetail(this); return false;" onclick="swapImageProductDetail(this); return false;"><img src="<%=request.getContextPath()%>/resources/images/product/85x100/${product.productCode}.jpg" class=" product-thumbnail-border" alt="" /></a></div>
						<div class="col-md-3"><a href="<%=request.getContextPath()%>/resources/images/product/600x800/${product.productCode}_1.jpg" onmouseover="swapImageProductDetail(this); return false;" onclick="swapImageProductDetail(this); return false;"><img src="<%=request.getContextPath()%>/resources/images/product/85x100/${product.productCode}_1.jpg" class="product-thumbnail-border" alt="" /></a></div>
						<div class="col-md-3"><a href="<%=request.getContextPath()%>/resources/images/product/600x800/${product.productCode}_2.jpg" onmouseover="swapImageProductDetail(this); return false;" onclick="swapImageProductDetail(this); return false;"><img src="<%=request.getContextPath()%>/resources/images/product/85x100/${product.productCode}_2.jpg" class="product-thumbnail-border" alt="" /></a></div>
						<div class="col-md-3"></div>
					</div>
					
			</div>
		
			<div class="col-md-5">
			
				<c:set var="isProductAddedToWishlist" value="0" scope="page" />
				<c:forEach items="${wishlistProductList}" var="wishlistProduct">
					<c:if test="${wishlistProduct.productCode == product.productCode}">
						<c:set var="isProductAddedToWishlist" value="1" scope="page" />
					</c:if>
				</c:forEach>
				
				<c:set var="isProductAddedToCart" value="0" scope="page" />
				<c:forEach items="${cartProductList}" var="cartProduct">
					<c:if test="${cartProduct.productCode == product.productCode}">
						<c:set var="isProductAddedToCart" value="1" scope="page" />
					</c:if>
				</c:forEach>
				
				<table class="table" id="cartTable">
    				<thead>
      					<tr>
        					<th colspan="2"><h3>${product.productName}</h3></th>
      					</tr>
    				</thead>
    				
    				<tbody>
    				
    					<tr>
							
							<td colspan="2" style="margin-top: 10px">
								<c:choose>
    								<c:when test="${isProductAddedToWishlist == 0}">
    									<a href="#" id="addToWishListLink" style="color : hotpink;" onclick="addProductToWishList('${product.productCode}'); return false;"><span class="glyphicon glyphicon-heart-empty"></span> ADD TO WISHLIST</a>
    								</c:when>
    				
    								<c:otherwise>
    									<a href="#" style="color : hotpink;" class="href-not-active"  title="Product already added to your Wishlist"><span class="glyphicon glyphicon-heart-empty"></span> ADDED TO WISHLIST</a>
    								</c:otherwise>
    							</c:choose>
							</td>
						</tr>
    				
    					<tr>
    						<td colspan="2">${product.productDescription}</td>
    					</tr>	
		
						<tr>
							<td><h4><strong>Rs. ${product.productPrice}</strong></h4></td>
							<td><h4><strong>${product.productStatus}</strong></h4>
								
							</td>
						</tr>
						
					</tbody>
				</table>
				
				<c:choose>
    				<c:when test="${isProductAddedToCart == 0}">
    					<input id="btn_addToCart" type="submit" class="common-btn" value="Add To Cart" onclick="addProductToCart('${product.productCode}');" /> 
    				</c:when>
    				
    				<c:otherwise>
    					<button type="button" class="common-btn-disabled" title="This product already added to cart">Added to Cart</button>
    				</c:otherwise>
    			</c:choose>
				
				
      				<input name="productCode" type="text" value="${product.productCode}" style="display: none" />
      				<input type="submit" class="common-btn"  onclick="checkoutPage('${product.productCode}'); return false;" value="Buy Now" />		
				
			</div> 
		</div>
		</div>
		
		<div id="footer-container" >
			<ul class="nav nav-pills">
				<li><a href="/">© 2016 mkonlinestore.com</a></li>
				<li><a href="#">Terms of Service</a></li>
				<li><a href="#">Privacy</a></li>
			</ul>
		</div>
	</div>

	<div id="body-area-left-container" class="col-md-2"></div>
	
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

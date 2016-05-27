
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  
	<div class="col-md-2 hidden-xs hidden-sm"></div>
	<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">

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
			<!-- Product category -->
			<input type="hidden" id="productCategory" value="${product.productCategory}">
			
			<div class="panel-body">
				
			<div id="div_successMessage" class="isa_success" style="display: none">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    			<span id="successMessage">${message}</span>
			</div>
			<div id="div_errorMessage" class="isa_error" style="display: none">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    			<span id="errorMessage">${message}</span>
			</div>
			
			<c:if test="${product.productCode  != null}">
			<div class="col-xs-12 col-sm-7 col-md-7">
					
					
					<div id="col-xs-12 product-detail-big-img" class="product-img-grow ">
						<img id="main-img" src="<%=request.getContextPath()%>/resources/images/product/600x800/${product.productCode}.jpg" class="img-responsive product-img-big" alt="Responsive image" />
					</div>
					<br>
					
						<div class="col-xs-4 col-sm-4 col-md-3" style="padding-right: 0px; padding-left: 0px;"><a href="<%=request.getContextPath()%>/resources/images/product/600x800/${product.productCode}.jpg"  onmouseover="swapImageProductDetail(this); return false;" onclick="swapImageProductDetail(this); return false;"><img src="<%=request.getContextPath()%>/resources/images/product/85x100/${product.productCode}.jpg" class=" product-thumbnail-border" alt="" /></a> &nbsp;</div>
						<div class="col-xs-4 col-sm-4 col-md-3" style="padding-right: 0px; padding-left: 0px;"><a href="<%=request.getContextPath()%>/resources/images/product/600x800/${product.productCode}_1.jpg" onmouseover="swapImageProductDetail(this); return false;" onclick="swapImageProductDetail(this); return false;"><img src="<%=request.getContextPath()%>/resources/images/product/85x100/${product.productCode}_1.jpg" class="product-thumbnail-border" alt="" /></a>&nbsp;</div>
						<div class="col-xs-4 col-sm-4 col-md-3" style="padding-right: 0px; padding-left: 0px;"><a href="<%=request.getContextPath()%>/resources/images/product/600x800/${product.productCode}_2.jpg" onmouseover="swapImageProductDetail(this); return false;" onclick="swapImageProductDetail(this); return false;"><img src="<%=request.getContextPath()%>/resources/images/product/85x100/${product.productCode}_2.jpg" class="product-thumbnail-border" alt="" /></a></div>
						<div class="col-md-3 hidden-xs hidden-sm"></div>
					
			</div>
			
			<c:set var="reviewRating" value="0" scope="page" />
			<c:set var="reviewCount" value="0" scope="page" />
			<c:forEach items="${reviewList}" var="review">
				<c:set var="reviewCount" value="${reviewCount + 1 }" scope="page" />
				<c:set var="reviewRating" value="${reviewRating + review.reviewRating}" scope="page" />
			</c:forEach>
			<c:if test="${reviewCount != 0 }">
				<c:set var="reviewRating" value="${reviewRating / reviewCount}" scope="page" />
			</c:if>	
		
			<div class="col-xs-12 col-sm-5 col-md-5">
			
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
							<td>
								<c:choose>
									<c:when test="${reviewRating == 0 }">
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
									</c:when>
									<c:when test="${reviewRating < 2 }">
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
									</c:when>
									<c:when test="${reviewRating < 3 }">
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
									</c:when>
									<c:when test="${reviewRating < 4 }">
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
									</c:when>
									<c:when test="${reviewRating < 5 }">
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
									</c:when>
									<c:when test="${reviewRating == 5 }">
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
										<span class="glyphicon glyphicon-star review-star"></span>
									</c:when>
									
								</c:choose><br>
								<a href="#productReviewList" style="color:hotpink;">${reviewCount} Reviews </a>
							</td>
							<td style="margin-top: 10px">
								
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
    					<button id="btn_addToCart" class="common-btn" onclick="addProductToCart('${product.productCode}');" > 
    						Add To Cart&nbsp;&nbsp;<i class="fa fa-shopping-cart fa-lg"></i>
    					</button>
    				</c:when>
    				
    				<c:otherwise>
    					<button class="common-btn-disabled" title="This product already added to cart">
    						Added to Cart&nbsp;&nbsp;<i class="fa fa-shopping-cart fa-lg"></i>
    					</button>
    				</c:otherwise>
    			</c:choose>
      				<input name="productCode" type="text" value="${product.productCode}" style="display: none" />
      				<button class="common-btn"  onclick="checkoutPage('${product.productCode}'); return false;" >		
						Buy Now&nbsp;&nbsp;<i class="fa fa-forward"></i> 
					</button>
			</div> 
			</c:if>
			<c:if test="${product.productCode  == null}"> 
				<div style="text-align: center">
						
					<span>Selected product details not available!</span>
				</div>
			</c:if>
		</div>
		
		</div>
		
		<c:if test="${product.productCode  != null}"> 
		<div id="productSubmitReview" class="alert alert-info">
			<jsp:include page="review.jsp" />
		</div>
		
		<div id="productReviewList" class="alert alert-success">
		
			<table class="table">
				<thead>
					<tr>
						<th colspan="2">
							<strong>Top reviews</strong>
							<br>
						</th>
					</tr>
				</thead>
				
				<tbody>
					<c:set var="reviewCount" value="0" scope="page" />
					<c:set var="reviewDate" value="0" scope="page" />
					<c:forEach items="${reviewList}" var="review">
						<c:set var="reviewRating" value="${review.reviewRating}" scope="page" />
						<c:set var="reviewCount" value="${reviewCount + 1}" scope="page" />
						
						<tr>
							<td style="width: 20%">
								<c:choose>
								<c:when test="${reviewRating == 0 }">
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								</c:when>
								<c:when test="${reviewRating < 2 }">
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								</c:when>
								<c:when test="${reviewRating < 3 }">
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								</c:when>
								<c:when test="${reviewRating < 4 }">
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								</c:when>
								<c:when test="${reviewRating < 5 }">
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star-empty review-star-empty"></span>
								</c:when>
								<c:when test="${reviewRating == 5 }">
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								<span class="glyphicon glyphicon-star review-star"></span>
								</c:when>
								
								</c:choose><br>
								${review.userName }<br>
								
								${review.reviewDate}
								
							</td>
							
							<td align="left">
								<p>${review.reviewComment}</p>
							</td>
						</tr>
				
					</c:forEach>
			
					<c:if test="${reviewCount == 0 }">
						<tr>
							<td colspan="2">Be first to give review</td>
						</tr> 
					</c:if>	
				</tbody>
			</table>
			<a href="#" class="back-to-top">Back to Top</a>	
		</div>
		</c:if>
	</div>

	<div class="col-md-2 hidden-xs hidden-sm"></div>
	
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 padding-zero" id="footer-container">
		<jsp:include page="footer.jsp" />
	</div>

	<jsp:include page="login-modal.jsp" />
	
	<jsp:include page="message-modal.jsp" />
	
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
		src="<%=request.getContextPath()%>/resources/js/review.js"></script>
<script type="text/javascript">
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

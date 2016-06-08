
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

<body>

	<div id="header-container">
		<jsp:include page="header-navbar.jsp" />
	</div>
	
		<div class="col-md-2 hidden-xs hidden-sm"></div>
		<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
				
				<div class="panel panel-success">
					<div class="panel-heading">
   						<h1 class="panel-title">Order Details</h1>
  					</div>
 					<div class="panel-body">
 						<div id="div_cartSuccessMessage" class="isa_success" style="display: none">
 							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    						<span id="successMessage">${message}</span>
						</div>
						<div id="div_cartErrorMessage" class="isa_error" style="display: none">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    						<span id="errorMessage">${message}</span>
						</div>
 						
 						<c:if test="${messageStatus == 'SUCCESS' }">
      				
 							<strong>Your Order Details</strong><br>
 							<span style="border: 1px solid orange; padding: 3px 3px 3px 3px;">Order ID : ${orderList[0].orderCode}</span>
 								
 							<div class="row" >
 								<div class="col-xs-9 col-sm-9 col-md-9">											
 									<table class="table" id="cartTable">
    									<thead>
      										<tr>
        										<th colspan="2" style="width : 60%">ITEM</th>
        										<th style="width : 10%">PRICE</th>
        										<th style="width : 10%">QTY</th>
        										<th style="width : 20%" >SUB TOTAL</th>
      										</tr>
    									</thead>
    				
    									<tbody>
    								    								
    										<c:set var="estimatedTotal" value="0" scope="page" />
      										<c:forEach items="${orderList}" var="orderProduct">
        										<tr  id="cart_tr_${orderProduct.productCode}">      
            										<td>
            											<a href="product-details?productCode=${orderProduct.productCode}" >
      														<img src="<%=request.getContextPath()%>/resources/images/product/85x100/${orderProduct.productCode}.jpg" class="img-responsive" alt="${orderProduct.productName}">		
														</a>
        											</td>
        								
        											<td>
        												${orderProduct.productName} <br><br>
        											</td>
        						
        											<td><strong>${orderProduct.productPrice}</strong></td>
        						
        											<td> ${orderProduct.productQuantity}</td>
       							
       												<td align="center"><strong>${orderProduct.productPrice * orderProduct.productQuantity}</strong></td>
        										</tr>
        					
        										<c:set var="estimatedTotal" value="${estimatedTotal + (orderProduct.productPrice * orderProduct.productQuantity)}" scope="page" />
        					
    										</c:forEach>
    				
       										<tr>
    											<td colspan="4" align="right"><h3><strong>Total Amount Paid:</strong></h3></td>
    											<td align="center"><h3><strong><span id="cartEstimatedTotal">${estimatedTotal}</span></strong></h3></td>
    										</tr>
 										</tbody>
  									</table>
  								</div>
  								
  								<div class="col-xs-3 col-sm-3 col-md-3 div-border">
  									<h3>Order Address</h3>
									<strong>${address.addressName}</strong><br>
									${address.addressStreet}<br> ${address.addressLandmark}<br>
									${address.addressCity} ${address.addressState},&nbsp;
									${address.addressCountry}<br>
									Mobile:&nbsp;${address.addressMobile}
									
  								</div>
  							</div>
  						</c:if>
  					</div>
				
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
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js">
		
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/validation.js"></script>
</body>
</html>

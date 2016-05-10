
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<body>

	<div id="header-container">
		<jsp:include page="header-navbar.jsp" />
	</div>
	
		<div id="body-area-left-container" class="col-md-2"></div>

		<div id="body-area-middle-container" class="col-md-8">
			<div id="body-container">
				
				<div class="panel panel-success">
					<div class="panel-heading">
   						<h1 class="panel-title">Order Details</h1>
  					</div>
 					<div class="panel-body">
 						<div id="div_cartSuccessMessage" class="isa_success" style="display: none">
    						<span id="successMessage">${message}</span>
						</div>
						<div id="div_cartErrorMessage" class="isa_error" style="display: none">
    						<span id="errorMessage">${message}</span>
						</div>
 						
 						<c:if test="${messageStatus == 'SUCCESS' }">
      						
						
						
 						<strong>Your Order List</strong><br>
						<table class="table" id="cartTable">
    						<thead>
      							<tr>
        							<th colspan="2" style="width : 50%">ITEM</th>
        							<th style="width : 20%">PRICE</th>
        							<th style="width : 10%">QTY</th>
        							<th style="width : 20%" >SUBTOTAL</th>
      							</tr>
    						</thead>
    				
    						<tbody>
    							<c:set var="estimatedTotal" value="0" scope="page" />
      							<c:forEach items="${orderList}" var="orderProduct">
        							<tr  id="cart_tr_${orderProduct.productCode}">      
            							<td>
            								<form action="product-details" method="post">
      											<input name="productCode" type="text" value="${orderProduct.productCode}" style="display: none" />
      											<input type="image" src="<%=request.getContextPath()%>/resources/images/product/85x100/${orderProduct.productCode}.jpg" class="img-responsive" alt="Submit">		
											</form>
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
    								<td></td>
    								<td></td>
    								<td></td>
    								<td align="center"><h3><strong>Estimated Total:</strong></h3></td>
    								<td align="center"><h3><strong><span id="cartEstimatedTotal">${estimatedTotal}</span></strong></h3></td>
    							</tr>
 							</tbody>
  						</table>
  						</c:if>
  					</div>
				
				</div>

			
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
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js">
		
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/validation.js"></script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
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
		<jsp:include page="checkout-header.jsp" />
	</div>

	<div class="col-md-2 hidden-xs hidden-sm"></div>
	<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
		<br>
		
		<div id="div_successMessage" class="isa_success" style="display: none">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<span id="successMessage">${message}</span>
		</div>
		<div id="div_errorMessage" class="isa_error" style="display: none">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<span id="errorMessage">${message}</span>
		</div>

		
		<div class="panel-group" id="checkoutPage" role="tablist" 	aria-multiselectable="true">
			<div class="panel panel-info">
				<div class="panel-heading" role="tab" id="headingCheckoutAddress">
					
				
					<h4 class="panel-title"><i id="checkoutAddressCompleted" class="fa fa-check isa_info" style="display: none"></i> 1. &nbsp;
						<a id="checkoutAddressLink" role="button" data-toggle="collapse" data-parent="#checkoutPage"
							href="#checkoutAddresBody" aria-expanded="true"
							aria-controls="checkoutAddresBody"> Select Delivery Address </a>
						<span style="float:right ">Email : ${user.userEmail}</span>
					</h4>
				</div>
				<div id="checkoutAddresBody" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="checkoutAddressHeading">
					<div class="panel-body">
					
						<button class="common-btn-border" style="width: 25%" type="button" data-toggle="collapse" data-target="#div_addNewAddress" aria-expanded="false" aria-controls="div_addNewAddress">
  							Add New Address
						</button>		
						<br>
						<div class="collapse" id="div_addNewAddress" >
 							<div class="row">
								<div class="col-md-3">
									Address Name
								</div>
									
								<div class="col-md-4">
									<input type="text" id="userAddressName" name="userAddressName" class="common-input-text" placeholder="Name*" />
								</div>
							</div>
										
							<div class="row">
								<div class="col-md-3">
									Street Address
								</div>
								
								<div class="col-md-4">
									<textarea name="message" id="userStreetAddress" name="userStreetAddress" class="common-input-textarea" placeholder="Street Address*" ></textarea>
								</div>
							</div>
										
							<div class="row">
								<div class="col-md-3">
									Landmark
								</div>
									
								<div class="col-md-4">
									<input type="text" id="userAddressLandmark" name="userAddressLandmark" class="common-input-text" placeholder="Landmark*" />
								</div>
							</div>
										
							<div class="row">
								<div class="col-md-3">
									City
								</div>
								
								<div class="col-md-4">
									<input type="text" id="userAddressCity" name="userAddressCity" class="common-input-text" placeholder="City*" />
								</div>
							</div>
										
							<div class="row">
								<div class="col-md-3">
									State
								</div>
							
								<div class="col-md-4">
									<input type="text" id="userAddressState" name="userAddressState" class="common-input-text" placeholder="State*" />
								</div>
							</div>
										
							<div class="row">
								<div class="col-md-3">
									Country
								</div>
							
								<div class="col-md-4">
									<input type="text" id="userAddressCounty" name="userAddressCounty" class="common-input-text" placeholder="Country*" />
								</div>
							</div>
									
							<div class="row">
								<div class="col-md-3">
									Mobile
								</div>
								
								<div class="col-md-4">
									<input type="text" id="userAddressMobile" name="userAddressMobile" class="common-input-text"  placeholder="Mobile*" />
								</div>
							</div>
										
							<div class="row">
								<div class="col-md-3"></div>
								
								<div class="col-md-4">
									<input type="submit" class="common-btn" value="Save Changes" onclick="addUserAddress('checkout'); return false;"  />
								</div>
							</div>
						</div>
						
						<div class="row">	
							
							<c:set var="addressCount" value="0" scope="page" />
							<c:forEach items="${addressList}" var="address">
								<div id="div_address${address.addressId}"
									class="col-md-3 alert alert-success" role="alert"
									style="margin-left: 10px; width:200px; height: 250px">
									<strong>${address.addressName}</strong><br>
									${address.addressStreet}<br> ${address.addressLandmark}<br>
									${address.addressCity} ${address.addressState},&nbsp;
									${address.addressCountry}<br>
									Mobile:&nbsp;${address.addressMobile}
									<hr style="border-top: 1px solid #8c8b8b; margin: 5px 1px 0px 1px">

									<button id="btn_deleteAddress" type="button" class="btn btn-link"
										style="text-align: center;" onclick="deleteUserAddress('${address.addressId}'); return false;">Delete
												Address</button>
									<button id="btn_makeDeliveryAddress${address.addressId}" type="button" class="btn btn-link"
										style="text-align: center;"
										onclick="makeDeliveryAddress('${address.addressId}'); return false;">
										Make Delivery Address</button>

								</div>
									
								<c:set var="addressCount" value="${addressCount + 1}" scope="page" />
							</c:forEach>

							<c:if test="${addressCount == 0}">
								<span style="margin-left: 10px"><strong>Address List Is Empty. Please add your address.</strong></span>
							</c:if>
													
						</div>
						
					</div>
				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading" role="tab" id="checkoutOrderSummaryHeading">
					<h4 class="panel-title"><i id="checkoutOrderSummaryCompleted" class="fa fa-check isa_info" style="display: none"></i>
						2. &nbsp;
						<a id="checkoutOrderSummaryLink" class="collapsed href-not-active" role="button" data-toggle="collapse"
							data-parent="#checkoutPage" href="#checkoutOrderSummaryBody"
							aria-expanded="false" aria-controls="checkoutOrderSummaryBody"> Edit Order
							Summary </a>
					</h4>
				</div>
				<div id="checkoutOrderSummaryBody" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="checkoutOrderSummaryHeading">
					<div class="panel-body">
						<div id="div_orderSummary">
									<table class="table" id="cartTable">
										<thead>
											<tr>
												<th colspan="2" style="width: 50%">ITEM</th>
												<th style="width: 20%">PRICE</th>
												<th style="width: 20%">QTY</th>
												<th style="width: 30%">SUBTOTAL</th>
											</tr>
										</thead>

										<tbody>
											<c:set var="estimatedTotal" value="0" scope="page" />
											<c:forEach items="${productList}" var="product">
												<tr id="cart_tr_${product.productCode}">
													<td><img
														src="<%=request.getContextPath()%>/resources/images/product/85x100/${product.productCode}.jpg"
														class="img-responsive"></td>

													<td>${product.productName} <br>
													<br> <input type="submit" class="btn btn-link"
														value="Remove"
														onclick="removeProductFromCheckout('${product.productCode}');" />
													</td>

													<td><strong>${product.productPrice}</strong></td>
													<td><select id="select_${product.productCode}"
														onChange="updateCheckoutProductQunatity('${product.productCode}', '${product.productPrice}', '${product.productQuantity}');">
															<c:choose>
																<c:when test="${product.productQuantity == 1}">
																	<option selected="selected" value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																</c:when>

																<c:when test="${product.productQuantity == 2}">
																	<option value="1">1</option>
																	<option selected="selected" value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																</c:when>

																<c:when test="${product.productQuantity == 3}">
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option selected="selected" value="3">3</option>
																	<option value="4">4</option>
																</c:when>

																<c:when test="${product.productQuantity == 4}">
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option selected="selected" value="4">4</option>
																</c:when>
															</c:choose>
													</select></td>

													<td align="center"><strong><span
															id="productSubTotal${product.productCode}">${product.productPrice * product.productQuantity}</span></strong></td>
												</tr>

												<c:set var="estimatedTotal"
													value="${estimatedTotal + (product.productPrice * product.productQuantity)}"
													scope="page" />

											</c:forEach>

											<c:choose>
												<c:when test="${estimatedTotal == 0}">
													<% ((HttpServletResponse)response).sendRedirect("view-cart"); %>
												</c:when>

												<c:otherwise>
													<tr>

														<td></td>
														<td></td>
														<td colspan="2"><h3>
																<strong>Estimated Total:</strong>
															</h3></td>
														<td><h3>
																<strong><span id="cartEstimatedTotal">${estimatedTotal}</span></strong>
															</h3></td>
													</tr>

													<tr>
														<td colspan="3"></td>
														<td colspan="2" ><br>
															<input type="submit" class="common-btn" value="Continue" onclick="goToPayment()" />
														</td>
													</tr>
												</c:otherwise>
											</c:choose>

										</tbody>
									</table>


						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading" role="tab" id="checkoutPaymentHeading">
					<h4 class="panel-title"><i id="checkoutPaymentCompleted" class="fa fa-check isa_info" style="display: none"></i>
						3. &nbsp;
						<a id="checkoutPaymentLink" class="collapsed" role="button" data-toggle="collapse"
							data-parent="#checkoutPage" href="#checkoutPaymentBody"
							aria-expanded="false" aria-controls="checkoutPaymentBody"> Make
							Payment </a>
					</h4>
				</div>
				<div id="checkoutPaymentBody" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="checkoutPaymentHeading">
					<div class="panel-body">
						<div class="col-md-6">
							<div class="panel panel-success">
								<div class="panel-heading">
									<img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
									<h1 class="panel-title" style="margin-top: 10px; height: 40px">Payment Details
										
									</h1>	
								</div>
			
								<div class="panel-body">
									
									<input type="text" id="paymentCardName" name="paymentCardName" class="common-input-text" placeholder="Name (as it appears on your card)" />
									<input type="text" id="paymentCardNumber" name="paymentCardNumber" class="common-input-text" placeholder="Card Number (no dashes or spaces)" />
									<input type="text" id="paymentCardCVV" name="paymentCardCVV" class="common-input-text" placeholder="CVV" />
									<input type="text" id="paymentCardAmount" name="paymentCardAmount" value="Amount Payable :${estimatedTotal}" disabled="disabled" class="common-input-text"  />
									<input type="submit" class="common-btn" value="Pay Now" onclick="orderCompletion(); return false;" />
							
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-md-2 hidden-xs hidden-sm"></div>

	<jsp:include page="login-modal.jsp" />

	<!-- JavaScript -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/checkout.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/validation.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/user-profile.js"></script>
</body>
</html>

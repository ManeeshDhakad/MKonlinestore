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

<body>

	<div id="header-container">
		<jsp:include page="header-navbar.jsp" />
	</div>

	<div class="col-md-1 hidden-xs hidden-sm"></div>
	<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-10 col-lg-10">

		<div class="panel panel-success">
			<div class="panel-heading">
				<strong>My Account</strong>
			</div>

			<div class="panel-body">
				<div id="div_successMessage" class="isa_success"
					style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<span id="successMessage">${message}</span>
				</div>
				<div id="div_errorMessage" class="isa_error" style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<span id="errorMessage">${message}</span>
				</div>

				<div class="col-xs-12 col-sm-3 col-md-3 list-group">

					<a id="userProfileLink" href="#" class="list-group-item active"><span
						class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;My Profile </a> <a
						id="userPasswordLink" href="#" class="list-group-item"><span
						class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;Update
						Password</a> <a id="userAddressLink" href="#" class="list-group-item"><span
						class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;Manage
						Address</a> <a id="userOrderLink" href="#" class="list-group-item"><span
						class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;Order
						History</a> <a id="userWishlistLink" href="#" class="list-group-item"><span
						class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;My
						Wishlist</a>
				</div>

				<div class="col-xs-12 col-sm-9 col-md-9" style="padding: 0px 0px 0px 0px">

					<div id="div_userPersonalInfo" class="panel panel-info" align="center">
						<div class="panel-heading">
							<h1 class="panel-title">Personal Information</h1>
						</div>

						<div class="panel-body" >
							<div class="input-group" style="margin-left: 9%">
      							<span class="input-group-addon glyphicon glyphicon-user" id="icon_profileUserName"></span>
								<input type="text" id="profileUserName" name="profileUserName" value="${user.userName}" class="form-control common-input-transparent"
										style="width: 80%" placeholder="Enter Name*" aria-describedby="icon_profileUserName" />
							</div>

							<div class="input-group" style="margin-left: 9%">
      							<span class="input-group-addon glyphicon glyphicon-envelope" id="icon_profileUserEmail"></span>
									<input type="text" id="profileUserEmail"
										name="profileUserEmail" value="${user.userEmail}" aria-describedby="icon_profileUserEmail"
										style="width: 80%" class="form-control common-input-transparent" placeholder="Enter Email*" />
							</div>

							<div class="input-group" style="margin-left: 9%">
      							<span class="input-group-addon glyphicon glyphicon-earphone" id="icon_userMobile"></span>
								<c:set var="userMobile" value="${user.userMobile}" scope="page" />
								<c:if test="${user.userMobile == 0}">
									<c:set var="userMobile" value="" scope="page"></c:set>
								</c:if>
								<input type="text" id="profileUserMobile" name="profileUserMobile" class="form-control common-input-transparent" aria-describedby="icon_userMobile"
										style="width: 80%" value="${userMobile}" placeholder="Enter Mobile" />
							</div>
							<div class="input-group" style="margin-left: 9%">
      							<span class="input-group-addon glyphicon glyphicon-send" id="icon_updateUserInfoBTN" style="display: none"></span>
									<input style="height: 45px; width: 82%" id="updateUserInfoBTN" type="submit" class="form-control common-btn" value="Save Changes" aria-describedby="icon_updateUserInfoBTN"
										onclick="saveUsersPersonalInfo('${user.userName}', '${user.userEmail}', '${userMobile}'); return false;" />
								
							</div>

						</div>
					</div>

					<div id="div_userPasswordUpdate" class="panel panel-info" style="display: none" align="center">
						<div class="panel-heading">
							<h1 class="panel-title">Update Your Password</h1>
						</div>

						<div class="panel-body">

							<div class="input-group" style="margin-left: 9%">
      							<span class="input-group-addon glyphicon glyphicon-lock" id="icon_profileUserOldPassword"></span>
								<input type="password" id="profileUserOldPassword" aria-describedby="icon_profileUserOldPassword"
										name="profileUserOldPassword" class="form-control common-input-transparent" style="width: 80%"
										placeholder="Enter Old Password*" />
							</div>

							<div class="input-group" style="margin-left: 9%">
      							<span class="input-group-addon glyphicon glyphicon-lock" id="icon_profileUserNewPassword"></span>
									<input type="password" id="profileUserNewPassword" aria-describedby="icon_profileUserNewPassword"
										name="profileUserNewPassword" class="form-control common-input-transparent" style="width: 80%"
										placeholder="Enter New Password*" />
								
							</div>

							<div class="input-group" style="margin-left: 9%">
      							<span class="input-group-addon glyphicon glyphicon-lock" id="icon_profileUserConfirmNewPassword"></span>
									<input type="password" id="profileUserConfirmNewPassword" aria-describedby="icon_profileUserConfirmNewPassword"
										name="profileUserConfirmNewPassword" class="form-control common-input-transparent" style="width: 80%"
										placeholder="Enter Confirm New Password*" />
							
							</div>

							<div class="input-group" style="margin-left: 9%">
      							<span class="input-group-addon glyphicon glyphicon-send" id="icon_updatePasswordBTN" style="display: none"></span>
								<input style="height: 45px; width: 82%" id="updatePasswordBTN" type="submit" class="form-control common-btn" value="Save Changes" aria-describedby="icon_updatePasswordBTN"
										onclick="updateUserPassword(); return false;" />
							
							</div>

						</div>
					</div>

					<div id="div_userAddressInfo" class="panel panel-default" style="display: none">
						<div class="panel-heading" align="center">
							<h1 class="panel-title">Manage Address Book</h1>
						</div>

						<div class="panel-body">

							<button class="common-btn-border"
								style="width: 30%" type="button" data-toggle="collapse"
								data-target="#div_addNewAddress" aria-expanded="false"
								aria-controls="div_addNewAddress">Add New Address</button>
							<br>
							<div class="collapse" id="div_addNewAddress">
								<div class="row">
									<div class="col-md-4">Address Name</div>

									<div class="col-md-5">
										<input type="text" id="userAddressName" name="userAddressName"
											class="common-input-text" placeholder="Name*" />
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">Street Address</div>

									<div class="col-md-5">
										<textarea name="message" id="userStreetAddress"
											name="userStreetAddress" class="common-input-textarea"
											placeholder="Street Address*"></textarea>
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">Landmark</div>

									<div class="col-md-5">
										<input type="text" id="userAddressLandmark"
											name="userAddressLandmark" class="common-input-text"
											placeholder="Landmark*" />
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">City</div>

									<div class="col-md-5">
										<input type="text" id="userAddressCity" name="userAddressCity"
											class="common-input-text" placeholder="City*" />
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">State</div>

									<div class="col-md-5">
										<input type="text" id="userAddressState"
											name="userAddressState" class="common-input-text"
											placeholder="State*" />
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">Country</div>

									<div class="col-md-5">
										<input type="text" id="userAddressCounty"
											name="userAddressCounty" class="common-input-text"
											placeholder="Country*" />
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">Mobile</div>

									<div class="col-md-5">
										<input type="text" id="userAddressMobile"
											name="userAddressMobile" class="common-input-text"
											placeholder="Mobile*" />
									</div>
								</div>

								<div class="row">
									<div class="col-md-4"></div>

									<div class="col-md-5">
										<input type="submit" class="common-btn" value="Save Changes"
											onclick="addUserAddress('profile'); return false;" />
									</div>
								</div>
							</div>

							<div class="row">

								<c:set var="addressCount" value="0" scope="page" />
								<c:forEach items="${addressList}" var="address">
									<div id="div_address${address.addressId}"
										class="col-md-3 alert alert-info" role="alert"
										style="margin-left: 10px; width: 185px; height: 250px">
										<strong>${address.addressName}</strong><br>
										${address.addressStreet}<br> ${address.addressLandmark}<br>
										${address.addressCity} ${address.addressState},&nbsp;
										${address.addressCountry}<br>
										Mobile:&nbsp;${address.addressMobile}
										<hr
											style="border-top: 1px solid #8c8b8b; margin: 5px 1px 0px 1px">

										<button type="button" class="btn btn-link"
											style="text-align: center;"
											onclick="deleteUserAddress('${address.addressId}'); return false;">Delete
											Address</button>

									</div>

									<c:set var="addressCount" value="${addressCount + 1}"
										scope="page" />
								</c:forEach>

								<c:if test="${addressCount == 0}">
									<span style="margin-left: 10px"><strong>Address
											List Is Empty. Please add your address.</strong></span>
								</c:if>

							</div>

						</div>
					</div>

					<div id="div_userOrderHistory" class="panel panel-info" style="display: none">
						<div class="panel-heading" align="center">
							<h1 class="panel-title">Order History</h1>
						</div>

						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th colspan="2" style="width: 45%">ITEM</th>
										<th style="width: 20%">Order Date</th>
										<th style="width: 10%">TOTAL</th>
										<th style="width: 25%">Status</th>
									</tr>
								</thead>

								<tbody>


									<c:set var="orderProductCount" value="0" scope="page" />
									<c:forEach items="${orderList}" var="orderHistoryProduct">
										<c:set var="currOrderID" value="${orderHistoryProduct.orderCode}" scope="page" />
										
										<tr id="tr_orderHistory${orderHistoryProduct.productCode}">
											<td>
												<form action="product-details" method="get">
													<input name="productCode" type="text"
														value="${orderHistoryProduct.productCode}"
														style="display: none" /> <input type="image"
														src="<%=request.getContextPath()%>/resources/images/product/85x100/${orderHistoryProduct.productCode}.jpg"
														class="img-responsive" alt="Submit">
												</form>
											</td>
											<td>${orderHistoryProduct.productName} <br> 
											<strong>QTY : ${orderHistoryProduct.productQuantity}</strong> <br> 
											<strong>Price : ${orderHistoryProduct.productPrice}</strong><br>
											
											<span><strong>Order ID : </strong>${orderHistoryProduct.orderCode}</span>
											</td>

											
											<td>
												${orderHistoryProduct.orderDate}												
											</td>
											
											<td>
												<strong>${orderHistoryProduct.productQuantity * orderHistoryProduct.productPrice}</strong>
											</td>
											<td>
												
												<span id="orderStatus${orderHistoryProduct.productCode}">${orderHistoryProduct.orderStatus}</span>
												
												<c:if test="${orderHistoryProduct.orderStatus != 'Cancelled'}">
													<br>
													<br><br>
													<button id="link_cancelOrder${orderHistoryProduct.productCode}" type="submit" class="common-btn" 
													onclick="cancelOrder('${orderHistoryProduct.productCode}', '${orderHistoryProduct.orderId}');" >
													Cancel Order&nbsp;&nbsp;<i class="fa fa-times-circle"></i>
													</button>
												</c:if>
												
											</td>
										</tr>

										<c:set var="orderProductCount"
											value="${orderProductCount + 1}" scope="page" />
									</c:forEach>


									<c:if test="${orderProductCount == 0}">
										<tr>
											<td colspan="5" align="center">Order History Is Empty.</td>
										</tr>
									</c:if>

								</tbody>
							</table>
						</div>
					</div>

					<div id="div_userWishList" class="panel panel-info" style="display: none">
						<div class="panel-heading" align="center">
							<h1 class="panel-title">Wishlist</h1>
						</div>

						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th colspan="2" style="width: 50%">ITEM</th>
										<th style="width: 20%">OPERATION</th>
									</tr>
								</thead>

								<tbody>


									<c:set var="wishlistProductCount" value="0" scope="page" />
									<c:forEach items="${wishlistProductList}" var="wishlistProduct">

										<c:set var="isProductAddedToCart" value="0" scope="page" />
										<c:forEach items="${cartProductList}" var="cartProduct">
											<c:if
												test="${cartProduct.productCode == wishlistProduct.productCode}">
												<c:set var="isProductAddedToCart" value="1" scope="page" />
											</c:if>
										</c:forEach>


										<tr id="tr_wishlist${wishlistProduct.productCode}">
											<td>
												<form action="product-details" method="get">
													<input name="productCode" type="text"
														value="${wishlistProduct.productCode}"
														style="display: none" /> <input type="image"
														src="<%=request.getContextPath()%>/resources/images/product/85x100/${wishlistProduct.productCode}.jpg"
														class="img-responsive" alt="Submit">
												</form>
											</td>
											<td>${wishlistProduct.productName} <br> <strong>${wishlistProduct.productStatus}
													<br> Rs : ${wishlistProduct.productPrice}
											</strong>
											</td>

											<td><input type="submit" class="btn btn-link"
												value="Remove From Wishlist"
												onclick="deleteProductFromWishlist('${wishlistProduct.productCode}');" />

												<c:choose>
													<c:when test="${isProductAddedToCart == 0}">
														<button id="btn_addToCart${wishlistProduct.productCode}"
															 class="common-btn" onclick="addProductToCart('${wishlistProduct.productCode}');" >
															 Add To Cart&nbsp;&nbsp;<i class="fa fa-shopping-cart fa-lg"></i>
														</button>
													</c:when>

													<c:otherwise>
														<button type="button" class="common-btn-disabled"
															title="This product already added to cart">
															Added to Cart&nbsp;&nbsp;<i class="fa fa-shopping-cart fa-lg"></i>
														</button>
													</c:otherwise>
												</c:choose></td>
										</tr>

										<c:set var="wishlistProductCount"
											value="${wishlistProductCount + 1}" scope="page" />
									</c:forEach>


									<c:if test="${wishlistProductCount == 0}">
										<tr>
											<td colspan="5" align="center">Wishlist Is Empty.</td>
										</tr>
									</c:if>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<a href="#" class="back-to-top">Back to Top</a>	
			</div>
			
		</div>
	</div>

	<div class="col-md-1 hidden-xs hidden-sm"></div>

	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 padding-zero" id="footer-container">
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
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/user-profile.js"></script>
<script>
	$(document).ready(function(){
		$("#menu_profile").addClass("mainmenu-underline");
	});
</script>
</body>
</html>

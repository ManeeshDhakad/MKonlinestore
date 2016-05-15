<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String userName = null;
	Cookie[] cookies = request.getCookies();
	if(cookies !=null){
		for(Cookie ck : cookies) {
			if(ck.getName().equalsIgnoreCase("userName")) {
				userName = ck.getValue();
			}
		}
	}
	if(userName == null) 
		//((HttpServletResponse)response).sendRedirect(".");
%>

<div id="loading" >
  	<img id="loading-image" src="<%=request.getContextPath()%>/resources/images/loading.gif" alt="Loading..." />
</div>

<div id="header-navbar" >
	<nav class="navbar header-margin" style="height: 60px">
		<section class="ccblue header-sticky">
			<div class="mainmenu">
				<a href="home" style="margin-left: 230px"><img
					style="height: 60px; width: 85px"
					src="<%=request.getContextPath()%>/resources/images/mk-logo.png" />
					<img
					style="height: 50px; width: 200px"
					src="<%=request.getContextPath()%>/resources/images/onlinestore1.png" />
				</a>   

				<ul class="nav navbar-nav navbar-right" style="margin-right: 230px">
					<li ><a href="about"><span
							class="glyphicon glyphicon-info-sign"></span> About</a></li>
					<li><a href="contact"><span
							class="glyphicon glyphicon-phone-alt"></span> Contact</a></li>
					<li>
						<a href="view-cart"> 
							<span class="glyphicon glyphicon-shopping-cart"> </span>
							<c:if test="${cartProductCount == null}">
								<c:set var="cartProductCount" value="0"></c:set>
							</c:if>
							CART <strong><span class="badge" id="crtProductCount">${cartProductCount}</span></strong> </a>
					</li>
					
					<c:if test="${loginUserSesson != null}">
    					<c:set var="loginUserName" value="${loginUserSesson}"/>
							<%
								userName = (String)pageContext.getAttribute("loginUserName");
								if(userName == "logout")
									userName = null;
							%>
					</c:if>
					
    				<%if(userName == null || userName.length() == 0){ %>
 							<li><a data-toggle="modal" data-target="#login-modal" style="cursor: pointer"> <span
							class="glyphicon glyphicon glyphicon-log-in"></span> Log In	</a></li>
					<%}
					else {%>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Hi <span id="headerUserName"><%= userName%></span><span class="caret"></span></a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuDivider">
									<li><a href="user-profile?type=1"><span class="glyphicon glyphicon-user"></span>
										Profile</a></li>
									<li><a href="user-profile?type=2"><span
										class="glyphicon glyphicon-calendar"></span> Orders</a></li>
									<li><a href="user-profile?type=3"><span
										class="glyphicon glyphicon-heart-empty"></span> Wishlist</a></li>
									<li role="separator" class="divider" style="padding : 0px"></li>
									<li><a href="logout"><span
										class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
								</ul>
							</li>
					<% } %>
    		
				</ul>
			</div>
		</section>
	</nav>
	<nav class="navbar" style="background: none repeat scroll 0 0 #6f5499 ; height : 55px">
		<section class="ccblue">
			<div class="mainmenu">
				<ul class="nav navbar-nav navbar-left" style="margin-left: 230px">
					<li><a href="home"><span class="glyphicon glyphicon-home"></span>
							Home</a></li>
					<li><a href="product-catelog?category=mens" id="mans-fashion-link"><span> MEN </span></a></li>
					<li><a href="product-catelog?category=womens" id="womans-fashion-link"><span> WOMEN </span></a></li>
					<li><a href="product-catelog?category=kids" id="kids-fashion-link"><span> KID </span></a></li>
				</ul>
				
			</div>
		</section>
	</nav>

</div>

<!-- Refresh page on back button -->
<input type="hidden" id="refresh" value="no">

<!-- Success and error messages -->
<input type="hidden" id="messageStatus" value="${messageStatus}">

<!-- Success and error messages -->
<input type="hidden" id="profileType" value="${profileType}">


<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>



<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />

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
  	<img id="loading-image" class="img-responsive" src="<%=request.getContextPath()%>/resources/images/loading.gif" alt="Loading..." />
</div>

<c:if test="${loginUserSesson != null}">
    <c:set var="loginUserName" value="${loginUserSesson}"/>
		<%
			userName = (String)pageContext.getAttribute("loginUserName");
			if(userName == "logout")
			userName = null;
		%>
</c:if>

<div id="header-navbar" style="margin-bottom: 15px">
	<nav class="navbar header-margin"  style="height : 50px">
		<section class="ccblue header-sticky">
			<div class="mainmenu row">
			
				<div class="col-md-2 hidden-xs"></div>
				
				<div class="col-xs-12 col-sm-4 col-md-2 col-lg-2 ">
					<a href="home">
					<img class="hidden-sm hidden-md hidden-lg"
						style="height: 37px; width: 75px; margin-top: 5px"
						src="<%=request.getContextPath()%>/resources/images/mk-logo.png" />
						
						<img class="hidden-xs"
						style="height: 37px; width: 160px; margin-top: 5px"
						src="<%=request.getContextPath()%>/resources/images/mkonlinestore.png" />
					</a> 
						
					<button class="dropdown-toggle hidden-sm hidden-md hidden-lg" style="background: initial; border:none" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    					<img style="height: 25px; width: 50px"
						src="<%=request.getContextPath()%>/resources/images/drop-down.png" />
    					<span class="caret"></span>
  					</button>
  					<ul class="dropdown-menu padding-zero" aria-labelledby="dropdownMenu">
  						<%if(userName == null || userName.length() == 0){ %>
 							<li><a data-toggle="modal" data-target="#login-modal" style="cursor: pointer"> <span
							class="glyphicon glyphicon glyphicon-log-in"></span> Log In	</a></li>
						
						<% } else {%>
							
							<li><a href="user-profile?type=1"><span class="glyphicon glyphicon-user"></span> <%= userName%></a></li>
						<% } %>
  					
  						<li role="separator" class="divider padding-zero" style="padding : 0px 0px 0px 0px; margin: 0px"></li>
    					<li class="padding-zero"><a href="product-catelog?category=mens" ><span> MEN </span></a></li>
    					<li role="separator" class="divider padding-zero" style="padding : 0px 0px 0px 0px; margin: 0px"></li>
						<li class="padding-zero"><a href="product-catelog?category=womens"><span> WOMEN </span></a></li>
						<li role="separator" class="divider" style="padding : 0px 0px 0px 0px; margin: 0px"></li>
						<li class="padding-zero"><a href="product-catelog?category=kids"><span> KID </span></a></li>
						<li role="separator" class="divider" style="padding : 0px 0px 0px 0px; margin: 0px"></li>
						<li class="padding-zero"><a href="about"><span
							class="glyphicon glyphicon-info-sign"></span> About</a></li>
						<li role="separator" class="divider" style="padding : 0px 0px 0px 0px; margin: 0px"></li>
						<li class="padding-zero"><a href="contact" ><span
							class="glyphicon glyphicon-phone-alt"></span> Contact</a></li>
   						
  					</ul>
  					
  					<button class="btn btn-primary hidden-sm hidden-md hidden-lg " style="background: initial; border: none;" type="button" onclick="goToViewCart(); return false;">
 						 <span class="glyphicon glyphicon-shopping-cart"> </span>
						 <c:if test="${cartProductCount == null}">
							<c:set var="cartProductCount" value="0" scope="page"></c:set>
						</c:if>
							CART <strong><span class="badge crtProductCount" >${cartProductCount}</span></strong> 
					</button>
					
				</div>  
				<div class="col-sm-8 col-md-8 col-lg-8 hidden-xs">
					<ul class="nav navbar-nav">
						<li id="menu_man" ><a href="product-catelog?category=mens"><span> MEN </span></a></li>
						<li id="menu_woman" ><a href="product-catelog?category=womens"><span> WOMEN </span></a></li>
						<li id="menu_kid" ><a href="product-catelog?category=kids"><span> KID </span></a></li>
					
						<li id="menu_about" class="hidden-xs hidden-sm hidden-md" ><a href="about"><span
							class="glyphicon glyphicon-info-sign"></span> About</a></li>
						<li id="menu_contact" class="hidden-xs hidden-sm hidden-md"><a href="contact"><span
							class="glyphicon glyphicon-phone-alt"></span> Contact</a></li>
						<li id="menu_cart" class="hidden-xs">
							<a  href="#" onclick="goToViewCart(); return false;">
 						 		<span class="glyphicon glyphicon-shopping-cart"> </span>
						 		<c:if test="${cartProductCount == null}">
									<c:set var="cartProductCount" value="0" scope="page"></c:set>
								</c:if>
									CART <strong><span class="badge crtProductCount" >${cartProductCount}</span></strong> 
							</a>
						</li>
					
    					<%if(userName == null || userName.length() == 0){ %>
 								<li class="hidden-xs"><a data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#login-modal" style="cursor: pointer"> <span
								class="glyphicon glyphicon glyphicon-log-in"></span> Log In	</a></li>
					
						<% } else { %>
							
							<li id="menu_profile" class="dropdown hidden-xs"><a href="#" class="dropdown-toggle"
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
			</div>
		</section>
	</nav>
	
	

</div>

<div class="visible-xs-block isa_error">
	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <i class="fa fa-warning"></i> Please increase window size for better experience.
</div>



<!-- Refresh page on back button -->
<input type="hidden" id="refresh" value="no">

<!-- Success and error messages -->
<input type="hidden" id="messageStatus" value="${messageStatus}">

<!-- Success and error messages -->
<input type="hidden" id="profileType" value="${profileType}">

<!-- Success and error messages -->
<input type="hidden" id="loginUserName" value="<%= userName%>">


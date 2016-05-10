<div id="loading" style="display: none">
  	<img id="loading-image" src="<%=request.getContextPath()%>/resources/images/loading.gif" alt="Loading..." />
</div>

<div id="header-navbar" >
	<nav class="navbar header-margin" style="height: 60px">
		<section class="ccblue header-sticky">
			<div class="mainmenu">
								
				<div style="color: white; font-size: 18px">
					<a href="home" style="margin-left: 230px"><img
					style="height: 60px; width: 100px"
					src="<%=request.getContextPath()%>/resources/images/mk-logo.png" />
					<img
					style="height: 50px; width: 200px"
					src="<%=request.getContextPath()%>/resources/images/onlinestore.png" />
					</a>   
				
					<span class="glyphicon glyphicon-ok-circle" style="margin-top:10px; margin-left: 200px"></span>&nbsp; 100% Secured Payment And Original Product
				</div>
				
			</div>
		</section>
	</nav>
</div>

<!-- Refresh page on back button -->
<input type="hidden" id="refresh" value="no">

<!-- Success and error messages -->
<input type="hidden" id="messages" value="${messageStatus}">

<!-- Success and error messages -->
<input type="hidden" id="profileType" value="${profileType}">






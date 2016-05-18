<div id="loading">
  	<img id="loading-image" src="<%=request.getContextPath()%>/resources/images/loading.gif" alt="Loading..." />
</div>

<div id="header-navbar" >
	<nav class="navbar header-margin" style="height: 60px">
		<section class="ccblue header-sticky">
			<div class="mainmenu col-xs-12">
								
				<div style="color: white; font-size: 18px">
					<div class="col-md-2 hidden-xs"></div>
					<div class="col-xs-12 col-sm-4 col-md-4">
						<a href="home"><img
							style="height: 50px; width: 70px"
							src="<%=request.getContextPath()%>/resources/images/mk-logo.png" />
							<img class="hidden-xs hidden-sm"
							style="height: 50px; width: 130px"
							src="<%=request.getContextPath()%>/resources/images/onlinestore1.png" />
						</a>   
					</div>
					<div class="col-sm-6 col-md-6 hidden-xs" >
						<span class="glyphicon glyphicon-ok-circle" style="margin-top: 10px">100% Secured Payment </span>
					</div>
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
<input type="hidden" id="messages" value="${messageStatus}">

<!-- Success and error messages -->
<input type="hidden" id="profileType" value="${profileType}">






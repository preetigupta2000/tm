<div class="navbar navbar-inverse navbar-fixed-top clearfix">
	<div class="navbar-inner">
		<span class="address brand">
				<r:img dir="images" file="fonantrix-logo.png" alt="Logo" id="f-logo"/>
		</span>
		<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</a>
		<!-- Everything you want hidden at 940px or less, place within here -->
		<div class="nav-collapse collapse">
			<ul class="nav pull-right">
				<li><a href="${request.contextPath}/home"><i class="icon-home"></i></a></li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-cog"></i>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
						<li><a tabindex="-1" href="#">Action</a></li>		
						<li><a tabindex="-1" href="#">Another action</a></li>
						<li><a tabindex="-1" href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Separated link</a></li>
					</ul>
				</li>
				<li><a href="#"><i class="icon-question-sign"></i></a></li>
				<sec:ifLoggedIn><li><a href="${request.contextPath}/logout/index">Logout</a></li></sec:ifLoggedIn>
			</ul>
		<!-- .nav, .navbar-search, .navbar-form, etc -->
		</div>
	</div>
</div>
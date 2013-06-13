<div class="navbar navbar-inverse navbar-fixed-top clearfix">
	<div class="navbar-inner">
		<span class="address brand">
				<img src="../images/fonantrix-logo.png" alt="Logo" id="f-logo">
				x Acton MA
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
				<li><a href="#">Home</a></li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						Settings
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
				<li><a href="#">Help</a></li>
				<sec:ifLoggedIn><li><a href="/tm/logout/index">Logout</a></li></sec:ifLoggedIn>
			</ul>
		<!-- .nav, .navbar-search, .navbar-form, etc -->
		</div>
	</div>
</div>
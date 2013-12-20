<div class="container">
	<div class="navbar-header">
		<a href="#" class="navbar-brand">
			<r:img dir="images" class="img-responsive" file="fonantrix-logo.png" alt="Logo" id="f-logo"/>
        </a>
	</div>
	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li id="admin-panel" class="{{home}}">
				<a href="javascript:void(0);" title="Click to see logs." class="hide">
					<i class="fa fa-legal"></i>
				</a>
			</li>            
			<li id="home"><a href="${request.contextPath}/home" title="Home"><i class="fa fa-home"></i></a></li>
			<li id="back" class="brand-button">
				<a href="javascript:void(0);" title="Back"><i class="fa fa-back-btn"></i></a>
			</li>
			<li id="help"><a href="javascript:void(0);"><i class="fa fa fa-question-circle"></i></a></li>
			<sec:ifLoggedIn><li id="logout"><a href="javascript:void(0);" title="Profile">Logout</a></li></sec:ifLoggedIn>
		</ul>
	</div><!--/.nav-collapse -->
</div>
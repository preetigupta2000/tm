<!-- Top  Navbar for logo, brand, menu, and language selection -->
<div class="navbar navbar-inverse navbar-fixed-top main-header" role="navigation">
	<div class="container">
		<div class="navbar-header">
            <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">
            	<!--  >r:img dir="images" class="img-responsive" file="fonantrix-logo.png" alt="Logo" id="f-logo"/-->
            </a>
          </div>
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
				<li><a href="${request.contextPath}/home"><i class="fa fa-home"></i></a></li>
				<li class="dropdown">
	                <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="fa fa-cog"></i> <b class="caret"></b></a>
	                <ul class="dropdown-menu">
	                  <li><a href="#">Action</a></li>
	                  <li><a href="#">Another action</a></li>
	                  <li class="divider"></li>
	                  <li class="dropdown-header">Nav header</li>
	                  <li><a href="#">One more separated link</a></li>
	                </ul>
				</li>
				<li><a href="#"><i class="fa fa-question-circle"></i></a></li>
				<sec:ifLoggedIn><li><a href="${request.contextPath}/logout/index">Logout</a></li></sec:ifLoggedIn>
            </ul>
          </div><!--/.nav-collapse -->
    </div>
</div>

<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div id="registration">	
			<div class="container">
				<form id="register" class="form-horizontal" action="register/save" method="post" name="register">
				<div class="row" id="header">
					<div class="col-md-9">
						<ul class="breadcrumb breadcrumb-admin">
							<li><h2><a href="home">Home</a> <span class="divider">/</span></h2></li>
							<li class="active"><h2>New user Registration</h2></li>
						</ul>
		        	</div>
					<div class="col-md-3">
						<button type="submit" id="create-account" class="btn btn-default accountAction" ><i class="fa fa-save"></i>  Create Account</button>
					</div>        	
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="well well-admin">
								<div class="form-group">
									<label class="control-label" for="username">Username</label>
									<div class="controls">
										<input id="username" type="email" placeholder="email" name="username" required/>					
										<span class="alert alert-danger hide" id="error-name">
											<strong>Warning!</strong> Username can't be blank.
										</span>
										<span class="alert alert-danger hide" id="error-username">
											<strong>Warning!</strong> Username must be a valid email id.
										</span>		
									</div>
								</div>
								<div class="form-group">
									<label class="control-label" for="password">Password</label>
									<div class="controls">
										<input id="password"  type="password" placeholder="password" name="password" required/>
										<span class="alert alert-danger hide" id="error-password">
											<strong>Warning!</strong> Password can't be blank.
										</span>						
									</div>
								</div>
								<div class="form-group">
									<label class="control-label" for="confirmPassword">Confirm Password</label>
									<div class="controls">
										<input id="confirmPassword" placeholder="confirm password" type="password" name="confirmPassword" required/>
									</div>
								</div>
								<div class="form-group">													
									<label class="control-label" for="firstName">First Name</label>
									<div class="controls">
										<input id="firstName" placeholder="first name" type="text" name="firstName" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label" for="lastName">Last Name</label>
									<div class="controls">
										<input id="lastName" placeholder="last name" type="text" name="lastName" />
									</div>
								</div>									
						</div>	
					</div>
				</div>
				</form>							
			</div>
		</div>
	</body>
</html>
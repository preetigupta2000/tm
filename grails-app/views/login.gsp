<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<meta name="layout" content="mainlayout"/>
</head>
<body>
	<div class="container maincontainer">
		<div class="row-fluid">
			<div class="span4 hidden-phone">
				<img src="images/cal.png" class="cal-size" />
			</div>
			<div class="span3 hidden-phone">
				<div class="tm-info ">
					<h2>iTime</h2>
					<h3>Mobile Time Management</h3>
					<p>Ordinary people think merely of spending time. Great people think of using it.</p>
					<hr>
					<p>Time is the school in which we learn, time is the fire in which we burn.</p>
					<hr>
				</div>
			</div>			
			<div class="span5">
				<sec:ifLoggedIn>
				  <form action="logout" method='POST' id='ajaxLoginForm' name='ajaxLoginForm'>
			    	<h3> Welcome back</h3>
			    	<div class="hero-unit">
						<div id="user-info">
							<div class="profile-image">
								<a><i class="icon-user"></i></a>
							</div>	
							<div>
								<p><strong>${firstName}</strong></p>
								<p><small><sec:username/></small></p>
							</div>
						</div>
				     <sec:ifAllGranted roles="ROLE_HR">
				     	<div>
							<a href="javascript:{}" onclick="#" id="users-button" class="btn btn-large btn-info">Manage Users</a>     
							<a href="javascript:{}" onclick="#" id="status-button" class="btn btn-large btn-info">Review Status</a>
							<a href="viewclient" id="Users-button" class="btn btn-large btn-block">Manage Clients</a>
						</div>
					  </sec:ifAllGranted>
					  <sec:ifAllGranted roles="ROLE_COORDINATOR">
					  	<div>
						  	<a href="javascript:{}" onclick="#" id="projectstatus-button" class="btn btn-large btn-info">Review Project Status</a>
							<a href="javascript:{}" onclick="#" id="task-button" class="btn btn-large btn-info">Manage Tasks</a>
							<a href="javascript:{}" onclick="#" id="projects-button" class="btn btn-large btn-info">Manage Projects</a>
							<a href="viewclient" id="Users-button" class="btn btn-large btn-info">Manage Clients</a>
						</div>
	                  </sec:ifAllGranted>
	                  <sec:ifAllGranted roles="ROLE_ADMIN">
	                  	<div>
							<a href="javascript:{}" onclick="#" id="status-button" class="btn btn-large btn-info">Review Status</a>					
							<a href="javascript:{}" onclick="#" id="task-button" class="btn btn-large btn-info">Manage Tasks</a>
							<a href="javascript:{}" onclick="#" id="projects-button" class="btn btn-large btn-info">Manage Projects</a>
							<a href="viewclient" id="Users-button" class="btn btn-large btn-info">Manage Clients</a>				  	
						</div>
	                  </sec:ifAllGranted>
	                  <sec:ifAllGranted roles="ROLE_USER">
						<a href="javascript:{}" onclick="viewclient" id="timenetry-button" class="btn btn-large btn-block">Go to user time entry</a>
	                  </sec:ifAllGranted>
					  <a href="javascript:{}" onclick="document.getElementById('ajaxLoginForm').submit();" type="submit" class="btn btn-large btn-block">Logout</a>					
					</div>
				  </form>
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>		
					<form action="${request.contextPath}/j_spring_security_check" method='POST' id='ajaxLoginForm' name='ajaxLoginForm'>
						<h3>Sign In</h3>
						<div id="loginErrorMessage"></div>	
						<div class="hero-unit">
							<p>Enter your username (or email-id) followed by your password</p>
							 <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<input class="input-xlarge" id="username" name="j_username" type="email" placeholder="username" required>
							</div>
							<div class="input-prepend">
								<span class="add-on"><i class="icon-lock"></i></span>
								<input class="input-xlarge" id="j_password" name="j_password" type="Password" placeholder="password" required>
							</div>
							<a href="javascript:{}" onclick="document.getElementById('ajaxLoginForm').submit();" type="submit" class="btn btn-large btn-block">Login</a>
						</div>
					</form>
				</sec:ifNotLoggedIn>
			</div>		
		</div>
		<div class="row-fluid">
			<div class="span12">
				<h2>What Level of Time Management are You At?</h2>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span3 media">
				<div class="level">
					<img alt="Level 1" class="pull-left" src="images/human.png">
					<div class="media-body">
						<h4>Level 1</h4>
						<h4>The Oblivious</h4>
					</div>
					<p>People on this end of the spectrum have no concern or any idea where there time is being spent. They are easily tossed to and fro by the most fickle of circumstances. Oftentimes, because they are constantly letting any interruption affect them, they have a hard time keeping appointments or remembering things that they needed to get done.</p>
				</div>										
			</div>
			<div class="span3 media">
				<div class="level">
					<img alt="Level 2" class="pull-left" src="images/bulb.png">
					<div class="media-body">
						<h4>Level 2</h4>
						<h4>Becoming Aware</h4>
					</div>
					<p>As one assumes more responsibilities in life, an awareness of time (or an awareness of the lack of time) begins to develop. All of the pressures of life: the job, the bills, the kids begin to weigh upon us. Before long we notice that it's the end of the day and we haven't finished half the things we needed to get done. Sometimes we forget them alltogether.</p>
				</div>
			</div>
			<div class="span3 media">
				<div class="level">
					<img alt="Level 3" class="pull-left" src="images/man.png">
					<div class="media-body">
						<h4>Level 3</h4>
						<h4>Discarding The Useless</h4>
					</div>
					<p>Natural progression toward wanting more time begins our journey into the development of time-management skills. No longer are we satisfied in just finishing certain tasks, instead, we begin to assign tasks to certain times of the day. We start using calendars and iTime.</p>
				</div>
			</div>
			<div class="span3 media">
				<div class="level">
					<img alt="kaizen" class="pull-left" src="images/symbol.png">
					<div class="media-body">
						<h4>Level 4</h4>
						<h4>Kaizen</h4>
					</div>
					<p>If you've arrived at that place where you are operating in Level 3, perhaps you'd like to go a little further. I'm talking about a lifestyle of excellence, where highly-effective people function. They live by the philosophy of Kaizen. Kaizen is a Japanese term used in business. Its origins lie in the auto-manufacturing industry. In English, it is defined as "constant and never-ending improvement".</p>
				</div>
			</div>
		</div>
	</div>
</body>

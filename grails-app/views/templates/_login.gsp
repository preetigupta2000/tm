	<sec:ifLoggedIn>
	  <form action="logout" method='POST' id='ajaxLoginForm' name='ajaxLoginForm'>
    	<h3> Welcome back</h3>
    	<div class="jumbotron">
			<div id="user-info">
				<div class="profile-image">
					<a><i class="fa fa-user"></i></a>
				</div>	
				<div>
					<p><strong>${firstName}</strong></p>
					<p><small><sec:username/></small></p>
				</div>
			</div>
	     <sec:ifAllGranted roles="ROLE_HR">
	     	<div>
				 <a href="manageUsers"  id="users-button" class="btn btn-default">Manage Users</a>
				 <!-- Hr review status link -->   
				 <a href="hrreviewstatus"  id="status-button" class="btn btn-default">Review Status</a>
				  <!-- btn-info class to resolved button alignment issue -->   
				<a href="viewclient"  id="Users-button" class="btn btn-default">Manage Clients</a>
			</div>
		  </sec:ifAllGranted>
		  <sec:ifAllGranted roles="ROLE_COORDINATOR">
		  	<div>
			  	<a href="javascript:{}" onclick="#" id="projectstatus-button" class="btn btn-default">Review Project Status</a>
				<a href="tasks" onclick="#" id="task-button" class="btn">Manage Tasks</a>
				<a href="projects" onclick="#" id="projects-button" class="btn btn-default">Manage Projects</a>
				<a href="viewclient" id="Users-button" class="btn btn-default">Manage Clients</a>
			</div>
                </sec:ifAllGranted>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                	<div>
				<a href="adminReviewStatus" onclick="#" id="status-button" class="btn btn-default">Review Status</a>	     				
				<a href="tasks" onclick="#" id="task-button" class="btn btn-default">Manage Tasks</a> 
				<a href="tprojects" onclick="#" id="projects-button" class="btn btn-default">Manage Projects</a> 
				<a href="viewclient" id="Users-button" class="btn btn-default">Manage Clients</a> 			  	
			</div>
                </sec:ifAllGranted>
                <sec:ifAllGranted roles="ROLE_USER">
			       <a href="usertimetask" id="timenetry-button" class="btn btn-default btn-block">Go to user time entry</a>
                </sec:ifAllGranted>		
		</div>
	  </form>
	</sec:ifLoggedIn>
	<sec:ifNotLoggedIn>		
		<form action="${request.contextPath}/j_spring_security_check" method='POST' id='ajaxLoginForm' name='ajaxLoginForm'>
			<h3>SIGN IN</h3>
			<g:if test='${flash.message}'>
				<div class='loginErrorMessage'>${flash.message}</div>
			</g:if>
			<div class="jumbotron">
				<p>Enter your username (or email-id) followed by your password</p>
				 <div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span>
					<input class="form-control input-lg" id="username" name="j_username" type="email" placeholder="username" required>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input class="form-control input-lg" id="j_password" name="j_password" type="Password" placeholder="password" required>
				</div>
					<a href="javascript:{}" onclick="document.getElementById('ajaxLoginForm').submit();" type="submit" class="btn btn-default">Login</a>
					<a href="register" type="button" class="btn btn-default">Register</a>
			</div>
		</form>
	</sec:ifNotLoggedIn>
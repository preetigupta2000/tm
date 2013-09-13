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
				<!-- changes made by sunil -->  
				 <a href="manageUsers"  id="users-button" class="btn btn-large btn-info">Manage Users</a>   
				 <a href="#"  id="status-button" class="btn btn-large btn-info">Review Status</a>
				<a href="viewclient"  id="Users-button" class="btn btn-large btn-block">Manage Clients</a>
			</div>
		  </sec:ifAllGranted>
		  <sec:ifAllGranted roles="ROLE_COORDINATOR">
		  	<div>
			  	<a href="javascript:{}" onclick="#" id="projectstatus-button" class="btn btn-large btn-info">Review Project Status</a>
				<a href="tasks" onclick="#" id="task-button" class="btn btn-large btn-info">Manage Tasks</a>
				<a href="projects" onclick="#" id="projects-button" class="btn btn-large btn-info">Manage Projects</a>
				<a href="viewclient" id="Users-button" class="btn btn-large btn-info">Manage Clients</a>
			</div>
                </sec:ifAllGranted>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                	<div>
				
				
	     	<!-- changes made by sunil -->  
				<a href="adminReviewStatus" onclick="#" id="status-button" class="btn btn-large btn-info">Review Status</a>	     				
				<a href="tasks" onclick="#" id="task-button" class="btn btn-large btn-info">Manage Tasks</a> 
				<!-- changes made by sunil --> 
				<a href="tprojects" onclick="#" id="projects-button" class="btn btn-large btn-info">Manage Projects</a> 
				<!-- changes made by sunil --> 
				<a href="viewclient" id="Users-button" class="btn btn-large btn-info">Manage Clients</a> 
				<!-- changes made by sunil --> 				  	
			</div>
                </sec:ifAllGranted>
                <sec:ifAllGranted roles="ROLE_USER">
 
			       <a href="timeentry/${id}" onclick="viewusertime" id="timenetry-button" class="btn btn-large btn-block">Go to user time entry</a>
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
					<a href="javascript:{}" onclick="document.getElementById('ajaxLoginForm').submit();" type="submit" class="btn">Login</a>
					<a href="register" type="button" class="btn">Register</a>
			</div>
		</form>
	</sec:ifNotLoggedIn>
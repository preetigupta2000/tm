<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils" %>

<div id="home">
	{{#loggedin}}
	    <div id="loggedin-container">
	    	<h3> Welcome back</h3>
	    	<div class="jumbotron">
				<div id="user-info">
					<div class="profile-image">
						<a><i class="fa fa-user"></i></a>
					</div>	
					<div>
						<p><strong>{{firstname}} {{lastname}}</strong></p>
						<p><small>{{email}}</small></p>
					</div>				
				</div>	
				{{#isHR}}
		     	<div>
					<button id="users-button" class="btn btn-default">Manage Users</button>
					<!-- Hr review status link -->   
					<button  id="status-button" class="btn btn-default">Review Status</button>
					 <!-- btn-info class to resolved button alignment issue -->   
					<button id="client-button" class="btn btn-default">Manage Clients</button>
				</div>
				{{/isHR}}
				{{#isCOORDINATOR}}
		     	<div>
				  	<button id="projectstatus-button" class="btn btn-default">Review Project Status</button>
					<button id="task-button" class="btn btn-default">Manage Tasks</button>
					<button id="projects-button" class="btn btn-default">Manage Projects</button>
					<button id="client-button" class="btn btn-default">Manage Clients</button>					
				</div>
				{{/isCOORDINATOR}}
				{{#isADMIN}}
		     	<div>				
					<button id="status-button" class="btn btn-default">Review Status</button>	     				
					<button id="task-button" class="btn btn-default">Manage Tasks</button> 
					<button id="projects-button" class="btn btn-default">Manage Projects</button> 
					<button id="clients-button" class="btn btn-default">Manage Clients</button>
					<button id="users-button" class="btn btn-default">Manage Users</button>  
				</div>
				{{/isADMIN}}
				{{#isUSER}}
		     	<div>					
					<button id="timenetry-button" class="btn btn-default">Go to user time entry</button>
				</div>
				{{/isUSER}}
				<button id="logout-button" class="btn btn-large btn-block">Logout</button>
			</div>
	    </div>
	{{/loggedin}}
	{{^loggedin}}
		<form action="${request.contextPath}/j_spring_security_check" method='POST' id='ajaxLoginForm' name='ajaxLoginForm'>
			<h3>Log In</h3>
			<div id="loginErrorMessage"></div> 	
			<div class="jumbotron">
				 <div class="input-group">
					<span class="add-on"><i class="fa fa-user"></i></span>
					<input class="input-sm" id="username" name="j_username" type="email" placeholder="email" required>
				</div>
				<div class="input-group">
					<span class="add-on"><i class="fa fa-lock"></i></span>
					<input class="input-sm" id="j_password" name="j_password" type="Password" placeholder="password" required>
				</div>
				<button class="btn btn-large btn-block" id="login-button">
					Login
				</button> 
			</div>
		</form>
		<div id="loginErrorMessage"></div> 
	{{/loggedin}}				
</div>
	
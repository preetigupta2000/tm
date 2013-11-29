<!DOCTYPE html>   
<html lang="en">   
<head>  
	<meta name="layout" content="hrlayout">
</head>  
<body>
	<div id="wrapper" class="clearfix">
		<div class="container">
			<legend>Manage Accounts</legend>
			<div class="row" id="header">
				<ul class="span12 breadcrumb breadcrumb-admin">
					<li><h2><a href="${contextPath}/home">Home</a> <span class="divider">/</span></h2></li>
  					<li class="active"><h2>Manage Users</h2></li>
				</ul>
	        </div>
	     
			 
			<div class="row">
				<div class="span12 breadcrumb breadcrumb-admin">
					<a class="span2 btn" href="createUser">
						<img src="images/glyphicons_006_user_add.png" />
						<br>
						Create User
					</a>
					<a class="span2 btn" href="editUser">
						<img src="images/glyphicons_030_pencil.png" />
						<br>
						Edit User
					</a>
					<a class="span2 btn" class="btn" href="activateuser">
						<img src="images/glyphicons_206_ok_2.png" />
						<br>
						Activate User
					</a>
					<a class="span2 btn" class="btn" href="blockuser">
						<img src="images/glyphicons_199_ban.png" />
						<br>
						Block User
					</a>
					<a class="span2 btn"   href="deleteUsers">
						<img src="images/glyphicons_007_user_remove.png" />
						<br>
						Delete User
					</a>
				</div>
			</div>
			
			<div class="row">
				<div class="span12 well well-admin">
					<div class="row">
						<div class="span9">
							<div class="input-prepend input-append">
							<button class="btn" onclick="search();">Search</button><%--
							    <input class="span2" id="appendedInputButtons" type="text">
							    --%><g:textField id="appendedInputButtons"  name="searchTxt" class="span2"  value="${form?.searchTxt}"></g:textField>
							      <button id="reset" class="btn" type="button"  onclick="reset();"><i class="icon-remove"></i></button>
							      <span id="NoSearchText"></span>
							  
						    </div>
					    </div>
					    <div class="span3">
				    		Filter User By:
					    	<div class="btn-group" >
							    <a id="state" class="btn dropdown-toggle" data-toggle="dropdown" href="#" >
							    	State
							    	<span class="caret" ></span>
							    </a>
							    <ul  id="dropdown" class="dropdown-menu" ">
							    	<li><a id="active" onclick="active()">Active</a></li>
							    	<li><a id="block" onclick="block()" >Block</a></li>
							    </ul>
						    </div>
						</div>
				    </div>
				
					<table class="table table-striped table-bordered table-hover" id="no-more-tables">
						<thead>
							<tr>
								<th>#</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>User Name</th>
								<th>Active / Blocked</th>
								<th>Last Login</th>
								<th>Registration Date</th>
								<th>ID</th>
								<th>More Options</th>
							</tr>
						</thead>
						<tbody id="client-list">
							<g:if test="${users}">
								<g:each in="${users}" status="i" var="user">
						  			<tr>
						  				<td>${i+1}</td>
						  				<td data-title="First Name">${user.firstName}</td>
						  				<td data-title="Last Name">${user.lastName}</td>
						  				<td data-title="User Name">${user.username}</td>
						  				<td data-title="Active / Blocked">${user.status}</td>
						  				<td data-title="Last Login"></td>
						  				<td data-title="Registration Date"></td>
						  				<td data-title="ID">${user.id}</td>
						  				<td data-title="More Options"></td>
						  			</tr>
			  					</g:each>
			  				</g:if>
						</tbody>
					</table>
				</div>			
			</div>
			<div class="row">
				<div class="span12 well well-admin">
					<div id="columnChart" class="span5"></div>
					<div id="pieChart" class="span6"></div>
				</div>
			</div>
		</div>
		<!--Hidden item used in Chart.js  -->
		<div id="hidden" class="list">${pendingRequest}</div>
		<div id="hiddenuser" class="list">${total}</div>
</div>
</body>
</html>  
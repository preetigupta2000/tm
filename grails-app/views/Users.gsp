<g:set var="contextPath" value="${request.contextPath}"/>   
<html>   
	<head>  
		<meta name="layout" content="mainlayout">
		
	</head>  
	<body>
		<div id="manageusers">
			<div class="container maincontainer">
				<div class="row" id="header">
					<div class="span9">
						<ul class="breadcrumb breadcrumb-admin">
							<li><h2><a href="${contextPath}/home">Home</a> <span class="divider">/</span></h2></li>
		  					<li class="active"><h2>Manage Users</h2></li>
						</ul>
		        	</div>
					<div class="span3">
						<%--<button id="addNewUser" class="btn accountAction" data-toggle="modal" href="#addClientModal"><i class="icon-plus"></i>  Add New User</button>--%>
					</div>
				</div>
				<div class="row">
					<div class="span12">
						<div class="well well-admin">
							<table class="table table-striped table-bordered table-hover" id="no-more-tables">
								<thead>
									<tr>
										<th>#</th>
										<th>User Name</th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="client-list">
									<g:if test="${users}">
										<g:each in="${users}" status="i" var="user">
								  			<tr>
								  				<td>${i+1}</td>
								  				<td data-title="Name">${user.username}</td>
								  				<td data-title="Name">${user.firstName}</td>
								  				<td data-title="Name">${user.lastName}</td>
								  				<td data-title="Description">${user.status}</td>
								  				<td data-title="Option"><a href="manageUsers/${user.id}"><i class="icon-pencil" title="Edit UserInfo"></i></a> | 
								  				  <g:link id="${user.id}" action="deleteUser"><i class="icon-remove" title="Delete"></i></g:link>
												</td>
								  			</tr>
					  					</g:each>
					  				</g:if>
								</tbody>
							</table>
						</div>			
					</div>
				</div>		
			</div>
		</div>
	</div>
		
</body>

</html>  
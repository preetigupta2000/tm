<!DOCTYPE html>   
<html lang="en">   
<head>  
	<meta name="layout" content="mainlayout">
</head>  
<body>
	<div id="wrapper" class="clearfix">
		<div class="container maincontainer">
			<legend>Manage Accounts</legend>
			<div class="row" id="header">
				<ul class="span12 breadcrumb breadcrumb-admin">
					<li><h2><a href="${contextPath}/home">Home</a> <span class="divider">/</span></h2></li>
  					<li class="active"><h2>Manage Users</h2></li>
				</ul>
	        </div>
			
			<div class="row">
				<div class="span12 well well-admin">
					<table class="table table-striped table-bordered table-hover" id="no-more-tables">
						<thead>
							<tr>
								<th>#</th>
								<th>User id</th>
								<th>User Name</th>
								<th>Status</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody id="client-list">
							<g:if test="${users}">
								<g:each in="${users}" status="i" var="user">
						  			<tr>
						  				<td>${i+1}</td>
						  				<td data-title="First Name">${user.id}</td>
						  				<td data-title="User Name">${user.username}</td>
						  				<td data-title="status">${user.status}
						  				<td data-title="Option">
										<a href="activateuser/${user.id}/acticateBlockedUser" class="badge badge-info">Activate User</a>
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
</body>
</html>  
<!DOCTYPE html>   
<html lang="en">   
	<head>  
		<meta name="layout" content="mainlayout">
			
	</head>  
<body>
		<div id="wrapper" class="clearfix">
				<div class="bodycontainer maincontainer">
					
					<legend>Manage Accounts</legend>
			<div id="manageclients">
			<div class="container maincontainer">
				<div class="row" id="header">
					<div class="span12">
						<ul class="breadcrumb breadcrumb-admin">
							<li><h2><a href="${contextPath}/home">Home</a> <span class="divider">/</span></h2></li>
		  					<li class="active"><h2>Manage Users</h2></li>
						</ul>
		        	</div>
					
				</div>
				<div class="row-fluid">
				    	<div class="span12">
						<div class="well well-admin">
						
							<table class="table table-striped table-bordered table-hover" id="no-more-tables">
								<thead>
									<tr>
										<th>#</th>
										<th>User Name</th>
										<th>Email</th>
									   <th>Designation </th>
									<th>Correspondence Address</th>
										</tr>
								</thead>
							
								<tbody id="client-list">
									<g:if test="${users}">
										<g:each in="${users}" status="i" var="userinfo">
								  			<tr>
								  				<td>${i+1}</td>
								  				<td data-title="Name">${userinfo.user.username}</td>
								  				<td data-title="Description">${userinfo.user.email}</td>
								  				<td data-title="Description">${userinfo.designation}</td>
								  				<td data-title="Description">${userinfo.corresAddress}</td>
								  		
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
			</div>
		
</body>

</html>  
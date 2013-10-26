<g:set var="contextPath" value="${request.contextPath}"/>   
<html>   
	<head>  
		<meta name="layout" content="mainlayout">
	</head>  
	<body>
		<div id="manageusers">
			<div class="container maincontainer">
				<div class="row" id="header">
					<div class="span12">
						<div class="headerband">				
							<span id="headingtext">
								<a href="${contextPath}/home">
									<div class="circle pull-left">
										<i class="icon-home"></i>
									</div>
								</a>
								<span class="line-right"></span>							
			  						Manage Users
							</span>
							<span class="pull-right">
								<a href="#" onclick="window.history.back();">Return</a>
							</span>
						</div>
					</div>
				</div>			
				<div class="row">
					<div class="span12">
						<table class="table table-striped" id="no-more-tables">
							<tbody id="user-list">
								<g:if test="${users}">
									<g:each in="${users}" status="i" var="user">
							  			<tr>
							  				<td>${i+1}</td>
							  				<td data-title="Name">
							  					<h4>${user.username}</h4>			  					
							  					<p>${user.firstName} ${user.lastName}</p>
							  				</td>
							  				<td data-title="Status">
												<h6>${user.status}</h6>					  					
							  				</td>									  				
							  				<td data-title="Email">
							  				<h6>${user.email}</h6>
							  				</td>
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
		
	</body>
</html>  
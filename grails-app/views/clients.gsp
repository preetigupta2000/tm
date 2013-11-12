<g:set var="contextPath" value="${request.contextPath}"/>
<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div id="manageclients">
			<div class="container">
				<div class="row" id="header">
					<div class="col-md-12">
						<div class="headerband">				
							<span id="headingtext">
								<a href="${contextPath}/home">
									<div class="circle pull-left">
										<i class="fa fa-home"></i>
									</div>
								</a>
								<span class="line-right"></span>					
			  					Manage Clients
							</span>
							<span class="pull-right">
								<a href="#" onclick="window.history.back();">Return</a>
								<button id="addNewUser" class="btn btn-sm navigationbutton" data-toggle="modal" href="#addClientModal"><i class="fa fa-plus"></i>  Add New Client</button>
							</span>
						</div>			
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<!-- changes made by sunil -->	
						<table class="table table-striped" id="no-more-tables">
							<tbody id="client-list">
								<g:if test="${clients}">
									<g:each in="${clients}" status="i" var="client">
							  			<tr>
							  				<td>${i+1}</td>
							  				<td data-title="Name">
							  					<h4>${client.name}</h4>			  					
							  					<p>${client.description}</p>								  				
							  				</td>
							  				<td data-title="Projects">
							  					<h4>2</h4>
							  					<p>Projects</p>
												<a href="client/${client.id}/projects">Add New Project</a>								  					
							  				</td>
							  				<td data-title="Option">
												<div class="icons">
													<div class="circle">
														<a href="viewclient/${client.id}">
															<i class="fa fa-pencil"></i>
															<p>Edit</p>
														</a>
													</div>
													<div class="circle">
														<g:link id="${client.id}" action="deleteClient">
															<i class="fa fa-times"></i>
															<p>Delete</p>
														</g:link>
													</div>
													<div class="circle">
														<a href="client/${client.id}/projects">
															<i class="fa fa-eye"></i>
															<p>View</p>
														</a>
													</div>
												</div>
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
		<!-- Modal Client -->
		<div id="addClientModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<form id="addclient" method="post" name="addclient" action="viewclient">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">Add New Client Information</h3>
				</div>
				<div class="modal-body">
					<div class="form-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Client Name</label>
			          <div class="controls">
			            <g:textField  name="name" placeholder="Please enter the Client name" class="input-xlarge" value="${form?.name}"></g:textField>
			          </div>
			        </div>
			    	<div class="form-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Client Description</label>
			          <div class="controls">
			            <g:textField  name="description" placeholder="Please enter the Client Description" class="input-xlarge" value="${form?.description}"></g:textField>
			           </div>
			        </div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i> Close</button>
					<button class="btn btn-default navigationbutton"><i class="fa fa-ok"></i> Add</button>
				</div>
			</form>
		</div>
	</body>
</html>
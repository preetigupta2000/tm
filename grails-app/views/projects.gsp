<g:set var="contextPath" value="${request.contextPath}"/>
<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div id="manageprojects">
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
								<g:if test="${clientid != null}">
									<a href="${contextPath}/viewclient">Manage Client</a><span id="line-right"></span>
								</g:if>						
			  					Manage Projects
							</span>
							<span class="pull-right">
								<a href="#" onclick="window.history.back();">Return</a>
								<button id="addNewUser" class="btn btn-small navigationbutton" data-toggle="modal" href="#addProjectModal"><i class="icon-plus"></i>  Add New Project</button>
							</span>
						</div>
					</div>
				</div>
				<g:if test="${clientid != null}">
					<div class="row">
						<div class="span12">
							<div class="well">
								Client Id : ${clientid}
							</div>
						</div>
					</div>
				</g:if>
				<div class="row">
					<div class="span12">
						<!-- changes made by sunil -->	
						<table class="table table-striped" id="no-more-tables">
							<tbody id="client-list">
							   <g:if test="${projects}">
									<g:each in="${projects}" status="i" var="project">
							  			<tr>
							  				<td>${i+1}</td>
							  				<td data-title="Name">
							  					<h4>${project.name}</h4>
												<g:if test="${clientid == null}">
													<h6>${project.client.name}</h6>
												</g:if>					  					
							  					<p>${project.description}</p>
							  				</td>
							  				<td data-title="Tasks">
							  					<h4>2</h4>
							  					<p>Tasks</p>
												<a href="project/${project.id}/tasks">Add New Task</a>
							  				</td>	
								  			<td data-title="Option">
												<div class="icons">
													<div class="circle">
														<a href="${request.contextPath}/client/${project.client.id}/projects/${project.id}">
															<i class="icon-pencil"></i>
															<p>Edit</p>
														</a>
													</div>
													<div class="circle">
														<g:if test="${clientid != null}">
															<g:link id="${project.id}" params='[clientid:"${project.client.id}"]' action="deleteProject">
																<i class="icon-remove"></i>
																<p>Delete</p>
															</g:link>
														</g:if>
														<g:else>
															<g:remoteLink action="deleteProject" id="${project.id}"  params='[clientid:"${project.client.id}", mode:"project"]' before="if(!confirm('Are you sure?')) return false" >
																<i class="icon-remove"></i>
																<p>Delete</p>
															</g:remoteLink>
														</g:else>
													</div>
													<div class="circle">
														<a href="project/${project.id}/tasks">
															<i class="icon-eye-open"></i>
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
		<!-- Modal -->
		<div id="addProjectModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<form action="projects" method="post">
				<g:hiddenField id="clientid" name="clientid" value="${clientid}"/>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">Add New Project Information</h3>
				</div>
				<div class="modal-body">
					<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Project Name</label>
			          <div class="controls">
			            <g:textField  name="name" placeholder="Please enter the Client name" class="input-xlarge" value="${form?.name}"></g:textField>
			          </div>
			        </div>
			    	<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Project Description</label>
			          <div class="controls">
			            <g:textField  name="description" placeholder="Please enter the Client Description" class="input-xlarge" value="${form?.description}"></g:textField>
			           </div>
			        </div>
					<div class="control-group">
			          <label class="control-label">Select Client</label>
			          <div class="controls">
			          	<g:if test="${clientid == null}">
			          		<g:select id="client" optionKey="id" optionValue="name" name="client" from="${clientList}" onchange="setClientId(this);" />
			          	</g:if>
			          	<g:else>
			          		<g:textField disabled id="id-display" name="id-display" class="input-large" value="${clientid}"></g:textField>
			          	</g:else>
			          </div>
			        </div>	
			   </div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i> Close</button>
					<button type="submit" class="btn btn-primary navigationbutton"><i class="icon-ok"></i> Add</button>
				</div>
			</form>
		</div>
	</body>
</html>
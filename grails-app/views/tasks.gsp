<g:set var="contextPath" value="${request.contextPath}"/>
<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div id="managetasks">
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
										<a href="${contextPath}/viewclient">Manage Client</a><span class="line-right"></span>
									</g:if>						
									<g:if test="${projectid != null}">
										<a href="${contextPath}/projects">Manage Project</a><span class="line-right"></span>
									</g:if>										
			  						Manage Tasks
							</span>
							<span class="pull-right">
								<a href="#" onclick="window.history.back();">Return</a>
								<button id="addNewUser" class="btn btn-small navigationbutton" data-toggle="modal" href="#addTaskModal"><i class="icon-plus"></i>  Add New Task</button>
							</span>
						</div>
					</div>
				</div>
				<g:if test="${clientid != null}">
					<div class="row">
						<div class="span6">
							<div class="well">
								Client Id : ${clientid}
							</div>
						</div>
						<div class="span6">
							<div class="well">
								Project Id : ${projectid}
							</div>
						</div>						
					</div>
				</g:if>				
				<div class="row">
					<div class="span12">
						<!-- changes made by sunil -->	
						<table class="table table-striped" id="no-more-tables">
							<tbody id="Project-list">
							  <g:if test="${tasks}">
								<g:each in="${tasks}" status="i" var="task">
						  			<tr>
						  				<td>${i+1}</td>
						  				<td data-title="Name">
						  					<h4>${task.name}</h4>			  					
						  					<p>${task.description}</p>
						  				</td>
						  				<td data-title="Project">
						  					<h6>25th Oct. 2013</h6>
						  					<p>Estimated Date of Completion</p>						  					
						  				</td>					  				
						  				<td data-title="Project">
						  					<h6>Bhupender, Arpit</h6>
						  					<p>Assigned To</p>						  					
						  				</td>					  				
							  			<td data-title="Option">
											<div class="icons">
												<div class="circle">
													<a href="${request.contextPath}/project/${task.project.id}/tasks/${task.id}">
														<i class="icon-pencil"></i>
														<p>Edit</p>
													</a>
												</div>
												<div class="circle">
													<g:link id="${task.id}" params='[projectId:"${projectid}"]' action="deleteTask">
														<i class="icon-remove"></i>
														<p>Delete</p>
													</g:link>
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
		<div id="addTaskModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<form action="tasks" method="post">
			<g:hiddenField id="projectid" name="projectid" value="${projectid}"/>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">Add New Task Information</h3>
				</div>
				<div class="modal-body">
					<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Task Name</label>
			          <div class="controls">
			            <g:textField  name="name" placeholder="Please enter the Task name" class="input-xlarge" value="${form?.name}"></g:textField>
			          </div>
			        </div>
			    	<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Task Description</label>
			          <div class="controls">
			            <g:textField  name="description" placeholder="Please enter the Task Description" class="input-xlarge" value="${form?.description}"></g:textField>
			           </div>
			        </div>
					
			        <!-- changes made by sunil -->
			        <div class="control-group">
			          <label class="control-label">EstimatedHrs</label>
			          <div class="controls">
			         
			          	  <g:textField  name="estimatedHrs" placeholder="Please enter the Estmatedhrs" class="input-xlarge" value="${form?.estimatedHrs}"></g:textField>
	
			          </div>
			        </div>	
						
						<!-- changes made by sunil -->
					<div class="control-group">
			          <label class="control-label">Select Project</label>
			          <div class="controls">
			          	<g:if test="${projectid == null}">
			          		<g:select id="project" optionKey="id" optionValue="name" name="project" from="${projectList}" onchange="setProjectId(this);" />
			          	</g:if>
			          	<g:else>
			          		<g:textField disabled id="id-display" name="id-display" class="input-large" value="${projectid}"></g:textField>
			          	</g:else>
			          </div>
			        </div>	
					<!-- changes made by sunil -->	
			       <div class="control-group">
			          <label class="control-label">Status</label>
			          <div class="controls">
			         
			          	<g:select  name="status" from="${['Open', 'InProgress', 'Completed']}"  value="${form?.status}"/> 
	
			          </div>
			        </div>	
			        
			   </div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i> Close</button>
					<button type="submit" class="btn navigationbutton"><i class="icon-ok"></i> Add</button>
				</div>
			</form>
		</div>
	</body>
</html>

<g:set var="contextPath" value="${request.contextPath}"/>
<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div id="managetasks">
			<div class="container maincontainer">
				<div class="row" id="header">
					<div class="span9">
						<ul class="breadcrumb breadcrumb-admin">
							<li><h2><a href="${contextPath}/home">Home</a> <span class="divider">/</span></h2></li>
							<g:if test="${clientid != null && !clientid.isEmpty()}">
								<li><h2><a href="${contextPath}/viewclient">Client</a> <span class="divider">/</span></h2></li>
							</g:if>						
							<g:if test="${projectid != null}">
								<li><h2><a href="${contextPath}/projects">Project</a> <span class="divider">/</span></h2></li>
							</g:if>						
		  					<li class="active"><h2>Tasks</h2></li>
						</ul>
		        	</div>
					<div class="span3">
						<button id="addNewTask" class="btn accountAction" data-toggle="modal" href="#addProjectModal"><i class="icon-plus"></i>  Add New Task</button>
						<button id="taskCancel" href="javascript:history.back();" class="accountAction btn" ><i class="icon-remove"></i>  Cancel</button>
					</div>
				</div>
				<g:if test="${projectid != null}">
					<div class="row">		
						<div class="span12">
							<div class="well">
								<g:if test="${clientid != null && !clientid.isEmpty()}"> Client Id : ${clientid} |
								</g:if> 
								Project Id : ${projectid}
							</div>
						</div>
					</div>
				</g:if>
				<div class="row">
					<div class="span12">
						<div class="well well-admin">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>Task Name</th>
										<th>Description</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="Project-list">
									<g:each in="${tasks}" status="i" var="task">
							  			<tr>
							  				<td>${i+1}</td>
							  				<td data-title="Name">${task.name}</td>
							  				<td data-title="Description">${task.description}</td>
										  	<td data-title="Option">
										  		<g:if test="${clientid != null}">
										  			<a href="${request.contextPath}/client/${clientid}/project/${task.project.id}/tasks/${task.id}"><i class="icon-pencil" title="Edit"></i></a> |
										  		</g:if>
										  		<g:else>
										  			<a href="${request.contextPath}/project/${task.project.id}/tasks/${task.id}"><i class="icon-pencil" title="Edit"></i></a> |
										  		</g:else> 
								  				<g:link id="${task.id}" params='[projectId:"${projectid}"]' action="deleteTask"><i class="icon-remove" title="Delete"></i></g:link>
								  			</td>
							  			</tr>
				  					</g:each>
								</tbody>
							</table>
						</div>			
					</div>
				</div>		
			</div>
		</div>	
		<!-- Modal -->
		<div id="addProjectModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<form action="tasks" method="post">
			<g:hiddenField id="projectid" name="projectid" value="${projectid}"/>
			<g:hiddenField id="clientid" name="clientid" value="${clientid}"/>
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
			   </div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
			</form>
		</div>
	</body>
</html>
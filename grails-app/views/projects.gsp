
<g:set var="contextPath" value="${request.contextPath}"/>
<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div id="manageprojects">
			<div class="container maincontainer">
				<div class="row" id="header">
					<div class="span9">
						<ul class="breadcrumb breadcrumb-admin">
							<li><h2><a href="${contextPath}/home">Home</a> <span class="divider">/</span></h2></li>
							<g:if test="${clientid != null}">
								<li><h2><a href="${contextPath}/viewclient">Manage Client</a> <span class="divider">/</span></h2></li>
							</g:if>						
		  					<li class="active"><h2>Manage Projects</h2></li>
						</ul>
		        	</div>
					<div class="span3">
						<button id="addNewUser" class="btn accountAction" data-toggle="modal" href="#addProjectModal"><i class="icon-plus"></i>  Add New Project</button>
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
						<div class="well well-admin">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>Project Name</th>
										<th>Description</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="client-list">
									<g:each in="${projects}" status="i" var="project">
							  			<tr>
							  				<td>${i+1}</td>
							  				<td data-title="Name">${project.name}</td>
							  				<td data-title="Description">${project.description}</td>
								  	<td data-title="Option"><a href="${request.contextPath}/client/${clientid}/projects/${project.id}"><i class="icon-pencil" title="Edit"></i></a> | 
								  				<g:link id="${project.id}" params='[clientid:"${clientid}"]' action="deleteProject"><i class="icon-remove" title="Delete"></i></g:link>
								  				<a href="project/${project.id}/tasks" class="badge badge-info">View Tasks</a>
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
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
			</form>
		</div>
	</body>
</html>
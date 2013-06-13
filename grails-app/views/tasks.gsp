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
							<li><h2><a href="../home">Home</a> <span class="divider">/</span></h2></li>
		  					<li class="active"><h2>Manage Projects</h2></li>
						</ul>
		        	</div>
					<div class="span3">
						<button id="addNewUser" class="btn accountAction" data-toggle="modal" href="#addTaskModal"><i class="icon-plus"></i>  Add Task</button>
					</div>
				</div>
				<div class="row">
					<div class="span12">
						<div class="well well-admin">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>Task</th>
										<th>Description</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="client-list">
									<g:each in="${task}" status="i" var="Task">
							  			<tr>
							  				<td>${i+1}</td>
							  				<td data-title="Name">${fieldValue(bean:Task, field:'name')}</td>
							  				<td data-title="Description">${fieldValue(bean:Task, field:'description')}</td>
											<td data-title="Option">
												<g:link id="${fieldValue(bean:Task, field:'id')}" class="confirm-delete" controller="Task" action="editTask" params='[taskId:"${fieldValue(bean:Task, field:'id')}", projectId:"${projectId}"]'><i class="icon-pencil" title="Edit"></i></g:link> | <g:link id="${fieldValue(bean:Task, field:'id')}" class="confirm-delete" controller="Task" params='[projectId:"${projectId}"]' action="deleteTask" data-confirm="Are you sure you want to delete?"><i class="icon-remove" title="Delete"></i></g:link>
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
		<div id="addTaskModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<g:form controller="Task" action="addtask">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">Add New Task Information</h3>
				</div>
				<div class="modal-body">
					<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Task Name</label>
			          <div class="controls">
			            <g:textField name="name" placeholder="Please enter the Task name" class="input-xlarge" value="${form?.name}"></g:textField>
			          </div>
			        </div>
			    	<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Task Description</label>
			          <div class="controls">
			            <g:textField  name="description" placeholder="Please enter the Task Description" class="input-xlarge" value="${form?.description}"></g:textField>
			           </div>
			        </div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Add</button>
					<g:hiddenField name="projectId" value="${projectId}"/>
				</div>
			</g:form>
		</div>
	</body>
</html>
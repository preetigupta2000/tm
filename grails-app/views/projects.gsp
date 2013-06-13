<html>
	<head>
		<meta name="layout" content="mainlayout"/>
		<script type="text/javascript">	
		$(document).ready(function () {
			$(".add-task").click(function() {
				var currentProjectId = $(this).attr("id");
				$(".modal-add-button-hidden").attr("value",currentProjectId);
			});
			var clientId = "${clientId}";	
			if(clientId != "" && clientId != null)
			{
				jQuery("#clientIdHidden").val(clientId);
			}
			$('input[name=modalHidden]').val(jQuery('#client').val());
		});
		function setClientId(object)
		{
			$('input[name=modalHidden]').val($(object).val());
		}
		</script>
	</head>
	<body>
		<div id="manageprojects">
			<div class="container maincontainer">
				<div class="row" id="header">
					<div class="span9">
						<ul class="breadcrumb breadcrumb-admin">
							<li><h2><a href="../home">Home</a> <span class="divider">/</span></h2></li>						
		  					<li class="active"><h2>Manage Projects</h2></li>
						</ul>
		        	</div>
					<div class="span3">
						<button id="addNewUser" class="btn accountAction" data-toggle="modal" href="#addProjectModal"><i class="icon-plus"></i>  Add New Project</button>
					</div>
				</div>
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
									<g:each in="${project}" status="i" var="Project">
							  			<tr>
							  				<td>${i+1}</td>
							  				<td data-title="Name">${fieldValue(bean:Project, field:'name')}</td>
							  				<td data-title="Description">${fieldValue(bean:Project, field:'description')}</td>
											<td data-title="Option"><g:link id="${fieldValue(bean:Project, field:'id')}" class="confirm-delete" params='[projectId:"${fieldValue(bean:Project, field:'id')}",clientId:"${clientId}"]' controller="project" action="editProject"><i class="icon-pencil" title="Edit"></i></g:link> | <g:link id="${fieldValue(bean:Project, field:'id')}" params='[clientId:"${clientId}"]' class="confirm-delete" controller="Project" action="deleteProject" data-confirm="Are you sure you want to delete?"><i class="icon-remove" title="Delete"></i></g:link>
								  				<button id="${fieldValue(bean:Project, field:'id')}" class="btn btn-mini btn-primary add-task" type="button" data-toggle="modal" href="#addTaskModal">Add Task</button>
								  				<g:link params='[projectId:"${fieldValue(bean:Project, field:'id')}"]' class="badge badge-info" controller="task" action="viewtask">View Tasks</g:link>
								  				<g:hiddenField name="projectId" value="${fieldValue(bean:Project, field:'id')}"></g:hiddenField>
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
			<g:form controller="Project" action="addproject">
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
			        %{--
					<div class="control-group">
			          <label class="control-label">Associate Client</label>
			          <div class="controls">
			          	<g:select id="client" optionKey="id" optionValue="name" name="client" from="${clientList}" onchange="setClientId(this);" />
			          </div>
			        </div>--}%	
			   </div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Add</button>
				</div>
				<g:hiddenField name="modalHidden" value="${clientId}"/>
				<g:hiddenField id="clientIdHidden" name="clientId" value=""/>
			</g:form>
		</div>
		<div id="addTaskModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<g:form controller="Project" action="addtask">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">Add New Task Information</h3>
				</div>
				<div class="modal-body">
					<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Task Name</label>
			          <div class="controls">
			            <g:textField  name="name" placeholder="Please enter the Client name" class="input-xlarge" value="${form?.name}"></g:textField>
			          </div>
			        </div>
			    	<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Task Description</label>
			          <div class="controls">
			            <g:textField  name="description" placeholder="Please enter the Client Description" class="input-xlarge" value="${form?.description}"></g:textField>
			           </div>
			        </div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Add</button>
				</div>
				<g:hiddenField class="modal-add-button-hidden" name="projectID" value=""/>
				<g:hiddenField name="clientId" value="${clientId}"/>
			</g:form>
		</div>
	</body>
</html>
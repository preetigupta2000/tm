<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="mainlayout"/>
		<title>Insert title here</title>
		<style type="text/css">
		@media only screen and (max-width: 800px) {
		/* Force table to not be like tables anymore */
		#no-more-tables table,
		#no-more-tables thead,
		#no-more-tables tbody,
		#no-more-tables th,
		#no-more-tables td,
		#no-more-tables tr {
		display: block;
		}
		 
		/* Hide table headers (but not display: none;, for accessibility) */
		#no-more-tables thead tr {
		position: absolute;
		top: -9999px;
		left: -9999px;
		}
		 
		#no-more-tables tr { border: 1px solid #ccc; }
		 
		#no-more-tables td {
		/* Behave like a "row" */
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
		white-space: normal;
		text-align:left;
		}
		 
		#no-more-tables td:before {
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
		text-align:left;
		font-weight: bold;
		}
		 
		/*
		Label the data
		*/
		#no-more-tables td:before { content: attr(data-title); }
		}
		</style>
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
		<div class="container">
			<div class="row-fluid">
		  		<div class="span12">
		  			<button class="btn btn-small btn-primary add-project" type="button" data-toggle="modal" href="#addProjectModal">Add Project</button>
		  		</div>
		  	</div>
			<div class="row-fluid">
			  	<table id="no-more-tables" class="table table-striped table-hover table-bordered table-condensed">
			  		<thead>
			  			<tr>
			  				<th class="span2">Project Id</th>
			  				<th class="span3">Project</th>
			  				<th class="span5">Description</th>
			  				<th class="span2">Options</th>
			  			</tr>
			  		</thead>
			  		<tbody>
						<g:each in="${project}" status="i" var="Project">
				  			<tr>
				  				<td data-title="Project Id">${fieldValue(bean:Project, field:'id')}</td>
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
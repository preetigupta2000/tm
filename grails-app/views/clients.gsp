<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container">
			<div class="row-fluid">
		  		<div class="span12">
		  			<button class="btn btn-small btn-primary" type="button" data-toggle="modal" href="#addClientModal">Add Client</button>
		  		</div>
		  	</div>
			<div class="row-fluid">
			  	<table id="no-more-tables" class="table table-striped table-hover table-bordered table-condensed">
			  		<thead>
			  			<tr>
			  				<th>Client Id</th>
			  				<th>Client</th>
			  				<th>Description</th>
			  				<th>Options</th>
			  			</tr>
			  		</thead>
			  		<tbody>
						<g:each in="${client}" status="i" var="Client">
				  			<tr>
				  				<td data-title="Client Id">${fieldValue(bean:Client, field:'id')}</td>
				  				<td data-title="Name">${fieldValue(bean:Client, field:'name')}</td>
				  				<td data-title="Description">${fieldValue(bean:Client, field:'description')}</td>
				  				<td data-title="Option"><g:link id="${fieldValue(bean:Client, field:'id')}" controller="client" action="editClient" params='[clientId:"${fieldValue(bean:Client, field:'id')}"]'><i class="icon-pencil" title="Edit"></i></g:link> | <g:link id="${fieldValue(bean:Client, field:'id')}" class="confirm-delete" controller="Client" action="deleteClient" data-confirm="Are you sure you want to delete?"><i class="icon-remove" title="Delete"></i></g:link>
				  				<button id="${fieldValue(bean:Client, field:'id')}" class="btn btn-mini btn-primary add-project" type="button" data-toggle="modal" href="#addProjectModal">Add Project</button>
				  				<g:link params='[clientId:"${fieldValue(bean:Client, field:'id')}"]' class="badge badge-info" controller="project" action="viewprojects">View Projects</g:link>
				  				<g:hiddenField name="clientId" value="${fieldValue(bean:Client, field:'id')}"></g:hiddenField>
				  				</td>
				  			</tr>
				  		</g:each>
			  		</tbody>
			  	</table>
		  	</div>
		</div>
		<!-- Modal -->
		<div id="addClientModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<g:form controller="Client" action="addclient">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">Add New Client Information</h3>
				</div>
				<div class="modal-body">
					<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Client Name</label>
			          <div class="controls">
			            <g:textField  name="name" placeholder="Please enter the Client name" class="input-xlarge" value="${form?.name}"></g:textField>
			          </div>
			        </div>
			    	<div class="control-group">
			          <!-- Text input-->
			          <label class="control-label" for="input01">Client Description</label>
			          <div class="controls">
			            <g:textField  name="description" placeholder="Please enter the Client Description" class="input-xlarge" value="${form?.description}"></g:textField>
			           </div>
			        </div>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Add</button>
				</div>
			</g:form>
		</div>
		<div id="addProjectModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<g:form controller="Client" action="addproject">
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
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					<button class="btn btn-primary">Add</button>
					<g:hiddenField class="modal-add-button-hidden" name="modalHidden" value=""/>
				</div>
			</g:form>
		</div>
	</body>
</html>
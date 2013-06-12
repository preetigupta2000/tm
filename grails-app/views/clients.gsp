<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div id="manageclients">
			<div class="container maincontainer">
				<div class="row" id="header">
					<div class="span9">
						<ul class="breadcrumb breadcrumb-admin">
		  					<li class="active"><h2>Manage Clients</h2></li>
						</ul>
		        	</div>
					<div class="span3">
						<button id="addNewUser" class="btn accountAction" data-toggle="modal" href="#addClientModal"><i class="icon-plus"></i>  Add New Client</button>
					</div>
				</div>
				<div class="row">
					<div class="span12">
						<div class="well well-admin">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Description</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="client-list">
									<g:each in="${client}" status="i" var="Client">
							  			<tr>
							  				<td>${i+1}</td>
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
				</div>		
			</div>
		</div>
		<!-- Modal Client -->
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
		<!-- Modal Project -->
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
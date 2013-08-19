<g:set var="contextPath" value="${request.contextPath}"/>
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
							<li><h2><a href="${contextPath}/home">Home</a> <span class="divider">/</span></h2></li>
		  					<li class="active"><h2>Manage Clients</h2></li>
						</ul>
		        	</div>
					<div class="span3">
						
						<button id="addNewUser" class="btn accountAction" data-toggle="modal" href="#addClientModal"><i class="icon-plus"></i>  Add New Client</button>
						<!-- changes made by sunil -->	
							<button id="CancelClient" onclick=" window.history.back();"   class="btn accountAction" ><i class="icon-remove"></i>  Cancel</button>
					</div>
				</div>
				<div class="row">
					<div class="span12">
						<div class="well well-admin">
						<!-- changes made by sunil -->	
							<table class="table table-striped table-bordered table-hover" id="no-more-tables">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Description</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="client-list">
									<g:if test="${clients}">
										<g:each in="${clients}" status="i" var="client">
								  			<tr>
								  				<td>${i+1}</td>
								  				<td data-title="Name">${client.name}</td>
								  				<td data-title="Description">${client.description}</td>
								  				<td data-title="Option"><a href="viewclient/${client.id}"><i class="icon-pencil" title="Edit"></i></a> | 
								  				<g:link id="${client.id}" action="deleteClient"><i class="icon-remove" title="Delete"></i></g:link>
								  				<a href="client/${client.id}/projects" class="badge badge-info">View Projects</a>
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
		</div>
		<!-- Modal Client -->
		<div id="addClientModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<form id="addclient" method="post" name="addclient" action="viewclient">
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
			</form>
		</div>
	</body>
</html>
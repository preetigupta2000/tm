<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container">
			<g:form id="${client.id}" method="put" action="viewclient">
			<div class="row" id="header">
				<div class="col-md-9">
					<ul class="breadcrumb breadcrumb-admin">
						<li><h2><a href=viewclient>Clients</a> <span class="divider">/</span></h2></li>
	  					<li class="active"><h2>Edit Client</h2></li>
					</ul>
	        	</div>
				<div class="col-md-3">
					<button id="clientCancel" href="javascript:history.back();" class="accountAction btn btn-default" ><i class="fa fa-remove"></i>  Cancel</button>
					<button id="clientEdit" class="accountAction btn btn-default" ><i class="fa fa-save"></i>  Save</button>					
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="well welladmin">
							<div class="form-group">
						        <label class="control-label">Client Id</label>
								<div class="controls">
								    <div class="input-group">
										<g:textField disabled id="id-display" name="id-display" class="input-lg" value="${client.id}"></g:textField>
									</div>
								</div>
							</div>
							<div class="form-group">
						        <label class="control-label">Client Name</label>
								<div class="controls">
								    <div class="input-group">
										<g:textField id="name" name="name" placeholder="Client Name" class="input-xlarge" value="${client.name}"></g:textField>
									</div>
								</div>
							</div>
							<div class="form-group">
						        <label class="control-label">Client Description</label>
								<div class="controls">
								    <div class="input-group">
										<g:textField id="description" name="description" placeholder="Description" class="input-xlarge" value="${client.description}"></g:textField>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
			</g:form>			
		</div>	
	</body>
</html>
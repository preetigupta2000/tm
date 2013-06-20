<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container">
			<g:form id="${client.id}" method="put" action="projects">
			<g:hiddenField name="clientId" value="${clientId}"/>
			<div class="row" id="header">
				<div class="span9">
					<ul class="breadcrumb breadcrumb-admin">
						<li><h2><a href=viewclient>Projects</a> <span class="divider">/</span></h2></li>
	  					<li class="active"><h2>Edit Project</h2></li>
					</ul>
	        	</div>
				<div class="span3">
					<button id="clientEdit" class="accountAction btn" ><i class="icon-save"></i>  Save</button>
				</div>
			</div>
			<div class="row">
				<div class="span12">
					<div class="well welladmin">
							<div class="control-group">
						        <label class="control-label">Project Id</label>
								<div class="controls">
								    <div class="input-prepend">
										<g:textField disabled id="id-display" name="id-display" class="input-large" value="${project.id}"></g:textField>
									</div>
								</div>
							</div>
							<div class="control-group">
						        <label class="control-label">Project Name</label>
								<div class="controls">
								    <div class="input-prepend">
										<g:textField id="name" name="name" placeholder="Client Name" class="input-xlarge" value="${project.name}"></g:textField>
									</div>
								</div>
							</div>
							<div class="control-group ">
						        <label class="control-label">Project Description</label>
								<div class="controls">
								    <div class="input-prepend">
										<g:textField id="description" name="description" placeholder="Description" class="input-xlarge" value="${project.description}"></g:textField>
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
			<legend>Edit Project</legend>
			<div class="well">
		    	<g:form id="signup" controller="Project" action="updateProject">
					<div class="control-group">
				        <label class="control-label">Project Name</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<g:textField id="pname" name="name" placeholder="Project Name" class="input-xlarge" value="${project.name}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group ">
				        <label class="control-label">Project Description</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<g:textField id="description" name="description" placeholder="Description" class="input-xlarge" value="${project.description}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"></label>
				      	<div class="controls">
				       		<button type="submit" class="btn btn-success">Submit</button>
				      	</div>
					</div>
					<g:hiddenField name="projectId" value="${project.id}"/>
					<g:hiddenField name="clientId" value="${clientId}"/>
			  	</g:form>
			</div>

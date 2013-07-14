<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container maincontainer">
			<g:form id="${project.id}" method="put" action="projects">
			<g:hiddenField name="clientid" value="${clientid}"/>
			<g:hiddenField name="mode" value="${mode}"/>
			<div class="row" id="header">
				<div class="span9">
					<ul class="breadcrumb breadcrumb-admin">
						<g:if test="${clientid != null}">
							<li><h2><a href="${contextPath}/viewclient">Client</a> <span class="divider">/</span></h2></li>
						</g:if>
						<li><h2><a href=viewclient>Projects</a> <span class="divider">/</span></h2></li>
	  					<li class="active"><h2>Edit Project</h2></li>
					</ul>
	        	</div>
				<div class="span3">
					<button id="projectCancel" href="javascript:history.back();" class="accountAction btn" ><i class="icon-remove"></i>  Cancel</button>				
					<button id="projectEdit" class="accountAction btn" ><i class="icon-save"></i>  Save</button>
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

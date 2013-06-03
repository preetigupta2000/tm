<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container">
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
		</div>
	</body>
</html>
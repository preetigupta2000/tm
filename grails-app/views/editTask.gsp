<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container">
			<legend>Edit Task</legend>
			<div class="well">
		    	<g:form id="signup" controller="Task" action="updateTask">
					<div class="control-group">
				        <label class="control-label">Task Name</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<g:textField id="tname" name="name" placeholder="Task Name" class="input-xlarge" value="${task.name}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group ">
				        <label class="control-label">Task Description</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<g:textField id="description" name="description" placeholder="Description" class="input-xlarge" value="${task.description}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"></label>
				      	<div class="controls">
				       		<button type="submit" class="btn btn-success">Submit</button>
				      	</div>
					</div>
					<g:hiddenField name="taskId" value="${task.id}"/>
					<g:hiddenField name="projectId" value="${projectId}"/>
			  	</g:form>
			</div>
		</div>
	</body>
</html>
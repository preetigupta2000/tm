<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container">
			<g:form id="${task.id}" method="put" action="tasks">
			<g:hiddenField name="projectid" value="${projectid}"/>
			<div class="row" id="header">
				<div class="col-md-9">
					<ul class="breadcrumb breadcrumb-admin">
						<li><h2><a href=projects>Projects</a> <span class="divider">/</span></h2></li>
	  					<li class="active"><h2>Edit Task</h2></li>
					</ul>
	        	</div>
				<div class="col-md-3">
					<button id="clientEdit" class="accountAction btn btn-default" ><i class="fa fa--save"></i>  Save</button>
				</div>
			</div>
			<g:if test="${projectid != null}">
				<div class="row">
					<div class="col-md-12">
						<div class="well">
							Project Id : ${projectid}
						</div>
					</div>
				</div>
			</g:if>				
			<div class="row">
				<div class="col-md-12">
					<div class="well welladmin">				
							<div class="form-group">
						        <label class="control-label">Task Id</label>
								<div class="controls">
								    <div class="input-group">
										<g:textField disabled id="id-display" name="id-display" class="input-lg" value="${task.id}"></g:textField>
									</div>
								</div>
							</div>
							<div class="form-group">
						        <label class="control-label">Task Name</label>
								<div class="controls">
								    <div class="input-group">
										<g:textField id="name" name="name" placeholder="Client Name" class="input-xlarge" value="${task.name}"></g:textField>
									</div>
								</div>
							</div>
							<div class="form-group">
						        <label class="control-label">Task Description</label>
								<div class="controls">
								    <div class="input-group">
										<g:textField id="description" name="description" placeholder="Description" class="input-xlarge" value="${task.description}"></g:textField>
									</div>
								</div>
							</div>
							<%--<div class="form-group">
						        <label class="control-label">status</label>
								<div class="controls">
								    <div class="input-group">
										<g:textField id="description" name="description" placeholder="Description" class="input-xlarge" value="${task.status}"></g:textField>
									</div>
								</div>
							</div>
					--%></div>
				</div>
			</div>
			</g:form>		
		</div>
	</body>
</html>

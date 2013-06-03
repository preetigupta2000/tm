<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container">
			<legend>Edit Client</legend>
			<div class="well">
		    	<g:form id="signup" controller="Client" action="updateClient">
					<div class="control-group">
				        <label class="control-label">Client Name</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<g:textField id="cname" name="name" placeholder="Client Name" class="input-xlarge" value="${client.name}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group ">
				        <label class="control-label">Client Description</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<g:textField id="description" name="description" placeholder="Description" class="input-xlarge" value="${client.description}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"></label>
				      	<div class="controls">
				       		<button type="submit" class="btn btn-success">Submit</button>
				      	</div>
					</div>
					<g:hiddenField name="clientId" value="${client.id}"/>
			  	</g:form>
			</div>
		</div>
	</body>
</html>
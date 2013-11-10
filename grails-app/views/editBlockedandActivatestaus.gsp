<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container"><%--
			<g:form id="${user.id}" method="put" action="blockStatus" controller="HRReviewStatus">
				--%><g:form id="${user.id}" method="put" action="update" controller="HRReviewStatus">
			<div class="row" id="header">
				<div class="span9">
					<ul class="breadcrumb breadcrumb-admin">
						<li><h2><a href=viewclient>Users</a> <span class="divider">/</span></h2></li>
	  					<li class="active"><h2>Edit Users</h2></li>
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
						        <label class="control-label">User Id</label>
								<div class="controls">
								    <div class="input-prepend">
										<g:textField disabled id="id-display" name="id-display" class="input-large" value="${user.id}"></g:textField>
									</div>
								</div>
							</div>
							<div class="control-group">
						        <label class="control-label">User Name</label>
								<div class="controls">
								    <div class="input-prepend">
										<g:textField disabled id="id-display" name="username" placeholder="user Name" class="input-large" value="${user.username}"></g:textField>
									</div>
								</div>
							</div>
							<div class="control-group ">
						        <label class="control-label"> Status</label>
								<div class="controls">
								    <div class="input-prepend">
										<g:textField id="mobile" name="status" placeholder="status" class="input-xlarge"  value="${form?.status}"></g:textField>
									</div>
								</div>
								
								
					</div>
				</div>
			</div>
			</g:form>			
		</div>	
	</body>
</html>
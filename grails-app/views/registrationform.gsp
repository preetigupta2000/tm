<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="mainlayout"/>
		<g:javascript src="jquery.validate.js"></g:javascript>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#signup").validate({
					rules:{
						firstname:"required",
						lastname:"required",
						email:{
							required:true,
							email: true
						},
						passwd:{
							required:true,
							minlength: 8
						},
						conpasswd:{
							required:true,
							equalTo: "#passwd"
						},
						gender:"required"
					},
					errorClass: "help-inline"
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<legend>Sign Up</legend>
			<div class="well">
		    	<g:form id="signup" class="form-horizontal" method="post" controller="Registration" action="save">
					<div class="control-group">
				        <label class="control-label">First Name</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<g:textField id="fname" name="firstname" placeholder="First Name" class="input-xlarge" required="" value="${form?.firstname}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group ">
				        <label class="control-label">Last Name</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<g:textField id="lname" name="lastname" placeholder="Last Name" class="input-xlarge" required="" value="${form?.lastname}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group">
				        <label class="control-label">Username/Email</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span>
								<input class="input-xlarge" id=email type="email" name="email" placeholder="Email" required value="${form?.email}"/>
							</div>
						</div>
					</div>
					<div class="control-group">
				        <label class="control-label">Password</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-lock"></i></span>
								<g:textField id="passwd" type="Password" name="password" placeholder="Password" required="" class="input-xlarge" value="${form?.password}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group">
				        <label class="control-label">Confirm Password</label>
						<div class="controls">
						    <div class="input-prepend">
								<span class="add-on"><i class="icon-lock"></i></span>
								<g:textField id="conpasswd" type="Password" name="confirmPassword" placeholder="Confirm Password" required="" class="input-xlarge" value="${form?.confirmPassword}"></g:textField>
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"></label>
				      	<div class="controls">
				       		<button type="submit" class="btn btn-success" >Create My Account</button>
				      	</div>
					</div>
			  	</g:form>
			</div>
		</div>
	</body>
</html>
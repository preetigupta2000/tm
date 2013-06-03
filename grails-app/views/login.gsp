<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container">
			<div class="row-fluid">
				<div class="span6 hidden-phone">
					<img src="../images/cal.png"/>
				</div>
				<div class="span5 offset1">
					<div id="loginform" class="row-fluid">
						<div class="row-fluid">
							<div class='fheader span12'></div>
							<g:if test='${flash.message}'>
								<div class='login_message'>${flash.message}</div>
							</g:if>
						</div>
						<div class="row-fluid">
							<form action='${postUrl}' method='POST' id='loginhorizontalform' class='cssform span12' autocomplete='off'>
								<sec:ifNotLoggedIn>
								<div class="row-fluid">
									<div class="span12">
										<h3>Sign In</h3>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span12">
										<h5>Enter your username (or email-id) followed by your password.</h5>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span12 hero-unit">
										<div class="row-fluid">
											<div class="span12 input-prepend">
												<span class="add-on"><img src="../images/user.png"></span>
												<input class="text_ span2 input-xlarge" id="username" type="email" name="j_username" placeholder="Email" required>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12 input-prepend">
												<span class="add-on"><img src="../images/lock.png"></span>
												<input class="text_ span2 input-xlarge" id="j_password" type="Password" name='j_password' placeholder="Password" required>
											</div>
										</div>
										<div class="row-fluid">
											<button class="btn btn-primary btn-large btn-block span12" id="login-button" value="${message(code: "springSecurity.login.button")}">
												Login
											</button>
										</div>
										<div class="row-fluid">
											<a type="button" class="btn btn-warning  btn-block span12" href="${request.contextPath}/registration/register" data-toggle="modal">Register</a>
										</div>
									</div>
								</div>
								</sec:ifNotLoggedIn>
								<sec:ifLoggedIn>
								<div class="row-fluid">
									<div class="span12">
										<h3>Welcome Back </h3>
									</div>
								</div>
								<div class="row-fluid">
			                        <div class="span12 hero-unit">
			                           <div class="row-fluid">
			                              <div class="span12 row-fluid hero-unit  btn-large btn-block" id="AdminLogo">
			                                 <div class="span3  btn-large" id="innerdiv"><span class="add-on"><img src="../images/UserImage.jpg"></span></div>
			                                 <div class="span6">
			                                 	<strong>${firstName}</strong><br/>
												<small><sec:username/></small>
			                                 </div>
			                              </div>
			                              <sec:ifAllGranted roles="ROLE_HR">
										  	<div class="row-fluid">
			                                	<a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Manage Users</a>
			                              	</div>
			                              	<div class="row-fluid">
			                                	<a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Review Status</a>
			                              	</div>
			                              	<div class="row-fluid">
			                                	<a type="button" class="btn btn-info btn-block span12" href="${request.contextPath}/client/viewclient" data-toggle="modal">Manage Clients</a>
			                              	</div>
										  </sec:ifAllGranted>
										  <sec:ifAllGranted roles="ROLE_COORDINATOR">
				                              <div class="row-fluid">
				                                 <a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Review Project Status</a>
				                              </div>
				                              <div class="row-fluid">
				                                 <a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Manage Tasks</a>
				                              </div>
				                              <div class="row-fluid">
				                                 <a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Manage Projects</a>
				                              </div>
				                              <div class="row-fluid">
				                                 <a type="button" class="btn btn-info btn-block span12" href="${request.contextPath}/client/viewclient" data-toggle="modal">Manage Clients</a>
				                              </div>
			                              </sec:ifAllGranted>
			                              <sec:ifAllGranted roles="ROLE_ADMIN">
				                              <div class="row-fluid">
				                                 <a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Review Status</a>
				                              </div>
				                              <div class="row-fluid">
				                                 <a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Manage Tasks</a>
				                              </div>
				                              <div class="row-fluid">
				                                 <a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Manage Projects</a>
				                              </div>
				                              <div class="row-fluid">
				                                 <a type="button" class="btn btn-info btn-block span12" href="${request.contextPath}/client/viewclient" data-toggle="modal">Manage Clients</a>
				                              </div>
			                              </sec:ifAllGranted>
			                              <sec:ifAllGranted roles="ROLE_USER">
			                              	  <div class="row-fluid">
			                              	  	 <a type="button" class="btn btn-info btn-block disabled span12" href="#" data-toggle="modal">Go to user time entry</a>
			                              	  </div>
			                              </sec:ifAllGranted>
			                           </div>
			                        </div>
								</div>
								</sec:ifLoggedIn>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<sec:ifNotLoggedIn>
		<div class="container-fluid visible-desktop">
			<div class="row-fluid quote">
				What Level of Time Management are You At?
			</div>
			<div class="row-fluid">
				<div class="span3 border">
					<div class="level">
						<img alt="Level 1" class="pull-left" src="../images/human.png">
						<div class="media-body">
							<h4>Level 1</h4>
							<h4>The Oblivious</h4>
						</div>
						<p>People on this end of the spectrum have no concern or any idea where there time is being spent. They are easily tossed to and fro by the most fickle of circumstances. Oftentimes, because they are constantly letting any interruption affect them, they have a hard time keeping appointments or remembering things that they needed to get done.</p>
					</div>										
				</div>
				<div class="span3 border">
					<div class="level">
						<img alt="Level 2" class="pull-left" src="../images/bulb.png">
						<div class="media-body">
							<h4>Level 2</h4>
							<h4>Becoming Aware</h4>
						</div>
						<p>As one assumes more responsibilities in life, an awareness of time (or an awareness of the lack of time) begins to develop. All of the pressures of life: the job, the bills, the kids begin to weigh upon us. Before long we notice that it's the end of the day and we haven't finished half the things we needed to get done. Sometimes we forget them alltogether.</p>
					</div>
				</div>
				<div class="span3 border">
					<div class="level">
						<img alt="Level 3" class="pull-left" src="../images/man.png">
						<div class="media-body">
							<h4>Level 3</h4>
							<h4>Discarding The Useless</h4>
						</div>
						<p>Natural progression toward wanting more time begins our journey into the development of time-management skills. No longer are we satisfied in just finishing certain tasks, instead, we begin to assign tasks to certain times of the day. We start using calendars and iTime.</p>
					</div>
				</div>
				<div class="span3 border">
					<div class="level">
						<img alt="kaizen" class="pull-left" src="../images/symbol.png">
						<div class="media-body">
							<h4>Level 4</h4>
							<h4>Kaizen</h4>
						</div>
						<p>If you've arrived at that place where you are operating in Level 3, perhaps you'd like to go a little further. I'm talking about a lifestyle of excellence, where highly-effective people function. They live by the philosophy of Kaizen. Kaizen is a Japanese term used in business. Its origins lie in the auto-manufacturing industry. In English, it is defined as "constant and never-ending improvement".</p>
					</div>
				</div>
			</div>
		</div>
		</sec:ifNotLoggedIn>
	</body>
</html>
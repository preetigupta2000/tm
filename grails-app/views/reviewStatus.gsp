<html>
	<head>
		<meta name="layout" content="chartlayout"/>
	</head>
	<body>
		<div class="container">	
			<div class="row" >
				<div class="col-md-6">
					<div id="containerChart"></div>
				</div>
				<div class="col-md-6">
					 <div id="verticalBarContainer"  style="width: 100%; min-height: 30%; margin: 0 auto;" ></div>
					 <label class="control-label">Select Clients</label>
					 <g:select   style="height:26px;" id="client" optionKey="id" placeholder="client" optionValue="name" name="user" from="${clientList}" onchange="clientProjectTask();" />					 
				</div>		
			</div>
			<hr/>
			<div class="row" >
				<div class="col-md-6">
					<div id="stackBarContainer"  class="col-md-12" style="width: 100%; min-height: 20%; margin: 0 auto; " ></div>	
					<g:if test="${userTimeEntry == null}">
				        <h5 align="center"> No Reord Found </h5>
					</g:if>					
				</div>
				<div class="col-md-6">
					<div id="pieChartContainer"  style="width: 100%;  min-height: 20%; margin: 0 auto;" ></div>
				 	<label class="control-label">Select User </label>
				 	<g:select id="user" optionKey="id" placeholder="user" optionValue="username" name="user" from="${userList}" onchange="setUserId(this);"  />
					<g:select  id="duration" name="bandWidth" from="${['Day', 'Week']}"  value="${form?.bandWidth}" />					
				</div>		
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel-group" id="accordion2">
					  <div class="panel panel-default">
					    <div class="panel-heading">
					      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
					        <i class="fa fa-chevron-up"></i>  No of Users
					      </a>
					      <a href="manageUsers" onclick="#" id="reviewstatus" class="pull-right">${totalUsers}</a>
					    </div>
					    <div id="collapseOne" class="panel-collapse collapse in">
					      <div class="panel-body">
							<table class="table table-striped table-bordered table-hover" id="no-more-tables">
								<thead>
									<tr>
										<th>#</th>
										<th>User Name</th>
										<th>Clients</th>
										<th>Projects</th>										
										<th></th>
									</tr>
								</thead>
								<tbody id="client-list">
									<g:if test="${users}">
										<g:each in="${users}" status="i" var="user">
								  			<tr>
								  				<td>${i+1}</td>
								  				<td data-title="Name">${user.username}</td>
								  				<td data-title="clients">${user.email}</td>
								  				<td data-title="projects"></td>
								  				<td data-title="action"><a>Review Status</a></td>
								  			</tr>
					  					</g:each>
					  				</g:if>
								</tbody>
							</table>
					      </div>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading">
					      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
					        <i class="fa fa-chevron-down"></i>  Current Projects
					      </a>
					      <a href="tprojects" onclick="#" id="totalproject" class="pull-right">${totalProject}</a>
					    </div>
					    <div id="collapseTwo" class="panel-collapse collapse">
					      <div class="panel-body">
					        Anim pariatur cliche...
					      </div>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading">
					      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
					        <i class="fa fa-chevron-down"></i>  Tasks in Process
					      </a>
					      <a href="tasks" onclick="#" id="reviewstatus" class="pull-right">${taskLength}</a>
					    </div>
					    <div id="collapseThree" class="panel-collapse collapse">
					      <div class="panel-body">
					        Anim pariatur cliche...
					      </div>
					    </div>
					  </div>					  
					</div>		        	  	
				</div>		
			</div>
		</div>	
		<div id="hidden" class="list">${projects}</div>
		<div id="hiddenTask" class="list">${taskTask}</div>
		<div id="hiddenTimeEntry" class="list">${userTimeEntry}</div>
		
   <script>
   		$( document ).ready(function() {	
			$('#accordion2').collapse({
				    toggle: false
				  }).on('show',function (e) {
				        $(e.target).parent().find(".glyphicon-chevron-down").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
				      }).on('hide', function (e) {
				        $(e.target).parent().find(".glyphicon-chevron-up").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
			});
		});
	
	</script>
	</body>
</html>
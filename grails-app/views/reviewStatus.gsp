<html>
	<head>
		<meta name="layout" content="chartlayout"/>
	</head>
	<body>
		<div class="container maincontainer">	
			<div class="row-fluid" >
				<div class="span6">
					<div id="containerChart"></div>
				</div>
				<div class="span6">
					 <div id="verticalBarContainer"  style="width: 100%; min-height: 30%; margin: 0 auto;" ></div>
					 <label class="control-label">Select Clients</label>
					 <g:select   style="height:26px;" id="client" optionKey="id" placeholder="client" optionValue="name" name="user" from="${clientList}" onchange="clientProjectTask();" />					 
				</div>		
			</div>
			<hr/>
			<div class="row-fluid" >
				<div class="span6">
					<div id="stackBarContainer"  class="span12" style="width: 100%; min-height: 20%; margin: 0 auto; " ></div>	
					<g:if test="${userTimeEntry == null}">
				        <h5 align="center"> No Reord Found </h5>
					</g:if>					
				</div>
				<div class="span6">
					<div id="pieChartContainer"  style="width: 100%;  min-height: 20%; margin: 0 auto;" ></div>
				 	<label class="control-label">Select User </label>
				 	<g:select id="user" optionKey="id" placeholder="user" optionValue="username" name="user" from="${userList}" onchange="setUserId(this);"  />
					<g:select  id="duration" name="bandWidth" from="${['Day', 'Week']}"  value="${form?.bandWidth}" />					
				</div>		
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="accordion" id="accordion2">
					  <div class="accordion-group">
					    <div class="accordion-heading">
					      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
					        <i class="icon-chevron-up"></i>  No of Users
					      </a>
					      <a href="manageUsers" onclick="#" id="reviewstatus" class="pull-right">${totalUsers}</a>
					    </div>
					    <div id="collapseOne" class="accordion-body collapse in">
					      <div class="accordion-inner">
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
					  <div class="accordion-group">
					    <div class="accordion-heading">
					      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
					        <i class="icon-chevron-down"></i>  Current Projects
					      </a>
					      <a href="tprojects" onclick="#" id="totalproject" class="pull-right">${totalProject}</a>
					    </div>
					    <div id="collapseTwo" class="accordion-body collapse">
					      <div class="accordion-inner">
					        Anim pariatur cliche...
					      </div>
					    </div>
					  </div>
					  <div class="accordion-group">
					    <div class="accordion-heading">
					      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
					        <i class="icon-chevron-down"></i>  Tasks in Process
					      </a>
					      <a href="tasks" onclick="#" id="reviewstatus" class="pull-right">${taskLength}</a>
					    </div>
					    <div id="collapseThree" class="accordion-body collapse">
					      <div class="accordion-inner">
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
				        $(e.target).parent().find(".icon-chevron-down").removeClass("icon-chevron-down").addClass("icon-chevron-up");
				      }).on('hide', function (e) {
				        $(e.target).parent().find(".icon-chevron-up").removeClass("icon-chevron-up").addClass("icon-chevron-down");
			});
		});
	
	</script>
	</body>
</html>
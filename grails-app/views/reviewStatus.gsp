<html>
	<head>
		<meta name="layout" content="chartlayout"/>
	</head>
	<body>
		<div class="container maincontainer">
			<div class="row-fluid">
				<div class="span12 ">
					<table class="table table-bordered table-condensed" >
						<thead>
							<tr>
				        	  	<th>Users</th>
				         	 	<th>Clients</th>
				         	 	<th>Projects</th>
				         	 	<th>Tasks</th>
							</tr>
						</thead>
      					<tbody>
				       		<tr ALIGN="CENTER">
								<td><a href="manageUsers" onclick="#" id="reviewstatus" class="">${totalUsers }</a>	</td>
								<td><a href="viewclient" onclick="#" id="reviewstatus" class="">${totalClient }</a></td>
								<td><a href="tprojects" onclick="#" id="totalproject" class="">${totalProject}</a></td>
								<td><a href="tasks" onclick="#" id="reviewstatus" class="">${taskLength }</a></td>
				     	  </tr>
						</tbody>
					</table>
				</div>	
			</div>
	
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
		</div>	
		<div id="hidden" class="list">${projects}</div>
		<div id="hiddenTask" class="list">${taskTask}</div>
		<div id="hiddenTimeEntry" class="list">${userTimeEntry}</div>
	</body>
</html>
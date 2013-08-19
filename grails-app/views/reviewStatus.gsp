<html>
	<head>
		<g:javascript>
		jQuery(".list").hide();
	
		</g:javascript>
 	
			 <meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container maincontainer">
			<div class="row-fluid">
					<div class="span12 ">
					    <TABLE  class="table table-bordered table-condensed" >
     		<thead> 	
      		 <TR>
        	  	<TH>Users</TH>
         	 	<TH>Clients</TH>
         	 	<TH>Projects</TH>
         	 	<TH>Tasks</TH>
      			 </TR>
      			</thead>
      			<tbody> 
      			 </TR>
       		<TR ALIGN="CENTER">
       	  	 <TD><a href="manageUsers" onclick="#" id="reviewstatus" class="">${totalUsers }</a>	</TD>
         	 <TD><a href="viewclient" onclick="#" id="reviewstatus" class="">${totalClient }</a></TD>
         	<TD><a href="tprojects" onclick="#" id="totalproject" class="">${totalProject}</a></TD>
         	 <TD><a href="tasks" onclick="#" id="reviewstatus" class="">${taskLength }</a></TD>
     	  </TR>
     	  </tbody>
    		</TABLE>

				</div>			
					
			</div>
			
		
		<%--<div   class="row-fluid">
			
			<div id="container" class="span 12"  style="min-width: 400px; height: 200px; margin: 0 auto"></div>
				<div id="verticalBarContainer"  class="span 12" style="min-width: 200px; height: 200px; margin: 0 auto;" ></div>
			  <div id="stackBarContainer"  class="span 5" style="width: 650px; height:200px; margin: 0 auto; " ></div>	
			   <div id="pieChartContainer"  class="span 5" style="width: 520px; height: 200px; margin: 0 auto;" ></div>	
			 
	</div>
				
		--%>
	
<div class="row-fluid" >
<div class="span12">
	<div id="container"   style="min-width: 100%; min-height: 30%; margin: 0 auto"></div>
	
</div>
</div>

<div class="row-fluid" >
<div class="span12">
	 <label class="control-label">Select Clients</label>
	 <g:select   style="height:26px;" id="client" optionKey="id" placeholder="client" optionValue="name" name="user" from="${clientList}" onchange="clientProjectTask();" />
</div>
</div>
			 
<div   class="row-fluid" >
 <div class="span12">
	<div id="verticalBarContainer"  style="width: 100%; min-height: 30%; margin: 0 auto;" ></div>
</div>
</div>	

 <div class="row-fluid" >
<div class="span12">
		<div id="stackBarContainer"  class="span12" style="width: 100%; min-height: 20%; margin: 0 auto; " ></div>	
		<g:if test="${userTimeEntry == null}">
	        <h5 align="center"> No Reord Found </h5>
	</g:if>
 </div>
</div>
			  
 <div  class="row-fluid" >
 <div class="span12">
 	 <label class="control-label">Select User </label>
 	 	<g:select id="user" optionKey="id" placeholder="user" optionValue="username" name="user" from="${userList}" onchange="setUserId(this);"  />
		<g:select  id="duration" name="bandWidth" from="${['Day', 'Week']}"  value="${form?.bandWidth}" />
 </div>
</div>
		
<div  class="row-fluid" >
 <div class="span12">
  	<div id="pieChartContainer"  style="width: 100%;  min-height: 20%; margin: 0 auto;" ></div>	
  </div>
   </div>
  
 

		
			 
	</div>
			
		
			<div id="hidden" class="list">${projects}</div>
			<div id="hiddenTask" class="list">${taskTask}</div>
			<div id="hiddenTimeEntry" class="list">${userTimeEntry}</div>	
		
			
	</body>
</html>
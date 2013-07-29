<g:set var="contextPath" value="${request.contextPath}"/>
   <head>
		<meta name="layout" content="mainlayout"/>
		<g:javascript src="JSFile.js"></g:javascript>
		<style type="text/css">
			@media only screen and (max-width: 485px) {
		
			#no-more-tables table,
			#no-more-tables thead,
			#no-more-tables tbody,
			#no-more-tables th,
			#no-more-tables td,
			#no-more-tables tr { display: block; }
			#no-more-tables thead tr { position: absolute; top: -9999px; left: -9999px; }
			#no-more-tables tr { border: 1px solid #ccc; }
			#no-more-tables td { border: none; border-bottom: 1px solid #eee; position: relative; padding-left: 50%; white-space: normal; text-align:left; height:10px; }
			#no-more-tables td:before { position: absolute;  top: -2px; left: 6px; width: 20%; padding-right: 10px; white-space: nowrap;text-align:left;font-weight:bold;}
         /*
         Label the data
         */
			#no-more-tables td:before { content: attr(title); }
		}
      </style>
      </head>
   <body>
	 	 <div id="myModal" class="modal hide fade"  tabindex="-1" data-width="700" style="position: fixed;">
	 	 <g:form  method="post" id="${userid}" onsubmit="saveValue()" action="timeEntry">
	 	 
         <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                  <h4 id="myModalLabel">Task Time</h4>
					 <g:hiddenField name="temp" id="temp"/>
					<g:hiddenField name="colorvalue" id="colorvalue"/>
         </div>	  
         <div class="modal-body">
         	<div class="control-group">
					<label class="control-label" for="project">User Id</label>
						<div class="controls">
						
								<g:textField disabled id="id-display" name="id-display" class="input-large" value="${userid}"></g:textField>
						
						</div>
				</div>
              <div class="control-group">
					<label class="control-label" for="project">Project</label>
						<div class="controls">
								<g:select name="project" from="${['IVM', 'ISM', 'DGW']}"  value="${form?.project}"/> 
						</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="task"> Task</label>
						<div class="controls">
							  <g:select name="task" from="${['Task1', 'Task2', 'Task3']}" value="${form?.task}" /> 
						</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="expectedtime">Time</label>
						<div class="controls">
							<g:textField  name="time" id="expectedtime" placeholder="Please Enter no of hours" class="input-xmedium" value="${form?.time}"></g:textField>
						</div>
				</div>
                <div class="modal-footer" style="text-align:justify">
						<div class="controls">
							<button type="submit"  class="btn btn-primary">Add</button>
                              <button  id='btn2' data-dismiss="modal" class="btn">Cancel</button>
                         </div>
                </div>
                    
			</div>
			</g:form>
   </div>
            <div class="div1" style="margin-top:52px;background-color:white;">
         <table class="table table-bordered " id="no-more-tables">
            <thead>
               <tr id="tr1">
                  <th></th>
                  <th>9:00 AM</th>
                  <th>10:00 am</th>
                  <th>11:00 am</th>
                  <th>12:00 pm</th>
                  <th>1:00 pm</th>
                  <th>2:00 pm</th>
                  <th>3:00 pm</th>
                  <th>4:00 pm</th>
                  <th>5:00 pm</th>
                  <th>6:00 pm</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <th class="th1">Mon</th>
                  <td title="9:00 AM" id="M0"> </td>
                  <td title="10:00 AM" id="M1"> </td>
                  <td title="11:00 AM" id="M2"> </td>
                  <td title="12:00 AM" id="M3"> </td>
                  <td title="1:00 PM" id="M4"> </td>
                  <td title="2:00 PM" id="M5"> </td>
                  <td title="3:00 PM" id="M6"> </td>
                  <td title="4:00 PM" id="M7"> </td>
                  <td title="5:00 PM" id="M8"> </td>
                  <td title="6:00 PM" id="M9"></td>
               </tr>
               <tr>
                  <th class="th1">Tue</th>
                  <td title="9:00 AM" id="T0"> </td>
                  <td title="10:00 AM" id="T1"> </td>
                  <td title="11:00 AM" id="T2"> </td>
                  <td title="12:00 AM" id="T3"> </td>
                  <td title="1:00 PM" id="T4"> </td>
                  <td title="2:00 PM" id="T5"> </td>
                  <td title="3:00 PM" id="T6"> </td>
                  <td title="4:00 PM" id="T7"> </td>
                  <td title="5:00 PM" id="T8"> </td>
                  <td title="6:00 PM" id="T9"></td>
               </tr>
               <tr>
                  <th  class="th1">Wed</th>
                  <td title="9:00 AM" id="W0"> </td>
                  <td title="10:00 AM" id="W1"> </td>
                  <td title="11:00 AM" id="W2"> </td>
                  <td title="12:00 AM" id="W3"> </td>
                  <td title="1:00 PM" id="W4"> </td>
                  <td title="2:00 PM" id="W5"> </td>
                  <td title="3:00 PM" id="W6"> </td>
                  <td title="4:00 PM" id="W7"> </td>
                  <td title="5:00 PM" id="W8"> </td>
                  <td title="6:00 PM" id="W9"></td>
               </tr>
               <tr>
                  <th  class="th1">Thu</th>
                  <td title="9:00 AM" id="S0"> </td>
                  <td title="10:00 AM" id="S1"> </td>
                  <td title="11:00 AM" id="S2"> </td>
                  <td title="12:00 AM" id="S3"> </td>
                  <td title="1:00 PM" id="S4"> </td>
                  <td title="2:00 PM" id="S5"> </td>
                  <td title="3:00 PM" id="S6"> </td>
                  <td title="4:00 PM" id="S7"> </td>
                  <td title="5:00 PM" id="S8"> </td>
                  <td title="6:00 PM" id="S9"></td>
               </tr>
               <tr>
                  <th class="th1">Fri</th>
                  <td  title="9:00 AM" id="F0"> </td>
                  <td title="10:00 AM" id="F1"> </td>
                  <td title="11:00 AM" id="F2"> </td>
                  <td title="12:00 AM" id="F3"> </td>
                  <td title="1:00 PM" id="F4"> </td>
                  <td title="2:00 PM" id="F5"> </td>
                  <td title="3:00 PM" id="F6"> </td>
                  <td title="4:00 PM" id="F7"> </td>
                  <td title="5:00 PM" id="F8"> </td>
                  <td title="6:00 PM" id="F9"></td>
               </tr>
               
         </table>
      </div> 
   </body>
</html>

<g:set var="contextPath" value="${request.contextPath}"/>
   <head>
		<meta name="layout" content="timelayout"/>
      </head>
   <body>
	 	 <div id="myModal" class="modal hide fade"  tabindex="-1" data-width="700" style="position: fixed;">
	 	 <g:form   id="${userid}" onsubmit="saveValue()" action="timeEntry">
	 	 
         <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                  <h4 id="myModalLabel">Task Time</h4>
					 <g:hiddenField name="temp" id="temp"/>
					<g:hiddenField name="colorvalue" id="colorvalue"/>
					<g:hiddenField name="estimatedHrs" class="estimatedHrs"/>
         </div>	  
         <div class="modal-body">
         	<div class="form-group">
					<label class="control-label" for="project">User Id</label>
						<div class="controls">
						
								<g:textField disabled id="id-display" name="id-display" class="input-lg" value="${userid}"></g:textField>
						
						</div>
				</div>
              <div class="form-group">
					<label class="control-label" for="project">Project</label>
						<div class="controls">
							<g:if test="${projectList}">
								<g:select id="project" optionKey="id" optionValue="name" name="project" from="${projectList}" onchange="projectTask();" noSelection="${['':'...Select One Project...']}" />
							</g:if>
						</div>
				</div>
				<div class="form-group">
					<label class="control-label" for="task"> Task</label>
						<div class="controls">
							<g:if test="${taskList}">
							 	<g:select id="task" optionKey="id" onChange="taskHrs();"  name="task" from="${taskList}"  />
							</g:if>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label" for="task"> Estimated Hrs</label>
						<div class="controls">
						
						<g:textField   disabled id="id-display" name="id-display"  name ="estimatedHrs" class="input-lg estimatedHrs" ></g:textField></div>
				</div>
				<div class="form-group">
					<label class="control-label" for="expectedtime">Time</label>
						<div class="controls">
							<g:textField  name="time" id="expectedtime" placeholder="Please Enter no of hours" class="input-xmedium" value=""></g:textField>
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
      
      <div id="taskhrs" class="taskhrsList">${ProjectTaskEstimatedHrs}</div>    <!-- changes made by sunil -->	
   </body>
</html>

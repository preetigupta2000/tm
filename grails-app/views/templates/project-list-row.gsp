<g:set var="contextPath" value="${request.contextPath}"/>
	<tr>
		<td>{{id}}</td>
		<td data-title="Name">
			<h4>{{name}}</h4>
			{{#if clientid}}
				<h6>{{clientname}}</h6>
			{{/if}}
			<p>{{description}}</p>								  				
		</td>
		<td data-title="Projects">
			<h4>{{noOfTasks}}</h4>
			<p>Tasks</p>
			<a href="#" id="addTask">Add New Task</a>								  					
		</td>
		<td data-title="Option">
			<div class="icons">
				<div class="circle">							
					<a class="overlay-modal"data-response-type="json" href="${contextPath}/api/client/{{clientid}}/project/{{id}}" id="editProject" data-auto-size="false" data-template-url="edit-project" data-height="330px" data-max-width="550px">
						<i class="fa fa-pencil"></i>
						<p>Edit</p>
					</a>
				</div>
				<div class="circle">
					<a class="overlay-modal" data-response-type="json" href="${contextPath}/api/client/{{clientid}}/project/{{id}}" id="deleteProject" data-auto-size="false" data-template-url="delete-project" data-height="330px" data-max-width="550px">					
						<i class="fa fa-times"></i>
						<p>Delete</p>
					</a>
				</div>
				<div class="circle">
					<a href="#" id="viewDetails">
						<i class="fa fa-eye"></i>
						<p>View</p>
					</a>
				</div>
			</div>
		</td>
	</tr>

<g:set var="contextPath" value="${request.contextPath}"/>
			<tr>
 				<td>{{id}}</td>
 				<td data-title="Name">
 					<h4>{{name}}</h4>			  					
 					<p>{{description}}</p>								  				
 				</td>
 				<td data-title="Projects">
 					<h4>{{noOfProjects}}</h4>
 					<p>Projects</p>
				<a href="#" id="addProject">Add New Project</a>								  					
 				</td>
 				<td data-title="Option">
				<div class="icons">
					<div class="circle">							
						<a class="overlay-modal" data-response-type="json" href="${contextPath}/api/client/{{id}}" data-id="{{id}}" id="editClient" data-auto-size="false" data-template-url="edit-client" data-height="330px" data-max-width="550px">
							<i class="fa fa-pencil"></i>
							<p>Edit</p>
						</a>
					</div>
					<div class="circle">
						<a id="delete" href="">
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

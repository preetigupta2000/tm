<!DOCTYPE html>   
<html lang="en">  
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container maincontainer">
				<div class="hiddenItems" id >${users}</div>
				<div class="hiddenItems" id = "projects">${project}</div>
				<div class="hiddenItems" id ="userInfo">${usersDetails}</div>
				<div class="hiddenItems" id="task">${tasks}</div>
				
				<div class="control-group">
					<label class="control-label" for="user">Users</label>
						<div class="controls">
							<g:if test="${users}">
								<g:select  name="user" class="input-large" from="${users}" id = "userName" onChange="projectDetails();" noSelection="${['':'...Select One User...']}"/>
							</g:if>
						</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="project" style="word-spacing:285px;">Project</label>
						<div class="controls">
									<g:select disabled id="project"  name="project" from="${}" onChange="TaskDetails();" noSelection="${['':'...Select One Project...']}"/>
						</div>
				</div>	
				
				<div class="row">
					<div class="span12">	
						<table class="table table-striped" id="no-more-tables">
							<thead>
               					<tr id="tr1">
                  					<td>Task Name</td>
                  					<td>Status</td>
                  					<td>Estimated Hours</td>
                  					<td>Actual Hours</td>
               					<tr>
            				</thead>
            				<tbody></tbody>

						</table>		
					</div>
				</div>
				<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			</div>
		
	</body>
</html>
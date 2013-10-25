<g:set var="contextPath" value="${request.contextPath}"/>
<html>
	<head>
	
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <title>User Time Entry</title>
  		<link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.ui.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.weekcalendar.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'Week.css')}" type="text/css">
  <meta name="layout" content="mainlayout"/>
  
</head>
	
	<body>
			<h1>User Time Entry</h1>
			<div><g:textField disabled id="user" name="user" class="input-large" value="${userid}"></g:textField>
			
			</div>
			<div id='calendar'></div>
				<g:textField   disabled id="id-display" name="id-display"  name ="estimatedHrs" class="input-large estimatedHrs" ></g:textField>
			<div id="event_edit_container">
			
		<g:form controller="time" method="post">
			<ul>
				<li>
					<span>Date: </span><span class="date_holder"></span> 
				</li>
				<li>
					<label for="project">Project </label>
							<g:if test="${projectList}">
								<g:select id="project" optionKey="id" optionValue="name" name="project" from="${projectList}" onchange="projectTask();" noSelection="${['':'...Select One Project...']}" />
							</g:if>
				</li>
				<li>
					<label for="Task">Task: </label>
					<g:if test="${taskList}">
							 	<g:select id="task" optionKey="id" onChange="taskHrs();"  name="task" from="${taskList}" noSelection="${['':'...Please select a project First...']}"  />
							</g:if>
				</li>
				
				<li id="estimatedHrs">
					<label for="project">Estimated hrs </label>
							<g:textField   disabled id="esHrs" name="id-display"  name ="estimatedHrs" class="input-large estimatedHrs" ></g:textField>
					
				</li>
				<li>
					<label for="start">Start Time: </label><select name="start" id="start"><option value="">Select Start Time</option></select>
				</li>
				<li>
					<label for="end">End Time: </label><select name="end" id="end"><option value="">Select End Time</option></select>
				</li>
				<li>
					<label for="hours">Actual Hours: </label><input type="text" name="hours" id="hours"/>
				</li>
				<li>
					<label for="title">Title: </label><input type="text" name="title" />
				</li>
				
			</ul>
		</g:form>
	</div>
	<div id='hidden'>${events}</div>
	 <div id="taskhrs" class="taskhrsList">${ProjectTaskEstimatedHrs}</div> 
	</body>
</html>
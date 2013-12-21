$(document).ready(function() {
	jQuery(".hiddenItems").hide();

});

/* Function To get the Project Details For a Specific User */
function projectDetails() {

	/*
	 * Reading the JsonLists for User and Projects From Controller and parsing
	 * them
	 */
	var jsondataForUser = jQuery("#userInfo").text();
	var jsondataForProject = jQuery("#projects").text();
	var jsonlistForProject = $.parseJSON(jsondataForProject);
	var jsonlistForUser = $.parseJSON(jsondataForUser);

	/* Declaration for Variables */
	var userProjects = [];
	var uniqueprojects = [];
	var user = jQuery('#userName').val();
	var projectname = [];
	var projects = [];
	var projectLen = jsonlistForProject.Projects.length;
	var userLen = jsonlistForUser.UserDetails.length;

	/* Enabling the Project DropDown to add FilterOptions */
	jQuery("#project").attr("disabled", false);
	$('#project').empty();
	$('#project').append(
			$("<option></option>").attr("value", "Select a Project").text(
					"Select a Project"));

	/* Loop to get All the Project Ids */
	for (i = 0; i < projectLen; i++) {
		var pid = jsonlistForProject.Projects[i].projectId;
		projects.push({
			"projectId" : pid
		});
	}
	/* Loop to get Projects related to Users */
	for (k = 0; k < userLen; k++) {
		var pro = jsonlistForUser.UserDetails[k].project;
		if (jQuery.inArray(pro, userProjects) == -1) {
			userProjects.push(pro);
		}
	}
	/*
	 * Loop to get the Project Name Specific to a User and Populate it to
	 * Projects DropDown
	 */
	for (j = 0; j < userLen; j++) {
		var userName = jsonlistForUser.UserDetails[j].user;
		var project = userProjects[j];
		if (user == userName) {
			for (l = 0; l < projects.length; l++) {
				if (projects[l].projectId == project) {
					projectname = jsonlistForProject.Projects[l].projectName;
					$('#project').append(
							$("<option></option>").attr("value", projectname)
									.text(projectname));
				}
			}
		}
	}
}

/* Function To get the Task Details For a Specific Project */
function TaskDetails() {

	/*
	 * Reading the JsonLists for User and Projects From Controller and parsing
	 * them
	 */
	var jsondataForTask = jQuery("#task").text();
	var jsonlistForTask = $.parseJSON(jsondataForTask);
	var jsondataForUser = jQuery("#userInfo").text();
	var jsondataForProject = jQuery("#projects").text();
	var jsonlistForProject = $.parseJSON(jsondataForProject);
	var jsonlistForUser = $.parseJSON(jsondataForUser);

	/* Declaration and Intializing for Variables */
	var selectedProject = jQuery('#project').val();
	var user = jQuery('#userName').val();
	var taskDetails = [];
	var taskName = [];
	var totaltasks = [];
	var projectLen = jsonlistForProject.Projects.length;
	var userLen = jsonlistForUser.UserDetails.length;
	var tasklen = jsonlistForTask.Tasks.length;
	var projects = [];

	/* Emptying the Task Table */
	$('#no-more-tables > tbody').empty();

	/*
	 * jQuery("#taskName").attr("disabled",false); $('#taskName').empty();
	 * $('#taskName').append($("<option></option>").attr("value","Select a
	 * Project").text("Select a Task"));
	 */

	/* Loop to get All the Project Ids */
	for (i = 0; i < projectLen; i++) {
		var pid = jsonlistForProject.Projects[i].projectId;
		projects.push({
			"projectId" : pid
		});
	}

	/* Loop to get All the Task Details */
	for (i = 0; i < tasklen; i++) {
		var tName = jsonlistForTask.Tasks[i].taskName;
		var tStatus = jsonlistForTask.Tasks[i].status;
		var tEstimate = jsonlistForTask.Tasks[i].EstimatedHours;
		taskDetails.push({
			"taskname" : tName,
			"status" : tStatus,
			"estimatedHours" : tEstimate
		});
	}
	/* Loop to get All the Task Details  for a Specific Project and Fill the Table*/
	for (j = 0; j < userLen; j++) {

		var userName = jsonlistForUser.UserDetails[j].user;

		var project = jsonlistForUser.UserDetails[j].project;
		for (l = 0; l < projects.length; l++) {
			if (projects[l].projectId == project) {
				var projectname = jsonlistForProject.Projects[l].projectName;
			}
		}

		var task = jsonlistForUser.UserDetails[j].taskName;
		var ActualHours = jsonlistForUser.UserDetails[j].ActualHours;
		if (user == userName && selectedProject == projectname) {
			for (l = 0; l < taskDetails.length; l++) {
				if (taskDetails[l].taskname == task) {
					var tNames = taskDetails[l].taskname;
					var tstat = taskDetails[l].status;
					var test = taskDetails[l].estimatedHours;
					taskName.push({
						"Name" : tNames,
						"status" : tstat,
						"EstimatedHours" : test,
						"ActualHours" : ActualHours
					})
					addTableRow(taskName);
					taskName = [];
					totaltasks.push({
						"Name" : tNames,
						"status" : tstat,
						"EstimatedHours" : test,
						"ActualHours" : ActualHours
					})
				}
			}
		}
	}
	BuildChart(totaltasks);
}

/*Function to Build a Chart*/
function BuildChart(totaltasks) {
	var TaskNames = [];
	var EstimatedHours = [];
	var ActualHours = [];

	for (i = 0; i < totaltasks.length; i++) {
		TaskNames.push(totaltasks[i].Name);
		EstimatedHours.push(totaltasks[i].EstimatedHours);
		ActualHours.push(parseFloat(totaltasks[i].ActualHours));
	}
	DisplayChart(TaskNames, EstimatedHours, ActualHours)

}

/*Function To Display a Chart*/
function DisplayChart(TaskNames, EstimatedHours, ActualHours) {
	var yAxisLabels = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];

	$(function() {
		$('#container').highcharts({
			chart : {
				type : 'column'
			},
			title : {
				text : 'Time Spent For Tasks'
			},
			subtitle : {
				text : 'Showing the Actual Hours and Estiamted Hours Per Task'
			},
			xAxis : {
				categories : TaskNames,
				title : {
					text : 'Task Names'
				}
			},
			yAxis : {
				title : {
					text : 'Time Duration'
				},
				tickPositioner : function() {
					return yAxisLabels;
				}
			},
			plotOptions : {
				column : {
					pointWidth : 35,
					pointPadding : 0,
					borderWidth : 0
				}
			},

			series : [ {
				name : 'Estimated Hours',
				data : EstimatedHours
			}, {
				name : 'Actual Hours',
				data : ActualHours

			} ]
		});
	});

}

/*Function to Add a Table Row to the Task Table*/
function addTableRow(taskName) {
	for (i = 0; i < taskName.length; i++) {
		$('#no-more-tables > tbody:last').append(
				'<tr><td>' + taskName[i].Name + '</td><td>'
						+ taskName[i].status + '</td><td>'
						+ taskName[i].EstimatedHours + '</td><td>'
						+ taskName[i].ActualHours + '</td></tr>');
	}

}

$(document).ready(function() {
	jQuery(".hiddenItems").hide();

});

/* Function To get the Project Details For a Specific User */
function projectDetails() {

	/*
	 * Reading the JsonLists for User and Projects From Controller and parsing
	 * them
	 */
	var jsondataForUser = jQuery("#userInfo").text();
	var jsondataForProject = jQuery("#projects").text();
	var jsonlistForProject = $.parseJSON(jsondataForProject);
	var jsonlistForUser = $.parseJSON(jsondataForUser);

	/* Declaration for Variables */
	var userProjects = [];
	var uniqueprojects = [];
	var user = jQuery('#userName').val();
	var projectname = [];
	var projects = [];
	var projectLen = jsonlistForProject.Projects.length;
	var userLen = jsonlistForUser.UserDetails.length;

	/* Enabling the Project DropDown to add FilterOptions */
	jQuery("#project").attr("disabled", false);
	$('#project').empty();
	$('#project').append(
			$("<option></option>").attr("value", "Select a Project").text(
					"Select a Project"));

	/* Loop to get All the Project Ids */
	for (i = 0; i < projectLen; i++) {
		var pid = jsonlistForProject.Projects[i].projectId;
		projects.push({
			"projectId" : pid
		});
	}
	/* Loop to get Projects related to Users */
	for (k = 0; k < userLen; k++) {
		var pro = jsonlistForUser.UserDetails[k].project;
		if (jQuery.inArray(pro, userProjects) == -1) {
			userProjects.push(pro);
		}
	}
	/*
	 * Loop to get the Project Name Specific to a User and Populate it to
	 * Projects DropDown
	 */
	for (j = 0; j < userLen; j++) {
		var userName = jsonlistForUser.UserDetails[j].user;
		var project = userProjects[j];
		if (user == userName) {
			for (l = 0; l < projects.length; l++) {
				if (projects[l].projectId == project) {
					projectname = jsonlistForProject.Projects[l].projectName;
					$('#project').append(
							$("<option></option>").attr("value", projectname)
									.text(projectname));
				}
			}
		}
	}
}

/* Function To get the Task Details For a Specific Project */
function TaskDetails() {

	/*
	 * Reading the JsonLists for User and Projects From Controller and parsing
	 * them
	 */
	var jsondataForTask = jQuery("#task").text();
	var jsonlistForTask = $.parseJSON(jsondataForTask);
	var jsondataForUser = jQuery("#userInfo").text();
	var jsondataForProject = jQuery("#projects").text();
	var jsonlistForProject = $.parseJSON(jsondataForProject);
	var jsonlistForUser = $.parseJSON(jsondataForUser);

	/* Declaration and Intializing for Variables */
	var selectedProject = jQuery('#project').val();
	var user = jQuery('#userName').val();
	var taskDetails = [];
	var taskName = [];
	var totaltasks = [];
	var projectLen = jsonlistForProject.Projects.length;
	var userLen = jsonlistForUser.UserDetails.length;
	var tasklen = jsonlistForTask.Tasks.length;
	var projects = [];

	/* Emptying the Task Table */
	$('#no-more-tables > tbody').empty();

	/*
	 * jQuery("#taskName").attr("disabled",false); $('#taskName').empty();
	 * $('#taskName').append($("<option></option>").attr("value","Select a
	 * Project").text("Select a Task"));
	 */

	/* Loop to get All the Project Ids */
	for (i = 0; i < projectLen; i++) {
		var pid = jsonlistForProject.Projects[i].projectId;
		projects.push({
			"projectId" : pid
		});
	}

	/* Loop to get All the Task Details */
	for (i = 0; i < tasklen; i++) {
		var tName = jsonlistForTask.Tasks[i].taskName;
		var tStatus = jsonlistForTask.Tasks[i].status;
		var tEstimate = jsonlistForTask.Tasks[i].EstimatedHours;
		taskDetails.push({
			"taskname" : tName,
			"status" : tStatus,
			"estimatedHours" : tEstimate
		});
	}
	/* Loop to get All the Task Details  for a Specific Project and Fill the Table*/
	for (j = 0; j < userLen; j++) {

		var userName = jsonlistForUser.UserDetails[j].user;

		var project = jsonlistForUser.UserDetails[j].project;
		for (l = 0; l < projects.length; l++) {
			if (projects[l].projectId == project) {
				var projectname = jsonlistForProject.Projects[l].projectName;
			}
		}

		var task = jsonlistForUser.UserDetails[j].taskName;
		var ActualHours = jsonlistForUser.UserDetails[j].ActualHours;
		if (user == userName && selectedProject == projectname) {
			for (l = 0; l < taskDetails.length; l++) {
				if (taskDetails[l].taskname == task) {
					var tNames = taskDetails[l].taskname;
					var tstat = taskDetails[l].status;
					var test = taskDetails[l].estimatedHours;
					taskName.push({
						"Name" : tNames,
						"status" : tstat,
						"EstimatedHours" : test,
						"ActualHours" : ActualHours
					})
					addTableRow(taskName);
					taskName = [];
					totaltasks.push({
						"Name" : tNames,
						"status" : tstat,
						"EstimatedHours" : test,
						"ActualHours" : ActualHours
					})
				}
			}
		}
	}
	BuildChart(totaltasks);
}

/*Function to Build a Chart*/
function BuildChart(totaltasks) {
	var TaskNames = [];
	var EstimatedHours = [];
	var ActualHours = [];

	for (i = 0; i < totaltasks.length; i++) {
		TaskNames.push(totaltasks[i].Name);
		EstimatedHours.push(totaltasks[i].EstimatedHours);
		ActualHours.push(parseFloat(totaltasks[i].ActualHours));
	}
	DisplayChart(TaskNames, EstimatedHours, ActualHours)

}

/*Function To Display a Chart*/
function DisplayChart(TaskNames, EstimatedHours, ActualHours) {
	var yAxisLabels = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];

	$(function() {
		$('#container').highcharts({
			chart : {
				type : 'column'
			},
			title : {
				text : 'Time Spent For Tasks'
			},
			subtitle : {
				text : 'Showing the Actual Hours and Estiamted Hours Per Task'
			},
			xAxis : {
				categories : TaskNames,
				title : {
					text : 'Task Names'
				}
			},
			yAxis : {
				title : {
					text : 'Time Duration'
				},
				tickPositioner : function() {
					return yAxisLabels;
				}
			},
			plotOptions : {
				column : {
					pointWidth : 35,
					pointPadding : 0,
					borderWidth : 0
				}
			},

			series : [ {
				name : 'Estimated Hours',
				data : EstimatedHours
			}, {
				name : 'Actual Hours',
				data : ActualHours

			} ]
		});
	});

}

/*Function to Add a Table Row to the Task Table*/
function addTableRow(taskName) {
	for (i = 0; i < taskName.length; i++) {
		$('#no-more-tables > tbody:last').append(
				'<tr><td>' + taskName[i].Name + '</td><td>'
						+ taskName[i].status + '</td><td>'
						+ taskName[i].EstimatedHours + '</td><td>'
						+ taskName[i].ActualHours + '</td></tr>');
	}

}

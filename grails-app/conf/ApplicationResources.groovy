modules = {
	libs {
		resource url:'js/libs/jquery-1.7.2.min.js'
		// Added for User DashBoard Support  -->
		resource url:'js/libs/jquery-ui.min.js'
		resource url:'js/libs/jquery.weekcalendar.js'
		resource url:'js/libs/date.js'
		resource url:'js/libs/bootstrap-collapse.js'
		resource url:'js/libs/bootstrap-dropdown.js'
		resource url:'js/libs/bootstrap-modal.js'
		resource url:'js/libs/jquery.validate.js'
		resource url:'js/libs/highcharts.js'
		resource url:'js/libs/exporting.js'
	}
	
	corejs {
		dependsOn "libs"
		resource url:'js/application.js'
	}

	chartjs {
		dependsOn "corejs"
		resource url:'js/charts.js'
	}
	
	timejs {
		dependsOn "corejs"
		resource url:'js/time.js'
	}
	//Hr review status js
	hrchartsjs {
		dependsOn "corejs"
		resource url:'js/reviewStatus-charts.js'
	}
	
	// Added for User DashBoard Support  -->
	calendarjs {
		dependsOn "corejs"
		resource url:'js/Week.js'
	}
	
}

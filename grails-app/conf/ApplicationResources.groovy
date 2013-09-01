modules = {
	libs {
		resource url:'js/libs/jquery-1.7.2.min.js'
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
}

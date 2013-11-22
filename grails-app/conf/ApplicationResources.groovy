modules = {
	libs {
		resource url:'js/libs/jquery-1.7.2.min.js'
		//logging component
		resource url:'js/libs/JSLog.js'
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
		//View Templates
		resource url:'js/libs/underscore.js'
		resource url:'js/libs/handlebars.js'
		
		resource url:'js/libs/backbone.js'
		resource url:'js/libs/jquery.fancybox.js'
	}
	
	corejs {
		dependsOn "libs"
		resource url:'js/application.js'
	}

	indexjs {
		dependsOn "libs"
		resource url:'js/application.js'
		//Main Application JavaScript - init and event binding
		resource url:'js/index.js'
		resource url:'js/libs/templateManager.js'
		resource url:'js/libs/overlay.js'
		
		//Backbone client View & Models & Collections
		resource url:'js/bb/client/clientmodel.js'
		resource url:'js/bb/client/clientcollection.js'
		resource url:'js/bb/client/clientview.js'
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

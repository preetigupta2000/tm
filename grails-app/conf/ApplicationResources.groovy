modules = {
	libs {
		resource url:'js/libs/jquery-1.7.2.min.js'
		//Bootstrap JS components
		resource url:'js/libs/bootstrap-collapse.js'
		resource url:'js/libs/bootstrap-dropdown.js'
		resource url:'js/libs/bootstrap-modal.js'
		resource url:'js/libs/jquery.validate.js'
	}
	
	corejs {
		dependsOn "libs"
		resource url:'js/application.js'
	}
}

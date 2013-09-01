class UrlMappings {

	static mappings = {

		"/"(controller:"home")
		"/home"(controller:"home")
		
		"/login/$action?/$id?"(controller:"login")
		"/logout/$action?/$id?"(controller:"logout")

		"/viewclient/deleteClient/$id?"(controller:"client", action="deleteClient")
		//url fire when click on Edit project
		"/viewclient/$action?/$id?"(resource:"client")  //changes made by sunil 
		//fire when cilck on manage client
		
		
		//url fire when click on Edit project
		"/client/$id/projects/$pid?"(resource:"project")  //changes made by sunil 
	
	  	"/projects/$action?/$id?"(resource:"project")    //when click on projects
		
		
		"/register/$action?/$id?"(controller:"registration")

		
		"/viewclient/client/$id/projects/$pid?"(resource:"project")
		
		
		"/projects/deleteProject/$id?"(controller:"project", action="deleteProject")
		
		"/client/$id/project/$pid/tasks/$tid?"(resource:"task")
	
	
		
		"/tasks/$action?/$tid?"(resource:"task")  //changes made by sunil
		
		"/project/$pid/tasks/$tid?"(resource:"task") //changes made by sunil
		"/tasks/deleteTask/$id?"(controller:"task", action="deleteTask")
		
		
			// all following changes made by Sunil
		
		//User click on Review Status and manage users
		"/viewclient/client/$id/project/$pid/tasks?"(resource:"task")  //Changes made by Sunil
	
	 	"/manageUsers/$action?/$id?"(resource:"manageUsers")  //fire when click on manage users
		
		 
		"/manageUsers/deleteUser/$id?"(controller:"manageUsers", action="deleteUser")
		"/client/$id/tasks/$pid?"(resource:"task")
		"/tprojects/$action?/$id?"(controller:"project",action="totalProjectCount")
	
		"/adminReviewStatus"(controller:"project",action:"reviewStatus") //when click on review status
		
		// for time
		"/timeentry/$id?"(resource:"time")
		"/timeentry/$action?/$id?"(resource:"time")
		
		"500"(view:'/error')
		
		
		
	}
}
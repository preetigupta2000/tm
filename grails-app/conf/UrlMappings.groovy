class UrlMappings {

	static mappings = {

		"500"(controller:"error")
		"/"(controller:"home")
		"/home"(controller:"home")
		
		"/login/$action?/$id?"(controller:"login")
		"/logout/$action?/$id?"(controller:"logout")

		"/viewclient/deleteClient/$id?"(controller:"client", action="deleteClient")
		//url fire when click on Edit project
		"/viewclient/$action?/$id?"(resource:"client") 
		//fire when cilck on edit client
		"/editclient/$id?"(resource:"client")
		//url fire when click on Edit project
		"/client/$id/projects/$pid?"(resource:"project")  
		
		//when click on projects
	  	"/projects/$action?/$id?"(resource:"project")    
		
		//url hit when a new user register, Registration Controller call and register page render.
		"/register/$action?/$id?"(controller:"registration")
		//url when click on register after entering wrong username or password 
		"/login/$action?/$id?"(controller:"registration")
		
		
		//url hit when user want to register after using wrong user name, password
		"/login/register/$action?/$id?"(controller:"registration")

		//url hit when hr and admin want to show client's project.
		"/viewclient/client/$id/projects/$pid?"(resource:"project")
		
		//url hit when a project is deleted.
		"/projects/deleteProject/$id?"(controller:"project", action="deleteProject")
		
		//url hit to view clients per project task. 
		"/client/$id/project/$pid/tasks/$tid?"(resource:"task")
		
		//url hit when admin click on manage tasks.
		"/tasks/$action?/$tid?"(resource:"task") 
		
		//url hit when per project's task is viewed.
		"/project/$pid/tasks/$tid?"(resource:"task") 
		
		//url hit when a task is deleted.
		"/tasks/deleteTask/$id?"(controller:"task", action="deleteTask")
		//User click on Review Status and manage users
		"/viewclient/client/$id/project/$pid/tasks?"(resource:"task") 
		
		//fire when click on manage users
	 	"/manageUsers/$action?/$id?"(resource:"manageUsers")  
		 "/editusers/$id?"(resource:"manageUsers")
		 //url hit when a user is deleted.
		"/manageUsers/deleteUser/$id?"(controller:"manageUsers", action="deleteUser")
		
		"/client/$id/tasks/$pid?"(resource:"task")
		//url hit to display toatal project count.
		"/tprojects/$action?/$id?"(controller:"project",action="totalProjectCount")
		
		//when click on review status
		"/adminReviewStatus"(controller:"project",action:"reviewStatus")
		
	//	"/hrreviewstatus/$action?/$id?"(resource:"HRReviewStatus")
		"/hrreviewstatus"(resource:"HRReviewStatus")
		"/createUser/$action?/$id?"(controller:"registration")
		
		//url related to Blocked user.
		"/activateuser"(controller:"HRReviewStatus",action:"activateUser")
		"/activateuser/$id/acticateBlockedUser"(controller:"HRReviewStatus",action:"editBlockStaus")
		"/hrreviewstatus/activateuser"(controller:"HRReviewStatus",action:"activateUser")
		
		//url related to active user.
		"/blockuser"(controller:"HRReviewStatus",action:"blockUser")
		"/blockuser/$id/BlockActiveUser"(controller:"HRReviewStatus",action:"editActiveStaus")
		"/hrreviewstatus/blockuser"(controller:"HRReviewStatus",action:"blockUser")
		
		//url related to show user,delete user,edit user.
		"/deleteUsers"(controller:"manageUsers", action="showUsers")
	   "/deleteUser/$id?"(controller:"manageUsers", action="deleteUser")
	   "/editUser/$id?"(resource:"manageUsers")
	   //url related to search and reset functionality
	   "/HRReviewStatus/searchFunction/$id?"(controller:"HRReviewStatus",action:"searchFunction")
	   "/HRReviewStatus/resetFunction/$id?"(controller:"HRReviewStatus",action:"resetFunction")
	   
	   // code for user dash board
	   "/usertimetask"(resource:"time")
	   "/usertimesave/$action"(resource:"time")
	   "/usertimeupadte/$action"(controller:"time", action:"update")
	   "/usertimedelete/$action"(controller:"time", action:"delete")

	   "/admin"(controller:"admin")
	   // Template controller mapping
	   "/getTemplate"(controller:"tmTemplate")
	   "/api/client/$id?"(resource:"client")
	   "/api/client"(resource:"client")
	   "/api/user/$id?"(resource:"user")
	   "/api/client/$id/project/$pid?"(resource:"project")
	   "/api/project/$id?"(resource:"project")

		// code for Co-ordinator 
	   "/reviewProjectStatus"(resource:"Cordinator",action:"show")
	   "/reviewProject"(controller:"Cordinator", action:"show")   
	}
}

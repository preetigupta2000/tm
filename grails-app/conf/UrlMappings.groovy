class UrlMappings {

	static mappings = {

		"/"(controller:"home")
		"/home"(controller:"home")
		
		"/login/$action?/$id?"(controller:"login")
		"/logout/$action?/$id?"(controller:"logout")

		"/viewclient/deleteClient/$id?"(controller:"client", action="deleteClient")
		"/viewclient/$action?/$id?"(resource:"client")
		
		"/client/$id/projects/$pid?"(resource:"project")
		
		"/projects/$action?/$id?"(resource:"project")
		"/register/$action?/$id?"(controller:"registration")
		
		//whene user come after edit from manage clients link
		
		
		"/viewclient/client/$id/projects/$pid?"(resource:"project")
		
		"/projects/deleteProject/$id?"(controller:"project", action="deleteProject")
		
		"/client/$id/project/$pid/tasks/$tid?"(resource:"task")
		"/tasks/$action?/$tid?"(resource:"task")
		"/projects/project/$pid/tasks/$tid?"(resource:"task")
		"/project/$pid/tasks/$tid?"(resource:"task")
		"/tasks/deleteTask/$id?"(controller:"project", action="deleteProject")
		
		"500"(view:'/error')
	}
}
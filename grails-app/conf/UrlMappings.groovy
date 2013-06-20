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
		
		
		"500"(view:'/error')
	}
}
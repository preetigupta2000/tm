class UrlMappings {

	static mappings = {

		"/home"(controller:"home")
		"/login/$action?/$id?"(controller:"login")
		"/logout/$action?/$id?"(controller:"logout")
	
		"/viewclient/$action?/$id?"(resource:"client")

		"/client/$id/projects/$action?/$id?"(resource:"project")
		
		"/projects/$action?/$id?"(resource:"project")
		"/register/$action?/$id?"(controller:"registration")
		
		
		"/"(controller:"home")
		"500"(view:'/error')
	}
}
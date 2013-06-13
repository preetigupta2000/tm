class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"home")
		"/home"(controller:"home")
		"/login/$action?/$id?"(controller:"login")
		"/logout/$action?/$id?"(controller:"logout")
		
		"/viewclient"(controller:"client")
		"/projects"(controller:"project")
		"/viewclientprojects"(controller:"project", action:"viewprojects")
		"/register"(controller:"registration", action:"register")
		"500"(view:'/error')
	}
}
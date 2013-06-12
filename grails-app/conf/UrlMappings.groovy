class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"home")
		"/login/$action?/$id?"(controller:"login")
		"/logout/$action?/$id?"(controller:"logout")
		
		"/viewclient"(controller:"client")
		"/register"(controller:"registration", action:"register")
		"500"(view:'/error')
	}
}
package com.fonantrix.tm


class ProjectController {

	def show = {
		def clientid = params.id
		def projectid = params.pid
		if(clientid && projectid) {
			
			if (params.pid != null ) {
				Client client = Client.get(clientid)
				Project project = Project.findByClientAndId(client , projectid) 
				
				if(project) {
					render view: '/projects', model: [project: project, clientId:clientid]
					return
				} else {
					def errorMsg = "<h2>No project found with the client id :<b>${params.id}</b> and project id :<b>${params.clientId}</b></h2>"
					render(status: 404, text: errorMsg)
					return
				}
			} else {
				Project project = Project.get(projectid)
				
				Client[] clients = Client.list()
				
				if (project) {
					render view: '/projects', model: [project: project, clientList:clients]
					return
				} else {
					def errorMsg = "<h2>No project found with the client id :<b>${params.id}</b> and project id :<b>${params.clientId}</b></h2>"
					render(status: 404, text: errorMsg)
					return
				}
			}
		} else {
			Client client = Client.get(clientid)
			def allProject = null
			if (client) {
				allProject = Project.findAllByClient(client)
			}	
			render view: '/projects', model: [projects: allProject, clientId:clientid ]
		}
	}
	
	
	def save = {
		
		def client = Client.get(params.id)
		if (client) {
					
			def project = new Project(name: params.name, description: params.description)
			client.addToProjects(project)
			client.save(flush:true, failOnError: true)
			
			redirect action: 'show', id: params.id
		}
	}
	

	def delete = {
		def project = Project.get(params.id)
		def clientId = params.client
		project.deleteProject(clientId)
		redirect action: 'show', params:[clientId:clientId]
	}
	

}

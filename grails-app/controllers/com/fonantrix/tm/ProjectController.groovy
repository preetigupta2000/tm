package com.fonantrix.tm

import org.hibernate.HibernateException

class ProjectController {

	def show = {
		def clientid = params.id
		def projectid = params.pid
		if(clientid && projectid) {
			
			if (params.pid != null ) {
				Client client = Client.get(clientid)
				Project project = Project.findByClientAndId(client , projectid) 
				
				if(project) {
					render view: '/editProject', model: [project: project, clientid:clientid]
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
			if(clientid) {
				Client client = Client.get(clientid)
				def allProject
				if (client) {
					allProject = Project.findAllByClient(client)
				}
				render view: '/projects', model: [projects: allProject, clientid:clientid]
			
			} else {
				Client[] clients = Client.list()
				
				def allProject = null
				if (clients) {
					allProject = Project.findAllByClient(clients)
				}
				render view: '/projects', model: [projects: allProject, clientList:clients]
			}
		}
	}
	
	
	def save = {
		if (params.clientid) {
			def client = Client.get(params.clientid)
			if (client) {
						
				def project = new Project(name: params.name, description: params.description)
				client.addToProjects(project)
				client.save(flush:true, failOnError: true)
				
				redirect action: 'show', id: params.clientid
			}
		} else {
			def client = Client.get(params.client)
			if (client) {
						
				def project = new Project(name: params.name, description: params.description)
				client.addToProjects(project)
				client.save(flush:true, failOnError: true)
				
				redirect action: 'show'
			}
		}
	}
	

	def deleteProject = {
		//System.out.println(clientId +"@@@@@@@"+project.id)
		def project = Project.get(params.id)
		def clientId = params.clientid
		if(project){
			project.delete()
		}
		redirect action: 'show', id: clientId
	}
	
	
	

	
	def update = {
		if(params.id) {
			def project = Project.get(params.id)
			def clientId = params.clientid
			def mode = params.mode
			if(project) {
				try {
					project.properties = params['name']
					project.properties = params['description']
					project.save(failOnError: true)
					if (mode==null) {
						redirect action: 'show', id: clientId
					} else {
						redirect action: 'show',id: clientId  
					}
					return
				} catch(HibernateException e){
					render project.errors
					return
				}
			} else {
				render "project not found."
				return
			}
		}
		else {
			render "Please specify project id to be updated."
		}
	}
	
	
	 }

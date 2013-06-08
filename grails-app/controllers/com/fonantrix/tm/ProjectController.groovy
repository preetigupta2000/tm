package com.fonantrix.tm

import tm.Project
import tm.Client
import tm.Task
import tm.ProjectTask
import tm.ClientProject
class ProjectController {

    def index() { }
	
	def addproject() {
		def project = new Project(params)
		project.save()
		println params
		if(!params.modalHidden.equals(""))
		{
			def clientId = (params.modalHidden).toInteger()
			def client = Client.get(params.modalHidden)
			ClientProject.create client, project, true
			def list = client.getAuthorities()
			redirect action: 'viewprojects', params:[clientId:clientId]
		}
		else if (!params.clientId.equals("")) 
		{
			def clientId = (params.clientId).toInteger()
			def client = Client.get(params.clientId)
			ClientProject.create client, project, true
			def list = client.getAuthorities()
			redirect action: 'viewprojects', params:[clientId:clientId]
		}
		//redirect action: 'viewallprojects'
	}
	
	def addtask() {
		def task = new Task(params)
		task.save()
		def projectId = (params.projectID).toInteger()
		def project = Project.get(params.projectID)
		ProjectTask.create project, task, true
		def list = project.getAuthorities()
		println list.getAt("name")
		redirect action: 'viewprojects',params:params
		
	}
	
	def viewallprojects() {
		def projects = Project.list()
		def clientList = Client.list()
		render view: '/projects', model: [project: projects, clientList:clientList]
	}
	
	def deleteProject() {
		def project = Project.get(params.id)
		def clientId = params.clientId
		project.deleteProject(clientId)
		redirect action: 'viewprojects', params:[clientId:clientId]
	}
	
	def viewprojects() {
		def clientId = (params.clientId).toInteger()
		def client = Client.get(params.clientId)
		def list = client.getAuthorities()
		println list
		render view: '/projects', model: [project: list,clientId:clientId]
	}
	def editProject(){
		def project = Project.get(params.projectId)
		def clientId = params.clientId
		render(view: "/editProject",model: [project: project,clientId:clientId]);
	}
	
	def updateProject(){
		def project = Project.get(params.projectId)
		System.out.println(params)
		if(project) {
			project.properties = params
			System.out.println(params)
			project.save()
		}
		def clientId = params.clientId
		redirect action: 'viewprojects', params:[clientId:clientId]
	}
}


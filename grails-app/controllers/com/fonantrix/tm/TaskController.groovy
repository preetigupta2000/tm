package com.fonantrix.tm


import org.hibernate.HibernateException
class TaskController {
	def show = {

		def projectid = params.id
		def taskid = params.pid
		if(projectid && taskid) {
			if (params.pid != null ) {
				Project project = Project.get(projectid)
				Task task = Task.findByProjectAndId(project , taskid)
				if(task) {
					render view: '/editProject', model: [task: task, projectid:projectid]
					return
				} else {
					def errorMsg = "<h2>No task found with the project id :<b>${params.id}</b> and project id :<b>${params.projectid}</b></h2>"
					render(status: 404, text: errorMsg)
					return
				}
			} else {
				Task task = Task.get(taskid)
				
				Project[] projects = Project.list()
				
				if (task) {
					render view: '/tasks', model: [task: task, projectList:projects]
					return
				} else {
					def errorMsg = "<h2>No task found with the project id :<b>${params.id}</b> and project id :<b>${params.clientId}</b></h2>"
					render(status: 404, text: errorMsg)
					return
				}
			}
		} else {
			Project project = Project.get(projectid)
			Project[] projects = Project.list()
			def allTask = null
			if (project) {
				allTask = Task.findAllByProject(project)
			System.out.println("indide this"+allTask)
				}
			render view: '/tasks', model: [tasks: allTask, projectId:projectid, projectList:projects ]
		}
	}
	
	
	def save = {
		
		def project = Project.get(params.project)
		System.out.println(project)
		if (project) {
					
			def task = new Task(name: params.name, description: params.description)
			project.addToTasks(task)
			project.save(flush:true, failOnError: true)
			
			redirect action: 'show', id: params.project
		}
	}
	

	def deleteTask = {
		def task = Task.get(params.id)
		def projectId = params.project
		task.deleteTask(projectId)
		redirect action: 'show', params:[projectId:projectId]
	}
}

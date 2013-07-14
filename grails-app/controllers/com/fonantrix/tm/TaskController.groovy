package com.fonantrix.tm


import org.hibernate.HibernateException
class TaskController {
	def show = {
		
		def clientid = params.id
		def projectid = params.pid
		def taskid = params.tid
//System.out.println "client" + clientid + "#####projectid" + projectid + "###taskid" + taskid
		
		if(projectid && taskid) {
			if (params.pid != null ) {
				Project project = Project.get(projectid)
				Task task = Task.findByProjectAndId(project , taskid)

				if(task) {
					render view: '/editTask', model: [task: task, projectid:projectid, clientid:clientid]
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
			if(projectid) {
				Project project = Project.get(projectid)
				def allTask
				if (project) {
					allTask = Task.findAllByProject(project)
				}
				render view: '/tasks', model: [tasks: allTask, projectid:projectid, clientid:clientid]
			} else {
				//changes made to displaying all tasks
				Project[] projects = Project.list()
				List tasklist=new ArrayList();
					
					def allTask = null
					if (projects) 
					{
						projects.eachWithIndex { item, index ->
							List task = Task.findAllByProject(item)
							task.eachWithIndex {eachtask,indexes ->
								tasklist.add(eachtask);
							}
						}
					}
					render view: '/tasks', model: [tasks: tasklist, projectList:projects]
			}
		}
	}
	
	def save = {
		if(params.projectid)
		{
		
			def clientid = params.clientid
			def project = Project.get(params.projectid)
			def projectId = params.projectid
		
			if (project) {					
				def task = new Task(name: params.name, description: params.description)
			
				project.addToTasks(task)
				project.save(flush:true, failOnError: true)
				
				redirect(action: "show", params: [pid: projectId,id:clientid]) 
			}
		} else {
			def project = Project.get(params.project)
			if (project) {
				def task = new Task(name: params.name, description: params.description)
				project.addToTasks(task)
				project.save(flush:true, failOnError: true)
				redirect action: 'show'
			}
		}
	}
	

	def deleteTask = {
		def task = Task.get(params.id)
		def projectId = params.projectid
		if(task){
		task.delete()
		}
		redirect action: 'show', id:projectId
	}

	
	
	
	def update = {
		if(params.id) {
			def task = Task.get(params.id)
			def projectid = params.projectid
			def clientid = params.clientid
			if(task) {
				try {
					task.properties = params['name']
					task.properties = params['description']
					task.save(failOnError: true)
					//below send pid in params
					redirect(action: "show", params: [pid: projectid,id:clientid])  
					return
				} catch(HibernateException e){
					render task.errors
					return
				}
			} else {
				render "task not found."
				return
			}
		}
		else {
			render "Please specify project id to be updated."
		}
	}
	
	}

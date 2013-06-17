package com.fonantrix.tm

import com.fonantrix.tm.Project
import com.fonantrix.tm.Task

class TaskController {

    def index() { }
	def viewtask() {
		System.out.println(params)
		def projectId = (params.projectId).toInteger()
		def project = Project.get(params.projectId)
		def list = project.getAuthorities()
		println list
		render view: '/tasks', model: [task: list,projectId:projectId]
	}
	
	def viewalltasks() {
		def list = Task.list()
		render view: '/tasks', model: [task: list]
	}
	
	def deleteTask() {
		def task = Task.get(params.id)
		def projectId = params.projectId
		task.deleteTask(projectId)
		redirect action: 'viewtask', params:[projectId:projectId]
	}
	
	def addtask() {
		def task = new Task(params)
		task.save()
		if(!params.projectId.equals(""))
		{
			def projectId = (params.projectId).toInteger()
			def project = Project.get(params.projectId)
			def list = project.getAuthorities()
			println list
			render view: '/tasks', model: [task: list,projectId:projectId]
		}
		redirect action:"viewalltasks"
	}
	def editTask(){
		def task = Task.get(params.taskId)
		System.out.println(params)
		def projectId = params.projectId
		render(view: "/editTask",model: [task: task,projectId:projectId])
	}
	
	def updateTask(){
		def task = Task.get(params.taskId)
		System.out.println(params)
		if(task) {
			task.properties = params
			System.out.println(params)
			task.save()
		}
		def projectId = params.projectId
		redirect action: 'viewtask', params:[projectId:projectId]
	}
	
}

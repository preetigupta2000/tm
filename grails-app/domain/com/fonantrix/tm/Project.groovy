package com.fonantrix.tm

import java.util.Set;

import com.fonantrix.tm.Task
import com.fonantrix.tm.Client
import com.fonantrix.tm.ClientProject
import com.fonantrix.tm.ProjectTask

class Project {

	String name
	String description
	static hasMany = [project: Task]
	Set<Task> getAuthorities() {
		ProjectTask.findAllByProject(this).collect { it.task } as Set
    }
	void deleteProject(clientId){
		def client = Client.get(clientId)
		println client
		def list=this.getAuthorities()
		if(list != null) {
		   for( Task task in list){
			   ProjectTask.remove(this, task, false)
			   task.delete(flush:true)
			}
		}
		ClientProject.remove(client, this, false)
		this.delete();
	}
}

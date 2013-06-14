package com.fonantrix.tm

import java.util.Set;

import com.fonantrix.tm.Project
import com.fonantrix.tm.Task
import com.fonantrix.tm.ClientProject
import com.fonantrix.tm.ProjectTask

class Client {
	
	String name
	String description
	static hasMany = [project: Project]
	Set<Project> getAuthorities() {
         ClientProject.findAllByClient(this).collect { it.project } as Set
    }
	
	void deleteClient(){
		def list=this.getAuthorities()
		if(list != null) {
		   for( Project project in list){
			   def tasklist = project.getAuthorities()
			   if(tasklist != null)
			   {
				   for(Task task in tasklist){
					   ProjectTask.remove(project, task, false)
					   task.delete(flush:true)
				   }
			   }
			   ClientProject.remove(this, project, true)
			   project.delete(flush:true)
		   }
		}
		for( Project project in list){
			ClientProject.remove(this, project, true)
		}
		this.delete();
	}
}

package com.fonantrix.tm

import com.fonantrix.tm.Project
import com.fonantrix.tm.Task
import com.fonantrix.tm.ProjectTask

class Task {

    String name
	String description
	void deleteTask(projectId){
		def project = Project.get(projectId)
		println project
		ProjectTask.remove(project, this, false)
		this.delete();
	}
}

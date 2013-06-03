package tm

import tm.Project
import tm.Task
import tm.ProjectTask
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

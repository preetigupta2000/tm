package tm

import org.apache.commons.lang.builder.HashCodeBuilder
import tm.Project
import tm.Task
class ProjectTask implements Serializable{

	Project project
	Task task
	
	boolean equals(other) {
		if (!(other instanceof ProjectTask)) {
			return false
		}
		other.project?.id == project?.id &&
		other.task?.id == task?.id
	}
	
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (project) builder.append(project.id)
		if (task) builder.append(task.id)
		builder.toHashCode()
	}
	
	static ProjectTask get(long projectId, long taskId) {
			find 'from ProjectTask where project.id=:projectId and task.id=:taskId',
			   [projectId: projectId, taskId: taskId]
	
	}

	
	static ProjectTask create(Project project, Task task, boolean flush = false) {
		new ProjectTask(project: project, task: task).save(flush: flush, insert: true)
	}
	
	static boolean remove(Project project, Task task, boolean flush = false) {
		//TODO: Modify logic for removing the records.
		System.out.println(project)
		System.out.println(task)
		ProjectTask instance = ProjectTask.findByProjectAndTask(project, task)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}
	
	static void removeAll(Project project) {
		executeUpdate 'DELETE FROM ProjectTask WHERE project=:project', [project: project]
	}
	
	static void removeAll(Task task) {
		executeUpdate 'DELETE FROM ProjectTask WHERE task=:task', [task: task]
	}
	
	static mapping = {
		id composite: ['task', 'project']
		version false
	}
}


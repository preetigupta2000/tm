package tm

import org.apache.commons.lang.builder.HashCodeBuilder
import tm.Client
import tm.Project
class ClientProject implements Serializable{

    Client client
	Project project
	
	boolean equals(other) {
		if (!(other instanceof ClientProject)) {
			return false
		}
		other.client?.id == client?.id &&
		other.project?.id == project?.id
    }
	
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (client) builder.append(client.id)
		if (project) builder.append(project.id)
		builder.toHashCode()
	}
	
	/*static ClientProject get(long clientId, long projectId) {
		find 'from ClientProject where client.id=:clientId and project.id=:projectId',
			[clientId: clientId, projectId: projectId]
	}*/
	
	static ClientProject get(long clientId, long projectId) {
			find 'from ClientProject where client.id=:clientId and project.id=:projectId',
			   [clientId: clientId, projectId: projectId]
	
	}

	
	static ClientProject create(Client client, Project project, boolean flush = false) {
		new ClientProject(client: client, project: project).save(flush: flush, insert: true)
	}
	
	static boolean remove(Client client, Project project, boolean flush = false) {
		//TODO: Modify logic for removing the records.   
		
		ClientProject instance = ClientProject.findByClientAndProject(client, project)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}
	
	static void removeAll(Client client) {
		executeUpdate 'DELETE FROM ClientProject WHERE client=:client', [client: client]
	}
	
	static void removeAll(Project project) {
		executeUpdate 'DELETE FROM ClientProject WHERE project=:project', [project: project]
	}
	
	static mapping = {
		id composite: ['project', 'client']
		version false
	}
}


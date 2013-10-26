import com.fonantrix.tm.UserInfo
import com.fonantrix.tm.authenticate.Role;
import com.fonantrix.tm.authenticate.User;
import com.fonantrix.tm.authenticate.UserRole;
import com.fonantrix.tm.Client;
import com.fonantrix.tm.Project;
import groovy.json.JsonSlurper


class BootStrap {

    def bootstrap_user_data =	{ servletContext ->
	
		if (!Role.count() && !User.count()) {		
		
			def adminUser = new User(username: "admin@fn.com", email: "admin@fn.com", firstName:"fname",lastName:"lname",password: "password",status:"active")
			adminUser.save(flush: true)
		
			def adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError: true, flush: true)
			UserRole.create adminUser, adminRole, true
			
		
			def hrUser = new User(username: "hr@fn.com", email: "hr@fn.com", firstName:"fname",lastName:"lname",password: "password",status:"active")			
			hrUser.save(flush: true)
		
			def hrRole = new Role(authority: 'ROLE_HR').save(failOnError: true, flush: true)
			UserRole.create hrUser, hrRole, true
			
		
			def user = new User(username: "user@fn.com", email: "user@fn.com", firstName:"fname",lastName:"lname",password: "password",status:"block")
			user.save(flush: true)
			
			def userRole = new Role(authority: 'ROLE_USER').save(failOnError: true, flush: true)
			UserRole.create user, userRole, true
			
			
			def cordUser = new User(username: "cordinator@fn.com", email: "cordinator@fn.com", firstName:"fname",lastName:"lname",password: "password",status:"active")
			cordUser.save(flush: true)
	
			def coordinatorRole = new Role(authority: 'ROLE_COORDINATOR').save(failOnError: true, flush: true)	
			UserRole.create cordUser, coordinatorRole, true
		}
		
    }
	
	def bootstrap_clients =	{ servletContext ->
		
		String jsonClientData = new File(servletContext.getRealPath("/json/client.json")).text
		
		if (!Client.count()) {
			def slurper = new JsonSlurper()
			def allClients = slurper.parseText(jsonClientData)
		
			allClients.clients.each	{
				def jsonProduct = it
				def aClient = new Client(name: it.name, description: it.description)
				if(jsonProduct.projects) {
					def aProject
					jsonProduct.projects.each	{
						def jsonTasks = it
						aProject = new Project(name: it.name, description: it.description)
						if(jsonTasks.tasks)
						{
							jsonTasks.tasks.each	{
								aProject.addToTasks(name: it.name, description: it.description, estimated_hrs: it.estimated_hrs, status: it.status)
							}
						}
					}
					aClient.addToProjects (aProject)
				}
				aClient.save(failOnError: true)
			}
		}
			
	}

	def updateGrailsConfigForHeroku() {

	}
	
	def init = { servletContext ->
		updateGrailsConfigForHeroku();
		bootstrap_user_data(servletContext);
		bootstrap_clients(servletContext);
	}
	
    def destroy = {
    }
}

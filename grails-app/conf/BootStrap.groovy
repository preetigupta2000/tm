import com.fonantrix.tm.authenticate.Role;
import com.fonantrix.tm.authenticate.User;
import com.fonantrix.tm.authenticate.UserRole;


class BootStrap {

    def init = { servletContext ->
	
		if (!Role.count() && !User.count()) {			
			def adminUser = new User(username: "admin@fn.com", email: "admin@fn.com", firstName:"fname",lastName:"lname",password: "password")
			adminUser.save(flush: true)
			def adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError: true, flush: true)
			UserRole.create adminUser, adminRole, true
			
			def hrUser = new User(username: "hr@fn.com", email: "hr@fn.com", firstName:"fname",lastName:"lname",password: "password")
			hrUser.save(flush: true)
			def hrRole = new Role(authority: 'ROLE_HR').save(failOnError: true, flush: true)
			UserRole.create hrUser, hrRole, true
			
			def user = new User(username: "user@fn.com", email: "user@fn.com", firstName:"fname",lastName:"lname",password: "password")
			user.save(flush: true)
			def userRole = new Role(authority: 'ROLE_USER').save(failOnError: true, flush: true)
			UserRole.create user, userRole, true
			
			def cordUser = new User(username: "cordinator@fn.com", email: "cordinator@fn.com", firstName:"fname",lastName:"lname",password: "password")
			cordUser.save(flush: true)
			def coordinatorRole = new Role(authority: 'ROLE_COORDINATOR').save(failOnError: true, flush: true)	
			UserRole.create cordUser, coordinatorRole, true
		}
		
    }
    def destroy = {
    }
}

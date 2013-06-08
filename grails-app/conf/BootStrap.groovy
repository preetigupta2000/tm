import com.fonantrix.tm.authenticate.Role;
import com.fonantrix.tm.authenticate.User;
import com.fonantrix.tm.authenticate.UserRole;


class BootStrap {

    def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
		def hrRole = new Role(authority: 'ROLE_HR').save(flush: true)
		def coordinatorRole = new Role(authority: 'ROLE_COORDINATOR').save(flush: true)
		def adminUser = new User(username: "admin@fn.com", email: "admin@fn.com", firstName:"fname",lastName:"lname",password: "password").save(flush: true)
		UserRole.create adminUser, adminRole, true
    }
    def destroy = {
    }
}

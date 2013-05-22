
import com.fonantrix.tm.authenticate.Role
import com.fonantrix.tm.authenticate.User
import com.fonantrix.tm.authenticate.UserRole;


class RegistrationController {

    def index() {}
	def save = {
		//def userRoleId = (params.userrole).toInteger() - 1
		def userRole = Role.list().get(1) // 1 is the ROLE_USER
		def testUser = new User(username: params.email, email: params.email, firstName:params.firstname,lastName:params.lastname,password: params.password)
	    testUser.save(flush: true)
		UserRole.create testUser, userRole, true
		redirect action: 'index', controller: 'login'
	}
	def register = {
		def roleList = Role.list()
		render(view: "/registrationform",model: [roleList: roleList])
	}
}

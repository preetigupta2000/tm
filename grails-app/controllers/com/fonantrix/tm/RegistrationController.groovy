package com.fonantrix.tm


import com.fonantrix.tm.authenticate.Role
import com.fonantrix.tm.authenticate.User
import com.fonantrix.tm.authenticate.UserRole;

import org.hibernate.HibernateException

class RegistrationController  {

	def springSecurityService
	
	/*
	 GET	show
	 PUT	update
	 POST	save
	 DELETE	delete
	 */

	
	def index() {
		render(view: "/registrationform")
	}
	
	def save = {
		def testUser = new User(username: params.username, email: params.username, firstName:params.firstName,lastName:params.lastName,password: params.password,status:"block")
		try {
			testUser.save(flush: true, failOnError: true)
			def userInfo= new UserInfo(designation:"designation",corresAddress:"address",user:testUser)
			userInfo.save(failOnError: true)  
		}
		catch(HibernateException e)
		{
			render (text:userInfo.errors,status:500)
			return
		}
		try {
			List<Role> roleList = Role.findAllByAuthority("ROLE_USER")
			Role userRole = roleList.get(0)
			UserRole.create testUser, userRole, true
			redirect action: 'index', controller: 'home'
			return
		}
		catch(HibernateException e)
		{
			render (text:userRole.errors + " ### " + testUser.errors,status:500)
			return
		}
		
	}
		
}
package com.fonantrix.tm

import com.fonantrix.tm.Time
import com.fonantrix.tm.authenticate.User

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
class TimeController {
	
	def springSecurityService
	
	def show={
		
		def userid = springSecurityService.principal.id 
		println userid
		 if(userid)
		 {
			 render view: '/timeentry' ,model:[userid:userid]
		 }
		 else
		 {
			 def errorMsg = "<h2>No User found with the User id :<b>${params.id}</b> "
			 render(status: 404, text: errorMsg)
			 return
		 }
		
	}
	
	def save ={
		
		println "save"
		println params
			def user= User.get(params.id)
			if(user){
				
				def time= new  Time(project:params.project,task:params.task,time:params.time,tabid:params.temp,coltd:params.colorvalue,user:user)
				user.save(flush:true)
			
			 if( !time.save(flush:true) ) {
				 println "Validation errors on save"
				 time.errors.each {
					  println it
				 }
			  }
			 else 
			 {
				 redirect action: 'show' ,model:[user:user]
			 }
	
	}
	}
	
}

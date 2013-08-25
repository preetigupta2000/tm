package com.fonantrix.tm

import com.fonantrix.tm.Time
import com.fonantrix.tm.authenticate.User

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
class TimeController {
	
	def springSecurityService
	
	
	//changes made by sunil
	def show={
		
		def userid = springSecurityService.principal.id 
		def taskList=Task.list()
		def projectList=Project.list()
		println("taskList.."+taskList)
		
	
	
	
		   
		JSONObject jObject = new JSONObject();
		
		  JSONArray jArray = new JSONArray();
		 
		 if(userid)
		 {
		
		
			 taskList.eachWithIndex() { item, index ->
				 JSONObject json = new JSONObject();
				 println("item.."+item.project.getName())
				
				
				 		
						 json .put("estimatedHrs",item.estimatedHrs);
						 json .put("taskName",item.name)
						 json .put("projectName",item.project.getName())
						
						jArray.add( json );
					  println(jArray)
					  def length=jArray.size()
					   println("length "+length)
						jObject.put("ProjectTaskEstimatedHrs", jArray);
						
		   }
			
				 
		  
			 render view: '/timeentry' ,model:[userid:userid,taskList:taskList,projectList:projectList,ProjectTaskEstimatedHrs:jObject]
		 }
		 else
		 {
			 def errorMsg = "<h2>No User found with the User id :<b>${params.id}</b> "
			 render(status: 404, text: errorMsg)
			 return
		 }
		
	}
	
	
	//changes made by sunil
	def save ={
		
		println "save"
		println params
			def user= User.get(params.id)
		
			if(user){
				
				def time= new  Time(project:params.project,task:params.task,time:params.time,tabid:params.temp,coltd:params.colorvalue,user:user,estimatedHrs:params.estimatedHrs)
				user.save(flush:true)
				println("save sucessfully")
			
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

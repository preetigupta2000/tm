package com.fonantrix.tm

import org.codehaus.groovy.grails.web.json.JSONArray;
import org.codehaus.groovy.grails.web.json.JSONObject;
import com.fonantrix.tm.authenticate.User
import org.hibernate.HibernateException

class TimeController {

	def springSecurityService

//To Display the Time-Entry page
	def show={

		def userid = springSecurityService.principal.id
		def estHrs;
		println(userid);
		JSONObject jsonObj=new JSONObject();
		JSONArray jSonArr=new JSONArray();
		JSONObject jsonObjs=new JSONObject();
		JSONArray jSonArrs=new JSONArray();
		def taskList=Task.list()
		def projectList=Project.list()

		if(userid){
			taskList.eachWithIndex() { item, index ->
				JSONObject json = new JSONObject();
				json .put("estimatedHrs",item.estimatedHrs);
				json .put("taskName",item.name)
				json .put("projectName",item.project.getName())
				jSonArrs.add( json );
				def length=jSonArrs.size()
				jsonObjs.put("ProjectTaskEstimatedHrs", jSonArrs);
				
			}
			Time[] time = Time.list();
			if(time){
						for (Time times : 	time)
						{
							JSONObject json=new JSONObject();
							
							if(userid==(times.user.id))
							{
								json.put("id",times.id);
								json.put("start", times.start);
								json.put("end", times.end);
								json.put("title", times.title);
								jSonArr.add(json);
							}
							jsonObj.put("events", jSonArr)
						}
						render view: '/usertimetask',model:[userid:userid,events:jsonObj,taskList:taskList,projectList:projectList,ProjectTaskEstimatedHrs:jsonObjs]
			}
			else
			{
			render view: '/usertimetask',model:[userid:userid,taskList:taskList,projectList:projectList,ProjectTaskEstimatedHrs:jsonObjs]
			}
		}
		else {
			def errorMsg = "<h2>No User found with the User id :<b>${params.id}</b> "
			render(status: 404, text: errorMsg)
			return
		}
	}

	//To save the time entry
	def save ={
		
 		def userid = springSecurityService.principal.id
	 	 def user= User.get(userid)

		if(user){
			
			def time= new  Time(project:params.project,title:params.title,end:params.end,task:params.task,start:params.start,actualHours:params.actualHours,user:user,estimatedHrs:params.estimatedHours)
			user.save(flush:true)
	
		   if( !time.save(flush:true) ) {
				println "Validation errors on save"
				time.errors.each {
					 println it
				}
			 }

			println("save sucessfully")
			redirect action: 'show' ,model:[time:time]
		}
	}
	
	
	
}

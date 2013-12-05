package com.fonantrix.tm
import com.fonantrix.tm.TimeController

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import com.fonantrix.tm.authenticate.User
import com.fonantrix.tm.authenticate.UserRole
import com.fonantrix.tm.authenticate.Role
import groovy.sql.Sql
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.HibernateException
import org.apache.commons.dbcp.BasicDataSource


class CordinatorController  {

	def show = {
		/* Queries to DB for User , Projects , Tasks , User Time Entries*/
		User[] users =User.executeQuery(" from User  where id>4")
		def time = UsersTimeEntry.list()
		def projectList = Project.list()
		def taskList = Task.list()
		
		/*Code for User*/
		def user ;
		def uIdlist = new ArrayList();
		def uNamelist = new ArrayList();
		JSONObject jsonObj=new JSONObject();
		JSONArray jSonArr=new JSONArray();
		for (int m = 0 ; m < users.length ; m++) {
			def uId = users[m];
			def uName = users[m].firstName
			uIdlist.add(uId);
			uNamelist.add(uName)
		}

		for (int j =0 ; j < uIdlist.size() ; j++) {
			user = uIdlist.get(j);
			if(time){
				for (UsersTimeEntry times : 	time) {
					if(user == (times.user)) {
						JSONObject json=new JSONObject();
						json .put("taskName",times.task)
						json .put("project",times.project)
						json.put("user", times.user.firstName)
						json.put("EstimatedHours", times.estimatedHrs);
						println times.estimatedHrs
						json.put("ActualHours", times.actualHours);
						jSonArr.add( json );
					}
					jsonObj.put("UserDetails", jSonArr)
				}
			}
		}
		
		/*Code For Project Details*/
		JSONObject jsonListProject=new JSONObject();
		JSONArray jSonArrProject=new JSONArray();
		if(projectList){
			for (Project p : 	projectList) {
				JSONObject json2 = new JSONObject();
				json2.put("projectName",p.name);
				json2.put("projectId", p.id);
				jSonArrProject.add(json2);
			}
			jsonListProject.put("Projects", jSonArrProject)
		}
		/*Code For Project Details*/
		JSONObject jsonListTask=new JSONObject();
		JSONArray jSonArrTask=new JSONArray();
		if(taskList){
			for (Task t : 	taskList) {
				JSONObject json1 = new JSONObject();
				json1.put("taskName",t.name);
				json1.put("status", t.status);
				json1.put("EstimatedHours", t.estimatedHrs);
				jSonArrTask.add(json1);
			}
			jsonListTask.put("Tasks", jSonArrTask)
		}	
		render view: "/ProjectReview" ,model: [usersDetails:jsonObj,users:uNamelist,project:jsonListProject,tasks:jsonListTask]
	}
}


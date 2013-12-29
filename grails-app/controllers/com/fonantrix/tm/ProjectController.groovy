package com.fonantrix.tm
import com.fonantrix.tm.authenticate.User

import groovy.json.JsonBuilder
import grails.converters.JSON

import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.HibernateException


/*
 GET	show
 PUT	update
 POST	save
 DELETE	delete
 */
class ProjectController {

	def tasklength;


	def show = {

		def clientid = params.id
		def projectid = params.pid
		if(clientid !=null && projectid !=null) {
			Client client = Client.get(clientid)
			Project project = Project.findByClientAndId(client, projectid)
			if(project) {
				//render view: '/editProject', model: [project: project, clientid:clientid]
				def data = [
					clientid: clientid,
					clientname: client.name,
					id: projectid,
					name : project.name,
					description : project.description,
					noOfTasks: project.tasks.size()
				]
				def json = new JsonBuilder(data)
				render json.toString()
				return
			}
			else {
				def errorMsg = "<h2>No project found with the client id :<b>${params.id}</b> and project id :<b>${params.clientId}</b></h2>"
				render(status: 404, text: errorMsg)
				return
			}
		} else if (clientid !=null && projectid ==null) {
			Client client = Client.get(clientid)
			Project allClientProjects = Project.findByClient(client)
			if (project) {
				//render view: '/projects', model: [project: project, clientList:clients]
				def data = [
					projects: allClientProjects.collect {[
						clientid: clientid,
						clientname: client.name,
						id: it.id,
						name : it.name,
						description : it.description,
						noOfTasks: it.tasks.size()
					]}
				]
				def json = new JsonBuilder(data.projects)
				render json.toString()
				return
			}
			else {
				def errorMsg = "<h2>No project found with the client id :<b>${params.id}</b> and project id :<b>${params.clientId}</b></h2>"
				render(status: 404, text: errorMsg)
				return
			}
		} else if (clientid==null && projectid ==null) {
			Project[] allProjects = Project.list()
			//List projectlist = new ArrayList();
			if (allProjects) {
				/*clients.eachWithIndex { item, index ->
					List project= Project.findAllByClient(item)
					project.eachWithIndex {eachproject,indexes ->
						projectlist.add(eachproject);
					}
				}
				render view: '/projects', model: [projects: projectlist, clientList:clients]*/
				def data = [
					projects: allProjects.collect {[
						id: it.id,
						name : it.name,
						description : it.description,
						noOfTasks: it.tasks.size(),
						clientid: it.client.id,
						clientname: it.client.name
					]}
				]
				def json = new JsonBuilder(data.projects)
				render json.toString()
				return
				
			}
		}//else end
	}


	def save = {

		if (params.clientid) {
			def client = Client.get(params.clientid)
			if (client) {

				def project = new Project(name: params.name, description: params.description)
				client.addToProjects(project)
				println("project " +project)
				client.save(flush:true, failOnError: true)

				redirect action: 'show', id: params.clientid
			}
		}

		else {
			def client = Client.get(params.client)


			println(client)


			if(client) {

				def project = new Project(name: params.name, description: params.description)
				client.addToProjects(project)
				client.save(flush:true, failOnError: true)
				redirect action: 'show'
			}
		}
	}

	def deleteProject = {
		def project = Project.get(params.id)
		def clientId = params.clientid
		if(project){
			project.delete()
		}
		redirect action: 'show', id: clientId
	}

	def update = {
		if(params.id) {
			def project = Project.get(params.id)
			def clientId = params.clientid
			def mode = params.mode
			if(project) {
				try {
					project.properties = params['name']
					project.properties = params['description']
					project.save(failOnError: true)
					if (mode==null) {
						redirect action: 'show', id: clientId
					} else {
						redirect action: 'show',id: clientId
					}
					return
				} catch(HibernateException e){
					render project.errors
					return
				}
			}
			else {
				render "project not found."
				return
			}
		}
		else {
			render "Please specify project id to be updated."
		}
	}

	/*Fucntion is used  for admin review status*/
	def reviewStatus = {

		User[] users =User.executeQuery(" from User  where id>4")

		Client[] clients = Client.list()

		List projectlist=new ArrayList();
		if (clients) {
			clients.eachWithIndex { item, index ->
				List project= Project.findAllByClient(item)
				project.eachWithIndex {eachcproject,indexes ->
					projectlist.add(eachcproject);
				}
			}
			JSONObject jObject = new JSONObject();

			JSONArray jArray = new JSONArray();
			for (Project project : 	 projectlist) {
				JSONObject json = new JSONObject();
				json .put("name", project.getName());
				json .put("description", project.getDescription());
				json .put("projectId", project.getId());
				json .put("clientName", project.client.getName());
				jArray.add(json );
			}

			jObject.put("totalproject", jArray);
			def length=jArray.size()
			def totaltask=TotalTask()
			def totalclient=totalClients()
			def totalUsers= totalUsers()
			def timeEntry=UserTaskTimeEntry()
			render view: "/reviewStatus" ,model: [projects: jObject,totalProject:length,taskTask:totaltask,totalClient:totalclient,totalUsers:totalUsers,taskLength:tasklength,userList:users,userTimeEntry:timeEntry,clientList:clients]
		} else {
			def totalProject=0;
			def totaltask=0;
			def totalclient=totalClients();
			def totalUsers= totalUsers();
			println("Total Users .." +totalUsers);
			def totalTask=0;
			def tasklength=0;

			render view: "/reviewStatus" ,model: [totalProject:totalProject,taskTask:totaltask,totalClient:totalclient,totalUsers:totalUsers,taskLength:tasklength,userList:users,clientList:clients]
		}
	}

	def totalProjectCount = {
		Client[] clients = Client.list()
		List projectlist=new ArrayList();
		List totalproject=new ArrayList();
		if (clients) {
			clients.eachWithIndex { item, index ->
				List project= Project.findAllByClient(item)
				if (project != null) {
					project.eachWithIndex {eachcproject,indexes ->
						projectlist.add(eachcproject);
					}
				}
			}
			render view: '/projects', model: [projects:projectlist,clientList:clients]
		}else {
			render view: '/projects', model: [projects:projectlist,clientList:clients]
		}
	}

	/*To count total number of tasks*/
	def TotalTask() {
		Project[] projects = Project.list()
		def taskId
		def taskCumProjectId
		List usertasklist=new ArrayList();
		if (projects) {
			JSONObject jTaskObject = new JSONObject();
			JSONArray jTaskArray = new JSONArray();
			projects.eachWithIndex { item, index ->
				List task = Task.findAllByProject(item)
				task.eachWithIndex {eachtask,indexes ->
					usertasklist.add(eachtask);
				}
			}
			for (Task task : 	usertasklist) {
				JSONObject upJSON = new JSONObject();
				upJSON .put("name", task.getName());
				upJSON .put("description", task.getDescription());
				upJSON .put("status", task.getStatus());
				upJSON .put("projectName", task.project.getName());
				upJSON .put("clientName", task.project.client.getName());
				taskId=task.getId()
				taskCumProjectId=task.get(taskId).project.getId()
				upJSON .put("taskCumProjectId",taskCumProjectId);
				jTaskArray.add(upJSON );
			}
			jTaskObject.put("totalTask",jTaskArray);
			tasklength=jTaskArray.size()
			return jTaskObject
		}
	}

	/*To count total number of clients*/
	def totalClients() {
		def allClient = Client.list()
		def NoOfClient;
		if(allClient) {
			NoOfClient=allClient.size();
		}
		else {
			NoOfClient=0;
		}
		return NoOfClient
	}
	/*To count total number of users*/
	def totalUsers() {
		def allUser =User.executeQuery("from User  where id>4")
		def NoOfUser;
		if(allUser) {
			NoOfUser=allUser.size();
		}
		else {
			NoOfUser=0;
		}
		return NoOfUser;
	}

	def clientsProjects = {
		Client[] clients = Client.list()
		List cprojectlist=new ArrayList();
		if (clients) {
			clients.eachWithIndex { item, index ->
				List project= Project.findAllByClient(item)
				project.eachWithIndex {eachcproject,indexes ->
					cprojectlist.add(eachcproject);
				}
			}

			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();
			for (Project cProject : cprojectlist) {
				JSONObject cpJSON = new JSONObject();
				cpJSON .put("name", cProject.getName());
				cpJSON .put("description", cProject.getDescription());
				cpJSON .put("projectId", cProject.getId());
				jArray.add(cpJSON );
			}
			def length=jArray.size()
		}
	}

	/*used for user task time entry..and this json used in chart.js to view High charts*/
	def UserTaskTimeEntry() {
		def timeList=UsersTimeEntry.list()
		JSONObject jObject = new JSONObject();
		JSONArray jArray = new JSONArray();
		if(timeList) {
			timeList.eachWithIndex() { item, index ->
				JSONObject json = new JSONObject();
				json .put("projectName",item.getProject());
				json .put("taskName",item.getTask())
				json .put("estimatedhrs",item.getEstimatedHrs())
				json .put("actualHrs",item.getActualHours())
				json .put("userName",item.user.getUsername())
				jArray.add( json );
				def length=jArray.size()
				jObject.put("timeEntryDetail", jArray);
			}
			return jObject
		} else {
			def errorMsg = "<h2>No User found with the User id :<b>${params.id}</b> "
			render(status: 404, text: errorMsg)
			return
		}
	}
}
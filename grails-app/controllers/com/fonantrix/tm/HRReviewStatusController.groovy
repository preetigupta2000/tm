package com.fonantrix.tm;

import com.fonantrix.tm.authenticate.User

import org.codehaus.groovy.ast.stmt.SwitchStatement;
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject
import org.hibernate.HibernateException
import com.fonantrix.tm.authenticate.User
import com.fonantrix.tm.authenticate.UserRole
import com.fonantrix.tm.authenticate.Role
import com.fonantrix.tm.UsersTimeEntry

class HRReviewStatusController {
	def serchUserList;

	def show = {
		JSONObject json = new JSONObject();
		JSONObject jsonObject = new JSONObject();
		def totalBlockUser=0;
		def total=0;
		List totaluser=User.list()
		ArrayList userstatus=new ArrayList();
		User[] userlist = User.executeQuery(" from User  where id>4")
		if(userlist) {
			userlist.eachWithIndex() { user, index ->

				if(user.status.equals("block")) {
					totalBlockUser++;
				}
			}
		}
		json.put("pendingRequest", totalBlockUser);
		println("pendingRequest.."+json);
		JSONArray jArray = new JSONArray();
		totaluser.eachWithIndex() { perUser, index ->
			total++;
		}
		jsonObject.put("userStatus",jArray);
		render view: '/hrreviewstatus',model: [users: userlist,pendingRequest:json,total:total]
		if(serchUserList) {
			render view: '/hrreviewstatus',model: [users: serchUserList,pendingRequest:json,total:total]
		}
	}


	//For Updating user status
	def update = {
		if(params.id) {
			def userinfo= User.get(params.id)
			def userId =params.id
			if(userinfo)
			{
				try {
					//userinfo.properties = setuser
					userinfo.properties = params['status']
					userinfo.save(failOnError: true)
					redirect(action: "show" ,params: [upid: userId] )
					return
				} catch(HibernateException e){
					render userinfo.errors
					return
				}
			} else {
				render "user not found."
				return
			}
		}
		else {
			render "Please specify user id to be updated."
		}
	}


	//To delete user
	def deleteUser(){

		def userInfo= User.get(params.id)
		println("userInfo.."+userInfo)
		if(params.id)
		{
			println("params.id.."+params.id)
			def role = Role.findByAuthority("ROLE_USER")
			def users = User.get(params.id)
			def allUsers = UserRole.findAllByRole(role).user
			def timeUsers= UsersTimeEntry.findAllByUser(users)
			allUsers.eachWithIndex() { user, index ->
				if(user.equals(users))
				{
					UserRole.executeUpdate("DELETE FROM UserRole WHERE user=:user", [user: user])
				}
			}
			timeUsers.eachWithIndex() { timeuser, index ->
				def tuser=timeuser.user
				if(tuser.equals(users))
				{
					UsersTimeEntry.executeUpdate("DELETE FROM  UsersTimeEntry WHERE user=:user", [user: tuser])
				}
			}
			if(users)
			{
				try
				{
					userInfo.delete()
					users.delete()
					redirect(action: "show")
				} catch(HibernateException e){
					render (text:"could not delete user",status:500)
					return
				}
			} else {
				render "user not found."
				return
			}
		}
		else {
			render "Please specify user id to be deletd."
		}
	}

	def list = {


		def results = User.executeQuery("Select f.username,f.email from fon_user f  join user_role ur on f.id=ur.user_id join role r on ur.role_id=r.id where ur.role_id=3") // Perform the query

		[ result: results] // return the results as model

		println(results)
	}


	//Method to Active users
	def activateUser = {

		List blockUsers=new ArrayList();
		User[] allUser = User.executeQuery(" from User  where id>4")
		allUser.eachWithIndex() { user, index ->

			if(user.status.equals("block"))
			{

				blockUsers.add(user);
			}

		}
		if(blockUsers)
		{
			render view: '/blockUsers', model: [users: blockUsers]
		}

		else
		{
			def errorMsg = "<p>No user found with the id :<b>${params.id}</b></p>"
			render(status: 404, text: errorMsg)
			return
		}

	}

	//Method to Edit block status
	def editBlockStaus = {

		def userid = params.id
		if(userid)
		{
			User user = User.get(params.id)
			if(user)
			{
				render view: '/editBlockedandActivatestaus', model: [user: user]
				return
			}
			else
			{
				def errorMsg = "<p>No user found with the id :<b>${params.id}</b></p>"
				render(status: 404, text: errorMsg)
				return
			}
		}
	}

	//Method to Block users
	def blockUser = {
		List activeUsers=new ArrayList();
		User[] allUser = User.executeQuery(" from User  where id>4")
		allUser.eachWithIndex() { user, index ->
			if(user.status.equals("active"))
			{
				activeUsers.add(user);

			}
		}
		if(activeUsers)
		{
			render view: '/activateuser', model: [users:activeUsers]
		}

		else
		{
			def errorMsg = "<p>No user found with the id :<b>${params.id}</b></p>"
			render(status: 404, text: errorMsg)
			return
		}

	}

	//Method to Edit block status
	def editActiveStaus = {
		def userid = params.id
		if(userid)
		{
			User user = User.get(params.id)
			if(user)
			{
				render view: '/editBlockedandActivatestaus', model: [user: user]
				return
			}
			else
			{
				def errorMsg = "<p>No user found with the id :<b>${params.id}</b></p>"
				render(status: 404, text: errorMsg)
				return
			}
		}
	}

	/*For Search User and Filter by Status */
	def searchFunction = {
		def searchText="";
		List totaluser=User.list();
		def totalBlockUser=0;
		def total=0;
		JSONObject jObject = new JSONObject();
		JSONArray jArray = new JSONArray();
		searchText = params['searchTxt']
		println("searchText.."+searchText)
		def parsedLong;
		if(searchText.isInteger())
		{
			parsedLong=searchText.toLong();
		}
		if(searchText !="")
		{
			def searchtextPttern=searchText+"%"
			def c = User.createCriteria()
			serchUserList = c.list() {
				or{
					like('firstName', searchtextPttern)
					like('lastName', searchtextPttern)
					like('username', searchtextPttern)
					like('email', searchtextPttern)
					like('status', searchtextPttern)
					eq('id', parsedLong)
				}
			}
			serchUserList.eachWithIndex { item, index ->
				JSONObject json = new JSONObject();
				json .put("id", item.id);
				json .put("firstName", item.firstName);
				json .put("lastName", item.lastName);
				json .put("username", item.username);
				json .put("status", item.status);
				json .put("email", item.email);
				jArray.add(json );

			}
			jObject.put("UserList", jArray);
			render jObject.toString();

		}
	}

	//To clearAll Serch Items
	def resetFunction = {
		JSONObject jObject = new JSONObject();
		JSONArray jArray = new JSONArray();
		User[] userlist = User.executeQuery(" from User  where id>4")
		userlist.eachWithIndex { item, index ->
			JSONObject json = new JSONObject();
			json .put("id", item.id);
			json .put("firstName", item.firstName);
			json .put("lastName", item.lastName);
			json .put("username", item.username);
			json .put("status", item.status);
			json .put("email", item.email);
			jArray.add(json );
		}
		jObject.put("UserList", jArray);
		render jObject.toString();

	}



}

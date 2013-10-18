package com.fonantrix.tm

import com.fonantrix.tm.authenticate.User
import com.fonantrix.tm.authenticate.UserRole
import com.fonantrix.tm.authenticate.Role
import groovy.sql.Sql
import org.hibernate.HibernateException
import org.apache.commons.dbcp.BasicDataSource


class ManageUsersController  {
	
	
	def show = {
		
		
		def userid = params.upid
		
		if(params.id)
		 {
			
			User user = User.get(params.id)
			 	//UserInfo userinfo=new UserInfo()
				// User user=userinfo.getUser();
			 
			
			 		if(user)
					 	{
					  render view: '/edituser', model: [user: user]
					  return
				
						 	} 
						 	else 
						 	{
								 def errorMsg = "<p>No user found with the id :<b>${params.id}</b></p>"
								 render(status: 404, text: errorMsg)
								 return
							 }
		}
		
		 
		//below code is Not needed yet because Userinfo is not being used. 
		   
		/* 
		 else if(userid)
		 {
			 
			// def allUser = UserInfo.list()
			 def allUser =UserInfo.executeQuery(" from UserInfo  where id>4")
			// redirect(controller:'adminReviewStatus',action:'getUValues')
			 
			 println(allUser)
			 
			 render view: '/newInfo', model: [users: allUser]
			
		}*/
		else
		 {
			 
		
			def allUser =User.executeQuery(" from User  where id>4") //alternative solution
			//def allUser =User.executeQuery(" from User  where id>4 where id>4 or id=3") 
			
			 
			 println(allUser)
			
			render view: '/Users', model: [users: allUser]
		}
		 
	}
	
	def update = {
		if(params.id) {
			//def userinfo= UserInfo.get(params.id)
			def user= User.get(params.id)
			def userId =params.id
			println("UserId.."+userId)
			
			if(userId) {
				try {
					//def setuser = params
					//println(setuser)
					
					//userinfo.properties = setuser
					user.properties = params['username']
					user.properties = params['firstName']
			        user.properties = params['lastName']
					user.properties = params['status']
					user.save(failOnError: true)
					redirect(action: "show" ,params: [upid: userId] )
					return
				} catch(HibernateException e){
					render user.errors
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
	
	//To delete a user from HrReview status page

	 def deleteUser(){
		UserInfo[] userInfo= UserInfo.list()
		
		 println("userInfo.."+userInfo);
		 if(params.id) {
			 
			 
			 println("params.id.."+params.id)
			 def role = Role.findByAuthority("ROLE_USER")
			 println("role..."+role)
			 println "role id "+role.id
			 def users = User.get(params.id)
			 def allUsers = UserRole.findAllByRole(role).user
			 println("allUsers.."+allUsers)
			 def timeUsers=Time.findAllByUser(users)
			 println("timeUser.."+timeUsers)
			 
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
						 println("within tUser")
						  Time.executeUpdate("DELETE FROM Time WHERE user=:user", [user: tuser])
					 }
					 
				 }
			 
			  if(users){
				  try
				  {
					   userInfo.eachWithIndex() { userinfo, index ->
						   def userss=userinfo.user;
							  if(userss.equals(users))
							  {
							  def userid=userinfo.id;
							  UserInfo.executeUpdate("DELETE FROM UserInfo WHERE id=:id", [id: userid])
							  }
						  }
				
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
	 
	/* 
	def deleteUser(){
		if(params.id) {
			def user = User.get(params.id)
			if(user) {
				try {
					user.delete()
					redirect(action: "show")
				} catch(HibernateException e){
					render (text:"could not delete client",status:500)
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
	*/
	
	
	def list = {
	

	def results = User.executeQuery("Select f.username,f.email from fon_user f  join user_role ur on f.id=ur.user_id join role r on ur.role_id=r.id where ur.role_id=3") // Perform the query

		[ result: results] // return the results as model
		
	println(results)
	}
	
	//show users for deleting.This method calls when delete user is click from HrReviewstatus page.
	def showUsers = {
	
			def allUser =User.executeQuery(" from User  where id>4") 
			//def allUser =User.executeQuery(" from User  where id>4 where id>4 or id=3")
			if(allUser)
			render view: '/deleteusers', model: [users: allUser]
			else {
				render "user not found."
			}
			 
			
		}
	


}

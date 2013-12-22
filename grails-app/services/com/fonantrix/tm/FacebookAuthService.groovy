package com.fonantrix.tm

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject


import com.fonantrix.tm.authenticate.User
import com.the6hours.grails.springsecurity.facebook.FacebookAuthDao
import com.the6hours.grails.springsecurity.facebook.FacebookAuthToken

class FacebookAuthService {
	FacebookAuthDao facebookAuthDao
	void prepopulateAppUser(User user, FacebookAuthToken token) {
		def accessToken  = token.accessToken?.accessToken	
		if(accessToken){
			String authUrl = "https://graph.facebook.com/me?access_token=$accessToken"
			URL url = new URL(authUrl)
			JSONObject me = JSON.parse(url.readLines().first())
			user.password = me.first_name.toLowerCase()
			user.username = me.id
			user.accountExpired = false
			user.accountLocked = false
			user.enabled = true
			user.passwordExpired = false
			user.email = me.email
			user.firstName = me.first_name
			user.lastName = me.last_name
			user.is_admin = false
			user.is_coordinator = false
			user.ishr = false
			user.is_user = true
			user.isFacebookUser = true
		}
	}
	
	
}
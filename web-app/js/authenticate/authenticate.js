Authenticate = new function() {
	var clsMainHeader = ".main-header";
	var mainApp = com.fonantrix.application.tm;
	var facebookAppId;
	
	this.authAjax = function(){
		$("#loginErrorMessage").hide();
		$($("#ajaxLoginForm").find("input[type=email]")).removeClass("invalid-name");
		$($("#ajaxLoginForm").find("input[type=password]")).removeClass("invalid-name");
		var form = document.ajaxLoginForm; 
		$.ajax({
 			url: form.action,
 			type: 'POST',
	    	data: { 
	    		j_username: form.j_username.value,
	    		j_password:  form.j_password.value
	    	},
	        success: function(response) {
				if (response.success) {
					mainApp.userinfo.loggedin = true;
					mainApp.userinfo.firstName = response.model.firstName;
					mainApp.userinfo.lastName = response.model.lastName;
					mainApp.userinfo.name =  response.model.username;
					mainApp.userinfo.email = response.model.email;
					mainApp.userinfo.admin =  response.model.is_admin;
					mainApp.userinfo.hr =  response.model.ishr;
					mainApp.userinfo.coordinator =  response.model.is_coordinator;
					mainApp.userinfo.user =  response.model.is_user;
					com.fonantrix.tm.util.TemplateManager.get('/home', function(template){
						$("#loginform").html(template({"facebookuser":mainApp.userinfo.facebookuser,"loggedin": mainApp.userinfo.loggedin,"username": mainApp.userinfo.name,
							"firstname":  mainApp.userinfo.firstName,"lastname":  mainApp.userinfo.lastName, "email":  mainApp.userinfo.email, 
							"isADMIN" : mainApp.userinfo.admin, "isHR" : mainApp.userinfo.hr, 
							"isCOORDINATOR" : mainApp.userinfo.coordinator, "isUSER" : mainApp.userinfo.user}));
					 });
				} else {
					mainApp.userinfo.loggedin = false;						
					$("#loginErrorMessage").show();
					var errorMessage = "";
					if (response.error) {
						errorMessage = response.error;						
					} else {
						errorMessage = response;
					}
					$("#loginErrorMessage").html("<span class='errorMessage'>" + errorMessage + "</span>");
					$($("#ajaxLoginForm").find("input[type=email]")).addClass("invalid-name");
					$($("#ajaxLoginForm").find("input[type=password]")).addClass("invalid-name");
					
				} 
	        }
	    });		    
  	},
  	this.loginWithFacebook = function(){
  		if(isStandaloneWebApp()) {
  			var redirectURI = formFacebookRedirectURI();
  			var authURL = "https://www.facebook.com/dialog/oauth/?client_id=" + this.facebookAppId +
  				"&redirect_uri=" + redirectURI + "&scope=email,user_likes&response_type=token";
  			window.location = authURL;
  		    return;
  		} else {
	  		 FB.login(function(response) {
	   			if (response.authResponse) {	   				
	   				mainApp.handleLoginSuccess(true);
	 		  	} else {
	 		  		mainApp.userinfo.loggedin = false;					
	 				$("#loginErrorMessage").show();
	 				$("#loginErrorMessage").html("<span class='errorMessage'>User cancelled login or did not fully authorize</span>");
	 				$($("#ajaxLoginForm").find("input[type=email]")).addClass("invalid-name");
					$($("#ajaxLoginForm").find("input[type=password]")).addClass("invalid-name");
	 	  		}
	   		},{scope: 'email,user_likes'});  
  		}	 
	},
	
	this.logout = function(){
		FB.getLoginStatus(function(response) {
		  if (response.status === 'connected') {
			  FB.logout();
		  } 
		});
		ajaxLogout();		  
	},
	
	this.setFacebookAppId = function(appId){
		this.facebookAppId =  appId;
	}	
	
	
	function ajaxLogout() {
		$.ajax({
			url: com.fonantrix.tm.REQUEST_CONTEXT + "/j_spring_security_logout",
			type: 'GET',    	
			success: function(response) {
				mainApp.userinfo.loggedin = false;
				mainApp.userinfo.admin = false;
				mainApp.userinfo.facebookuser =  false;
				UserModel.destroy();
				com.fonantrix.tm.util.TemplateManager.get('/home', function(template){
					var templateHTML = template ({"loggedin": mainApp.userinfo.loggedin});
					$("#loginform").html(templateHTML);	
					if (typeof FB != 'undefined') {
						$("button#facebook-login").show();
					}					
			 	 });
				
				/*
				 * 1st parameter - update header for login
				 * 2nd parameter - showHomeLink
				 * 3rd parameter - setBackLink 
				 */
				mainApp.setHeaderOptions(true, false, false);
			}
		});
	}
	function isStandaloneWebApp () {
		if(("standalone" in window.navigator) && window.navigator.standalone){
			return true;
		}
		return false;
	}
	
	function formFacebookRedirectURI () {
  		var URI = window.location.protocol + "//" + window.location.host 
  					+ com.fonantrix.tm.REQUEST_CONTEXT + "/"
  					+ "/login/facebookLoginSuccess/"  					
  		return URI;
  	}
};
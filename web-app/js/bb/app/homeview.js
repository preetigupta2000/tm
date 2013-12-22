HomeView = new function() {
	
	/* ----- Global Variables ----------------------*/
	var mainApp = com.fonantrix.application.tm;
	var homeView = null;
	
	var tmNameSpace = com.fonantrix.tm.util;
	
	var Router = Backbone.Router.extend({
		routes: {
	      'home':'home',
	      '*notFound': 'notFound'
	    }, 
	    initialize: function() {

		},
	    home : function() {
	    	if (homeView == null) {  //First OR After Browser Refresh
	    		homeView = new View();
			} else {  	 //If the View has been created (bbView) never re-create
				homeView.render();
			}
	    },
	    notFound : function(){
	    	if(location.href.indexOf("#") == -1){
	    		Backbone.history.navigate("#/home");
	    		return true;
	    	}
	    	if(window.location.hash.indexOf("#access_token")>-1){
	    		Backbone.history.navigate("#/home");
	    		return true;
	    	}
	    	$('#message').html("The requested page does not exist.");
	    	var logger = com.fonantrix.application.tm.logger;
	    	logger.error("No such route defined.");
	    	logger.error("The requested route "+ location.hash +" does not match with the specified routes.");
	    	$('#headers').html("");
	    	$("#ajax-error-label").text("Oops!");
		    $('#ajax-error-modal .modal-body .content-header').text("Invalid path requested!");
		    $('#no-network').hide();
	    	$('#ajax-error-modal .modal-body .content-body').show();
		    $('#ajax-error-modal').modal();
	    }
	});
	
	var View = Backbone.View.extend({
		/*--------------- Static Class Variable ------------*/
		myPanelId:"#bb-container",
		
		events: {
			"click #login-button"			:	"userlogin",
			"click #logout-button"			:	"userlogout",
			"click #users-button"			:	"browseUser",
			"click #status-button"			:	"browseStatus",
			"click #client-button"			:	"browseClients",
			"click #projects-button"		:	"browseProjects",
			"click #task-button"			:	"browseTasks",
			"click #projectstatus-button"	:	"browseProjectStatus",
			"click #timenetry-button"		:	"addTimeEntry"
		},
				
		initialize: function() {
			
			/* -------------- Setup and Initialize INSTANCE Variables -----------------*/
			this.template_splash="";
			this.template_body_home="";
			/* ------------------------------------------------------------------------*/
			
			//Fill Templates
			var that = this;			
			tmNameSpace.TemplateManager.get('splash', 
				function(template){		
					that.template_splash = template;
					tmNameSpace.TemplateManager.get('home', function(template){
						that.template_body_home = template;
						that.render();
					});
			});	
		},
		render : function() {
			$(this.myPanelId).html(this.template_splash());
			var view = this;
			if(mainApp.userinfo.loggedin){
				UserModel.get().fetch({
					success: function(model, response){
						mainApp.userinfo.name = model.get("username");
						mainApp.userinfo.email =  model.get("email");
						mainApp.userinfo.admin =  model.get("is_admin");
						mainApp.userinfo.hr =  model.get("ishr");
						mainApp.userinfo.coordinator =  model.get("is_coordinator");
						mainApp.userinfo.user =  model.get("is_user");
						$("#loginform").html(view.template_body_home({"facebookuser":mainApp.userinfo.facebookuser,"loggedin": mainApp.userinfo.loggedin,"username": mainApp.userinfo.name,
							"firstname": model.get("firstName"),"lastname": model.get("lastName"), "email":  mainApp.userinfo.email, 
							"isADMIN" : mainApp.userinfo.admin, "isHR" : mainApp.userinfo.hr, 
							"isCOORDINATOR" : mainApp.userinfo.coordinator, "isUSER" : mainApp.userinfo.user}));
						
						/*
						 * 1st parameter - update header for login
						 * 2nd parameter - showHomeLink
						 * 3rd parameter - setBackLink 
						 * 4th parameter - showLogoutIcon
						 */
						if(mainApp.userinfo.facebookuser) {
							$($("#user-info").find("img")).css("border","1px solid #E5E5E5");
						}
						mainApp.setHeaderOptions(true, false, false, false);
					}
				});
			} else {
				$("#loginform").html(view.template_body_home({loggedin: mainApp.userinfo.loggedin, isHR: false, isCOORDINATOR:false, isADMIN:true, isUSER:false}));
				if (typeof FB != 'undefined') {
					$("button#facebook-login").show();
				}
		
			}
			this.setElement("#loginform");			
			return this; //Do this at the end to allow for method chaining.		
		},
		userlogin : function() {
			Authenticate.authAjax(); 
			return false;
		},
		userlogout : function() {
			Authenticate.logout();
			return false;
		},
		browseClients: function() {
			Backbone.history.navigate("#/client/list");
		},
		listUsers: function() {
			Backbone.history.navigate("#/user");
		}		
	});
	
	this.routerInitialize = function(){
		router = new Router();   
	};
};
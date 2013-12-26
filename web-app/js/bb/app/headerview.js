HeaderView = new function() {

	/* ----- Global View Variables ----------------------*/
	var headerbbView = null;
	/* -------------------------------------------------*/
	var mainApp = com.fonantrix.application.tm;
	var clsMainHeader = mainApp.clsMainHeader;
	var tmNameSpace = com.fonantrix.tm.util;
	
	this.initialize = function(){
		if (headerbbView == null)
			headerbbView = new View();
	};
	
	this.setHeaderMenu = function(show)	{
		headerbbView.updateloginheader(show);
	};
	
	this.setHomeIcon = function(show) {
		headerbbView.setHomeIcon(show);
	};
	
	this.setBackIcon = function(show) {
		headerbbView.setBackIcon(show); 
	};
	
	var View = Backbone.View.extend({
		
		/*--------------- Static Class Variable ------------*/
		
		/*------------------------------------------------------*/		
			
		template_header: "",
		
		events: {
			"click #back"	:	"backbutton",
			"click #home"	:	"homebutton",
			"click #logout"	:	"logout",
			"click #admin-panel" :	"showModal",
		},
		
		initialize: function() {
			
			/* -------------- Setup and Initialize INSTANCE Variables -----------------*/
			this.template_header="";
			/* ------------------------------------------------------------------------*/
			
			//Fill Templates
			var that = this;
			tmNameSpace.TemplateManager.get('header', 
				function(template){
					that.template_header = template;
					that.render();
			});
			this.setElement(clsMainHeader);
		},
		
		// Updating method name from "render" to "custiomRender" for logging.
		render : function() {
			
			var compiled_template_header = this.template_header();
			$(clsMainHeader).html(compiled_template_header);
			
			
			this.updateloginheader();
			this.setHomeIcon(false);
			this.setBackIcon(false);
			return this; //Do this at the end to allow for method chaining.
		},
		
		backbutton : function() {
            if (window.history.length > 0) {
                window.history.back();
                if (window.location.hash == "#/home")
                	this.setBackIcon(false);
                return false;
            }
            navigator.app.exitApp();
		},
		
		homebutton : function() {
			Backbone.history.navigate("#/home");
			this.setBackIcon(false);
			return false;
		},
		
		logout : function() {
			Backbone.history.navigate("#/home");
			return false;
		},
		showModal : function(){
			$("#ajax-error-label").text("Time-Managemnt-APP");
		    $('#ajax-error-modal').modal('show');
		},
		updateloginheader : function(show) {
			if (show == undefined) {
				if (mainApp.userinfo.loggedin) {
					$(".navbar-inner .loggedin").css("display", "block");
				} else {
					$(".navbar-inner .loggedin").css("display", "none");
				}
			} else {
				if (show) {
					$(".navbar-inner .loggedin").css("display", "block");
				} else {
					$(".navbar-inner .loggedin").css("display", "none");
				}				
			}
			$("#admin-panel").css("display", "block");
				
		},
		
		setHomeIcon : function(show) {
			if (show) {
				$(".navbar-inner #home").css("display", "block");
			} else {
				$(".navbar-inner #home").css("display", "none");
			}
		},
		
		setBackIcon : function(show) {
			if (show) {
				$(".navbar-inner #back").css("display", "block");
			} else {
				$(".navbar-inner #back").css("display", "none");
			}
		}		
	});
		
};
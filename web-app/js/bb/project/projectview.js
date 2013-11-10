ProjectView = new function() {

	/* ----- Global View Variables ----------------------*/
	var listbbclientView = null;
	var tmNameSpace = com.fonantrix.tm.util;
	/* -------------------------------------------------*/

	this.initialize = function(){
		if (listbbclientView == null)
			listbbclientView = new View();
	};
	
	var Router = Backbone.Router.extend({
		routes: {
			"project/list": "projectlist",
			"projects/addClient": "addProject",
			"projects/edit/:clientId": "editProject",
			"projects/delete/:id": "deleteProject"
	    },	    

	    projectlist : function() {
			if (listbbclientView == null) {  //First OR After Browser Refresh
				
				listbbclientView = new View();
				
			} else {  	 //If the View has been created (bbView) never re-create
				
				listbbclientView.render();
			}
	    },
	    
	    addProject: function(){
	    	//ClientAddView.initialize();
	    },

	    editProject: function(projectId){
	    	//ClientEditView.initialize(projectId);
	    },

	    deleteProject: function(projectId){
	    	//ClientDeleteView.initialize(projectId);
	    }
	});


	var View = Backbone.View.extend({
		
		/*--------------- Static Class Variable ------------*/
		myPanelId:"#bb-container",
		myPanelRowId:"#bb-container #project-list",
		/*------------------------------------------------------*/
		
		events:{
			"click #addNewProject": "createOnEnter"
		},
		
		initialize: function() {
			
			/* -------------- Setup and Initialize INSTANCE Variables -----------------*/
			this.template_header="";
			this.template_body="";
			this.template_body_row="";
			/* ------------------------------------------------------------------------*/
			
			this.loadCollection();
			
			//Fill Templates
			var that = this;					
			tmNameSpace.TemplateManager.get('project-list',
					function(template){
						that.template_body = template;
						
						tmNameSpace.TemplateManager.get('project-list-row',
								function(template){
									that.template_body_row = template;
									//Always call render from initialize - as Backbone does not automatically call it.									
									that.render();
								}
						);
					}
			);
		},
		
		loadCollection: function()	{
			this.collection = ClientCollection.get();	
		},
		
		createOnEnter: function()	{
			Backbone.history.navigate("#/projects/addProject", {trigger:true});
		},
		
		render : function() {

			var compiled_template_body = Mustache.render(this.template_body);
			$(this.myPanelId).html(compiled_template_body);
			
			/* ----- Appending Rows  ----------- */
			that = this;
	    	this.collection.fetch({success: function() {
				that.collection.each( function(client) {				
					/* ----- Appending Rows  ----------- */
			    	var compiled_template_body_row = Mustache.render(that.template_body_row, client.toJSON());	    	
			    	$(that.myPanelRowId).append(compiled_template_body_row);
			    });
	    	}});	    	
			
			this.setElement(this.myPanelId);

			return this; //Do this at the end to allow for method chaining.			
		}
	});
	
	
	this.routerInitialize = function(){
		router = new Router();   
	};
};

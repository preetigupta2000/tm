ProjectView = new function() {

	/* ----- Global View Variables ----------------------*/
	var listbbprojectView = null;
	
	var tmNameSpace = com.fonantrix.tm.util;
	/* -------------------------------------------------*/

	this.initialize = function(){
	};
	
	var Router = Backbone.Router.extend({
		routes: {
			'project/list':'projectBrowse',
			'client/:clientId/project/list':'projectlist',
			'client/:clientId/project/addProject': 'addProject',
			'client/:clientId/project/:projectId': 'editProject',
			'client/:clientId/project/delete/:id': 'deleteProject'
	    },	    
	    projectBrowse : function() {
			if (listbbprojectView == null) {  //First OR After Browser Refresh
				listbbprojectView = new View();
			} else {  	 //If the View has been created (bbView) never re-create
				listbbprojectView.loadCollection();
			}
	    },
	    projectlist : function(clientId,projectId) {
			if (listbbprojectView == null) {  //First OR After Browser Refresh
				
				listbbprojectView = new View({clientId:clientId,projectId:projectId});
				
			} else {  	 //If the View has been created (bbView) never re-create
				listbbprojectView.loadCollection(clientId,projectId);
				listbbprojectView.collection.fetch({
					success: function(){
						listbbprojectView.render();
					}
				});
			}
	    },
	    
	    addProject: function(clientId){
	    	collection = ProjectCollection.get(clientId)
	    	collection.create(
	    		this.newAttributes(),
	    		{
	    			success: function(response) {
	    				$.fancybox.close();
	    				Backbone.history.navigate("#/project/list", {trigger:true,replace:true});
	    			},
	    			error: function(error){
	    				console.log(error.responseText);
	    				$.fancybox.close();
	    			},
	    		}
	    	);
	    },
	    newAttributes: function() {
		      return {
		    	  name : $("#projectform #name").val(),
		    	  description	: 	$("#projectform #description").val()
		    };
		},
	    editProject: function(clientId, projectId){
	    	model = ProjectCollection.get(clientId).get(projectId);
	    	model.save(
    			this.newAttributes(),
	    		{
	    			success: function(model, response) {
	    				$.fancybox.close();
	    				Backbone.history.navigate("#/project/list", {trigger:true,replace:true});
	    			},
	    			error: function(error){
	    				console.log(error.responseText);
	    				$.fancybox.close();
	    			},
	    		}	    		
	    	);
	    },

	    deleteProject: function(clientId, projectId){
	    	collection = ProjectCollection.get(clientId);

	    	collection.get(projectId).destroy({
	    			success: function(response) {
	    				$.fancybox.close();
	    				Backbone.history.navigate("#/project/list", {trigger:true,replace:true});
	    			},
	    			error: function(error){
	    				console.log(error.responseText);
	    				$.fancybox.close();
	    			},
	    		}
	    	);
	    }
	});


	var View = Backbone.View.extend({
		
		/*--------------- Static Class Variable ------------*/
		myPanelId:"#bb-container",
		myPanelRowId:"#bb-container #project-list",
		/*------------------------------------------------------*/
		
		events:{
			"click #addNewProject": "createOnEnter",
			"click #editProject": "editExistingProject",
			"click #deleteProject": "deleteExistingProject"				
		},
		
		initialize: function() {
			
			/* -------------- Setup and Initialize INSTANCE Variables -----------------*/
			this.template_header="";
			this.template_body="";
			this.template_body_row="";
			/* ------------------------------------------------------------------------*/
			
			if (arguments.length > 0)
				this.loadCollection(arguments[0].clientId,arguments[0].projectId);
			else
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
		
		loadCollection: function(clientId,projectId)	{
			this.collection = ProjectCollection.get(clientId,projectId);	
		},
		
		createOnEnter: function()	{
			$(document).on('click', '[title="Close"]', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$(document).on('click', '.modal-footer >a#add', function(event){
				var formElement = this.parentNode.parentNode;
				var clientId = formElement['client-id'].value;
				Backbone.history.navigate("#client/" + clientId +"/project/addProject", {trigger:true});
			});	
		},
		editExistingProject: function(event) {
			$(document).on('click', '[title="Close"]', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$('.modal-footer >a#edit').die().live('click', function(event){
				var projectId = event.currentTarget.attributes['project-id'].value;
				var clientId = event.currentTarget.attributes['client-id'].value;
				Backbone.history.navigate("#/client/" + clientId + "/project/"+ projectId, {trigger:true});
			});				
		},
		deleteExistingProject: function(event) {
			$(document).on('click', '[title="Close"]', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$('.modal-footer >a#delete').die().live('click', function(event){
				var projectId = event.currentTarget.attributes['project-id'].value;
				Backbone.history.navigate("#/projects/delete/"+ projectId, {trigger:true});
			});				
		}, 
		render : function() {
			$(this.myPanelId).html(this.template_body({}));
			
			/* ----- Appending Rows  ----------- */
			that = this;
	    	this.collection.fetch({success: function() {
					
				that.collection.each( function(project) {				
					/* ----- Appending Rows  ----------- */
					$(that.myPanelRowId).append(that.template_body_row(project.toJSON()));
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

ProjectView = new function() {

	/* ----- Global View Variables ----------------------*/
	var listbbprojectView = null;
	var tmNameSpace = com.fonantrix.tm.util;
	/* -------------------------------------------------*/

	this.initialize = function(){
		if (listbbprojectView == null)
			listbbprojectView = new View();
	};
	
	var Router = Backbone.Router.extend({
		routes: {
			"project/list": "projectlist",
			"projects/addProject": "addProject",
			"projects/edit/:projectId": "editProject",
			"projects/delete/:id": "deleteProject"
	    },	    

	    projectlist : function() {
			if (listbbprojectView == null) {  //First OR After Browser Refresh
				
				listbbprojectView = new View();
				
			} else {  	 //If the View has been created (bbView) never re-create
				
				listbbprojectView.render();
			}
	    },
	    
	    addProject: function(){
	    	collection = ProjectCollection.get()
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
	    editProject: function(projectId){
	    	model = ProjectCollection.get().get(projectId);
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

	    deleteProject: function(projectId){
	    	collection = ProjectCollection.get();

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
			this.collection = ProjectCollection.get();	
		},
		
		createOnEnter: function()	{
			$(document).on('click', '[title="Close"]', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$(document).on('click', '.modal-footer >a#add', function(event){
			Backbone.history.navigate("#/projects/addProject", {trigger:true});
			});	
		},
		editExistingProject: function(event) {
			$(document).on('click', '[title="Close"]', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$('.modal-footer >a#edit').die().live('click', function(event){
				var projectId = event.currentTarget.attributes['project-id'].value;
				Backbone.history.navigate("#/projects/edit/"+ projectId, {trigger:true});
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

			var compiled_template_body = Mustache.render(this.template_body);
			$(this.myPanelId).html(compiled_template_body);
			
			/* ----- Appending Rows  ----------- */
			that = this;
	    	this.collection.fetch({success: function() {
				that.collection.each( function(project) {				
					/* ----- Appending Rows  ----------- */
			    	var compiled_template_body_row = Mustache.render(that.template_body_row, project.toJSON());	    	
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

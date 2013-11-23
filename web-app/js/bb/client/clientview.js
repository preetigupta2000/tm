ClientView = new function() {

	/* ----- Global View Variables ----------------------*/
	var listbbclientView = null;
	var tmNameSpace = com.fonantrix.tm.util;
	/* -------------------------------------------------*/

	this.initialize = function(){
		listbbclientView = new View();
	};
	
	var Router = Backbone.Router.extend({
		routes: {
			"client/list": "clientlist",
			"clients/addClient": "addClient",
			"clients/edit/:clientId": "editClient",
			"clients/delete/:clientId": "deleteClient"
	    },	    

	    clientlist : function() {
			if (listbbclientView == null) {  //First OR After Browser Refresh
				
				listbbclientView = new View();
				
			} else {  	 //If the View has been created (bbView) never re-create
				
				listbbclientView.render();
			}
	    },
	    
	    addClient: function(){
	    	collection = ClientCollection.get()
	    	collection.create(
	    		this.newAttributes(),
	    		{
	    			wait : true,
	    			success: function(response) {
	    				$.fancybox.close();
	    				Backbone.history.navigate("#/client/list", {trigger:true,replace:true});
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
		    	  name : $("#clientform #name").val(),
		    	  description	: 	$("#clientform #description").val()
		    };
		},
	    editClient: function(clientId){
	    	collection = ClientCollection.get().get(clientId);

	    	collection.save(
	    		this.newAttributes(),
	    		{
	    			wait : true,
	    			success: function(response) {
	    				$.fancybox.close();
	    				Backbone.history.navigate("#/client/list", {trigger:true,replace:true});
	    			},
	    			error: function(error){
	    				console.log(error.responseText);
	    				$.fancybox.close();
	    			},
	    		}
	    	);
	    },

	    deleteClient: function(clientId){
	    	collection = ClientCollection.get().get(clientId);

	    	collection.destroy({
	    			success: function(response) {
	    				$.fancybox.close();
	    				Backbone.history.navigate("#/client/list", {trigger:true,replace:true});
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
		myPanelRowId:"#bb-container #client-list",
		/*------------------------------------------------------*/
		
		events:{
			"click #addNewClient": "createOnEnter",
			"click #editClient": "editExistingClient",
			"click #deleteClient": "deleteExistingClient"
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
			tmNameSpace.TemplateManager.get('client-list',
					function(template){
						that.template_body = template;
						
						tmNameSpace.TemplateManager.get('client-list-row',
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
		
		createOnEnter: function(event)	{
			$(document).on('click', '[title="Close"]', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$(document).on('click', '.modal-footer >a#add', function(event){
				Backbone.history.navigate("#/clients/addClient", {trigger:true});
			});	
		
		},
		editExistingClient: function(event) {
			$(document).on('click', '[title="Close"]', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$('.modal-footer >a#edit').die().live('click', function(event){
				var clientId = event.currentTarget.attributes['client-id'].value;
				Backbone.history.navigate("#/clients/edit/"+ clientId, {trigger:true});
			});				
		},
		deleteExistingClient: function(event) {
			$(document).on('click', '[title="Close"]', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$('.modal-footer >a#delete').die().live('click', function(event){
				var clientId = event.currentTarget.attributes['client-id'].value;
				Backbone.history.navigate("#/clients/delete/"+ clientId, {trigger:true});
			});				
		}, 
		render : function() {
			$(this.myPanelId).html(this.template_body());
			
			/* ----- Appending Rows  ----------- */
			that = this;
	    	this.collection.fetch({success: function() {
				that.collection.each( function(client) {				
					/* ----- Appending Rows  ----------- */
					$(that.myPanelRowId).append(that.template_body_row(client.toJSON()));

			    });
	    	}});	    	
			
			this.setElement(this.myPanelId);

			return this; //Do this at the end to allow for method chaining.			
		},
		paintEdit : function(clientId) {
			that = this;
	    	this.collection.fetch({data: {"id": clientId}, success: function() {
	    		that.collection.each(function(user){	    		
	    			$(that.myPanelId).html(that.template_body(client.toJSON()));
		    	});    		
	    	}});	
		}		
	});    
	
	this.routerInitialize = function(){
		router = new Router();   
	};
};

ClientView = new function() {

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
			"client/list": "clientlist",
			"clients/addClient": "addClient",
			"clients/edit/:clientId": "editClient",
			"clients/delete/:id": "deleteClient"
	    },	    

	    clientlist : function() {
			if (listbbclientView == null) {  //First OR After Browser Refresh
				
				listbbclientView = new View();
				
			} else {  	 //If the View has been created (bbView) never re-create
				
				listbbclientView.render();
			}
	    },
	    
	    addClient: function(){
	    	ClientCollection.get().create(
	    		this.newAttributes(),
	    		{
	    			wait : true,
	    			success: function(collection, response) {
	    				alert(response);
	    				$.fancybox.close();
	    				Backbone.history.navigate("#/clients/list", {trigger:true,replace:true});
	    			},
	    			error: function(response){
	    				alert(response);
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
	    editClient: function(userId){
	    	//ClientEditView.initialize(userId);
	    },

	    deleteClient: function(userId){
	    	//ClientDeleteView.initialize(userId);
	    }
	});


	var View = Backbone.View.extend({
		
		/*--------------- Static Class Variable ------------*/
		myPanelId:"#bb-container",
		myPanelRowId:"#bb-container #client-list",
		/*------------------------------------------------------*/
		
		events:{
			"click #addNewClient": "createOnEnter"
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
			$('[title="Close"]').live('click', function(event){
			    event.stopPropagation();
			    $.fancybox.close();
			});
			$('#addclient').live('click', function(event){
				Backbone.history.navigate("#/clients/addClient", {trigger:true,replace:true});
			});			
		
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

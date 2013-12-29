//Backbone Collection
ProjectCollection = new function() {
	
	var collectionMap = new Object;
	
	var Collection = Backbone.Collection.extend({
		model: ProjectModel.get(),
		initialize: function(models, options){
			this.url= com.fonantrix.tm.REQUEST_CONTEXT + "/api/project";
		},
		comparator: function(project) {
			return project.get('id');
		}        
	});

 	  this.get = function(clientId, projectid){ // Each backbone collection needs to define "get()" function
 		  
 		  var urlGET = com.fonantrix.tm.REQUEST_CONTEXT + "/api/";
 		  
 		  if (typeof clientId != "undefined") {
 			  urlGET =  urlGET + "/client/" + clientId ;
 		  } 	
 		  if (typeof projectid != "undefined") {
 			  urlGET =  urlGET + "/project/" +  projectid ;
 		  } 
 		  
 		 if (typeof clientId == "undefined" && typeof projectid == "undefined") {
 		 	urlGET = urlGET + "project/";
 		 }
 		 
          if (collectionMap[clientId] == null) {
        	  collectionMap[clientId] = new Collection();
        	  collectionMap[clientId].url = urlGET;
          }
		  return collectionMap[clientId];
	  };
};
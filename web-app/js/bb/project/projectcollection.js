//Backbone Collection
ProjectCollection = new function() {
	
	var collection = null;
	
	var Collection = Backbone.Collection.extend({
		model: ClientModel.get(),
		url: com.fonantrix.tm.REQUEST_CONTEXT + "/api/project"
	});

	this.get = function(clientId, projectId){
		var urlGET = com.fonantrix.tm.REQUEST_CONTEXT + "/api/project" ;
		if (clientId != undefined)
			urlGET= com.fonantrix.tm.REQUEST_CONTEXT + "/api/client/" + clientId + "/project";
		if (projectId != undefined)
			urlGET= com.fonantrix.tm.REQUEST_CONTEXT + "/api/client/" + clientId + "/project/" + projectId;
		
		if (this.collection == null || clientId != undefined) {
			this.collection = new Collection();
			this.collection.url = urlGET;
		}
		return this.collection;
	};
};

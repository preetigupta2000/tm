//Backbone Collection
ClientCollection = new function() {
	
	var collection = null;
	var Collection = Backbone.Collection.extend({
		model: ClientModel.get(),
		initialize: function(){
			this.url= com.fonantrix.tm.REQUEST_CONTEXT + "/api/client";
		},
		comparator: function(client) {
			return client.get('id');
		}
	});

	this.get = function(){
		if (this.collection == null) {
			this.collection = new Collection();
		}
		return this.collection;
	};
};
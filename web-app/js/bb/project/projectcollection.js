//Backbone Collection
ProjectCollection = new function() {
	
	var collection = null;
	var Collection = Backbone.Collection.extend({
		model: ProjectModel.get(),
		initialize: function(){
			this.url= com.fonantrix.tm.REQUEST_CONTEXT + "/api/project";
		},
		comparator: function(project) {
			return project.get('id');
		}
	});

	this.get = function(){
		if (this.collection == null) {
			this.collection = new Collection();
		}
		return this.collection;
	};
};
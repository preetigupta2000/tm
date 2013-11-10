 /*
 -----------------
 GLOBAL Util Module
 -----------------
 */
 
function namespace(namespaceString) {
     var parts = namespaceString.split('.'),
         parent = window,
         currentPart = '';
 
     for(var i = 0, length = parts.length; i < length; i++) {
         currentPart = parts[i];
         parent[currentPart] = parent[currentPart] || {};
         parent = parent[currentPart];
     }
 
     return parent;
 }
 
/*JSHINT global variables*/
/*global com*/
/*global $*/
/*global Handlebars*/
"use strict";
namespace("com.fonantrix.tm.util");

com.fonantrix.tm.util.TemplateManager = {
	
	templates: {},
	get: function (id, callback, options) {
		var cache;
		if (options == null) {
			cache = true;
		} else if (options.cache == null) {
			cache = true;
		} else {
			cache = options.cache;
		}
		var compiledTemplate = this.templates[id];
		if (compiledTemplate) {
			callback(compiledTemplate);
		} else {
			var templateManagerRef = this;
			$.ajax({
					url: com.fonantrix.tm.REQUEST_CONTEXT + "/getTemplate/",
					dataType: "html",
					data: {
						path: "/templates/" + id,
					},
					success: function (template) {
						//var compiledTemplate = mustache.compile(template);
						if (cache) {
							templateManagerRef.templates[id] = template;
						}
						callback(template);
					}
				});
		}
	},
	clearCache: function () {
		this.templates = {};
	}
};
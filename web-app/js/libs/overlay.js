/*global com*/
/*global jQuery*/
/*global window */
com.fonantrix.tm.fn.namespace("com.fonantrix.tm.util");
com.fonantrix.tm.util.overlay = (function () {
	"use strict";

	/********************************************************/
	/*                   DEPENDENCIES                       */
	/********************************************************/
	var TemplateManager = com.fonantrix.tm.util.TemplateManager;
	var elLoader = "#content";

	/********************************************************/
	/*                 PRIVATE MEMBERS                     */
	/********************************************************/
	/**
	 * Helper function used to call the javascript function by using the function name passed as String.
	 */
	var executeFunctionByName = function (functionName, context /*, args */ ) {
		// var args = Array.prototype.slice.call(arguments).splice(2);
		var namespaces = functionName.split(".");
		var func = namespaces.pop();
		for (var i = 0; i < namespaces.length; i++) {
			context = context[namespaces[i]];
		}
		return context[func].apply(this /*, args */ );
	};
	
	var setFancyBox = function (overlayModalAnchor, html) {
		// In case Data has to be shown in Iframe.
		if (overlayModalAnchor.attr('data-type')) {
			jQuery.fancybox({
				href: overlayModalAnchor.attr('data-href')
			}, overlayModalAnchor.data());
		} else {
			jQuery.fancybox(html, overlayModalAnchor.data());
		}
		// In case a function is to be called when the pop up gets loaded pass the function name
		// along with namespace in anchor element as "init-fn"
		if (overlayModalAnchor.attr("data-init-fn") && (overlayModalAnchor.attr("data-init-fn") !== "")) {
			var functionName = overlayModalAnchor.attr("data-init-fn");
			executeFunctionByName(functionName, window);
		}
	};

	/********************************************************/
	/*                 PUBLIC METHODS                     */
	/********************************************************/
	/**
	 *  Function used to call overlay response from Server.
	 *  @serviceToBeCalled : Rest Service to be called.
	 *  @serviceDataFormId : Parameter contains the data is stored in Form to be sent to server. Form id has to be passed to the function.
	 *  @callBackFunction : Call back function to be called if some extra processing is required.
	 **/
	var callServicePost = function (serviceToBeCalled, serviceDataFormId, callBackFunction) {
		var form = jQuery("#" + serviceDataFormId);
		jQuery(elLoader).append("<div class='ui-loader' id='overlay-loader'><span class='ui-icon'><img src='/media/img/common/ajax-loader.gif'></span></div>");
		jQuery("#overlay-loader").css({
			"position": "fixed",
			"top": jQuery(".fancybox-wrap").width() / 2,
			"left": "50%",
			padding : 5,
			margin  : 10			
		});
		jQuery.ajax({
			type: "POST",
			url: serviceToBeCalled,
			dataType: "json",
			data: form.serialize(),
			success: function (response) {
				if (response.header.statusCode === "success") {
					//Checking if response contains body element also body element should not be empty.
					if (response.body) {
						if (!response.body.length) {
							/*callBackFunction should be called*/
						}
					} else {
						jQuery.fancybox.close();
					}
				} else {
					jQuery(".fancybox-outer .errorMessage").html(response.header.statusMessage);
					jQuery(".fancybox-outer .errorMessage").addClass("alert");
					jQuery(".fancybox-outer .errorMessage").addClass("alert-error");
				}
				if (callBackFunction) {
					// If some extra handling to be done for popup, call the callBackFunction passed in service along with response.body returned from JSON. For Example:
					callBackFunction(response.body);
				}
				jQuery('#overlay-loader').remove();
			}
		});
	};

	/**
	 *  Function used to call overlay response from Server. In case data to be sent is in form of key value pair use this function instead.
	 *  @serviceToBeCalled : Rest Service to be called.
	 *  @serviceDataFormId : Parameter contains the data array to be sent to server. An array containing the key value pair has to be sent.
	 *	Example : var serviceDataArray = { 'BrandName' : "Fiat,BMW", 'year' : "2004,2005" };
	 *  @callBackFunction : Call back function to be called if some extra processing is required.
	 **/
	var callServiceGet = function (serviceToBeCalled, serviceDataArray, callBackFunction) {
		jQuery(elLoader).append("<div class='ui-loader' id='overlay-loader'><span class='ui-icon'><img src='../images/ajax-loader.gif'></span></div>");
		jQuery("#overlay-loader").css({
			"position": "fixed",
			"top": jQuery(".fancybox-wrap").width() / 2,
			"left": "50%",
			padding : 5,
			margin  : 10			
		});
		jQuery.ajax({
			type: "GET",
			url: serviceToBeCalled,
			dataType: "json",
			data: serviceDataArray,
			success: function (response) {
				if (response.header.statusCode === "success") {
					//Checking if response contains body element. Also body element should not be empty.
					if (response.body) {
						if (!response.body.length) {
							/*callBackFunction should be called*/
						}
					} else {
						jQuery.fancybox.close();
					}
				} else {
					jQuery(".fancybox-outer .errorMessage").html(response.header.statusMessage);
					jQuery(".fancybox-outer .errorMessage").addClass("alert");
					jQuery(".fancybox-outer .errorMessage").addClass("alert-error");
				}
				if (callBackFunction) {
					// If some extra handling to be done for popup, call the callBackFunction passed in service along with response.body returned from JSON. For Example:
					callBackFunction(response.body);
				}
				jQuery('#overlay-loader').remove();
			}
		});
	};

	/********************************************************/
	/*                 ONE TIME INIT FUNCTION              */
	/********************************************************/

	(function () {
		// In case options parameters are to be passed to fancybox mention those in anchor element with "data-" initials.
		// Example would be "maxWidth" fancybox option would be set as "data-max-width", "height" would be set as "data-height",etc.
		jQuery('.overlay-modal').live('click', function (event) {
			// Support for AJAX loaded modal window.
			event.preventDefault();
			//Check if any call needs to be sent to server
			var overlayModalAnchor = jQuery(event.target);
			//This is done as anchor may contain an icon inside it. In that case "event.target" will refer to Icon element.
			if (!overlayModalAnchor.hasClass("overlay-modal")) {
				overlayModalAnchor = jQuery(jQuery(event.target).parent());
			}
			var isTemplate = overlayModalAnchor.attr('data-is-template');
			if (isTemplate && isTemplate === "true") {
				var templateURL = overlayModalAnchor.attr('data-template-url');
				TemplateManager.get(templateURL, function (overlayTemplate) {
					var html = overlayTemplate;
					setFancyBox(overlayModalAnchor, html);
				});
			} else {
				var dataResponseType = overlayModalAnchor.attr('data-response-type');
				if (!dataResponseType || dataResponseType === "") {
					dataResponseType = "html";
				}
				if (typeof overlayModalAnchor.attr('data-type') !== 'undefined' && overlayModalAnchor.attr('data-type') !== 'iframe' ){
						jQuery(elLoader).append("<div class='ui-loader' id='overlay-loader' style='position:fixed; top:50%; left:50%;'><span class='ui-icon'><img src='../images/ajax-loader.gif'></span></div>");
				}
				jQuery.ajax({
					type: "GET",
					url: jQuery(this).attr('href'),
					dataType: dataResponseType,
					success: function (response) {
						var html = response;
						if (dataResponseType === 'json') {
							//Handling to paint HTML templates with json data passed from back end.
							var templateURL = overlayModalAnchor.attr('data-template-url');
							TemplateManager.get(templateURL, function (overlayTemplate) {
								html = overlayTemplate(response);
							});
						}
						setFancyBox(overlayModalAnchor, html);
						if (typeof overlayModalAnchor.attr('data-type') !== 'undefined' && overlayModalAnchor.attr('data-type') !== 'iframe'){
							jQuery('#overlay-loader').remove();
						}
					}
				});
			}
		});
	}());

	return {
		"callServicePost": callServicePost,
		"callServiceGet": callServiceGet
	};
})();
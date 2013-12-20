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
 
 /*
 -----------------
 Anonymous Application Module
 -----------------
 
 Name: TM app
 
 */
 namespace("com.fonantrix.application");
 
 com.fonantrix.application.tm = (function() {
 	
 	var version = 25;
 	
 	// Add separate Log Settings from Mascula for different logs.
 	var musculaLogSettingsConfig = {
 		"default-log" : {
 			logId:"aaa4d152-e808-4f89-9cde-3e7b396ae1f8",
 			suppressErrors: false,
 			branding: 'none'
 		}
 	}
 	//Logger config
 	var JSLogsSettingsConfig = {
 			"loggerPrefix" : "App.Login",
 			"maxLogSize" : "50"
 	}
 
 
 
     /********************************************************/
 	/*                   DEPENDENCIES                       */
 	/********************************************************/
 
 	//JS Library Dependencies
 
 	//DOM Dependencies
 	var idTopContainer = "#bb-container";
 	var clsMainHeader = ".main-header";
 	var currentPanelId = -1;
 	var isIE = false;
 	var globalAjaxOptions = {
 		elProgress : "#loadingIcon",
 		cssProgressLoading : "",
 		disableLoadingProgress : false
 	}
 		
 	/********************************************************/
 	/*                 PRIVATE MEMBERS                     */
 	/********************************************************/
 	
 	// Config 
 	var config = {
 	};
 	//User Logged In Flag
 	var userinfo = {
 			loggedin: false,
 			name: "John Doe",
 			email: "(john@pearson.com)",
 			facebookuser: false,
 			admin: false
 	}
 			
 	//Logger
 	var logger = JSLog.Register(JSLogsSettingsConfig.loggerPrefix);
 	 	
 	//...
 	var facebookLoginCheckTimer;
 	var facebookLoginTries=20;
 	/*
 	 * Backbone Initialization
 	 * 
 	 * 
 	 */
	function backbone_init_routers()	{
 		HomeView.routerInitialize();
		ClientView.routerInitialize();
 		//One time loading of common Header View
 		HeaderView.initialize();
	}
	
 	
 	function backbone_start_navigation()	{
 		Backbone.history.start();
 		if (location.href.indexOf("#") == -1) { //Normal App startup
			Backbone.history.navigate("#/clients/list", {trigger:true,replace:true});
		} 		
 	}	
 	/*
 	 * Global Viewas
 	 * 
 	 * 
 	 */
 	var appHeader;
 	
 	/*
 	 * Global errorHandler 
 	 */
 	function ajax_init_global_handlers()	{
 		/* -------------  Ajax events fire in following order ----------------*/
 
 		$(document).ajaxStart(function () {
 			
 		    var elProgress = globalAjaxOptions.elProgress;
 		    var cssProgressLoading = globalAjaxOptions.cssProgressLoading;
 
 		    if(!globalAjaxOptions.disableLoadingProgress) {
 		        //Show Waiting Icon
 		    	$(globalAjaxOptions.elProgress).show();
 		    }
 		    
 			
 		});
 
 		$(document).ajaxSend(function (e, xhr, opts) {
 		    /* Do Nothing */
 		});
 
 		$(document).ajaxError(function(event, xhr, settings, exception) {
 			var msgHeader = "Ajax Error!";
 		    var msgTitle = "Oops!";
 		    var statusCode = "?..";
 		 
 		    var msgDesc = "An error has occured. Please try again by refreshing your browser or restarting the Application. If the problem persists, please contact your System Administrator.";
 
 		    if (xhr.status == 0) { // Not connected. Verify Network
 		    	statusCode = xhr.status;
 		    	msgHeader = statusCode + " :No Network Detected!";
 		    } else if (xhr.status == 401) { // UnAuthorized
 		    	Backbone.history.navigate("#/home");
 			    return true;
 		    } else if (xhr.status == 403) { // Requested page not found. [404]
 		    	statusCode = xhr.status;
 		    	msgHeader = statusCode + " :The requested url is forbidden.";
 		        msgDesc = xhr.responseText;
 		    } else if (xhr.status == 404) { // Requested page not found. [404]
 		    	statusCode = xhr.status;
 		    	msgHeader = statusCode + " :Requested page not found.";
 		        msgDesc = xhr.responseText;
 		    } else if (xhr.status > 400 && xhr.status< 500) { // Requested page not found. [404]
 		    	statusCode = xhr.status;
 		    	msgHeader = statusCode + " :Client-Side Error.";
 		        msgDesc = xhr.responseText;
 		    } else if (xhr.status >= 500) { //Internal Server Error [500]
 		    	statusCode = xhr.status;
 		    	msgHeader = statusCode + " :Internal Server Error";
 		        msgDesc = xhr.responseText;
 		    } else if (exception === 'parsererror') { //Requested JSON parse failed
 		        msgHeader = statusCode + " :Response Parsing Error (Invalid JSON)";
 		        msgDesc = xhr.responseText;
 		    } else if (exception === 'timeout') { //Server Timeout - Check Connection
 		        msgHeader = statusCode + "Request to server has timed out";
 		        msgTitle = " :No Network Detected!";
 		        msgDesc = "You don't seem to be connected to the network. Please check network settings or connectivity and try again.";
 		    } else if (exception === '') { //Server Aborted request
 		       msgHeader = statusCode + " :Server Aborted Request";
 		       msgDesc = xhr.responseText
 		    } else { //Unknown Error
 		       msgHeader = statusCode + " :Unknown Error";    
 		       msgDesc = xhr.responseText               
 		    }
 		    logger.error("Ajax Error  - statusCode:"+statusCode+" msgHeader :"+msgHeader);
 		    var regex = new RegExp("\<style.*style\>");
 		    msgDesc = msgDesc.replace(regex, "");
 		    $("#ajax-error-label").text(msgTitle);
 		    $('#ajax-error-modal .modal-body .content-header').text(msgHeader);
 		    $('#message').html(msgDesc);
 		    $('#headers').html("<ul>");  
 		    $('#headers').append("<li>url: " + settings.url + "</li>");
 		    $('#headers').append("<li>type: " + settings.type + "</li>");
 		    $('#headers').append("<li>data: " + settings.data + "</li></ul>");
 		    if(statusCode == 0){
		    	$('#ajax-error-modal .modal-body .content-body').hide();
		    	$('#no-network').show();
		    } else {
		    	$('#no-network').hide();
		    	$('#ajax-error-modal .modal-body .content-body').show();
		    }
 		    $('#ajax-error-modal').modal();
 		    return true;
 		});		        
 		$(document).ajaxSuccess(function (e, xhr, opts) {
 		        /* Do Nothing */
 		});
 
 		$(document).ajaxComplete(function (e, xhr, opts) {
 		    /* Do Nothing */
 		});
 
 		$(document).ajaxStop(function () {
 		    //Stop loading animation
 			$(globalAjaxOptions.elProgress).hide();
 		});
 	}
 	function handleLoginSuccess(isFacebookUser) {
 		
 		//Check for double call
 		if(userinfo.loggedin)	{
 			return;
 		}
 		userinfo.facebookuser =  isFacebookUser;
 		userinfo.loggedin = true;
 		Backbone.history.navigate("#/discipline");
 	}
 	function getFBLoginStatus(){
 		
 		FB.getLoginStatus(function(response) {
 			  if (response.status === 'connected')  {
 				  clearInterval(facebookLoginCheckTimer);
 				  handleLoginSuccess(true);
 			  }
 			  else
 			  {
 				  facebookLoginTries--;
 				  if(facebookLoginTries == 0)	{
 					  //No more checking
 					  clearInterval(facebookLoginCheckTimer);
 					  facebookLoginTries=20;
 					  alert("Unable to login via Facebook. Did not recive a timely response from Facebook.")
 				  }
 			  }
 		});
 	}

 	
 	function muscula_log_init()	{
 		var domain = document.domain;
 		if(!musculaLogSettingsConfig[domain]) {
 			// Add the errors to the default logs file if the domain don't have separate logs config. 
 			domain = "default-log";
 		}
 		var masculaLogSettings = musculaLogSettingsConfig[domain];
 		
 	    window.Muscula = { settings:{
 	        logId:masculaLogSettings.logId,
 	        suppressErrors: masculaLogSettings.suppressErrors,
 	        branding: masculaLogSettings.branding
 	    }};
 	    (function () {
 	        var m = document.createElement('script'); m.type = 'text/javascript'; m.async = true;
 	        m.src = (window.location.protocol == 'https:' ? 'https:' : 'http:') +
 	            '//musculahq.appspot.com/Muscula.js';
 	        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(m, s);
 	        window.Muscula.run=function(c){eval(c);window.Muscula.run=function(){};};
 	        window.Muscula.errors=[];window.onerror=function(){window.Muscula.errors.push(arguments);
 	        return window.Muscula.settings.suppressErrors===undefined;}
 	    })();
 	}
 function modalEventRegistration(){
	    $('#ajax-error-modal').on('show', function () {
	    	if($('#ajax-error-label').html().indexOf("version")==-1) {
	    		$('#ajax-error-label').append(" <small>version " + version+"</small>");
	    	}
			var innerHTML = getJSLogsAsList;
		    $('#logs').html(innerHTML);
	    });
	    
	    $('#error-report').on('show', function () {
		    var innerHTML = getJSLogsAsList;
		    var date = new Date();
		    var dateString = date.toString(); 
		    $('#error-report .modal-body .date .date-data').html(dateString);
		    $('#error-report .modal-body .date .version-data').html(version);
		    $('#error-report .modal-body .content-header').html($('#ajax-error-modal .modal-body .content-header').html());
		    $('#error-report .modal-body .content-body .logs').html(innerHTML);
		    $('#error-report .modal-body .content-body .params').html($('#headers').html());
		    $('#error-report .modal-body .content-body .message').html($('#message').html());
	    });

	    $("#ajax-error-modal .modal-footer .generateErrorReport").click(function(){
	    	$('#error-report').modal();
	    }); 
	    		
	}	
	function getJSLogsAsList() {
		var logs = JSLog.Logs['App.Login'];
		var innerHTML = "<ol>";
		var planeLogs = "";
		for (var i = 0, len = logs.length; i < len; i++) {
			innerHTML += "<li value="+(logs.length - i)+">" +logs[logs.length - i - 1] + "</li>";
			// planeLogs is required so that tags are not included in the text for email. Required to add HTML in email.
			planeLogs += logs[i]+" ~~ ";
		}
	    innerHTML += "</ol>";
	    return innerHTML;
	}
 	function setHeaderOptions(updateHeader, showHomeLink, showBackLink, showProfileButton) {
 		if (updateHeader) {
 			if (showProfileButton != undefined) {
 				HeaderView.setHeaderMenu(showProfileButton);
 			} else {
 				HeaderView.setHeaderMenu();
 			}
 		}
 		
 		HeaderView.setHomeIcon(showHomeLink);
 		HeaderView.setBackIcon(showBackLink);
 	}	
 	/********************************************************/
 	/*                 ONE TIME INIT FUNCTION              */
 	/********************************************************/
 
 	(function init()	{
 			//Check if browser is IE
 			isIE = navigator.appVersion.indexOf("MSIE") != -1;
 			$(document).ready(function() {
 				
 				logger.info("On Ready - Starting Initialization");
 				
 				logger.info("global error handlers initialization");
 				ajax_init_global_handlers();
 				
 				logger.info("backbone routers initialization");
 				backbone_init_routers();
 				
 				logger.info("backbone navigation start");
 				backbone_start_navigation();
 				//Initializing error modal to trigger logging in modal box each time it is shown.
 				modalEventRegistration();
 				
 				logger.info("muscula initialization");
 				muscula_log_init();
 
 				
 				/*! Normalized address bar hiding for iOS & Android (c) @scottjehl MIT License */
 				(function( win ){
 				    var doc = win.document;
 
 				    // If there's a hash, or addEventListener is undefined, stop here
 				    if( !location.hash && win.addEventListener ){
 
 				        //scroll to 1
 				        window.scrollTo( 0, 1 );
 				        var scrollTop = 1,
 				            getScrollTop = function(){
 				                return win.pageYOffset || doc.compatMode === "CSS1Compat" && doc.documentElement.scrollTop || doc.body.scrollTop || 0;
 				            },
 
 				        //reset to 0 on bodyready, if needed
 				            bodycheck = setInterval(function(){
 				                if( doc.body ){
 				                    clearInterval( bodycheck );
 				                    scrollTop = getScrollTop();
 				                    win.scrollTo( 0, scrollTop === 1 ? 0 : 1 );
 				                }
 				            }, 15 );
 
 				        win.addEventListener( "load", function(){
 				            setTimeout(function(){
 				                //at load, if user hasn't scrolled more than 20 or so...
 				                if( getScrollTop() < 20 ){
 				                    //reset to hide addr bar at onload
 				                    win.scrollTo( 0, scrollTop === 1 ? 0 : 1 );
 				                }
 				            }, 0);
 				        } );
 				    }
 				})( window );
 				
 				logger.info("On Ready - Completed Initialization");
 			});
 
 					
 	})();
 
 	/********************************************************/
 	/*                 Public   							*/
 	/********************************************************/
 
 	return	{
 		"config":config,
 		"userinfo": userinfo,
 		"appHeader":appHeader,
 		"idTopContainer" : idTopContainer,
 		"clsMainHeader" : clsMainHeader,
 		"globalAjaxOptions" : globalAjaxOptions,
 		"isIE":isIE,
 		"handleLoginSuccess" : handleLoginSuccess,
 		"logger" : logger,
 		"JSLogsSettingsConfig" : JSLogsSettingsConfig,
 		"version" : version
 	}
 
})();

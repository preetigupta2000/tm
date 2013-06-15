package com.fonantrix.tm

import org.codehaus.groovy.grails.commons.GrailsApplication

class StylesheetTaglibTagLib {

	static namespace = "fon"
	GrailsApplication grailsApplication

	public static final String LESS_SCRIPT_FILE_LOCATION = "js/lesscompiler/less-1.3.1.min.js"
	public static final String LESS_BUILDCOMPILER_PATH = "web-app/js/lesscompiler/lessc.wsf"

	public static final String LESS_FOLDER_NAME = "less"
	public static final String CSS_PATH = "css"
	
	def stylesheet = { attrs, body ->
			getStyleSheet(attrs)
	}
	
	private void getStyleSheet(def attrs){
		String fileType
		String src = attrs.remove('src')
		
		if (!src) {
			throwTagError("Tag [less] is missing required attribute [src]")
		}
			
		if (isDebugMode()) {
			// reference .less files directly (In browser, less.js will compile into CSS)
			fileType = '.less'
		} else {
			fileType = '.css'
		}
		String filePath = "${CSS_PATH}/${LESS_FOLDER_NAME}/${src}${fileType}"

		if (isDebugMode()) {
			String ctxPath = request.contextPath
			// reference .less files directly (In browser, less.js will compile into CSS)
			Long timestamp = System.currentTimeMillis()
			out <<  "<link type='text/css' rel='stylesheet/less' href='${ctxPath}/${filePath}?_debugResources=y&n=$timestamp'/>"
			out <<  r.external(uri : "${pluginContextPath }/${LESS_SCRIPT_FILE_LOCATION}")
			if (isAutoReloadLessChanges(attrs)) {
				out << "<script type='text/javascript'>less.env = 'development';less.watch();</script>"
			}
		} else {
System.out0.println("######################" + uri + "######################" + filePath + "######################")		
			out << r.external(uri : "/" + filePath)
		}
		return
	}
	
	private boolean isDebugMode() {
		if(grailsApplication.config.grails.resources.debug){
			return true
		} else {
			return false
		}
	}
	
	private boolean isAutoReloadLessChanges(attrs) {
		def watch = attrs.watch
		return !(watch == null || watch == "false")
	}
}

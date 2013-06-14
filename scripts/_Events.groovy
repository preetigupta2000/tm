import grails.util.GrailsUtil

includeTargets << grailsScript("_GrailsInit")
eventPackagingEnd = {kind->	
		includeTargets << new File("scripts/DeployCss.groovy")
		
		def classLoader = Thread.currentThread().contextClassLoader
		classLoader.addURL(new File(classesDirPath).toURI().toURL())
		def config = new ConfigSlurper(GrailsUtil.environment).parse(classLoader.loadClass('FonConfig'))
		def grailsconfig = new ConfigSlurper(GrailsUtil.environment).parse(classLoader.loadClass('Config'))
	
		if(!config.fon.cloudMode) {
			deployCSS()
		}
}
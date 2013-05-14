import grails.util.GrailsUtil

includeTargets << grailsScript("_GrailsInit")
eventPackagingEnd = {kind->	
		includeTargets << new File("scripts/DeployCss.groovy")
		
		def classLoader = Thread.currentThread().contextClassLoader
		classLoader.addURL(new File(classesDirPath).toURI().toURL())
		def config = new ConfigSlurper(GrailsUtil.environment).parse(classLoader.loadClass('FonConfig'))
		if(!config.fon.cloudMode) {
			deployCSS()
		}
}
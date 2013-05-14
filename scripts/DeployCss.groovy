
target(deployCSS:"Deploys CSS files") {
	grailsConsole.updateStatus "Started deploying CSS.....";
	def FileArray = ["index"]
	String cssDir = "web-app/css"
	runCompileLess(FileArray,cssDir);
	grailsConsole.updateStatus "CSS deployed successfully.....";
}

private runCompileLess(def lessFileArray, def cssDir){

	lessFileArray.each {lessFilepath->
		String inputFilePath = "${cssDir}/less/${lessFilepath}.less"
		grailsConsole.updateStatus "Compiling ${inputFilePath} .....${lessFilepath} "
		File inputFile = new File(inputFilePath)
		if(inputFile.exists()) {
			String ouputFilePath = "${cssDir}/less/${lessFilepath}.css"
			File ouputFile = new File(ouputFilePath)
			if(ouputFile.exists()) {
				ouputFile.delete()
			}
			grailsConsole.updateStatus "Compiling ${inputFilePath} to ${ouputFilePath} ....."
			ant.exec(failonerror: "false",executable:"cmd"){
				arg(value:"/c")
				arg(value:"cscript")
				arg(value:"//nologo")
				arg(value:"web-app/js/lesscompiler/lessc.wsf")
				arg(value:"${inputFilePath}")
				arg(value:"${ouputFilePath}")
				//arg(value:"-compress")
			}
		} else {
			grailsConsole.updateStatus "ERROR.....";
			grailsConsole.updateStatus "LESS file not found: " + inputFilePath;
			exit(1)
		}
	}
}

setDefaultTarget(deployCSS)

package com.fonantrix.tm

class Task {

    String name
	String description

	
	static belongsTo = [project: Project]
	
	static mapping = {

	}
	
}

package com.fonantrix.tm

class Task {

    String name
	String description
	String status       
	int estimatedHrs
	
	static belongsTo = [project: Project]
	
	static mapping = {

	}
	
}

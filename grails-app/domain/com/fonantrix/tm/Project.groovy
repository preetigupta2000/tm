package com.fonantrix.tm


class Project {

	static belongsTo = [client: Client]
	
	static hasMany = [tasks: Task]
	
	static mapping = {
		tasks lazy: true
	}
	
	
	String name
	String description
	static constraints = {
		description nullable: true
	}
}

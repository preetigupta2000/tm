package com.fonantrix.tm

class Client {

	String name
	String description
	
	static hasMany = [projects: Project]
	
	static mapping = {
		products lazy: true
	}


	static constraints = {
	}

}

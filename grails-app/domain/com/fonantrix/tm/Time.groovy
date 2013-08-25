package com.fonantrix.tm

import com.fonantrix.tm.authenticate.User

class Time {

		String project
		int time    
		String tabid
		String coltd
		User user   
		String task   
		int estimatedHrs;  
		static belongsTo = [task: Task]   
		
		static mapping = {
			
			user unique: false
			cache usage:'read-write', include:'non-lazy'
			}
}
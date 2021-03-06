package com.fonantrix.tm

import com.fonantrix.tm.authenticate.User


class UsersTimeEntry {

		String starttime
		String endtime
		String project
		String task
		User user   
		String title
		String actualHours
		int estimatedHrs
		static belongsTo = [task: Task]   
		
		static mapping = {
			
			user unique: false
			cache usage:'read-write', include:'non-lazy'
		}
		static constraints = {
			actualHours nullable: true
		}
}

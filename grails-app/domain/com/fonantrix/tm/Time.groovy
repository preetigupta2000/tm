package com.fonantrix.tm

import com.fonantrix.tm.authenticate.User

class Time {

		String project
		String task
		String time
		String tabid
		String coltd
		User user
		
		static mapping = {
			
			user unique: false
			cache usage:'read-write', include:'non-lazy'
			}
}

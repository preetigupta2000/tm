package com.fonantrix.tm

import com.fonantrix.tm.authenticate.User



class UserInfo {
	
	String designation;
	String corresAddress;
	
	static belongsTo = [user: User]
	
	static mapping = {
		designation(nullable: true)
		corresAddress(nullable: true)
	}
	
}


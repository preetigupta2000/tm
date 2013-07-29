package com.fonantrix.tm.authenticate

import com.fonantrix.tm.Time

class User {

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName
	String email
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
	static  hasMany = [time: Time ]
	static constraints = {
		username blank: false, unique: true
		password blank: false
		time nullable: true 
		
		
	}
	
	static mapping = {
		table 'fon_user'
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
package com.fonantrix.tm.authenticate

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
	
	static constraints = {
		username blank: false, unique: true
		password blank: false
	}
	
	static mapping = {
		table 'tm_user'
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
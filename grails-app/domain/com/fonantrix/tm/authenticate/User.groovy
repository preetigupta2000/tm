package com.fonantrix.tm.authenticate
import com.fonantrix.tm.UsersTimeEntry

class User {

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName
	String email
	String status;
	boolean isAdmin = false
	boolean isFacebookUser = false
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
	static  hasMany = [time: UsersTimeEntry ]

	static constraints = {
		username blank: false, unique: true
		password blank: false
		time nullable: true
		status nullable: true
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
package com.fonantrix.tm

import org.hibernate.HibernateException


class ClientController {

	/*
	 GET	show
	 PUT	update
	 POST	save
	 DELETE	delete
	 */
	def show = {
		if(params.id) {
			
			Client client = Client.get(params.id)
			
			if(client) {
				render view: '/editClient', model: [client: client]
				return
				
			} else {
				def errorMsg = "<p>No client found with the id :<b>${params.id}</b></p>"
				render(status: 404, text: errorMsg)
				return
			}
		}
		else {
			
			def allClient = Client.list()
			render view: '/clients', model: [clients: allClient]
		}
	}
	
		
	def save = {	
		def client = new Client(params)
		client.save(failOnError: true)
		redirect(action: "show")
	}
	
	def update = {
		if(params.id) {
			def client = Client.get(params.id)
			if(client) {
				try {
					client.properties = params['name']
					client.properties = params['description']
					client.save(failOnError: true)
					redirect(action: "show")
					return
				} catch(HibernateException e){
					render client.errors
					return
				}
			} else {
				render "Client not found."
				return
			}
		}
		else {
			render "Please specify client id to be updated."
		}
	}
	
	def deleteClient() {
		if(params.id) {
			def client = Client.get(params.id)
			if(client) {
				try {
					client.delete()
					redirect(action: "show")
				} catch(HibernateException e){
					render (text:"could not delete client",status:500)
					return
				}
			} else {
				render "client not found."
				return
			}
		}
		else {
			render "Please specify client id to be deletd."
		}
	}
}

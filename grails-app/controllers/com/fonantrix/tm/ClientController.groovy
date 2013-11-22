package com.fonantrix.tm

import org.hibernate.HibernateException
import groovy.json.JsonBuilder
import grails.converters.JSON

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
				//render view: '/editClient', model: [client: client]
				//return
				def data = [
					id: client.id,
					name : client.name,
					description : client.description,
					noOfProjects: client.projects.size()
				]
				def json = new JsonBuilder(data)
				render json.toString()
				return;
				//redirect(uri: "/getTemplate", path:'templates/edit-client', modal: [client: client])
			} else {
				def errorMsg = "<p>No client found with the id :<b>${params.id}</b></p>"
				render(status: 404, text: errorMsg)
				return
			}
		}
		else {
			def allClient = Client.list()
			//render view: '/clients', model: [clients: allClient]
			def data = [
				clients: allClient.collect {[
					id: it.id,
					name : it.name,
					description : it.description,
					noOfProjects: it.projects.size()
				]}
			]
			def json = new JsonBuilder(data.clients)
			render json.toString()
		}
	}
	
		
	def save = {	
		def client = new Client(params)
		try {
			client.save(failOnError: true)
			redirect(action: "show")
		} catch(HibernateException e){
			render client.errors
			return
		}
	}
	
	def update = {
		if(params.id) {
			def client = Client.get(params.id)
			if(client) {
				client.properties = params['client']
				try {
					client.save(failOnError: true)
					//redirect(action: "show")
					render client as JSON
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

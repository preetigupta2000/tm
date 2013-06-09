package com.fonantrix.tm

import java.util.Set;

import tm.Client
import tm.Project
import tm.Task
import tm.ClientProject
import tm.ProjectTask


class ClientController {

    def index() {
		def client = Client.list()
		render view: '/clients', model: [client: client]
	}
		
	def addclient() {
		def client = new Client(params)
		client.save()
		redirect(action: "viewclient")
	}
	
	def addproject() {
		def project = new Project(params)
		project.save()
		def clientId = (params.modalHidden).toInteger()
		def client = Client.get(params.modalHidden)
		ClientProject.create client, project, true
		def list = client.getAuthorities()
		println list.getAt("name")
		redirect action: 'viewclient'
	}
	
	def deleteClient(){
		def client = Client.get(params.id)
		client.deleteClient()
		redirect action: 'viewclient'
	}
	
	def editClient(){
		def client = Client.get(params.clientId)
		render(view: "/editClient",model: [client: client]);
	}
	
	def updateClient(){
		def client = Client.get(params.clientId)
		System.out.println(params)
		if(client) {
			client.properties = params
			System.out.println(params)
			client.save()
		}
		redirect action: 'viewclient'
	}
}

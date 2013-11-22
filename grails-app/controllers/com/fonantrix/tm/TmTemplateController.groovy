package com.fonantrix.tm

class TmTemplateController {
	
	def index() {
		render (view:"/"+ params.path)
	}
}
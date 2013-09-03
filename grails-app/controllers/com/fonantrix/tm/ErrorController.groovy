package com.fonantrix.tm

class ErrorController {

    def index() {
		def exception = request.exception.cause

		render(view: "/error", model: [exception: exception])
	}
}

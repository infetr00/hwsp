package hwsp

class IncidenciaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [incidenciaInstanceList: Incidencia.list(params), incidenciaInstanceTotal: Incidencia.count()]
    }

    def create = {
        def incidenciaInstance = new Incidencia()
        incidenciaInstance.properties = params
        return [incidenciaInstance: incidenciaInstance]
    }

    def save = {
        def incidenciaInstance = new Incidencia(params)
        if (incidenciaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), incidenciaInstance.id])}"
            redirect(action: "show", id: incidenciaInstance.id)
        }
        else {
            render(view: "create", model: [incidenciaInstance: incidenciaInstance])
        }
    }

    def show = {
        def incidenciaInstance = Incidencia.get(params.id)
        if (!incidenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            [incidenciaInstance: incidenciaInstance]
        }
    }

    def edit = {
        def incidenciaInstance = Incidencia.get(params.id)
        if (!incidenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [incidenciaInstance: incidenciaInstance]
        }
    }

    def update = {
        def incidenciaInstance = Incidencia.get(params.id)
        if (incidenciaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (incidenciaInstance.version > version) {
                    
                    incidenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'incidencia.label', default: 'Incidencia')] as Object[], "Another user has updated this Incidencia while you were editing")
                    render(view: "edit", model: [incidenciaInstance: incidenciaInstance])
                    return
                }
            }
            incidenciaInstance.properties = params
            if (!incidenciaInstance.hasErrors() && incidenciaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), incidenciaInstance.id])}"
                redirect(action: "show", id: incidenciaInstance.id)
            }
            else {
                render(view: "edit", model: [incidenciaInstance: incidenciaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def incidenciaInstance = Incidencia.get(params.id)
        if (incidenciaInstance) {
            try {
                incidenciaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
            redirect(action: "list")
        }
    }
}

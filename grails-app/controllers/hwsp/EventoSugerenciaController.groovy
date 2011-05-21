package hwsp

class EventoSugerenciaController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [eventoSugerenciaInstanceList: EventoSugerencia.list(params), eventoSugerenciaInstanceTotal: EventoSugerencia.count()]
  }

  def create = {
    def eventoSugerenciaInstance = new EventoSugerencia()
    eventoSugerenciaInstance.sugerencia = Sugerencia.findById(params.id)
    eventoSugerenciaInstance.user = session.user
    eventoSugerenciaInstance.properties = params
    return [eventoSugerenciaInstance: eventoSugerenciaInstance]
  }

  def save = {
    def eventoSugerenciaInstance = new EventoSugerencia(params)
    eventoSugerenciaInstance.fechaCreacion = new Date()
    eventoSugerenciaInstance.user = session.user
    eventoSugerenciaInstance.sugerencia = Sugerencia.findById(params.sugerencia.id)
    if (eventoSugerenciaInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia'), eventoSugerenciaInstance.id])}"
      redirect(controller: "sugerencia", action: "showadvanced", id: eventoSugerenciaInstance.sugerencia.id)
    }
    else {
      render(view: "create", model: [eventoSugerenciaInstance: eventoSugerenciaInstance])
    }
  }

  def show = {
    def eventoSugerenciaInstance = EventoSugerencia.get(params.id)
    if (!eventoSugerenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      [eventoSugerenciaInstance: eventoSugerenciaInstance]
    }
  }

  def edit = {
    def eventoSugerenciaInstance = EventoSugerencia.get(params.id)
    if (!eventoSugerenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [eventoSugerenciaInstance: eventoSugerenciaInstance]
    }
  }

  def update = {
    def eventoSugerenciaInstance = EventoSugerencia.get(params.id)
    if (eventoSugerenciaInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (eventoSugerenciaInstance.version > version) {

          eventoSugerenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia')] as Object[], "Another user has updated this EventoSugerencia while you were editing")
          render(view: "edit", model: [eventoSugerenciaInstance: eventoSugerenciaInstance])
          return
        }
      }
      eventoSugerenciaInstance.properties = params
      if (!eventoSugerenciaInstance.hasErrors() && eventoSugerenciaInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia'), eventoSugerenciaInstance.id])}"
        redirect(action: "show", id: eventoSugerenciaInstance.id)
      }
      else {
        render(view: "edit", model: [eventoSugerenciaInstance: eventoSugerenciaInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def eventoSugerenciaInstance = EventoSugerencia.get(params.id)
    if (eventoSugerenciaInstance) {
      try {
        eventoSugerenciaInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventoSugerencia.label', default: 'EventoSugerencia'), params.id])}"
      redirect(action: "list")
    }
  }
}

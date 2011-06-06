package hwsp

class EventoIncidenciaController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [eventoIncidenciaInstanceList: EventoIncidencia.list(params), eventoIncidenciaInstanceTotal: EventoIncidencia.count()]
  }

  def create = {
    def eventoIncidenciaInstance = new EventoIncidencia()
    eventoIncidenciaInstance.incidencia = Incidencia.findById(params.id)
    eventoIncidenciaInstance.user = session.user
    eventoIncidenciaInstance.properties = params
    return [eventoIncidenciaInstance: eventoIncidenciaInstance]
  }

  def save = {
    def eventoIncidenciaInstance = new EventoIncidencia(params)
    eventoIncidenciaInstance.fechaCreacion = new Date()
    eventoIncidenciaInstance.user = session.user
    eventoIncidenciaInstance.incidencia = Incidencia.findById(params.incidencia.id)
    if (eventoIncidenciaInstance.save(flush: true)) {
      if (isTecnico) {
        flash.message = "${message(code: 'default.created.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), eventoIncidenciaInstance.id])}"
        redirect(controller: "incidencia", action: "showadvancedtecnico", id: eventoIncidenciaInstance.incidencia.id)
        return
      }
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), eventoIncidenciaInstance.id])}"
      redirect(controller: "incidencia", action: "showadvanced", id: eventoIncidenciaInstance.incidencia.id)
    }
    else {
      render(view: "create", model: [eventoIncidenciaInstance: eventoIncidenciaInstance])
    }
  }

  def show = {
    def eventoIncidenciaInstance = EventoIncidencia.get(params.id)
    if (!eventoIncidenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      [eventoIncidenciaInstance: eventoIncidenciaInstance]
    }
  }

  def edit = {
    def eventoIncidenciaInstance = EventoIncidencia.get(params.id)
    if (!eventoIncidenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [eventoIncidenciaInstance: eventoIncidenciaInstance]
    }
  }

  def update = {
    def eventoIncidenciaInstance = EventoIncidencia.get(params.id)
    if (eventoIncidenciaInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (eventoIncidenciaInstance.version > version) {

          eventoIncidenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia')] as Object[], "Another user has updated this EventoIncidencia while you were editing")
          render(view: "edit", model: [eventoIncidenciaInstance: eventoIncidenciaInstance])
          return
        }
      }
      eventoIncidenciaInstance.properties = params
      if (!eventoIncidenciaInstance.hasErrors() && eventoIncidenciaInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), eventoIncidenciaInstance.id])}"
        redirect(action: "show", id: eventoIncidenciaInstance.id)
      }
      else {
        render(view: "edit", model: [eventoIncidenciaInstance: eventoIncidenciaInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def eventoIncidenciaInstance = EventoIncidencia.get(params.id)
    if (eventoIncidenciaInstance) {
      try {
        eventoIncidenciaInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'eventoIncidencia.label', default: 'EventoIncidencia'), params.id])}"
      redirect(action: "list")
    }
  }

  def isTecnico = {
    for (Role role in session.user.authorities) {
      if (role.authority.equals('ROL_TECNICO')) return true
    }
    return false
  }

}

package hwsp

class SugerenciaController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [sugerenciaInstanceList: Sugerencia.findAllByUser(session.user), sugerenciaInstanceTotal: Sugerencia.count()]
  }

  def listtecnico = {
//    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [sugerenciaInstanceList: Sugerencia.list(), sugerenciaInstanceTotal: Sugerencia.count()]
  }

  def create = {
    def sugerenciaInstance = new Sugerencia()
    sugerenciaInstance.properties = params
    return [sugerenciaInstance: sugerenciaInstance]
  }

  def save = {
    def sugerenciaInstance = new Sugerencia(params)
    sugerenciaInstance.user = session.user
    sugerenciaInstance.fechaModificacion = new Date()
    if (sugerenciaInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), sugerenciaInstance.id])}"
      redirect(action: "showadvanced", id: sugerenciaInstance.id)
    }
    else {
      render(view: "create", model: [sugerenciaInstance: sugerenciaInstance])
    }
  }

  def show = {
    def sugerenciaInstance = Sugerencia.get(params.id)
    if (!sugerenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      [sugerenciaInstance: sugerenciaInstance]
    }
  }


  def showadvanced = {
    def sugerenciaInstance = Sugerencia.get(params.id)
    if (!sugerenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      [sugerenciaInstance: sugerenciaInstance, eventoSugerenciaInstanceList: EventoSugerencia.findAllBySugerencia(sugerenciaInstance)]
    }

  }

  def showadvancedtecnico = {
    def sugerenciaInstance = Sugerencia.get(params.id)
    if (!sugerenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      [sugerenciaInstance: sugerenciaInstance, eventoSugerenciaInstanceList: EventoSugerencia.findAllBySugerencia(sugerenciaInstance)]
    }

  }

  def addevento = {
    redirect(controller: "eventoSugerencia", action: "create", id: params.id)
  }

  def edit = {
    def sugerenciaInstance = Sugerencia.get(params.id)
    if (!sugerenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [sugerenciaInstance: sugerenciaInstance]
    }
  }

  def update = {
    def sugerenciaInstance = Sugerencia.get(params.id)
    if (sugerenciaInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (sugerenciaInstance.version > version) {

          sugerenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sugerencia.label', default: 'Sugerencia')] as Object[], "Another user has updated this Sugerencia while you were editing")
          render(view: "edit", model: [sugerenciaInstance: sugerenciaInstance])
          return
        }
      }
      sugerenciaInstance.properties = params
      if (!sugerenciaInstance.hasErrors() && sugerenciaInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), sugerenciaInstance.id])}"
        redirect(action: "show", id: sugerenciaInstance.id)
      }
      else {
        render(view: "edit", model: [sugerenciaInstance: sugerenciaInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def sugerenciaInstance = Sugerencia.get(params.id)
    if (sugerenciaInstance) {
      try {
        sugerenciaInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sugerencia.label', default: 'Sugerencia'), params.id])}"
      redirect(action: "list")
    }
  }
}

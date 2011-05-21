package hwsp

class IncidenciaController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST", addevento: "POST"]

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [incidenciaInstanceList: Incidencia.findAllByUser(session.user), incidenciaInstanceTotal: Incidencia.count()]
  }

  def listtecnico = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)

    [incidenciaInstanceList: Incidencia.findAllByTecnicoAsignado(session.user), incidenciaInstanceTotal: Incidencia.count()]
  }

  def listcoordinador = {
    [incidenciaInstanceList: Incidencia.findAllByTecnicoAsignadoIsNull()]
  }

  def listcalidad = {
    [incidenciaInstanceList: Incidencia.findAllByTecnicoAsignadoIsNotNull()]
  }

  def create = {
    def incidenciaInstance = new Incidencia()
    incidenciaInstance.properties = params
    return [incidenciaInstance: incidenciaInstance]
  }

  def save = {
    def incidenciaInstance = new Incidencia(params)
    incidenciaInstance.user = session.user
    incidenciaInstance.fechaModificacion = new Date()
    if (incidenciaInstance.save(flush: true)) {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), incidenciaInstance.id])}"
      redirect(action: "showadvanced", id: incidenciaInstance.id)
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

  def showadvanced = {
    def incidenciaInstance = Incidencia.get(params.id)

    if (!incidenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
      redirect(action: "list")
    }
    else {
      [incidenciaInstance: incidenciaInstance, eventoIncidenciaInstanceList: EventoIncidencia.findAllByIncidencia(incidenciaInstance)]
    }

  }

  def showadvancedtecnico = {
    def incidenciaInstance = Incidencia.get(params.id)

    if (!incidenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
      redirect(action: "listtecnico")
    }
    else {
      [incidenciaInstance: incidenciaInstance, eventoIncidenciaInstanceList: EventoIncidencia.findAllByIncidencia(incidenciaInstance)]
    }

  }

  def showadvancedcoordinador = {
    def incidenciaInstance = Incidencia.get(params.id)

    if (!incidenciaInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
      redirect(action: "listcoordinador")
    }
    else {
      [incidenciaInstance: incidenciaInstance, eventoIncidenciaInstanceList: EventoIncidencia.findAllByIncidencia(incidenciaInstance)]
    }

  }

  def addevento = {
    redirect(controller: "eventoIncidencia", action: "create", id: params.id)
  }

  def addeventoycierra = {
    def incidenciaInstance = Incidencia.get(params.id)

    EventoIncidencia eventoIncidencia = new EventoIncidencia()
    eventoIncidencia.descripcion = "Incidencia cambia de estado a Cerrada"
    eventoIncidencia.user = session.user
    eventoIncidencia.fechaCreacion = new Date()
    eventoIncidencia.incidencia = incidenciaInstance
    eventoIncidencia.save()

    incidenciaInstance.estadoDeIncidencia = "Cerrada"
    incidenciaInstance.save(flush: true)
    redirect(controller: "eventoIncidencia", action: "create", id: params.id)
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
      if (incidenciaInstance.tecnicoAsignado == null || incidenciaInstance.importancia == "Sin importancia") {
        flash.message = "Debes asignar un tecnico y una importancia a la incidencia"
        render(view: "edit", model: [incidenciaInstance: incidenciaInstance])
        return
      }

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

  def updateasigatecnico = {
    def incidenciaInstance = Incidencia.get(params.id)
    if (incidenciaInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (incidenciaInstance.version > version) {

          incidenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'incidencia.label', default: 'Incidencia')] as Object[], "Another user has updated this Incidencia while you were editing")
          render(view: "asignatecnico", model: [incidenciaInstance: incidenciaInstance])
          return
        }
      }
      incidenciaInstance.properties = params
      if (incidenciaInstance.tecnicoAsignado == null || incidenciaInstance.importancia == "Sin prioridad") {
        flash.message = "Debes asignar un tecnico y una importancia a la incidencia"
        def tecnicosList = []

        for (user in User.list()) {
          for (role in user.authorities) {
            if (role.authority.equals("ROL_TECNICO")) tecnicosList.add(user)
          }
        }
        render(view: "asignatecnico", model: [incidenciaInstance: incidenciaInstance, tecnicosList: tecnicosList])
        return
      }

      EventoIncidencia eventoIncidencia = new EventoIncidencia()
      eventoIncidencia.descripcion = "Se ha asignado el tecnico ${incidenciaInstance.tecnicoAsignado.nombre} a esta incidencia"
      eventoIncidencia.user = session.user
      eventoIncidencia.fechaCreacion = new Date()
      eventoIncidencia.incidencia = incidenciaInstance
      eventoIncidencia.save()

      incidenciaInstance.eventos.add(eventoIncidencia)
      incidenciaInstance.estadoDeIncidencia = "En curso"

      if (!incidenciaInstance.hasErrors() && incidenciaInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), incidenciaInstance.id])}"
        redirect(action: "listcoordinador", id: incidenciaInstance.id)
      }
      else {
        render(view: "asignatecnico", model: [incidenciaInstance: incidenciaInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
      redirect(action: "listcoordinador")
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


  def asignatecnico = {

    def incidenciaInstance = Incidencia.findById(params.id)

    def tecnicosList = []

    for (user in User.list()) {
      for (role in user.authorities) {
        if (role.authority.equals("ROL_TECNICO")) tecnicosList.add(user)
      }
    }

//    def tecnicosList = User.findByAuthorities([roltecnico])

    [incidenciaInstance: incidenciaInstance, tecnicosList: tecnicosList]

  }

  def isTecnico = {
    for (Role role in session.user.authorities) {
      if (role.authority.equals('ROL_TECNICO')) return true
    }
    return false
  }

  def isCalidad = {
    for (Role role in session.user.authorities) {
      if (role.authority.equals('ROL_CALIDAD')) return true
    }
    return false
  }

}

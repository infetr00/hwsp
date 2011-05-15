package hwsp

class EventoIncidencia extends Evento {

  static belongsTo = [incidencia: Incidencia]

  static constraints = {

  }


}

package hwsp

class EventoSugerencia extends Evento {

  static belongsTo = [sugerencia: Sugerencia]

  static constraints = {
  }
}

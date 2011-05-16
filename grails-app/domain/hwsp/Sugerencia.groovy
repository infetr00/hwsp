package hwsp

class Sugerencia extends IncidenciaSugerenciaComun {


 static hasMany = [eventos: EventoSugerencia]
  static belongsTo = [user: User]

  String tipoDeSugerencia
  String estadoDeSugerencia
  String prioridad

  static constraints = {
    tipoDeSugerencia(nullable: false, inList: ['Instalacion', 'Configuracion', 'Funcionalidad', 'Generica'])
    estadoDeSugerencia(nullable: false, inList: ['Reportada', 'Rechazada', 'Pospuesta', 'Incorporada'])
    prioridad(inList: ['Sin prioridad', 'Baja', 'Media', 'Alta'])
  }
}

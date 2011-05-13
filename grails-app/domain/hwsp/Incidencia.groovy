package hwsp

class Incidencia extends IncidenciaSugerenciaComun {

  static tipoDeIncidenciaEnum = ['Instalacion', 'Configuracion', 'Funcionalidad', 'Base de datos', 'Codigo', 'Generica']
  static estadoDeIncidenciaEnum = ['Reportada', 'En curso', 'Cerrada']

  static hasOne = [user: User]

  String tipoDeIncidencia
  String estadoDeIncidencia

  static constraints = {
    tipoDeIncidencia(nullable: false, inList: tipoDeIncidenciaEnum)
    estadoDeIncidencia(nullable: false, inList: estadoDeIncidenciaEnum)
  }
}

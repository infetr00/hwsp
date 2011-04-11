package hwsp

class Sugerencia extends IncidenciaSugerenciaComun {

  static tipoDeSugerenciaEnum = ['Instalacion', 'Configuracion', 'Funcionalidad', 'Generica']
  static estadoDeSugenrenciaEnum = ['Reportada', 'Rechazada', 'Pospuesta', 'Incorporada']

  String tipoDeSugerencia
  String estadoDeSugerencia

  static constraints = {
    tipoDeSugerencia(nullable: false, inList: tipoDeSugerenciaEnum)
    estadoDeSugerencia(nullable: false, inList: estadoDeSugenrenciaEnum)
  }
}

package hwsp

class Incidencia extends IncidenciaSugerenciaComun {

  static hasMany = [eventos: EventoIncidencia]
  static belongsTo = [usuario: Usuario]


  String tipoDeIncidencia
  String estadoDeIncidencia = "Reportada"
  String importancia = "Sin prioridad"

  Usuario tecnicoAsignado


  static constraints = {
    tipoDeIncidencia(nullable: false, inList: ['Instalacion', 'Configuracion', 'Funcionalidad', 'Base de datos', 'Codigo', 'Generica'])
    estadoDeIncidencia(nullable: false, inList: ['Reportada', 'En curso', 'Cerrada'])
    importancia (inList: ['Sin prioridad', 'Baja', 'Media', 'Alta'])
    tecnicoAsignado (nullable: true)

  }
}

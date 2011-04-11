package hwsp

abstract class IncidenciaSugerenciaComun {

  String producto
  String versionInstalada
  String informacionEspecifica
  String descripcion
  String email
  String telefono

  Date fecha
  String nombreDeReportador

  static constraints = {
  }
}

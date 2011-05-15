package hwsp

abstract class IncidenciaSugerenciaComun {



  String producto
  String versionInstalada
  String informacionEspecifica
  String descripcion
  String email
  String telefono

  Date fechaCreacion = new Date();
  Date fechaModificacion


  static constraints = {
    descripcion(size: 0..5000)

  }
}

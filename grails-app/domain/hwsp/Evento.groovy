package hwsp

class Evento {

  User user

  String descripcion

  Date fechaCreacion

  static constraints = {
    descripcion(size: 0..5000)

  }

}

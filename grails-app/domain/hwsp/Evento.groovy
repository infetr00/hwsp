package hwsp

abstract class Evento {

String descripcion

  Date fechaCreacion

    static constraints = {
      descripcion(size: 0..5000)

    }
}


class BootStrap {

  def authenticateService


    def init = { servletContext ->
//
//      try {
//        def role = Rol.findByAuthority('ROL_ADMINISTRADOR')
//
//        if (!role.any()) {
//
//          def roleAdministrador = new Rol(authority: 'ROL_ADMINISTRADOR', description: 'Administrador').save()
//          def roleDistribuidor = new Rol(authority: 'ROL_DISTRIBUIDOR', description: 'Distribuidor').save()
//          def roleCliente = new Rol(authority: 'ROL_CLIENTE', description: 'Cliente').save()
//          def roleCoordinador = new Rol(authority: 'ROL_COORDINADOR', description: 'Coordinador').save()
//          def roleTecnico = new Rol(authority: 'ROL_TECNICO', description: 'Tecnico').save()
//          def roleCalidad = new Rol(authority: 'ROL_CALIDAD', description: 'Calidad').save()
//
//          //Adding Users
//
//          def passwdEncoded = authenticateService.passwordEncoder('admin')
//          def userAdministrador = new Usuario(nombre: 'admin', email: 'admin@ufv.es', telefono: '', passwd: passwdEncoded).save()
//
//          passwdEncoded = authenticateService.passwordEncoder('userdistribuidor')
//          def userDistribuidor = new Usuario(nombre: 'userdistribuidor', email: 'userdistribuidor@ufv.es', telefono: '', passwd: passwdEncoded).save()
//
//          passwdEncoded = authenticateService.passwordEncoder('usercliente')
//          def userCliente = new Usuario(nombre: 'usercliente', email: 'usercliente@ufv.es', telefono: '', passwd: passwdEncoded).save()
//
//          passwdEncoded = authenticateService.passwordEncoder('usercoordinador')
//          def userCoordinador = new Usuario(nombre: 'usercoordinador', email: 'usercoordinador@ufv.es', telefono: '', passwd: passwdEncoded).save()
//
//          passwdEncoded = authenticateService.passwordEncoder('usertecnico')
//          def userTecnico = new Usuario(nombre: 'usertecnico', email: 'usertecnico@ufv.es', telefono: '', passwd: passwdEncoded).save()
//
//          passwdEncoded = authenticateService.passwordEncoder('usercalidad')
//          def userCalidad = new Usuario(nombre: 'usercalidad', email: 'usercalidad@ufv.es', telefono: '', passwd: passwdEncoded).save()
//
//          //Note that here we associate users with their respective roles
//          roleAdministrador.addToPeople(userAdministrador)
//          roleDistribuidor.addToPeople(userDistribuidor)
//          roleCliente.addToPeople(userCliente)
//          roleCoordinador.addToPeople(userCoordinador)
//          roleTecnico.addToPeople(userTecnico)
//          roleCalidad.addToPeople(userCalidad)
//        }
//        log.info "ROLES y USUARIOS por defecto, en BBDD OK"
//      } catch (Exception e) {
//        log.error "Excepcion en la comprobacion de Roles en BBDD. ERROR - ${e.message}"
//
////        despliegueOK = false
//      }

    }
    def destroy = {
    }
}

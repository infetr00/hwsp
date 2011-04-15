class BootStrap {

  def authenticateService

    def init = { servletContext ->

      //-------------------------------------------------ACEGI---------------------------------------------------------
      //Adding Roles
      log.info "Comprobando ROLES en BBDD ..."

      try {
        def role = Role.findByAuthority('ROL_ADMINISTRADOR')

        if (!role.any()) {
          def roleAdministrador = new Role(authority: 'ROL_ADMINISTRADOR', description: 'Administrador').save()
          def roleDistribuidor = new Role(authority: 'ROL_DISTRIBUIDOR', description: 'Distribuidor').save()
          def roleCliente = new Role(authority: 'ROL_CLIENTE', description: 'Cliente').save()
          def roleCoordinador = new Role(authority: 'ROL_COORDINADOR', description: 'Coordinador').save()
          def roleTecnico = new Role(authority: 'ROL_TECNICO', description: 'Tecnico').save()
          def roleCalidad = new Role(authority: 'ROL_CALIDAD', description: 'Calidad').save()

          //Adding Users

          def passwordd = authenticateService.passwordEncoder('admin')

          def userAdministrador = new User(nombre: 'admin', email: 'admin@ufv.es', telefono: '', passwd: passwordd).save()
          def userDistribuidor = new User(nombre: 'userdistribuidor', email: '', telefono: '', pass: 'userdistribuidor').save()
          def userCliente = new User(nombre: 'usercliente', email: '', telefono: '', pass: 'usercliente').save()
          def userCoordinador = new User(nombre: 'usercoordinador', email: '', telefono: '', pass: 'usercoordinador').save()
          def userTecnico = new User(nombre: 'usertecnico', email: '', telefono: '', pass: 'usertecnico').save()
          def userCalidad = new User(nombre: 'usercalidad', email: '', telefono: '', pass: 'usercalidad').save()

          //Note that here we associate users with their respective roles
          roleAdministrador.addToPeople(userAdministrador)
          roleDistribuidor.addToPeople(userDistribuidor)
          roleCliente.addToPeople(userCliente)
          roleCoordinador.addToPeople(userCoordinador)
          roleTecnico.addToPeople(userTecnico)
          roleCalidad.addToPeople(userCalidad)
        }
        log.info "ROLES y USUARIOS por defecto, en BBDD OK"
      } catch (Exception e) {
        log.error "Excepcion en la comprobacion de Roles en BBDD. ERROR - ${e.message}"

//        despliegueOK = false
      }


//new Requestmap(url: '/login/**', configAttribute: 'IS_AUTHENTICATED_ANONYMOUSLY').save()
//new Requestmap(url: '/secure/**', configAttribute: 'ROL_ADMIN').save()


    }
    def destroy = {
    }
}

class BootStrap {

    def init = { servletContext ->

      //-------------------------------------------------ACEGI---------------------------------------------------------
      //Adding Roles
      log.info "Comprobando ROLES en BBDD ..."

      try {
        def role = Role.findByAuthority('ROLE_ADMIN')

        if (!role.any()) {
          def roleAdmin = new Role(authority: 'ROL_ADMINISTRADOR', description: 'Administrador').save()
          def roleUser = new Role(authority: 'ROL_DISTRIBUIDOR', description: 'Distribuidor').save()
          def roleRRHH = new Role(authority: 'ROL_CLIENTE', description: 'Cliente').save()
          def roleVU = new Role(authority: 'ROL_TECNICO', description: 'Tecnico').save()
          def roleMARK = new Role(authority: 'ROL_CALIDAD', description: 'Calidad').save()

          //Adding Users
//          def admin = new User(nombre: 'administrador', email:, telefono: , passwd: ).save()
//          def userAdmin = new User(username: 'useradmin',
//                  userRealName: 'administrador del sistema').save()
//          def userUser = new UserSayc(username: 'useruser',
//                  userRealName: 'usuario standard').save()
//          def userRRHH = new UserSayc(username: 'userrrhh',
//                  userRealName: 'recursos humanos').save()
//          def userVu = new UserSayc(username: 'uservu',
//                  userRealName: 'ventanilla œnica').save()
//          def userMark = new UserSayc(username: 'usermark',
//                  userRealName: 'usuario de marketing').save()

          //Note that here we associate users with their respective roles
//          roleAdmin.addToPeople(admin)
//          roleUser.addToPeople(admin)
//          roleRRHH.addToPeople(admin)
//          roleVU.addToPeople(admin)
//          roleMARK.addToPeople(admin)
//          roleAdmin.addToPeople(userAdmin)
//          roleUser.addToPeople(userUser)
//          roleRRHH.addToPeople(userRRHH)
//          roleVU.addToPeople(userVu)
//          roleMARK.addToPeople(userMark)
        }
        log.info "ROLES en BBDD OK"
      } catch (Exception e) {
        log.error "Excepcion en la comprobacion de Roles en BBDD. ERROR - "
//        despliegueOK = false
      }

    }
    def destroy = {
    }
}

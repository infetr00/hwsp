package hwsp

import hwsp.Role

/**
 * User domain class.
 */
class User {
	 static transients = ['pass']
  static hasMany = [authorities: Role, incidencias: Incidencia, sugerencias: Sugerencia]
  static belongsTo = Role

  /** hwsp.User Real Name */
  String nombre
  /** MD5 Password  */
  String passwd

  String email

  String telefono

  boolean enabled = true

  /** plain password to create a MD5 password  */
  String pass = '[secret]'

  static constraints = {
    email(blank: false, unique: true, email: true)
    passwd(blank: false)
  }
}

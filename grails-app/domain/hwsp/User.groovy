package hwsp



/**
 * User domain class.
 */
class User {
	static transients = ['pass']
	static hasMany =  [authorities: Role]
  static belongsTo = Role

	/** User Real Name*/
	String nombre
	/** MD5 Password */
	String passwd

	String email

  String telefono

  boolean enabled = true

	/** plain password to create a MD5 password */
	String pass = '[secret]'

	static constraints = {
		passwd(blank: false)
	}
}

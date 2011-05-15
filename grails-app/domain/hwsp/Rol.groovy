package hwsp

import hwsp.Usuario

/**
 * Authority domain class.
 */
class Rol {

	static hasMany = [people: Usuario]

	/** description */
	String description
	/** ROLE String */
	String authority

	static constraints = {
		authority(blank: false, unique: true)
		description()
	}
}

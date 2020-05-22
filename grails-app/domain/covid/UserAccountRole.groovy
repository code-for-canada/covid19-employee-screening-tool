package covid

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.codehaus.groovy.util.HashCodeHelper
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@ToString(cache=true, includeNames=true, includePackage=false)
class UserAccountRole implements Serializable {

	private static final long serialVersionUID = 1

	UserAccount userAccount
	Role role

	@Override
	boolean equals(other) {
		if (other instanceof UserAccountRole) {
			other.userAccountId == userAccount?.id && other.roleId == role?.id
		}
	}

    @Override
	int hashCode() {
	    int hashCode = HashCodeHelper.initHash()
        if (userAccount) {
            hashCode = HashCodeHelper.updateHash(hashCode, userAccount.id)
		}
		if (role) {
		    hashCode = HashCodeHelper.updateHash(hashCode, role.id)
		}
		hashCode
	}

	static UserAccountRole get(long userAccountId, long roleId) {
		criteriaFor(userAccountId, roleId).get()
	}

	static boolean exists(long userAccountId, long roleId) {
		criteriaFor(userAccountId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long userAccountId, long roleId) {
		UserAccountRole.where {
			userAccount == UserAccount.load(userAccountId) &&
			role == Role.load(roleId)
		}
	}

	static UserAccountRole create(UserAccount userAccount, Role role, boolean flush = false) {
		def instance = new UserAccountRole(userAccount: userAccount, role: role)
		instance.save(flush: flush)
		instance
	}

	static boolean remove(UserAccount u, Role r) {
		if (u != null && r != null) {
			UserAccountRole.where { userAccount == u && role == r }.deleteAll()
		}
	}

	static int removeAll(UserAccount u) {
		u == null ? 0 : UserAccountRole.where { userAccount == u }.deleteAll() as int
	}

	static int removeAll(Role r) {
		r == null ? 0 : UserAccountRole.where { role == r }.deleteAll() as int
	}

	static constraints = {
	    userAccount nullable: false
		role nullable: false, validator: { Role r, UserAccountRole ur ->
			if (ur.userAccount?.id) {
				if (UserAccountRole.exists(ur.userAccount.id, r.id)) {
				    return ['userRole.exists']
				}
			}
		}
	}

	static mapping = {
		id composite: ['userAccount', 'role']
		version false
	}
}

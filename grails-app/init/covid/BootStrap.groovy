package covid

import grails.util.Environment
import org.springframework.beans.factory.annotation.Value

class BootStrap {

    // from application.yml or environment, default value is false
    @Value('${usingLdap: false}')
    boolean usingLdap

    def init = { servletContext ->

        Map saveMap = [failOnError:true, flush:true]

        if (Home.list().size == 0) {

            def homeList = [
                    new Home(name: 'Lee Manor'),
                    new Home(name: 'Grey Gables'),
                    new Home(name: 'Rockwood Terrace')
            ]

            Home.withTransaction { status ->
                Home.withSession {
                    homeList.each { home ->
                        home.save(saveMap)
                    }
                }
            }

            // if not using LDAP, create users
            if (!usingLdap) {
                createDefaultUsers()
            }

            //Test data
            if (Environment.current == Environment.DEVELOPMENT) {

                Employee employee = new Employee(
                        firstName: 'First',
                        lastName: 'Last'
                )

                Employee employeeJoe = new Employee(
                        firstName: 'Joe',
                        lastName: 'User'
                )

                Employee.withTransaction { status ->
                    Employee.withSession {
                        employee.save(failOnError: true)
                        employeeJoe.save(failOnError: true, flush: true)
                    }
                }

                new Screening(employee: "Employee, Joe", phoneNumber: "123-456-7890", home: homeList[0], temperatureIn: '37', screenedByIn: "Screener Bob").save(failOnError: true)
            }
        }
    }
    def destroy = {
    }

    /**
     * Create default roles and users if none exist in the database
     * @return
     */
    def createDefaultUsers() {
        if (UserAccount.list().size == 0) {
            UserAccount.withTransaction { status ->
                UserAccount.withSession {
                    def adminRole = new Role(authority: 'ROLE_COVID_ADMINISTRATORS').save()
                    def screenerRole = new Role(authority: 'ROLE_COVID_SCREENERS').save()

                    def admin = new UserAccount(username: 'admin', password: 'admin').save()
                    UserAccountRole.create admin, adminRole

                    def screener = new UserAccount(username: 'screener', password: 'screener').save()
                    UserAccountRole.create screener, screenerRole

                    UserAccountRole.withSession {
                        it.flush()
                        it.clear()
                    }
                }
            }
        }
    }
}

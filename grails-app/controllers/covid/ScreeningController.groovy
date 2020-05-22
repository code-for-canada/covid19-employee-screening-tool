package covid

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_COVID_SCREENERS', 'ROLE_COVID_ADMINISTRATORS'])
class ScreeningController {

    ScreeningService screeningService
    EmployeeService employeeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        Home home = null
        def screeningList = []

        if (params.home) {
            home = Home.get(params.int("home"))
            session["home"] = params.home
        } else if (session.getAttribute("home")) {
            home = Home.get(session.getAttribute("home"))
        }

        if (home) {
            screeningList = Screening.findAllByHomeAndScreenedByOutIsNull(home, [sort: "dateCreated", order: "desc"])
        }

        model: [screeningList: screeningList, homes: Home.list(), home: home]
    }

    def fullList() {
        //Retrieve session attributes
        if (session.getAttribute("locationFilter")) { params.locationFilter = session.getAttribute('locationFilter') }
        if (session.getAttribute("flagsFilter")) { params.flagsFilter = session.getAttribute('flagsFilter') }
        if (session.getAttribute("timePeriodFilter")) { params.timePeriodFilter = session.getAttribute('timePeriodFilter') }

        model: [locations: Home.list(sort: "name"), params: params]
    }

    def resetScreeningFilter() {
        session.removeAttribute('locationFilter')
        session.removeAttribute('flagsFilter')
        session.removeAttribute('timePeriodFilter')
        redirect action: 'fullList'
    }

    def list() {
        if (params.locationFilter) {
            session["locationFilter"] = params.int('locationFilter')
        }
        if (params.flagsFilter) {
            session["flagsFilter"] = params.int('flagsFilter')
        }
        if (params.timePeriodFilter) {
            session["timePeriodFilter"] = params.int('timePeriodFilter')
        }

        render(template: 'list', model: [screeningList: getScreeningList(params)])
    }

    def getScreeningList(params) {

        def locationFilter = session.getAttribute("locationFilter")
        def flagsFilter = session.getAttribute('flagsFilter') ?: 0
        def timePeriodFilter = session.getAttribute('timePeriodFilter') ?: 1

        def c = Screening.createCriteria()
        def screeningList = c.list {
            if (flagsFilter == 1) {
                or {
                    eq("feverIn", true)
                    eq("newOnsetIn", true)
                    eq("travelOutsideCanada", true)
                    eq("contactPositive", true)
                    eq("feverOut", true)
                    eq("newOnsetOut", true)
                }
            }
            if (locationFilter) {
                def locations = locationFilter.collect { Home.get(it) }
                'in'('home', locations)
            }
            if (timePeriodFilter) {
                switch(timePeriodFilter) {
                    case 1:
                        gt('dateCreated', new Date().clearTime())
                        break
                    case 2:
                        gt('dateCreated', new Date().clearTime().minus(7))
                        break
                    default:
                        break

                }
            }
            order("dateCreated")
        }

        return screeningList
    }

    def show(Long id) {
        respond screeningService.get(id)
    }

    def create() {
        respond new Screening(params), model: [employees: Employee.list(sort: "lastName"),
                                               homes: Home.list(),
                                               defaultHome: session.getAttribute("home"),
                                               screenedBy: session.getAttribute("screenedBy")]
    }

    def save(Screening screening) {
        if (screening == null) {
            notFound()
            return
        }

        try {
            //Remember some options
            session["screenedBy"] = screening.screenedByIn
            session["home"] = screening.home.id

            //Save employee contact number
            Employee employee = Employee.get(params.int("contactChooser"))
            if (employee) {
                employee.contactNumber = screening.phoneNumber
                employeeService.save(employee)
            }

            screeningService.save(screening)
        } catch (ValidationException e) {
            respond screening.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Saved screening"
                redirect action:"index"
            }
            '*' { respond screening, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond screeningService.get(id)
    }

    def editNotes(Screening screening) {
        render(template: 'notes', model: [screening: screening, params: params])
    }

    def updateNotes(Screening screening) {
        screeningService.save(screening)

        def responseMap = [html: g.render(template: 'list', model:[screeningList: getScreeningList(params)]), success: true]
        render responseMap as JSON
    }

    def complete(Long id) {
        respond screeningService.get(id), model: [screenedBy: session.getAttribute("screenedBy")]
    }

    def update(Screening screening) {
        if (screening == null) {
            notFound()
            return
        }

        try {
            screeningService.save(screening)
        } catch (ValidationException e) {
            respond screening.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Updated screening"
                redirect action:"index"
            }
            '*'{ respond screening, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        screeningService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'screening.label', default: 'Screening'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'screening.label', default: 'Screening'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

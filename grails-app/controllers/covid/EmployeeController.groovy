package covid

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_COVID_ADMINISTRATORS'])
class EmployeeController {

    EmployeeService employeeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        respond Employee.list()
    }

    def list() {
        render(template: 'list', model: [employees: listEmployees()])
    }

    def show(Long id) {
        Employee employee = employeeService.get(id)

        respond employee, model: [employee: employee, employees: Employee.list(sort: "lastName")]
    }

    def create() {
        respond new Employee(params)
    }

    def save(Employee employee) {
        if (employee == null) {
            notFound()
            return
        }

        try {
            employeeService.save(employee)
        } catch (ValidationException e) {
            respond employee.errors, view:'create', model: [rdpCategories: RDPCategory.list(),
                                                          rdpStatuses: RDPStatus.list(),
                                                          rdpLocations: RDPLocation.list(),
                                                          departments: Department.list(sort: "name"),
                                                          ltcTrainingList: ['Completed', 'Enrolled', 'N/A'],
                                                            shifts: Shift.list(sort: "sortOrder"),
                                                            days: dayList()]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employee.id])
                redirect action: 'index'
            }
            '*' { respond employee, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond employeeService.get(id)
    }

    def update(Employee employee) {
        if (employee == null) {
            notFound()
            return
        }

        try {
            employeeService.save(employee)
        } catch (ValidationException e) {
            respond employee.errors, view:'edit', model: [rdpCategories: RDPCategory.list(),
                                                          rdpStatuses: RDPStatus.list(),
                                                          rdpLocations: RDPLocation.list(),
                                                          departments: Department.list(sort: "name"),
                                                          ltcTrainingList: ['Completed', 'Enrolled', 'N/A'],
                                                          shifts: Shift.list(sort: "sortOrder"),
                                                          days: dayList()]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), employee.id])
                redirect action: 'index'
            }
            '*'{ respond employee, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        employeeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def dayList() {
        return [0: "Sunday", 1: "Monday", 2: 'Tuesday', 3: 'Wednesday', 4: 'Thursday', 5: 'Friday', 6: 'Saturday']
    }
}

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h3>Employees</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><i class="fas fa-dashboard"></i> Home</li>
                        <li class="breadcrumb-item"><g:link action="index">Employees</g:link></li>
                        <li class="breadcrumb-item"><g:link action="show" id="${employee.id}">${employee.lastName}, ${employee.firstName}</g:link></li>
                        <li class="breadcrumb-item active">Edit</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.employee}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.employee}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <div class="row">

            <div class="col-sm-6">

                <div class="card">
                    <div class="card-header">
                        <h5 class="m-0">Edit Employee
                        <span class="float-right">
                            <g:form resource="${this.employee}" method="DELETE">
                                <input class="btn btn-sm btn-danger" type="submit" value="Delete" onclick="return confirm('Delete this Employee?');" />
                            </g:form>
                        </span>
                        </h5>
                    </div>
                    <div class="card-body">
                        <g:form resource="${this.employee}" method="PUT">
                            <g:hiddenField name="version" value="${this.employee?.version}" />

                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <g:textField name="firstName" class="form-control" required="required" value="${employee.firstName}" autocomplete="no" />
                            </div>

                            <div class="form-group">
                                <label for="lastName">Last Name</label>
                                <g:textField name="lastName" class="form-control" required="required" value="${employee.lastName}" autocomplete="no" />
                            </div>

                            <div class="form-group">
                                <label for="contactNumber">Contact Number</label>
                                <g:textField name="contactNumber" class="form-control" value="${employee.contactNumber}" autocomplete="no" />
                            </div>

                            <div class="form-group">
                                <label for="employeeNumber">Employee Number</label>
                                <g:textField name="employeeNumber" class="form-control" value="${employee.employeeNumber}" autocomplete="no" />
                            </div>

                            <div class="text-center">
                                <g:link class="btn btn-secondary" action="index">Cancel</g:link>
                                <input class="btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>


    </section>

    </body>
</html>

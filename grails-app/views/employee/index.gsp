<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
                        <li class="breadcrumb-item active">Employees</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="col-sm-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="m-0">Employee List
                        <span class="float-right"><g:link action="create" class="btn btn-primary pull-right"><i class="fas fa-plus"></i> New Employee</g:link>
                    </span></h5>
                </div>
                <div class="card-body">
                    <table id="employeeTable" class="table table-condensed table-striped">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Employee Number</th>
                                <th>Contact Number</th>
                            </tr>
                        </thead>
                        <tbody>
                        <g:each in="${employeeList}" var="employee">
                            <tr>
                                <td>
                                    <g:link action="edit" resource="${employee}" title="Edit Employee">${employee.lastName}, ${employee.firstName}</g:link>
                                </td>
                                <td>${employee.employeeNumber}</td>
                                <td>${employee.contactNumber}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <g:javascript>
        $(document).ready(function() {
            $('#employeeTable').dataTable({
                dom: 'Bfrtip',
                stateSave: true,
                buttons: [
                    {
                        extend: 'excel',
                        text: 'Export to Excel'
                    }
                ]
            });
        });
    </g:javascript>

    </body>
</html>
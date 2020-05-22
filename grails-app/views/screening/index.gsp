<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'screening.label', default: 'Screening')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h3>Screening</h3>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><i class="fas fa-dashboard"></i> Home</li>
                            <li class="breadcrumb-item active">Screening</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="m-0">Screening List</h5>
                        </div>
                        <div class="card-body">
                            <g:form action="index">
                                <div class="form-group">
                                    <label for="home">Home</label>
                                    <g:select class="form-control selectpicker" id="home" name="home" from="${homes}" optionKey="id" required="required"
                                              noSelection="['':'- Select Home -']" data-live-search="true" value="${home?.id}" onchange="this.form.submit()" />
                                </div>
                            </g:form>

                            <div class="text-center">
                                <g:link class="btn btn-primary" action="create">New Screening</g:link>
                                <sec:ifAnyGranted roles="ROLE_COVID_ADMINISTRATORS">
                                    <g:link class="btn btn-secondary" action="fullList">Full Listing</g:link>
                                </sec:ifAnyGranted>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="m-0">Incomplete Screening Entries</h5>
                        </div>
                        <div class="card-body">
                            <g:if test="${flash.message}">
                                <div class="alert alert-info" role="status">${flash.message}</div>
                            </g:if>

                            <g:if test="${home}">
                                <table id="screeningTable" class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Employee</th>
                                        <th>Home</th>
                                        <th>Screened In By</th>
                                        <th>Screened Out By</th>
                                        <th>Date</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <g:each in="${screeningList}" var="screening">
                                            <tr>
                                                <td><g:link action="show" id="${screening.id}">${screening.employee}</g:link></td>
                                                <td>${screening.home}</td>
                                                <td>${screening.screenedByIn}</td>
                                                <td>${screening.screenedByOut}</td>
                                                <td>${screening.dateCreated.format('yyyy-MM-dd')}</td>
                                                <td>
                                                    <g:if test="${!screening.screenedByOut}">
                                                        <g:link class="btn btn-sm btn-primary" action="complete" id="${screening.id}">Complete End of Shift</g:link>
                                                    </g:if>
                                                </td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </g:if>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <g:javascript>
        $(document).ready(function() {
            $('#screeningTable').dataTable();
        });
    </g:javascript>

    </body>
</html>
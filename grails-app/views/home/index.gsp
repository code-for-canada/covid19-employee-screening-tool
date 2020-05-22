<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'home.label', default: 'Home')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h3>Locations</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><i class="fas fa-dashboard"></i> Home</li>
                        <li class="breadcrumb-item active">Locations</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="m-0">Location List</h5>
                    </div>
                    <div class="card-body">
                        <g:if test="${flash.message}">
                            <div class="alert alert-info" role="status">${flash.message}</div>
                        </g:if>
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>Location</th>
                            </tr>
                            </thead>
                            <tbody>
                                <g:each in="${homeList}" var="home">
                                    <tr>
                                        <td><g:link action="edit" id="${home.id}" title="Edit Location">${home}</g:link></td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <div class="text-center">
                            <g:link class="btn btn-primary" action="create">Add Location</g:link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    </body>
</html>
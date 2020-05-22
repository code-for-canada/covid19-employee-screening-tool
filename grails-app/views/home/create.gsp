<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'home.label', default: 'Home')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h3>Locations</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><i class="fas fa-dashboard"></i> Home</li>
                        <li class="breadcrumb-item"><g:link action="index">Locations</g:link></li>
                        <li class="breadcrumb-item active">Create</li>
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
                        <h5 class="m-0">Create Location</h5>
                    </div>
                    <div class="card-body">
                        <g:if test="${flash.message}">
                            <div class="alert alert-info" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${this.home}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${this.home}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>
                        <g:form resource="${this.home}" method="POST">
                            <div class="form-group">
                                <label for="name">Location Name</label>
                                <g:textField name="name" class="form-control" value="${home.name}" autocomplete="no" />
                            </div>

                            <hr />

                            <div class="text-center">
                                <g:link action="index" class="btn btn-secondary">Cancel</g:link>
                                <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    </body>
</html>

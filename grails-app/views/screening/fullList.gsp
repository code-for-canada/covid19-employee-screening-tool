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
                <div class="col-sm-12">
                    <g:form action="list" class="js-filter-list">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="m-0">Screening List</h5>
                            </div>
                            <div class="card-body">
                                <g:if test="${flash.message}">
                                    <div class="message" role="status">${flash.message}</div>
                                </g:if>

                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group row">
                                            <label for="locationFilter" class="col-sm-4 control-label">Location</label>
                                            <div class="col-sm-8">
                                                <g:select class="form-control form-control-sm selectpicker"
                                                          from="${locations}"
                                                          id="locationFilter" name="locationFilter" value="${params.locationFilter}"
                                                          optionKey="id" noSelection="['0':'- Select a Location - ']"
                                                />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="flagsFilter" class="col-sm-4 control-label">Flags</label>
                                            <div class="col-sm-8">
                                                <g:select class="form-control form-control-sm selectpicker"
                                                          from="${['0': 'Show All Screenings', 1: 'Show Flagged Screenings Only']}"
                                                          id="flagsFilter" name="flagsFilter" value="${params.flagsFilter}"
                                                          optionKey="key" optionValue="value" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="timePeriodFilter" class="col-sm-4 control-label">Time Period</label>
                                            <div class="col-sm-8">
                                                <g:select class="form-control form-control-sm selectpicker"
                                                          from="${['1': 'Today', 2: 'Last 7 Days', 3: 'All']}"
                                                          id="timePeriodFilter" name="timePeriodFilter" value="${params.timePeriodFilter ?: 1}"
                                                          optionKey="key" optionValue="value" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <button class="btn btn-primary my-3">Filter</button>
                                        <g:link class="btn btn-secondary my-3" action="resetScreeningFilter">Reset</g:link>
                                    </div>
                                </div>

                                <hr />

                                <div id="screeningList"></div>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
    </section>

    <g:javascript>
        $(document).ready(function() {
            var templateUrl = "${g.createLink(action: 'list')}";
            $('#screeningList').load(templateUrl, function() { });
        });

        $('.js-filter-list').submit(function(event) {
            event.preventDefault();

            $("#screeningList").html('<g:img dir="images" file="spinner.gif" width="40" height="40"/>');

            var $form = $(this);
            url = $form.attr('action');
            var posting = $.post(url, $(this).serialize());

            posting.done(function(data) {
                $("#screeningList").html(data);
            });
        });
    </g:javascript>

    </body>
</html>
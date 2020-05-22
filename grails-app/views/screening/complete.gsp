<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'screening.label', default: 'Screening')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="m-0">Start of Shift <div class="float-right"><span class="badge badge-secondary">Completed ${screening.dateCreated.format('yyyy-MM-dd')}</span></div></h5>
                    </div>
                    <div class="card-body">

                        <g:form resource="${this.screening}" method="POST">

                            <div class="row">
                                <div class="col-md-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="employee">Employee</label>
                                        <g:textField name="phoneNumber" class="form-control" value="${screening.employee}" disabled="" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="phoneNumber">Phone</label>
                                        <g:textField name="phoneNumber" class="form-control" value="${screening.phoneNumber}" disabled="" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="home">Home</label>
                                        <g:textField name="home" class="form-control" value="${screening.home}" disabled="" />
                                    </div>
                                </div>
                            </div>

                            <hr />

                            <div class="form-group">
                                <label for="newOnsetIn">1. Do you have any new or worsening symptoms or signs: New or worsening cough, Shortness of Breath, Sore throat, Runny nose, Sneezing, Nasal congestion, (that are not related to seasonal allergies, post nasal drip, etc.), Hoarse voice, Difficulty swallowing, New smell or taste disorder(s), Nausea/vomiting, Diarrhea, Abdominal pain, Unexplained fatigue/malaise, Chills, Headache, Multisystem Inflammatory Vasculitis (in children)</label>
                                <div class="form-check">
                                    <g:checkBox name="newOnsetIn" value="${screening.newOnsetIn}" data-toggle="toggle" data-on="Yes" data-off="No" disabled="" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="travelOutsideCanada">2. Have you travelled outside of Canada or had close contact with anyone that has travelled outside of Canada in the past 14 days?</label>
                                <div class="form-check">
                                    <g:checkBox name="travelOutsideCanada" value="${screening.travelOutsideCanada}" data-toggle="toggle" data-on="Yes" data-off="No" disabled="" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="temperatureIn">3. Do you have a fever? <small>(temperature of 37.8 Celsius or higher)</small></label>
                                <div class="form-check">
                                    <span>Temperature In:</span>
                                    <g:textField name="temperatureIn" required="" value="${screening.temperatureIn}" disabled="" />&deg;C
                                    <span class="pl-3">
                                        Fever: <g:checkBox id="feverIn" name="feverIn" value="${screening.feverIn}" data-toggle="toggle" data-on="Yes" data-off="No" disabled="" />
                                    </span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="contactPositive">4.	Have you had close contact with anyone with respiratory illness or a confirmed or probable case of COVID-19?</label>
                                <div class="form-check">
                                    <g:checkBox name="contactPositive" value="${screening.contactPositive}" data-toggle="toggle" data-on="Yes" data-off="No" disabled="" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="requiredPPEWorn">5.	If Yes to question 4, did you wear the required and/or recommended PPE according to the type of duties you were performing (e.g. goggles, gloves, mask and gown or N95 with aerosol generating medical procedures (AGMPs)) when you had close contact with a suspected or confirmed case of COVID-19?</label>
                                <div class="form-check">
                                    <g:checkBox name="requiredPPEWorn" value="${screening.requiredPPEWorn}" data-toggle="toggle" data-on="Yes" data-off="No" disabled="" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="screenedByIn">Screened By</label>
                                        <g:textField name="screenedByIn" class="form-control" required="required" value="${screening.screenedByIn}" disabled="" />
                                    </div>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h5 class="m-0">End of Shift</h5>
                    </div>
                    <div class="card-body">
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${this.screening}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${this.screening}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>

                        <g:form resource="${this.screening}" method="PUT">

                            <div class="form-group">
                                <label for="newOnsetOut">1.	Do you have any new or worsening symptoms or signs: New or worsening cough, Shortness of Breath, Sore throat, Runny nose, Sneezing, Nasal congestion, (that are not related to seasonal allergies, post nasal drip, etc.), Hoarse voice, Difficulty swallowing, New smell or taste disorder(s), Nausea/vomiting, Diarrhea, Abdominal pain, Unexplained fatigue/malaise, Chills, Headache, Multisystem Inflammatory Vasculitis (in children)</label>
                                <div class="form-check">
                                    <g:checkBox name="newOnsetOut" value="${screening.newOnsetOut}" data-toggle="toggle" data-on="Yes" data-off="No" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="temperatureOut">2. Do you have a fever? (temperature of 37.8 Celsius or higher)</label>
                                <div class="form-check">
                                    <span>Temperature Out:</span>
                                    <g:textField name="temperatureOut" required="" value="${screening.temperatureOut}" />&deg;C
                                    <span class="pl-3">
                                        Fever: <g:checkBox id="feverOut" name="feverOut" value="${screening.feverOut}" data-toggle="toggle" data-on="Yes" data-off="No" />
                                    </span>
                                </div>
                            </div>

                            <div class="alert alert-secondary">
                                <strong>NOTE</strong>
                                <p>Should the person present a fever or answer “YES” to any of the preceding questions, please ask the person to put on mask and DO NOT permit the person to enter.
                                Ask that they contact Public Health or Telehealth for further instructions regarding
                                self-monitoring or self-quarantine.</p>

                                <p>GREY BRUCE PUBLIC HEALTH<br />
                                    Telephone: 519-376-9420 -Toll: 1-800-263-3456<br />
                                    TELEHEALTH Ontario – 1-866-797-0000</p>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="screenedByOut">Screened By</label>
                                        <g:textField name="screenedByOut" class="form-control" required="required" value="${screenedBy}" />
                                    </div>
                                </div>
                            </div>

                            <div class="text-center">
                                <g:link class="btn btn-default" action="index">Cancel</g:link>
                                <input class="btn btn-primary" type="submit" value="Complete" />
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <g:javascript>
        $(function() {
            $("#temperatureOut").keyup(function(){
                var temp = $(this).val();
                if (parseFloat(temp)) {
                    if (parseFloat(temp) >= 37.8) {
                        $('#feverOut').bootstrapToggle('on');
                    } else {
                        $('#feverOut').bootstrapToggle('off');
                    }
                }
            });
        });
    </g:javascript>

    </body>
</html>

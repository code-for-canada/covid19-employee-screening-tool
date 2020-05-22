<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Import</title>
    </head>
    <body>

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h3>Import</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><i class="fas fa-dashboard"></i> Home</li>
                        <li class="breadcrumb-item active"><g:link action="index">Import</g:link></li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="card">
            <div class="card-header">
                <h5 class="m-0">Excel Import</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">

                        <g:uploadForm action="upload" >
                            <div class="form-group">
                                <input type="file" name="file" />
                            </div>
                            <div class="form-group">
                                <g:submitButton name="uploadbutton" class="btn btn-primary" value="Upload" />
                            </div>
                        </g:uploadForm>

                        <g:if test="${flash.message}">
                            <div class="alert alert-info" role="alert">
                                ${flash.message}
                            </div>
                        </g:if>
                    </div>
                    <div class="col-md-8">
                        <div>
                            <p>Employees can be uploaded from an Excel file that has the following headings:</p>
                            <ul>
                                <li>firstName</li>
                                <li>lastName</li>
                                <li>contactNumber (optional)</li>
                                <li>employeeNumber (optional)</li>
                            </ul>

                            <p>Example:</p>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>firstName</th>
                                    <th>lastName</th>
                                    <th>contactNumber</th>
                                    <th>employeeNumber</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>John</td>
                                    <td>Smith</td>
                                    <td>123-456-7890</td>
                                    <td>12345</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </body>
</html>

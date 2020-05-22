<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>COVID-19 Tracking</title>
</head>
<body>

<!-- Content Header (Page header) -->
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h3>COVID-19 Tracking</h3>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item active"><i class="fas fa-dashboard"></i> Home</li>
                </ol>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">

    <div class="row">
        <sec:ifAnyGranted roles="ROLE_COVID_ADMINISTRATORS">
            <div class="col-sm-2">
                <g:link controller="Employee">
                    <div class="card text-white text-center bg-info h-40">
                        <div class="card-body bg-gradient-info">
                            <h5><i class="fas fa-user-friends"></i> Employees</h5>
                        </div>
                    </div>
                </g:link>
            </div>
        </sec:ifAnyGranted>
        <div class="col-sm-2">
            <g:link controller="Screening">
                <div class="card text-white text-center bg-danger h-40">
                    <div class="card-body bg-gradient-danger">
                        <h5><i class="fas fa-temperature-low"></i> Screening</h5>
                    </div>
                </div>
            </g:link>
        </div>
    </div>
</section>

</body>
</html>

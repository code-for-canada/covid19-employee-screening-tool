
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><g:layoutTitle default="Covid-19"/></title>
    
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <asset:javascript src="application.js"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">


    <g:layoutHead/>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <nav class="main-header navbar navbar-expand navbar-dark navbar-info">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link nav-link-bars" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i><span class="nav-link-bars-text">Menu</span></a>
                </li>
            </ul>

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <li class="dropdown user user-menu">
                    <sec:ifNotLoggedIn>
                        <g:link controller="login" action="auth" name="login" class="nav-link"><i class="fa fa-fw fa-user"></i> Login</g:link>
                    </sec:ifNotLoggedIn>

                    <sec:ifLoggedIn>
                        <g:link controller="logout" name="logout" class="nav-link"><i class="fa fa-fw fa-user"></i> Log Out (<sec:username />)</g:link>
                    </sec:ifLoggedIn>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-light-info elevation-4">
            <!-- Brand Logo -->
            <a href="/" class="brand-link navbar-gray-dark">
                <span class="brand-text font-weight-light text-white"><strong title="COVID-19">COVID-19</strong></span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <sec:ifAnyGranted roles="ROLE_COVID_ADMINISTRATORS">
                            <li class="nav-item" role="menuitem">
                                <g:link controller="Employee" class="nav-link" role="menuitem">
                                    <i class="nav-icon fas fa-user-friends"></i>
                                    <p>Employees</p>
                                </g:link>
                            </li>
                        </sec:ifAnyGranted>
                        <li class="nav-item" role="menuitem">
                            <g:link controller="Screening" class="nav-link" role="menuitem">
                                <i class="nav-icon fas fa-temperature-low"></i>
                                <p>Screening</p>
                            </g:link>
                        </li>

                        <sec:ifAnyGranted roles="ROLE_COVID_ADMINISTRATORS">
                            <li class="nav-item has-treeview" role="menuitem">
                                <a href="#" class="nav-link" role="menuitem">
                                    <i class="nav-icon fas fa-tools"></i>
                                    <p>
                                        Administration
                                        <i class="fas fa-angle-right right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview" role="list">
                                    <li class="nav-item">
                                        <g:link controller="Screening" action="fullList" class="nav-link">
                                            <i class="nav-icon fas fa-list-alt"></i>
                                            <p>Reporting</p>
                                        </g:link>
                                    </li>

                                    <li class="nav-item">
                                        <g:link controller="Home" class="nav-link" role="menuitem">
                                            <i class="nav-icon fas fa-hotel"></i>
                                            <p>Locations</p>
                                        </g:link>
                                    </li>
                                    <li class="nav-item">
                                        <g:link controller="Import" class="nav-link" role="menuitem">
                                            <i class="nav-icon fas fa-file-import"></i>
                                            <p>Import</p>
                                        </g:link>
                                    </li>
                                </ul>
                                
                            </li>
                        </sec:ifAnyGranted>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper pl-3">
            <g:layoutBody/>

            <div class="modal" id="modal-default" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Body
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
        <!-- /.content-wrapper -->

    </div>

    <footer class="main-footer">
        <strong><b>Version</b> 1.0</strong>
    </footer>

</body>

</html>

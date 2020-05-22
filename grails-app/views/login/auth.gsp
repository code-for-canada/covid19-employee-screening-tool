<!DOCTYPE html>
<html>
<head>
    <meta name="layout" />
    <title>COVID-19</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <b>COVID-19</b>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Sign in to start your session</p>

            <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                <div class="input-group mb-3">
                    <g:textField class="form-control" name="${usernameParameter ?: 'username'}" required="required" placeholder="Username" autofocus="autofocus" />
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <g:passwordField class="form-control" name="${passwordParameter ?: 'password'}" required="required" placeholder="Password" />
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                    </div>
                    <!-- /.col -->
                </div>

                <g:if test='${flash.message}'>
                    <div class="alert alert-warning mt-3">${flash.message}</div>
                </g:if>
            </form>

        </div>
        <!-- /.login-card-body -->
    </div>
</div>
<!-- /.login-box -->

</body>
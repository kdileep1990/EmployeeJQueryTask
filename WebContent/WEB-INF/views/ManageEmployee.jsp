<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Employee Management System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Le styles -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144"
              href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114"
              href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72"
              href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed"
              href="assets/ico/apple-touch-icon-57-precomposed.png">
        <link rel = "stylesheet" href = "http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <script src="assets/js/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <style>
            .search {
                display: none;
            }
            .roles {
                display: none;
            }

            .sidebar-nav {
                padding: 9px 0;
            }

            @media ( max-width : 980px) {
                /* Enable use of floated navbar text */
                .navbar-text.pull-right {
                    float: none;
                    padding-left: 5px;
                    padding-right: 5px;
                }
            }
        </style>
        <script src="assets/js/manage.js"></script>
    </head>
    <body>
        <div class="navbar navbar-inverse">
            <div class="navbar" style="background-color: #009999;">
                <div class="container" style="height: 80px;">
                    <br> <a class="brand" href="#"><font color="#000000"
                                                         size="5px">Employee Management System</font></a>
                    <div class="nav-collapse collapse">
                        <p class="navbar-text pull-right" style="color: #000000">
                            <img src="assets/img/glyphicons_003_user.png"
                                 style="height: 15px;">&nbsp;Welcome&nbsp;${sessionScope.user}<a href="#"
                                 class="navbar-link" style="color: #000000"></a>
                        </p>

                    </div>
                    <!--/.nav-collapse -->
                </div>
                <ul class="nav nav-tabs nav-pills">
                    <li><a href="register.html">Create Employee</a></li>
                    <li><a href="">Manage Employee</a></li>
                </ul>
            </div>

        </div>
        <div class="container">
            <div class="row">
                <div class="span12">
                    <br />
                    <br />
                    <div class="span9">
                        <form method="post" action="search" class="form-horizontal"
                              style="text-align: left;">
                            <div class="control-group">
                                <label class="control-label">Employee Type</label>
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-user"></i></span> <select
                                            id="userType" class="input-xlarge">
                                            <option value="">Select User Type</option>
                                            <option value="Full Time Employee">Full Time Employee</option>
                                            <option value="Contractor">Contractor</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group search">
                                <label class="control-label">Search Parameter</label>
                                <div class="controls">
                                    <div class="input-prepend">
                                        <select multiple id="searchParameter" class="input-xlarge" style='height: 100%;'>
                                            <option value="firstName">First Name</option>
                                            <option value="lastName">Last Name</option>
                                            <option value="searchEmail">EmailId</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group search">
                                <label class="control-label">First Name</label>
                                <div class="controls">
                                    <div class="input-prepend">
                                        <input id="firstName" type="text"
                                               placeholder="Start type Here " class="input-xlarge">
                                    </div>
                                </div>
                            </div>
                            <div class="control-group search">
                                <label class="control-label">Last Name</label>
                                <div class="controls">
                                    <div class="input-prepend">
                                        <input id="lastName" type="text" placeholder="Start type Here "
                                               class="input-xlarge">
                                    </div>
                                </div>
                            </div>
                            <div class="control-group search">
                                <label class="control-label">EmailId</label>
                                <div class="controls">
                                    <div class="input-prepend">
                                        <input id="searchEmail" type="text" placeholder="Start type Here "
                                               class="input-xlarge">
                                    </div>
                                </div>
                            </div>
                            <div class="control-group search" id="searchUser">
                                <label class="control-label offset5" for="input01"></label>
                                <div class="controls">
                                    <button type="submit" id="startSearch" class="btn btn-success" rel="tooltip"
                                            title="Search">Search</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="span12">
                    <table class="table table-bordered search">
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Salary</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            <footer>
                <p class="">Â© Company 2013</p>
            </footer>
        </div>
        <script src="assets/js/bootstrap.js"></script>
    </body>
</html>

<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Employee Management System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Investor Portal Site">
        <link rel="shortcut icon" href="SemanticBits/ico/favicon.ico">
        <!-- CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/font-awesome.css">
        <!--<link rel="stylesheet" href="assets/css/style.css">-->
        <script src="assets/js/jquery-1.9.1.js"></script>
        <style>
            .my-error-class {
                color:#FF0000;  /* red */
                font-size: 15px;
            }
            .my-valid-class {
                color:#000000; /* green */
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
        <script>
            $(document).ready(function() {
                $("#form1").submit(function() {
                    if ($("#password").val() != $("#confirmPassword").val())
                    {
                        alert("Both passwords should be equal")
                        return false;
                    }
                    else
                        return true;
                });
            });
        </script>
    </head>
    <!--clear-->
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
                    <li><a href="">Create Employee</a></li>
                    <li><a href="manage.html">Manage Employee</a></li>
                </ul>
            </div>

        </div>
        <div class="container">
            <div class="row">
                <div class="span12"><br/><br/>
                    <div class="span9">
                        <form:form id="form1" class="form-horizontal" method="post" commandName="user" name="registration" action="register.html" style="text-align:left;">
                            <fieldset><legend>Create Employee</legend><br/>

                                <div class="span6">
                                    <span style="color:green">${requestScope.msg }</span><br>	
                                    <div class="control-group">
                                        <label class="control-label">First Name</label>
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-user"></i></span>
                                                    <form:input path="firstname" class="input-xlarge required" id="firstName"  placeholder="First Name" required="required"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group ">
                                        <label class="control-label">Last Name</label>
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-user"></i></span>
                                                    <form:input path="lastname" class="input-xlarge required" id="lastName"  placeholder="Last Name"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Email</label>
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-envelope"></i></span>
                                                    <form:input type="email" path="emailid" class="input-xlarge required" id="email"  placeholder="Email" required="required"/><form:errors path="emailid" cssClass="my-error-class"/>
                                            </div>
                                        </div>	
                                    </div>                             
                                    <div class="control-group">
                                        <label class="control-label">Password</label>
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-lock"></i></span>
                                                    <form:password path="password" id="password" class="input-xlarge required"  placeholder="Password" required="required"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Confirm Password</label>
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-lock"></i></span>
                                                <input type="password" id="confirmPassword" class="input-xlarge required" placeholder="Re-enter Password" required="required"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group" id="selectUser">
                                        <label class="control-label">User Type</label>
                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-lock"></i></span>  
                                                    <form:select path="usertype"  id="userType" class="input-xlarge">
                                                        <form:option value="---Select The User Type---"></form:option>
                                                        <form:option value="Full Time Employee"></form:option>
                                                        <form:option value="Contractor"></form:option>
                                                    </form:select>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="control-group" id="sal">
                                        <label class="control-label">Salary</label>
                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on"><i class="icon-lock"></i></span>
                                                <form:input path="salary" id="salary" class="input-xlarge" placeholder="Enter Salary" pattern="[0-9.]{1,}" title="must be a decimal value"/>
                                            </div>
                                        </div>
                                    </div>                               

                                    <div>
                                        <div class="control-group">
                                            <label class="control-label offset5" for="input01"></label>
                                            <div class="controls">
                                                <input type="submit" class="btn btn-success" rel="tooltip" title="Add Employee" value="Add Employee"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div><br/><br/>
            <footer>
                <p class="">© Company 2013</p>
            </footer>
        </div>
        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.js"></script>
        <script src="assets/js/jquery-ui.js"></script>
    </body>
</html>


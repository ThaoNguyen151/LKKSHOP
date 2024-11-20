<%@page import="sample.user.UserError"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@page import="sample.user.UserError"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Bootstrap-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="styles/create.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-grid.min.css" type="text/css"/>
</head>
<body>
    <div class="row loginform">
        <div class="col-md-12 loginheader">
            <br/><br/>
            <h1>REGISTER</h1>
        </div>

        <!-- Display general error or success message -->
        <div class="col-md-12 text-center">
            <div class="error-message text-danger">
                ${requestScope.USER_ERROR != null && requestScope.USER_ERROR.error != null ? requestScope.USER_ERROR.error : ""}
            </div>
            <div class="success-message text-success">
                ${requestScope.USER_SUCCESS != null ? requestScope.USER_SUCCESS : ""}
            </div>
        </div>

        <div class="row infomationform">
            <form action="MainController" method="POST">
                <!-- User ID Input -->
                <div class="col-md-12 input-group input-group-lg">
                    <input 
                        class="form-control" 
                        type="text" 
                        name="userID" 
                        value="${param.userID != null ? param.userID : ""}" 
                        required 
                        placeholder="User ID" />
                    
                </div>
                 <br/>
                    <div class="text-danger small">
                        ${requestScope.USER_ERROR != null && requestScope.USER_ERROR.userIDError != null ? requestScope.USER_ERROR.userIDError : ""}
                    </div>
                <br/>

                <!-- Full Name Input -->
                <div class="col-md-12 input-group input-group-lg">
                    <input 
                        class="form-control" 
                        type="text" 
                        name="fullName" 
                        value="${param.fullName != null ? param.fullName : ""}" 
                        required 
                        placeholder="Full Name" />
                   
                </div>
                    <br/>
                    <div class="text-danger small">
                        ${requestScope.USER_ERROR != null && requestScope.USER_ERROR.fullNameError != null ? requestScope.USER_ERROR.fullNameError : ""}
                    </div>
                <br/>

                <!-- Role ID Input (Read-only) -->
                <div class="col-md-12 input-group input-group-lg">
                    <input 
                        class="form-control" 
                        type="text" 
                        name="roleID" 
                        value="US" 
                        readonly />
                </div>
                <br/>

                <!-- Password Input -->
                <div class="col-md-12 input-group input-group-lg">
                    <input 
                        class="form-control" 
                        type="password" 
                        name="password" 
                        required 
                        placeholder="Password" />
                   
                </div>
                 <br/>
                 <div class="text-danger small">
                        ${requestScope.USER_ERROR != null && requestScope.USER_ERROR.passwordError != null ? requestScope.USER_ERROR.passwordError : ""}
                    </div>
                <br/>

                <!-- Confirm Password Input -->
                <div class="col-md-12 input-group input-group-lg">
                    <input 
                        class="form-control" 
                        type="password" 
                        name="confirm" 
                        required 
                        placeholder="Confirm Password" />
                   
                </div>
                <br/>
                 <div class="text-danger small">
                        ${requestScope.USER_ERROR != null && requestScope.USER_ERROR.confirmError != null ? requestScope.USER_ERROR.confirmError : ""}
                 </div>
                <br/>

                <!-- Buttons -->
                <div class="row">
                    <div class="col-md-6">
                        <input class="btn btn-primary login-reset-btn" type="reset" value="Reset"/>
                    </div>
                    <div class="col-md-6">
                        <input class="btn btn-primary login-reset-btn" type="submit" name="action" value="Create"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

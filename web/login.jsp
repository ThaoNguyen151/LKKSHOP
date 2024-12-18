<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Bootstrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/login.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap-grid.min.css" type="text/css"/>
    </head>
    <body>
        <div class="row loginform">
            <div class="col-md-12 loginheader">
                </br>
                </br>
                <h1>LOGIN</h1>
            </div>



            <div class="col-md-12 error-message">
                ${requestScope.ERROR}
            </div>

            <div class="row infomationform">
                <form action="MainController" method="POST" id="login-form">
                    <div class="col-md-12 input-group input-group-lg">
                        <input class="form-control" type="text" name="userID" placeholder="User ID"/>
                    </div>
                    </br>
                    <div class="col-md-12 input-group input-group-lg">
                        <input class="form-control" type="password" name="password" placeholder="Password"/>
                    </div>

                    </br>
                     <!-- reCAPTCHA -->
                    <div class="col-md-12 recaptcha-box input-group">
                        <div class="g-recaptcha" data-sitekey="6LffOAwqAAAAADduXd6UhtIJXDif_HhSJ4tk_FBf"></div>
                        <div id="error"></div>  
                    </div>
                    

                    </br>
                    <div class="row">
                        <div class="col-md-6">
                            <input class="btn btn-primary login-reset-btn" type="reset" value="Reset"/>
                        </div>
                        <div class="col-md-6">
                            <input class="btn btn-primary login-reset-btn" type="submit" name="action" value="Login"/>
                        </div>
                    </div>
                </form>
            </div>
            
      

            <div class="col-md-12 login-google-btn">
                <a class="btn btn-danger google-btn" href="https://accounts.google.com/o/oauth2/auth?scope=openid%20email%20profile&redirect_uri=http://localhost:8080/SE180486_Assignment_T4S3/LoginGoogleController&response_type=code&client_id=938662090458-j9sibk247sg7lj1dscdtvus3n8uapg8v.apps.googleusercontent.com&approval_prompt=force">
                    <!--google icon start here-->
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                    <path d="M15.545 6.558a9.4 9.4 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.7 7.7 0 0 1 5.352 2.082l-2.284 2.284A4.35 4.35 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.8 4.8 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.7 3.7 0 0 0 1.599-2.431H8v-3.08z"/>
                    </svg>
                    <!--end here-->
                    Sign in with Google
                </a>
            </div>



            <div class="row direct-btn">
                <div class="col-md-6">
                    <a href="MainController?action=Create_Page">Register</a>
                </div>

                <div class="col-md-6">
                    <a href="MainController?action=Shopping_Page">LKK Shop</a>
                </div>
            </div>
        </div>
        <script src="assets/js/login.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                const form = document.getElementById("login-form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    const response = grecaptcha.getResponse();
                    if (!response) {
                        event.preventDefault();
                        error.innerHTML = "Please complete the reCAPTCHA.";
                    }
                });
            }
        </script>
    </body>
</html>
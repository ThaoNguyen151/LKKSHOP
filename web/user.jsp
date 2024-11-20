<%-- 
    Document   : user
    Created on : May 29, 2024, 4:52:05 PM
    Author     : NGUYENTRAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="sample.user.UserDTO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="styles/user.css">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container mt-5">
            <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
                <c:redirect url="login.html"></c:redirect>
            </c:if>
            <div class="card">
               <div class="card-header thanh ">
                        <h1 class="mb-0 loginheader">USER INFORMATION</h1>
                    </div>
                <div class="card-body">
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th>UserID</th>
                            <td>${sessionScope.LOGIN_USER.userID}</td>
                        </tr>
                        <tr>
                            <th>FullName</th>
                            <td>${sessionScope.LOGIN_USER.fullName}</td>
                        </tr>
                        <tr>
                            <th>RoleID</th>
                            <td>${sessionScope.LOGIN_USER.roleID}</td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td>${sessionScope.LOGIN_USER.password}</td>
                        </tr>
                    </table>
                    <c:url var="ShopLink" value="MainController">
                    <c:param name="action" value="Shopping_Page"></c:param>
                  </c:url>

                  <c:url var="ViewLink" value="MainController">
                    <c:param name="action" value="View"></c:param>
                  </c:url>
                    
                <div class="row mb-3">
                    <div class="col-md-2">    
                    </div>
                    <div class="col-md-2">
                        <a class="btn btn-danger btn-block" href="${ViewLink}">Cart</a>
                    </div>
                    <div class="col-md-2">    
                    </div>
                    <div class="col-md-2">    
                    </div>
                     <div class="col-md-2">
                        <a class="btn btn-danger btn-block" href="${ShopLink}">Shopping</a>
                    </div>
                       <div class="col-md-2">    
                    </div>
                    
                </div>
                  
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>



                
                 
                   
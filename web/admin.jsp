<%-- 
    Document   : admin
    Created on : May 29, 2024, 4:52:09 PM
    Author     : NGUYENTRAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
     <style>
            body {
                font-family: 'Arial', sans-serif;
                background: linear-gradient(to right, #cb117a, #25dcfc);
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100vh;
                margin: 0;
                color: #333;
            }
            .card-header {
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
                height: 100px; /* Bạn có thể điều chỉnh chiều cao theo ý muốn */
            }
        </style>
</head>
<body>
   
    <div class="container mt-5">
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div class="card">
            <div class="card-header">
                <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            </div>
            
            
            
            
            <div class="card-body">
               
                <c:url var="logoutLink" value="MainController">
                    <c:param name="action" value="Logout"></c:param>
                </c:url>
                
                 <c:url var="CreateLink" value="MainController">
                    <c:param name="action" value="AddProduct_Page"></c:param>
                  </c:url>
                    
                    <c:url var="EditLink" value="MainController">
                    <c:param name="action" value="Edit_Product_Page"></c:param>
                  </c:url>
                    <c:url var="ShopLink" value="MainController">
                    <c:param name="action" value="Shopping_Page"></c:param>
                  </c:url>
                    
                <div class="row mb-3">
                    <div class="col-md-3">
                        <a class="btn btn-danger btn-block" href="${logoutLink}">Logout</a>
                    </div>
                    <div class="col-md-3">
                        <a class="btn btn-danger btn-block" href="${CreateLink}">Create</a>
                    </div>
                    <div class="col-md-3">
                        <a class="btn btn-danger btn-block" href="${EditLink}">Edit</a>
                    </div>
                     <div class="col-md-3">
                        <a class="btn btn-danger btn-block" href="${ShopLink}">Shopping</a>
                    </div>
                   
                </div>
                
                
                <form action="MainController" method="POST" class="form-inline mb-3">
                    <div class="form-row align-items-center">
                        <div class="col-auto">
                            <label for="search" class="sr-only">Search</label>
                            <input type="text" class="form-control mb-2" id="search" name="search" value="${param.search}" placeholder="Search">
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary mb-2" name="action" value="Search">Search</button>
                        </div>
                    </div>
                        
                </form>
                        
                    <c:if test="${requestScope.LIST_USER != null}">
                    <c:if test="${not empty requestScope.LIST_USER}">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th>No</th>
                                    <th>User ID</th>
                                    <th>Full Name</th>
                                    <th>Role ID</th>
                                    <th>Password</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                    <tr>
                                        <form action="MainController" method="POST">
                                            <td>${counter.count}</td>
                                            <td>
                                                <input type="text" class="form-control" name="userID" value="${user.userID}" readonly>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="fullName" value="${user.fullName}" required>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="roleID" value="${user.roleID}" required>
                                            </td>
                                            <td>${user.password}</td>
                                            <td>
                                                <button type="submit" class="btn btn-warning" name="action" value="Update">Update</button>
                                                <input type="hidden" name="search" value="${param.search}">
                                            </td>
                                            <td>
                                                <c:url var="deleteProductLink" value="MainController">
                                                    <c:param name="action" value="Delete"></c:param>
                                                    <c:param name="userID" value="${user.userID}"></c:param>
                                                    <c:param name="search" value="${param.search}"></c:param>
                                                </c:url>
                                                <a class="btn btn-danger" href="${deleteProductLink}">Delete</a>
                                            </td>
                                        </form>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        ${requestScope.DELETE_ERROR}
                        ${requestScope.DELETE_SUCCESS}
                        ${requestScope.ERROR_USER_MESSAGE}
                        
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



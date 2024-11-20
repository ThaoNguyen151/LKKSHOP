<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--header of the page start here-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer Example</title>
    <style>
        .custom-bg-color {
             background-image: linear-gradient(to top, #9795f0 0%, #fbc8d4 100%);
        }
        
    </style>
</head>
<body>
    <div id="header">
    <!--Navigate-->
    <nav style="color: #1f4788" class="navbar navbar-expand-lg navbar-dark custom-bg-color fixed-top">
        <div class="container-fluid">
            <!--Logo-->
            <a class="navbar-brand" href="MainController?action=Shopping_Page">
                <img src="https://cdn.pixabay.com/photo/2020/05/14/18/41/write-5170938_1280.jpg" width="40" height="40">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!--Logo-->

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#"></a>
                    </li>

                     <li class="nav-item">
                        <a class="nav-link" href="#"></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"></a>
                    </li>
                </ul>
                <!--Search, Cart, Profile-->
              
                
                <form class="d-flex " action="MainController" method="POST">
                    <input class="form-control me-2" type="text" name="searchProduct" placeholder="Search Product" aria-label="searchProduct" value="">
                    <button class=" btn btn-outline-success" type="submit" name="action" value="Find">Search</button>
                    
                    <button class="  btn btn-outline-success ms-2 position-relative" type="submit" name="action" value="View">                                        
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                        </svg>
                        <c:if test="${sessionScope.CART != null}">
                            <c:set var="totalQuantity" value="0" />
                            <c:forEach var="product" items="${sessionScope.CART.getCart().values()}">
                                <c:set var="totalQuantity" value="${totalQuantity + product.getQuantity()}" />
                            </c:forEach>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                ${totalQuantity}
                                <span class="visually-hidden">unread messages</span>
                            </span>
                        </c:if>
                    </button> 

                    <c:if test="${sessionScope.LOGIN_USER != null}">
                        <li class="nav-item dropdown profile-menu" style="display: flex;">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownProfile" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="${sessionScope.LOGIN_USER.picture == null || sessionScope.LOGIN_USER.picture == '' ? 'assets/avatar.jpg' : sessionScope.LOGIN_USER.picture}" width="35" height="35" class="rounded-circle">
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownProfile">
                               
                                <li><button class="dropdown-item" name="action" value="Logout" type="submit">Log Out</button></li>
                            </ul>
                        </li>
                    </c:if>
                </form>
                <!--Search, Cart, Profile end-->
            </div>
        </div>
    </nav>
    <!--Navigation-->
</div>
</body>
</html>

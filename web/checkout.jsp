
<%-- 
    Document   : checkout
    Created on : Jun 22, 2024, 8:43:51 PM
    Author     : NGUYENTRAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.OrderDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Checkout Page</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include custom CSS -->
    <style>
        body {
/*           background-image: linear-gradient(to top, #9795f0 0%, #fbc8d4 100%);*/
           background-color: #f2b3eb;
        }
        .checkout-container {
            margin-top: 50px;
        }
        .order-summary {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .order-summary h3 {
            margin-bottom: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-custom {
            margin-top: 20px;
        }
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container checkout-container">
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <c:if test="${requestScope.ORDER != null}">
            <div class="order-summary">
                <h1>Thank you for purchasing</h1>
                <h3>Order Details</h3>
                <p><strong>Order ID:</strong> ${requestScope.ORDER.getOrderID()}</p>
                <p><strong>User ID:</strong> ${requestScope.ORDER.getUserID()}</p>
                <p><strong>Total Amount:</strong> ${requestScope.ORDER.getTotal()}$</p>
                <p><strong>Checkout Date:</strong> ${requestScope.ORDER.getDate()}</p>

                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>No</th>
                            <th>Order ID</th>
                            <th>Product ID</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orderDetail" varStatus="counter" items="${requestScope.LIST_ORDER_DETAIL}">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${orderDetail.getOrderID()}</td>
                                <td>${orderDetail.getProductID()}</td>
                                <td>${orderDetail.getPrice()}$</td>
                                <td>${orderDetail.getQuantity()}</td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>    
            </div>
        </c:if>

        <div class="error-message">
            <h5>${requestScope.ERROR_MESSAGE}</h5>
            <h5>${requestScope.ERROR_CART_MESSAGE}</h5>
        </div>
        
           <c:url var="ShopLink" value="MainController">
                    <c:param name="action" value="Shopping_Page"></c:param>
                  </c:url>
        
            <c:url var="CartLink" value="MainController">
                    <c:param name="action" value="View"></c:param>
                  </c:url>
        <div class="row">        
        <div class="col-md-2">
        </div>

        <div class="col-md-2">
                        <a class="btn btn-danger btn-block" href="${CartLink}">Cart</a>
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
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>
    <style>
        .fixed-size-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <%@include file="assets/header.jsp" %>
    
    <div class="container my-5">
        <h6>Search Results</h6>
        <c:if test="${empty requestScope.PRODUCT_LIST2}">
            <div class="alert alert-danger" role="alert">
                No products found.
            </div>
        </c:if>
        
        <div class="row">
            <c:forEach var="product" items="${requestScope.PRODUCT_LIST2}">
                <div class="col-md-4 mb-3">
                            <div class="card">
                                <img src="${product.getPicture()}" class="card-img-top fixed-size-img" alt="${product.getName()}">
                                <div class="card-body">
                                    <h5 class="card-title">${product.getName()}</h5>
                                    <p class="card-text">${product.getPrice()} VND</p>
                                    <p class="card-text">${product.getBrand()}</p>
                                    <form action="MainController" method="POST" class="row">
                                        <input type="hidden" name="cmbShoes" id="cmbShoes-${product.getProductID()}" value="${product.getProductID()}-${product.getName()}-${product.getPrice()}-1-${product.getPicture()}-${product.getBrand()}">
                                        <div class="col-7">
                                            <div class="input-group mb-3">
                                                <input type="number" class="form-control" id="quantity-${product.getProductID()}" value="1" min="1" onchange="updateQuantity('${product.getProductID()}')">
                                            </div>
                                        </div>
                                        <div class="col-5">
                                            <button class="btn btn-primary" type="submit" name="action" value="Add">Add to Cart</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
            </c:forEach>
        </div>
    </div>
    
    <script src="js/bootstrap.bundle.min.js"></script>
    <script>
        function updateQuantity(productId) {
            var quantity = document.getElementById('quantity-' + productId).value;
            var cmbShoes = document.getElementById('cmbShoes-' + productId);
            var values = cmbShoes.value.split('-');
            values[3] = quantity;
            cmbShoes.value = values.join('-');
        }
    </script>
    <%@include file="assets/footer.jsp" %>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LKKShop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/shopping.css" rel="stylesheet">
        <style>
            .fixed-size-img {
                width: 100%;
                height: 400px;
                object-fit: cover; /* Cắt ảnh để vừa với khung mà vẫn giữ tỉ lệ */
            }
            
         
        </style>
    </head>
    <body>
        <div>
            <!--header of the page start here-->
            <%@include file="assets/header.jsp" %>
            <!--header of the page end here-->

            <!--carousel of the page start here-->
            <div id="carouselFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://images.pexels.com/photos/53874/pexels-photo-53874.jpeg" class="d-block w-100" alt="Addidas">
                    </div>
                    
                    <div class="carousel-item">
                        <img src="https://cdn.pixabay.com/photo/2020/05/14/18/41/write-5170938_1280.jpg" class="d-block w-100" alt="Nike">
                    </div>
                    <div class="carousel-item">
                        <img src="https://images.pexels.com/photos/632470/pexels-photo-632470.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="d-block w-100" alt="Vans">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselFade" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselFade" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!--carousel of the page end here-->

            <!--body of the page start here-->
           <div class="container my-5">
                <div class="row">
                    <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
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
            <!--body of the page end here-->

            <!--footer of the page start here-->
            <%@include file="assets/footer.jsp" %>
            <!--footer of the page end here-->
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
    </body>
</html>

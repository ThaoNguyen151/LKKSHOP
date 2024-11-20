<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="sample.shopping.Product"%>
<%@ page import="sample.shopping.Cart"%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LKKShop</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/viewCart.css">
</head>
<body>
    <div>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div>   
            <h1>List Products</h1>
            <div>
                    
                
                 <c:url var="BackLink" value="MainController">
                    <c:param name="action" value="Admin_Page"></c:param>
                  </c:url>
                    
                <div class="row mb-3">
                     <form action="MainController" method="POST" style="display: flex;">
                    <span style="display: block;margin-top: 5px;margin-right: 10px;font-size: x-large;">Search: </span>
                    <input class="col-md-3" type="text" name="searchP" value="">
                    <input type="submit" name="action" value="searchProduct">
                   </form>
                    
                       <div class="col-md-3">
                    </div>
                    
                    <div class="col-md-3">
                        <a class="btn btn-danger btn-block" href="${BackLink}">Admin</a>
                    </div>
                    
                       <div class="col-md-3">
                    </div>
                    
                   </div>
                            
                <c:if test="${requestScope.LIST_PRODUCT != null}">
                    <c:if test="${not empty requestScope.LIST_PRODUCT}">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th>No</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Brand</th>
                                    <th>Edit</th>
                                  
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_PRODUCT}">
                                    <tr>
                                        <form action="EditProductController" method="POST">
                                            <td>${counter.count}</td>
                                            <td>
                                                <input type="text" class="form-control" name="productID" value="${product.getProductID()}" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="name" value="${product.getName()}" required=""/>
                                            </td>
                                            <td>
                                                <input type="number" class="form-control" min="1" name="quantity" value="${product.getQuantity()}" required=""/>
                                            </td>
                                            <td>
                                                <input type="number" class="form-control" min="1" name="price" value="${product.getPrice()}" required=""/>
                                            </td>
                                            <td>
                                                <div class="form-group col-md-12">
                                                    <label class="control-label">Ảnh sản phẩm</label>
                                                    <div id="myfileupload">
                                                        <input multiple type="file" id="uploadfile" name="picture" value="${product.getPicture()}" onchange="readURL(this);" required="required" />
                                                    </div>
                                                    <div id="thumbbox">
                                                        <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
                                                        <a class="removeimg" href="javascript:"></a>
                                                    </div>
                                                </div>
                                            </td>  
                                            <td>
                                                <input type="text" class="form-control" name="brand" value="${product.getBrand()}" required=""/>
                                            </td>      
                                            <td>
                                                <button type="submit" class="btn btn-warning" name="action" value="EditProduct">Update</button>
                                                <input type="hidden" name="searchP" value="${param.searchP}">
                                            </td>
                                            <td>
                                                <c:url var="deleteLink" value="MainController">
                                                    <c:param name="action" value="DeleteProduct"></c:param>
                                                    <c:param name="productID" value="${product.getProductID()}"></c:param>
                                                    <c:param name="search" value="${param.search}"></c:param>
                                                </c:url>
                                              
                                            </td>
                                        </form>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        ${requestScope.DELETE_ERROR}
                    </c:if>
                </c:if>
            </div>
        </div> 
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <%@include file="assets/footer.jsp" %>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                    <html lang="en">

                    <head>
                        <meta charset="utf-8" />
                        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                        <meta name="description" content="Wins IT - Dự án laptopshop" />
                        <meta name="author" content="Wins IT" />
                        <title>Order - Wins IT</title>
                        <link href="/css/styles.css" rel="stylesheet" />
                        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                            crossorigin="anonymous"></script>

                    </head>

                    <body>
                        <jsp:include page="../layout/header.jsp" />
                        <div id="layoutSidenav">
                            <jsp:include page="../layout/sidebar.jsp" />
                            <div id="layoutSidenav_content">
                                <main>
                                    <div class="container-fluid px-4">
                                        <h1 class="mt-4">Manage Orders</h1>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                            <li class="breadcrumb-item active"><a href="/admin/product">Orders</a></li>
                                            <li class="breadcrumb-item active">Detail</li>
                                        </ol>
                                        <div class="mt-5">
                                            <div class="row">
                                                <div class="col-12 mx-auto">
                                                    <div class="d-flex justify-content-between">
                                                        <h3>Order detail with id = ${id}</h3>
                                                    </div>
                                                    <hr />

                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col">Sản phẩm</th>
                                                                    <th scope="col">Tên</th>
                                                                    <th scope="col">Giá cả</th>
                                                                    <th scope="col">Số lượng</th>
                                                                    <th scope="col">Thành tiền</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="cartDetail" items="${orderDetails}"
                                                                    varStatus="status">
                                                                    <tr>
                                                                        <th scope="row">
                                                                            <div class="d-flex align-items-center">
                                                                                <img src="/images/product/${cartDetail.product.image}"
                                                                                    class="img-fluid me-5 rounded-circle"
                                                                                    style="width: 80px; height: 80px;"
                                                                                    alt="">
                                                                            </div>
                                                                        </th>
                                                                        <td>
                                                                            <p class="mb-0 mt-4"><a
                                                                                    href="/product/${cartDetail.product.id}"
                                                                                    target="_blank">${cartDetail.product.name}</a>
                                                                            </p>
                                                                        </td>
                                                                        <td>
                                                                            <p class="mb-0 mt-4">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${cartDetail.product.price}" />
                                                                                đ
                                                                            </p>
                                                                        </td>
                                                                        <td>
                                                                            <div class="input-group quantity mt-4"
                                                                                style="width: 100px;">

                                                                                <input type="text"
                                                                                    class="form-control form-control-sm text-center border-0"
                                                                                    value="${cartDetail.quantity}"
                                                                                    data-cart-detail-id="${cartDetail.id}"
                                                                                    data-cart-detail-price="${cartDetail.price}"
                                                                                    data-cart-detail-index="${status.index}" />
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <p class="mb-0 mt-4"
                                                                                data-cart-detail-id="${cartDetail.id}">
                                                                                <fmt:formatNumber type="number"
                                                                                    value="${cartDetail.product.price * cartDetail.quantity}" />
                                                                                đ
                                                                            </p>
                                                                        </td>
                                                                        <td>
                                                                            <form
                                                                                action="/delete-cart-product/${cartDetail.id}"
                                                                                method="post">
                                                                                <input type="hidden"
                                                                                    name="${_csrf.parameterName}"
                                                                                    value="${_csrf.token}">
                                                                            </form>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <a href="/admin/order" class="btn btn-success mt-3">Back</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </main>
                                <jsp:include page="../layout/footer.jsp" />
                            </div>

                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                                crossorigin="anonymous"></script>
                            <script src="/js/scripts.js"></script>
                    </body>

                    </html>
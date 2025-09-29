<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Wins IT - Dự án laptopshop" />
                    <meta name="author" content="Wins IT" />
                    <title>User - Wins IT</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
                                        <li class="breadcrumb-item active"><a href="/admin/order">Order</a></li>
                                        <li class="breadcrumb-item active">Update</li>
                                    </ol>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h4 class="mb-3">Update a order</h4>
                                                <hr />
                                                <!-- Spring form -->
                                                <form:form method="post" action="/admin/order/update"
                                                    modelAttribute="newOrder">
                                                    <p>Order id = ${newOrder.id} &nbsp;&nbsp; Price:
                                                        <fmt:formatNumber type="number"
                                                            value="${newOrder.totalPrice}" />
                                                        đ
                                                    </p>
                                                    <!-- Hidden ID -->
                                                    <form:hidden path="id" />

                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <label class="form-label">User:</label>
                                                            <input type="text" class="form-control"
                                                                value="${newOrder.user.fullName}" disabled />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="form-label">Status:</label>
                                                            <form:select path="status" cssClass="form-select">
                                                                <form:option value="PENDING" label="PENDING" />
                                                                <form:option value="PROCESSING" label="PROCESSING" />
                                                                <form:option value="COMPLETE" label="COMPLETE" />
                                                                <form:option value="CANCELLED" label="CANCELLED" />
                                                            </form:select>
                                                        </div>
                                                    </div>

                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                </body>

                </html>
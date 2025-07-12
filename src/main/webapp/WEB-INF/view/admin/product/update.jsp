<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - Hỏi Dân IT</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">User</li>
                                </ol>
                                <div class=" mt-5">
                                    <div class="row justify-content-center">
                                        <div class="col-md-6 col-12 max-auto">
                                            <h2>Update Product</h2>
                                            <hr />
                                            <form:form action="/admin/product/update" method="POST"
                                                modelAttribute="newProduct">
                                                <div class="mb-3" style="display: none;">
                                                    <label for="id" class="form-label">ID:</label>
                                                    <form:input type="id" class="form-control" path="id" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="name" class="form-label">Name:</label>
                                                    <form:input type="text" class="form-control" path="name"
                                                        disabled="true" />
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-12 col-md-6">
                                                        <label for="price" class="form-label">Price:</label>
                                                        <form:input type="number" class="form-control" path="price" />
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <label for="quantity" class="form-label">Quantity:</label>
                                                        <form:input type="number" class="form-control"
                                                            path="quantity" />
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="detailDesc" class="form-label">Description:</label>
                                                    <form:textarea type="text" class="form-control" path="detailDesc" />
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label">Factory:</label>
                                                        <form:select class="form-select" path="factory">
                                                            <form:option value="APPLE">Apple (MacBook)</form:option>
                                                            <form:option value="ACER">Acer</form:option>
                                                            <form:option value="DELL">Dell</form:option>
                                                            <form:option value="ASUS">Asus</form:option>
                                                            <form:option value="LG">LG</form:option>
                                                            <form:option value="LENOVO">Lenovo</form:option>
                                                        </form:select>
                                                    </div>

                                                    <div class="col-12 col-md-6">
                                                        <label class="form-label">Target:</label>
                                                        <form:select class="form-select" path="target">
                                                            <form:option value="GAMING">Gaming</form:option>
                                                            <form:option value="SINHVIEN-VANPHONG">Sinh Viên - Văn Phòng
                                                            </form:option>
                                                            <form:option value="THIET-KE-DO-HOA">Thiết kế đồ hoạ
                                                            </form:option>
                                                            <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                            <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div>
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </div>
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
                <script src="js/scripts.js"></script>
            </body>

            </html>
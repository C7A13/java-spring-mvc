<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
            </head>

            <body>

            </body>

            </html>
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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                    <li class="breadcrumb-item active">Product</li>
                                </ol>
                                <div class="row justify-content-center">
                                    <div class="col-md-6 col-12 max-auto">
                                        <h2>Create a product</h2>
                                        <hr />
                                        <form:form action="/admin/product/create" method="POST"
                                            modelAttribute="newProduct" enctype="multipart/form-data">
                                            <div class="row mb-3">
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" />
                                                    </c:set>
                                                    <label for="name" class="form-label">Name:</label>
                                                    <form:input type="name"
                                                        class="form-control ${not empty errorName? 'is-invalid' : ' ' } "
                                                        path="name" />
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorPrice">
                                                        <form:errors path="price" />
                                                    </c:set>
                                                    <label for="price" class="form-label">Price:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorPrice? 'is-invalid' : ' ' } "
                                                        path="price" />
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </div>
                                            </div>
                                            <div class="mb-3 col-12">
                                                <c:set var="errorDescription">
                                                    <form:errors path="detailDesc" />
                                                </c:set>
                                                <label for="description" class="form-label">Description:</label>
                                                <form:textarea type="text"
                                                    class="form-control ${not empty errorDescription? 'is-invalid' : ' ' } "
                                                    path="detailDesc" />
                                                <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="row mb-3">
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="shortDesc" class="form-label">ShortDesc</label>
                                                    <form:input type="text" class="form-control" path="shortDesc" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <c:set var="errorQuantity">
                                                        <form:errors path="quantity" />
                                                    </c:set>
                                                    <label for="quantity" class="form-label">Quantity:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorQuantity? 'is-invalid' : ' ' } "
                                                        path="quantity" />
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </div>
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
                                            <div class="col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Avatar:</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png , .jpg , .jpeg" name="loadFileUser" />
                                            </div>

                                            <div class="mb-3 mt-3">
                                                <img style="max-height: 150px; display: none;" alt="avatar preview"
                                                    id="avatarPreview" class="img-fluid rounded shadow">
                                            </div>
                                            <div class="col-12 mt-3 mb-5">
                                                <button type="submit" class="btn btn-primary">Create</button>
                                            </div>
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
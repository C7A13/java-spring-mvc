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
                                <h1 class="mt-4">Manager User</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">User</li>
                                </ol>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-md-6 col-12 max-auto">
                                    <h2>Create a user</h2>
                                    <hr />
                                    <form:form action="/admin/user/create" method="POST" modelAttribute="newUser"
                                        enctype="multipart/form-data">
                                        <div class="row mb-3">
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorEmail">
                                                    <form:errors path="email" />
                                                </c:set>
                                                <label for="email" class="form-label">Email:</label>
                                                <form:input type="email"
                                                    class="form-control ${not empty errorEmail? 'is-invalid' : ' ' } "
                                                    path="email" />
                                                <form:errors path="email" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorPassword">
                                                    <form:errors path="password" />
                                                </c:set>
                                                <label for="password" class="form-label">Password:</label>
                                                <form:input type="password"
                                                    class="form-control ${not empty errorPassword? 'is-invalid' : ' ' } "
                                                    path="password" />
                                                <form:errors path="password" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="phone" class="form-label">Phone number:</label>
                                                <form:input type="tel" class="form-control" path="phone" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorFullName">
                                                    <form:errors path="fullName" />
                                                </c:set>
                                                <label for="fullName" class="form-label">Full Name:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorFullName? 'is-invalid' : ' ' } "
                                                    path="fullName" />
                                                <form:errors path="fullName" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="mb-3">
                                                <label for="address" class="form-label">Address:</label>
                                                <form:input type="text" class="form-control" path="address" />
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-12 col-md-6">
                                                <label class="form-label">Role:</label>
                                                <form:select class="form-select" path="role.name">
                                                    <form:option value="ADMIN">ADMIN</form:option>
                                                    <form:option value="USER">USER</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Avatar:</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png , .jpg , .jpeg" name="loadFile" />
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <img style="max-height: 150px; display: none;" alt="avatar preview"
                                                id="avatarPreview" class="img-fluid rounded shadow">
                                        </div>
                                        <div class="col-12 mt-3 mb-5">
                                            <button type="submit" class="btn btn-primary">Create</button>
                                        </div>
                                    </form:form>
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
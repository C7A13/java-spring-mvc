<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="/css/test.css" rel="stylesheet">


            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h2>Table users</h2>
                            <a href="/admin/user/create" class="btn btn-primary">Create a User</a>
                        </div>
                        <hr>
                        <table class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Email</th>
                                    <th>Full Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users1}">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.email}</td>
                                        <td>${user.fullName}</td>
                                        <td>
                                            <button class="btn btn-success btn-sm me-2">View</button>
                                            <button class="btn btn-warning btn-sm me-2">Update</button>
                                            <button class="btn btn-danger btn-sm">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </body>

            </html>
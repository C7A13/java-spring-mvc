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
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-12 max-auto">
                            <h2>Create a user</h2>
                            <hr />
                            <form:form action="/admin/user/create" method="POST" modelAttribute="newUser">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email:</label>
                                    <form:input type="email" class="form-control" path="email" />
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password:</label>
                                    <form:input type="password" class="form-control" path="password" />
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone number:</label>
                                    <form:input type="tel" class="form-control" path="phone" />
                                </div>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full Name:</label>
                                    <form:input type="text" class="form-control" path="fullName" />
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address:</label>
                                    <form:input type="text" class="form-control" path="address" />
                                </div>
                                <div>
                                    <button type="submit" class="btn btn-primary">Create</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>


            </html>
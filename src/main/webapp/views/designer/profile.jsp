<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
            }

            .container {
                margin-top: 30px;
            }

            .side-bar {
                padding: 20px;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .user-info img {
                border-radius: 50%;
            }

            .user-info h4 {
                margin-top: 15px;
                font-size: 18px;
                font-weight: bold;
            }

            .user-info p {
                color: #888;
                font-size: 14px;
            }

            .content-panel {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .title {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .fieldset {
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .control-label {
                font-weight: bold;
            }

            .btn-primary {
                background-color: #007bff;
                padding: 10px 20px;
                font-size: 16px;
            }

            .btn-default {
                background-color: #6c757d;
                padding: 10px 20px;
                font-size: 16px;
                color: white;
            }

            .btn-secondary {
                background-color: #17a2b8;
                padding: 10px 20px;
                font-size: 16px;
                color: white;
            }

            input[readonly] {
                background-color: #e9ecef;
            }

        </style>
    </head>

    <body>
        <div class="container">
            <header>
                <div class="nav">
                    <a href="/designer/manage" class="nav-link">
                        <i class="fas fa-project-diagram"></i> My Projects
                    </a>

                    <div class="nav-item-group">
                        <a href="#" class="nav-link">
                            <i class="fas fa-bell"></i>
                            <span class="badge badge-danger">3</span>
                        </a>

                        <div class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="/uploads/${staff.imgURL}" alt="User Avatar" class="rounded-circle" width="40">
                                <span class="ml-2 user-name">Designer 1</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item" href="/designer/profile"><i class="fas fa-user"></i> Profile</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fas fa-paint-brush"></i> Theme</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fas fa-question-circle"></i> Help</a></li>
                                <li class="divider"></li>
                                <li><a href="/logout" class="dropdown-item btn-logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
            <div class="row">
                <div class="col-md-3">
                    <div class="side-bar">
                        <div class="user-info text-center">
                            <img class="img-profile img-circle img-responsive center-block" src="/uploads/${staff.imgURL}" alt="User Avatar" width="150" />
                            <h4>${staff.name}</h4>
                            <label class="badge badge-info">Designer</label>
                            <p>${staff.email}</p>
                        </div>
                    </div>
                </div>

                <!-- Main content area with form and account summary -->
                <div class="col-md-9">
                    <div class="content-panel">
                        <fieldset class="fieldset">
                            <h3 class="fieldset-title">Personal Info</h3>
                            <form class="form-horizontal" action="${pageContext.request.contextPath}/imageStaff/uploads" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${staff.id}">
                                <div class="form-group avatar">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img class="img-rounded img-responsive" src="/uploads/${staff.imgURL}" alt="Avatar" width="80">
                                        </div>
                                        <div class="col-md-10">
                                            <input type="file" name="file" class="file-uploader" accept="image/*" />
                                            <button type="submit" class="btn btn-secondary">Update Image</button>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <form class="form-horizontal" action="${pageContext.request.contextPath}/profileStaff/update" method="post">
                                <input type="hidden" name="id" value="${staff.id}">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Email:</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" value="${sessionScope.user.email}" readonly />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">Name:</label>
                                    <div class="col-md-10">
                                        <input name="name" type="text" class="form-control" value="${sessionScope.user.name}" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label">Phone:</label>
                                    <div class="col-md-10">
                                        <input  name="phone" type="text" class="form-control" value="${sessionScope.user.phone}" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-10 col-md-offset-2">
                                        <button class="btn btn-primary" type="submit" style="margin-bottom: 10px">Update Profile</button>
                                        <br>
                                        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#changePasswordModal">Change Password</button>
                                        <a class="btn btn-secondary" href="/forgot-password">Forgot Password</a>
                                    </div>
                                </div>
                            </form>
                        </fieldset>

                        <fieldset class="fieldset">
                            <h3 class="fieldset-title">Account Summary</h3>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Total Project:</label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control" value="${totalDesign}" readonly />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">Total Design In Process:</label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control" value="${totalDesignInProcess}" readonly />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">Total Design In Process:</label>
                                <div class="col-md-10">
                                    <input type="text" class="form-control" value="${totalDesignComplete}" readonly />
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Change Password -->
        <div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="changePasswordModalLabel">Change Password</h4>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/profileStaff/changePassword" method="post">
                            <input type="hidden" name="id" value="${staff.id}">
                            <div class="form-group">
                                <label for="currentPassword">Current Password</label>
                                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                            </div>
                            <div class="form-group">
                                <label for="newPassword">New Password</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Confirm Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Change Password</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function togglePassword(fieldId) {
                var field = document.getElementById(fieldId);
                var icon = field.nextElementSibling.querySelector('.fas');

                if (field.type === "password") {
                    field.type = "text";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                } else {
                    field.type = "password";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                }
            }
            $(document).on('click', '[data-toggle="modal"]', function () {
                console.log('Modal button clicked');
            });
            $(document).ready(function () {
                if (typeof $().modal == 'function') {
                    console.log('Bootstrap modal function exists.');
                } else {
                    console.log('Bootstrap modal function does not exist.');
                }
            });

        </script>
        <c:if test="${not empty message}">
            <script>
                alert("${message}");
            </script>
        </c:if>
        <!-- jQuery and Bootstrap Scripts -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

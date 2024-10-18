<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f3f4f6;
        }

        .container {
            margin-top: 30px;
        }

        .side-bar {
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .side-bar:hover {
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.2);
        }

        .user-info img {
            border-radius: 50%;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .user-info h4 {
            margin-top: 15px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .user-info p {
            color: #888;
            font-size: 14px;
        }

        .content-panel {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .content-panel:hover {
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        }

        .title {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: bold;
            color: #007bff;
        }

        .fieldset {
            margin-bottom: 30px;
        }

        .form-group label {
            font-weight: bold;
            color: #333;
        }

        .btn-primary {
            background-color: #007bff;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 25px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-default {
            background-color: #6c757d;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            border-radius: 25px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-default:hover {
            background-color: #5a6268;
        }

        .btn-secondary {
            background-color: #17a2b8;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            border-radius: 25px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #138496;
        }

        input[readonly] {
            background-color: #e9ecef;
        }

        .password-field {
            position: relative;
        }

        .password-field input {
            padding-right: 40px;
        }

        .password-field .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #888;
        }

        .nav-link {
            font-size: 18px;
            color: #007bff;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #0056b3;
        }
        .password-field .toggle-password {
            margin-top: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <%@include file="navbarConsultruction.jsp" %>

    <div class="row">
        <div class="col-md-3">
            <div class="side-bar">
                <div class="user-info text-center">
                    <img class="img-profile img-circle img-responsive center-block" src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "/SWPKoiContructor/assets/imgs/logo/final_resized_colored_logo_image.png"}"
                         alt="User Avatar" width="150" />
                    <h4>${user.name}</h4>
                    <label class="badge badge-info">Constructor</label>
                    <p>${user.email}</p>
                </div>
            </div>
        </div>

        <!-- Main content area with form and account summary -->
        <div class="col-md-9">
            <div class="content-panel">
                <fieldset class="fieldset">
                    <h3 class="title">Personal Info</h3>
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/imageStaff/uploads" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${user.id}">
                        <div class="form-group avatar">
                            <div class="row">
                                <div class="col-md-2">
                                    <img class="img-rounded img-responsive" src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "/SWPKoiConstructor/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt="Avatar" width="80">
                                </div>
                                <div class="col-md-10">
                                    <input type="file" name="file" class="file-uploader" accept="image/*" />
                                    <button type="submit" class="btn btn-secondary">Update Image</button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <form class="form-horizontal" action="${pageContext.request.contextPath}/profileStaff/update" method="post">
                        <input type="hidden" name="id" value="${user.id}">
                        <div class="form-group">
                            <label class="col-md-2 control-label">Email:</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" value="${user.email}" readonly />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">Name:</label>
                            <div class="col-md-10">
                                <input name="name" type="text" class="form-control" value="${user.name}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label">Phone:</label>
                            <div class="col-md-10">
                                <input name="phone" type="text" class="form-control" value="${user.phone}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-2">
                                <button class="btn btn-primary" type="submit">Update Profile</button>
                                <button class="btn btn-default ml-2" type="button" data-toggle="modal" data-target="#changePasswordModal">Change Password</button>
                                <a class="btn btn-secondary ml-2" href="${pageContext.request.contextPath}/forgot-password">Forgot Password</a>
                            </div>
                        </div>
                    </form>
                </fieldset>

                <fieldset class="fieldset">
                    <h3 class="title">Account Summary</h3>
                    <div class="form-group">
                        <label class="col-md-4 control-label">Total Projects:</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${totalConstruction}" readonly />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">Total Construction In Process:</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${totalConstructionInProcess}" readonly />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label">Total Construction Completed:</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" value="${totalConstructionComplete}" readonly />
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
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="form-group password-field">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('currentPassword')"></i>
                    </div>
                    <div class="form-group password-field">
                        <label for="newPassword">New Password</label>
                        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('newPassword')"></i>
                    </div>
                    <div class="form-group password-field">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('confirmPassword')"></i>
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
        var icon = field.nextElementSibling;

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
</script>
<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    $('#changePasswordModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    });
</script>
</body>
</html>

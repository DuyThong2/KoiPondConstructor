<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />

    <title>My Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <%@include file="cssTemplate.jsp"%>
    <link href="<c:url value='/css/profile.css'/>" rel="stylesheet">
    <style>

        .modal {
            opacity: 1 !important; /* Đảm bảo modal không bị trong suốt */
        }
        .btn-update{
            padding: 15px;
            font-size: 13px;
            border-radius: 15px;
        }
        @media (min-width: 992px) {
            .view-account .content-panel {
                min-height: 800px;
                border-left: 1px solid #f3f3f7;
                margin-left: 250px;
            }
            .view-account .side-bar .side-menu .nav > li > a {
                display: block;
                color: #9499a3;
                padding: 13px 15px;
                padding-left: 30px;
                width: 250px;
            }
        }

    </style>
</head>
<%@include file="homePageNavbar.jsp"%>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
<div class="container mt-5">
    <div class="view-account">
        <section class="module">
            <div class="module-inner">
                <div class="side-bar">
                    <div class="user-info">
                        <img class="img-profile img-circle img-responsive center-block"
                             src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "/SWPKoiConstructor/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt />
                        <ul class="meta list list-unstyled">
                            <li class="name">
                                ${user.name}
                                <br>
                                <label class="label label-info">Customer</label>
                            </li>
                            <li class="email">
                                <a href="#"><span>${user.email}</span></a>
                            </li>
                        </ul>
                    </div>
                    <nav class="side-menu">
                        <ul class="nav">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/customer/profile"><span class="fa fa-user"></span> Profile</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/customer/contract">
                                    <span class="fas fa-file-contract"></span> My Contract</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/customer/projects/">
                                    <span class="fas fa-project-diagram"></span> My Project</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/customer/quote"><span class="bi bi-bar-chart-line"></span> Quotes</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/customer/serviceDetails"><span class="bi bi-bar-chart-line"></span> Service</a>
                            </li>
                        </ul>
                    </nav>
                </div>

                <div class="content-panel">
                    <h2 class="title">
                        Profile<span class="pro-label label label-warning">PRO</span>
                    </h2>

                    <fieldset class="fieldset">
                        <h3 class="fieldset-title">Personal Info</h3>
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/image/uploads" method="post" enctype="multipart/form-data">
                            <div class="form-group avatar">

                                <figure class="figure col-md-2 col-sm-3 col-xs-12">
                                    <img class="img-rounded img-responsive" src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "/SWPKoiConstructor/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt/>
                                </figure>
                                <input type="hidden" name="id" value="${user.id}">

                                <div class="form-inline col-md-10 col-sm-9 col-xs-12">
                                    <input type="file" name="file" class="file-uploader pull-left" accept="image/*"/>
                                    <button type="submit"  class="btn btn-secondary btn-img pull-left">Update Image</button>
                                </div>
                            </div>
                        </form>
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/profile/update" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${user.id}">
                            <div class="form-group">
                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Email</label>
                                <div class="col-md-10 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" name="email" value="${user.email}" readonly/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Name</label>
                                <div class="col-md-10 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control input-group" name = "name" value="${user.name}" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Phone: </label>
                                <div class="col-md-10 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control input-group" name="phone" value="${user.phone}" />
                                </div>
                            </div>

                            <!-- Nút Update Profile -->
                            <div class="form-group" style="margin-top: 30px">
                                <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                    <button class="btn btn-primary btn-update" type="submit">Update Profile</button>
                                    <a class="btn btn-sm btn-default-alt btn-change-password btn-update" data-toggle="modal" data-target="#changePasswordModal">Change Password</a>
                                    <a class="btn btn-sm btn-default-alt btn-forgot-password btn-update" href="${pageContext.request.contextPath}/forgot-password">Forgot Password</a>
                                </div>
                            </div>
                        </form>

                    </fieldset>
                    <form class="form-horizontal">

                        <fieldset class="fieldset">
                            <h3 class="fieldset-title">Account Summary</h3>
                            <div class="form-group">
                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Total Project</label>
                                <div class="col-md-10 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" value="${totalProject}" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Total Service</label>
                                <div class="col-md-10 col-sm-9 col-xs-12">
                                    <input type="email" class="form-control" value="${totalService}" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 col-sm-3 col-xs-12 control-label">Loyalty Points: </label>
                                <div class="col-md-10 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" value="${totalPoint} points" readonly />
                                </div>
                            </div>

                        </fieldset>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

<!-- Modal Change Password -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="changePasswordModalLabel">Change Password</h4>
            </div>
            <form action="${pageContext.request.contextPath}/profile/changePassword" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <div class="modal-body">
                    <div class="form-group password-wrapper">
                        <label for="currentPassword">Current Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                            <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="fas fa-eye toggle-password" onclick="togglePassword('currentPassword')"></i>
                                        </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group password-wrapper">
                        <label for="newPassword">New Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                            <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="fas fa-eye toggle-password" onclick="togglePassword('newPassword')"></i>
                                        </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group password-wrapper">
                        <label for="confirmPassword">Confirm New Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                            <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="fas fa-eye toggle-password" onclick="togglePassword('confirmPassword')"></i>
                                        </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Change Password</button>
                </div>
            </form>
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

</script>

<%@include file="footer.jsp"%>
<%@include file="scriptTemplate.jsp"%>
<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>

<script>
    $('#changePasswordModal').on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    });
</script>
</body>
</html>

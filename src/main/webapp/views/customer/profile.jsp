<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />

        <title>Update user profile - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <%@include file="cssTemplate.jsp"%>
        <link href="<c:url value='/css/profile.css'/>" rel="stylesheet">
        <style>

            .modal {
                opacity: 1 !important; /* Đảm bảo modal không bị trong suốt */
            }

        </style>
    </head>
    <%@include file="homePageNavbar.jsp"%>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
        <div class="container">
            <div class="view-account">
                <section class="module">
                    <div class="module-inner">
                        <div class="side-bar">
                            <div class="user-info">
                                <img class="img-profile img-circle img-responsive center-block"
                                     src="/uploads/${customer.imgURL}" alt />
                                <ul class="meta list list-unstyled">
                                    <li class="name">
                                        ${customer.name}
                                        <br>
                                        <label class="label label-info">Customer</label>
                                    </li>
                                    <li class="email">
                                        <a href="#"><span>${customer.email}</span></a>
                                    </li>
                                </ul>
                            </div>
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
                                            <img class="img-rounded img-responsive" src="/uploads/${customer.imgURL}" alt/>
                                        </figure>
                                        <input type="hidden" name="id" value="${customer.id}">

                                        <div class="form-inline col-md-10 col-sm-9 col-xs-12">
                                            <input type="file" name="file" class="file-uploader pull-left" accept="image/*"/>
                                            <button type="submit"  class="btn btn-secondary btn-img pull-left">Update Image</button>
                                        </div>
                                    </div>
                                </form>
                                <form class="form-horizontal" action="${pageContext.request.contextPath}/profile/update" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="${customer.id}">
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Email</label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" name="email" value="${sessionScope.user.email}" readonly/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Name</label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control input-group" name = "name" value="${sessionScope.user.name}" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Phone: </label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control input-group" name="phone" value="${sessionScope.user.phone}" />
                                        </div>
                                    </div>

                                    <!-- Nút Update Profile -->
                                    <div class="form-group" style="margin-top: 30px">
                                        <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                            <button class="btn btn-primary" type="submit">Update Profile</button>
                                        </div>
                                    </div>
                                </form>

                                <!-- Chuyển các nút Change Password xuống dưới -->
                                <div class="form-group" style="margin-top: 20px;">
                                    <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                        <a class="btn btn-sm btn-default-alt btn-change-password" data-toggle="modal" data-target="#changePasswordModal">Change Password</a>
                                        <a class="btn btn-sm btn-default-alt btn-forgot-password" href="/forgot-password">Forgot Password</a>
                                    </div>
                                </div>

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
                        <input type="hidden" name="id" value="${customer.id}">
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


    </body>
</html>

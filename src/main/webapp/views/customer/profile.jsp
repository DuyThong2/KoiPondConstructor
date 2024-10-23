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
        <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
        <style>
            .row {
                margin-right: -190px;
                margin-left: -15px;
            }

            .modal {
                opacity: 1 !important;
            }

            .btn-update {
                background-color: #007bff;
                color: white;
                font-size: 16px;
                padding: 10px 20px;
                border-radius: 10px;
                border: none; /* Remove borders */
                box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
                transition: all 0.3s ease;
                font-weight: bold;
            }
            .content-panel {
                background: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .btn-update:hover {
                background-color: #00509d;
                box-shadow: 0 6px 14px rgba(0, 80, 157, 0.4);
                transform: translateY(-2px);
            }

            .btn-change-password {
                background-color: #28a745;
                color: white;
                font-size: 16px;
                padding: 10px 20px;
                border-radius: 10px;
                border: none;
                box-shadow: 0 4px 10px rgba(40, 167, 69, 0.2);
                transition: all 0.3s ease;
                font-weight: bold;
            }

            .btn-change-password:hover {
                background-color: #1e7e34;
                box-shadow: 0 6px 14px rgba(30, 126, 52, 0.4);
                transform: translateY(-2px);
            }

            .btn-forgot-password {
                background-color: #ffc107;
                color: black;
                font-size: 16px;
                padding: 10px 20px;
                border-radius: 10px;
                border: none;
                box-shadow: 0 4px 10px rgba(255, 193, 7, 0.2);
                transition: all 0.3s ease;
                font-weight: bold;
            }

            .btn-forgot-password:hover {
                background-color: #e0a800;
                box-shadow: 0 6px 14px rgba(224, 168, 0, 0.4);
                transform: translateY(-2px);
            }
            /* Modal Styling */
            .modal-content {
                border-radius: 10px; /* Rounded corners */
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Shadow for depth */
                background-color: #f9f9f9; /* Softer background color */
            }

            .modal-header {
                border-top-left-radius: 10px; /* Rounded top left corner */
                border-top-right-radius: 10px; /* Rounded top right corner */
            }

            .modal-title {
                font-size: 3.3rem;
            }

            /* Buttons Styling */
            .modal-footer {
                border-top: none; /* Remove the top border */
                display: flex;
            }

            .modal-footer .btn {
                padding: 10px 20px;
                border-radius: 10px;
                font-weight: bold;
                font-size: 1.5rem;
                transition: all 0.3s ease;
            }

            /* Change Password Button */
            .btn-dark {
                background-color: #000000;
                color: white;
                border: none;
                border-radius: 10px;
            }

            .btn-dark:hover {
                background-color: #6c757d;
            }
            .btn-img{
                background-color: #3e3838;
                color: white;
                border: none;
                border-radius: 9px;
                padding: 8px 15px;
            }
            .btn-img:hover {
                background-color: #6c757d;
                color: white;
            }
            /* Focus States */
            .form-control:focus {
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Glow effect on focus */
                border-color: #007bff; /* Border color on focus */
            }

            /* Icon Size */
            .fas.fa-eye, .fas.fa-eye-slash {
                font-size: 1.2rem;
            }

            /* Improved layout for small screens */
            @media (max-width: 576px) {
                .modal-content {
                    border-radius: 0;
                }
                .btn-forgot-password{
                    margin-top: 15px;
                }
            }
            @media (min-width: 768px) {
                .form-horizontal .control-label {
                    font-size: 20px;
                    margin-top: 8px;
                }
            }
            .password-field input {
                padding-right: 40px;
                font-size: 20px;
                border-radius: 14px;
            }
            input[type=text]{
                font-size: 20px;
            }
            .input-group>.form-control{
                background-color: #dcdcdc;
            }
        </style>
    </head>
    <%@include file="homePageNavbar.jsp"%>
    <body>
        <section id="services"
                 class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
            <div class="container rr-shape-p-c_1">
                <div class="service__shape-1 rr-shape-p-s_1 leftRight">
                    <div></div>
                </div>

                <div class="row mb-30 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                    <div class="col-md-6">
                        <div class="section__title-wrapper text-center text-xl-start">
                            <span class="section__subtitle justify-content-start mb-13"><span data-width="40px"
                                                                                              class="left-separetor"></span>Yourself</span>
                            <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                data-cursor="-opaque">Information
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
                                        <a href="${pageContext.request.contextPath}/customer/consultant">
                                            <span class="bi bi-briefcase"></span> My Consultant</a>
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
                                        <a href="${pageContext.request.contextPath}/customer/quote">
                                            <i class="bi bi-file-earmark-text"></i>Quotes</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/customer/serviceDetails">
                                            <span class="bi bi-bar-chart-line"></span> Service</a>

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
                                            <button type="submit"  class="btn btn-img pull-left">Update Image</button>
                                        </div>
                                    </div>
                                </form>
                                <form class="form-horizontal" action="${pageContext.request.contextPath}/profile/update" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="${user.id}">
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Email</label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="text" name="email" value="${user.email}" readonly/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Name</label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="text" class="input-group" style="background-color: #f5f5f5" name = "name" value="${user.name}" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Phone: </label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="text" class="input-group" style="background-color: #f5f5f5" name="phone" value="${user.phone}" />
                                        </div>
                                    </div>

                                    <!-- Nút Update Profile -->
                                    <div class="form-group" style="margin-top: 30px">
                                        <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                            <!-- Update Profile Button -->
                                            <button class="btn btn-update" type="submit">Update Profile</button>

                                            <!-- Change Password Button -->
                                            <a class="btn btn-sm btn-change-password" data-toggle="modal" data-target="#changePasswordModal">Change Password</a>

                                            <!-- Forgot Password Button -->
                                            <a class="btn btn-sm btn-forgot-password" href="${pageContext.request.contextPath}/forgot-password">Forgot Password</a>

                                        </div>
                                    </div>
                                </form>
                                <br>
                            </fieldset>
                            <form class="form-horizontal">

                                <fieldset class="fieldset">
                                    <h3 class="fieldset-title">Account Summary</h3>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Total Projects: </label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="text" value="${totalProject}" readonly/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Total Services: </label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="email" value="${totalService}" readonly/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 col-sm-3 col-xs-12 control-label">Loyalty Points: </label>
                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                            <input type="text" value="${totalPoint} points" readonly />
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </div>
                    </div>
                </section>
                <!-- Popup cho success -->
                <div id="successPopup" class="popup-background">
                    <div class="popup-box success">
                        <i class="fas fa-check-circle"></i> <!-- Icon success -->
                        <h2 class="success">Success!</h2>
                        <p>${success}</p>
                        <button class="close-btn" onclick="closePopup()">Close</button>
                    </div>
                </div>

                <!-- Popup cho error -->
                <div id="errorPopup" class="popup-background">
                    <div class="popup-box error">
                        <i class="fas fa-exclamation-circle"></i> <!-- Icon lỗi -->
                        <h2 class="error">Error!</h2>
                        <p>${error}</p>
                        <button class="close-btn" onclick="closePopup()">Close</button>
                    </div>
                </div>


                <script>
                    function showSuccessPopup() {
                        const successPopup = document.getElementById('successPopup');
                        successPopup.classList.add('show');
                        const popupBox = successPopup.querySelector('.popup-box');
                        setTimeout(() => {
                            popupBox.classList.add('show');
                        }, 10);
                    }

                    function showErrorPopup() {
                        const errorPopup = document.getElementById('errorPopup');
                        errorPopup.classList.add('show');
                        const popupBox = errorPopup.querySelector('.popup-box');
                        setTimeout(() => {
                            popupBox.classList.add('show');
                        }, 10);
                    }

                    function closePopup() {
                        const popups = document.querySelectorAll('.popup-background.show');
                        popups.forEach(popup => {
                            const popupBox = popup.querySelector('.popup-box');
                            popupBox.classList.remove('show');
                            setTimeout(() => {
                                popup.classList.remove('show');
                            }, 300);
                        });
                    }

                </script>

                <c:if test="${not empty success}">
                    <script>
                        showSuccessPopup();
                    </script>
                </c:if>

                <c:if test="${not empty error}">
                    <script>
                        showErrorPopup();
                    </script>
                </c:if>

            </div>
            <%@include file="spacing.jsp"%>
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
                                <label class="control-label" for="currentPassword">Current Password</label>
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
                                    <input type="password" class="form-control" id="newPassword" name="newPassword" required minlength="8">
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
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required minlength="8">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <i class="fas fa-eye toggle-password" onclick="togglePassword('confirmPassword')"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-dark">Change Password</button>
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

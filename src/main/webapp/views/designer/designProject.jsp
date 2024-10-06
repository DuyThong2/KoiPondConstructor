
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project and Customer Information</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">

        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .info-section {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .info-box {
                width: 68%;
                background-color: #fff;
                padding: 23px;
                margin: 5px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .info-box-small {
                width: 30%;
                background-color: #ffffff;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .info-item p, .info-item textarea {
                background-color: #f0f0f0;
                padding: 12px;
                border-radius: 5px;
                margin-bottom: 15px;
                font-size: 1rem;
            }

            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
                font-weight: bold;
                padding: 10px 20px;
                width: 100%;
                border-radius: 5px;
            }

            h4 {
                font-size: 1.5rem;
                color: #343a40;
                margin-bottom: 20px;
            }

            .btn {
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn-primary {
                background-color: #6c63ff;
                border-color: #6c63ff;
            }

            .btn-primary:hover {
                background-color: #5753e8;
            }
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

    <body>

        <div class="container">
            <header>
                <div class="nav">
                    <a href="/designer/manage" class="nav-link">
                        <i class="fas fa-project-diagram"></i> My Projects
                    </a>
                    <!-- Search box -->
                    <input type="text" placeholder="Search..." id="search">

                    <!-- Notifications icon with badge -->
                    <div class="nav-item-group">
                        <a href="#" class="nav-link">
                            <i class="fas fa-bell"></i>
                            <span class="badge badge-danger">3</span> <!-- Số thông báo chưa đọc -->
                        </a>
                        <!-- Dropdown menu for Settings -->
                        <div class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-cogs"></i> Settings
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/profile">Profile</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#themeModal">Theme</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/help">Help</a>
                                <div class="dropdown-divider"></div>
                                <!-- Logout button in dropdown -->
                                <a href="/logout" class="dropdown-item btn-logout">
                                    <i class="fas fa-sign-out-alt"></i> Logout
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Info Sections -->
            <div class="info-section">
                <!-- Customer Information -->
                <div class="info-box info-box-small">
                    <h4>Customer Information</h4>
                    <div class="info-item">
                        <p><strong>Name:</strong> ${customer.name}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Phone Number:</strong> ${customer.phone}</p>
                    </div>
                    <div class="info-item mb-4">
                        <p><strong>Email:</strong> ${customer.email}</p>
                    </div>

                </div>

                <!-- Project Information -->
                <div class="info-box">
                    <h4>Project Information</h4>
                    <div class="info-item">
                        <p><strong>Project Name:</strong> ${project.projectName}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Address:</strong> ${project.address}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Design Aesthetic:</strong> ${project.style}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Area (m²):</strong> ${quote.quotesArea}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Description:</strong> ${project.description}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Start Date:</strong> ${project.dateStart}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>End Date:</strong>
                            <c:choose>
                                <c:when test="${empty project.dateEnd}">Not yet</c:when>
                                <c:otherwise>${project.dateEnd}</c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                    <div class="info-item">
                        <p><strong>Project Status:</strong>
                            <c:choose>
                                <c:when test="${project.status == 1}">Pending</c:when>
                                <c:when test="${project.status == 2}">Processing</c:when>
                                <c:when test="${project.status == 3}">Completed</c:when>
                                <c:when test="${project.status == 4}">Canceled</c:when>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="themeModal" tabindex="-1" role="dialog" aria-labelledby="themeModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="themeModalLabel">Choose Theme</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <button id="lightTheme" class="btn btn-light btn-block">Light Theme</button>
                            <button id="darkTheme" class="btn btn-dark btn-block">Dark Theme</button>
                        </div>
                    </div>
                </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Gán sự kiện cho các nút chọn theme
                var lightThemeBtn = document.getElementById('lightTheme');
                var darkThemeBtn = document.getElementById('darkTheme');

                if (lightThemeBtn) {
                    lightThemeBtn.addEventListener('click', function () {
                        document.body.classList.remove('dark-mode');
                        localStorage.setItem('theme', 'light'); // Lưu lựa chọn vào localStorage
                        $('#themeModal').modal('hide');
                    });
                }

                if (darkThemeBtn) {
                    darkThemeBtn.addEventListener('click', function () {
                        document.body.classList.add('dark-mode');
                        localStorage.setItem('theme', 'dark'); // Lưu lựa chọn vào localStorage
                        $('#themeModal').modal('hide');
                    });
                }

                // Kiểm tra và áp dụng theme từ LocalStorage khi load trang
                var savedTheme = localStorage.getItem('theme');
                if (savedTheme === 'dark') {
                    document.body.classList.add('dark-mode');
                } else if (savedTheme === 'light') {
                    document.body.classList.remove('dark-mode');
                }
            });

        </script>
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
    <%@include file="../footer.jsp"%>

</html>

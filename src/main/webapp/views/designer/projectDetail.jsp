<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


            h3 {
                font-size: 1.5rem;
                color: #343a40;
                margin-bottom: 20px;
                font-weight: bold;
                border-bottom: 2px solid #343a40;
                padding-bottom: 10px;
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

                    <!-- Thông báo và cài đặt -->
                    <div class="nav-item-group">
                        <!-- Notifications icon with badge -->
                        <a href="#" class="nav-link">
                            <i class="fas fa-bell"></i>
                            <span class="badge badge-danger">3</span> <!-- Số thông báo chưa đọc -->
                        </a>

                        <!-- Avatar và tên người dùng -->
                        <div class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                <img src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt="User Avatar" class="rounded-circle" width="40">
                                <span class="ml-2 user-name">${sessionScope.user.name}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/designer/profile">Profile</a>
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
                    <h3>Customer Information</h3>
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
                    <h3>Project Information</h3>
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
                        <p><strong>Start Date:</strong><fmt:formatDate value="${project.dateStart}" pattern="dd-MM-yyyy"/></p>
                    </div>
                    <div class="info-item">
                        <p><strong>End Date:</strong>
                            <c:choose>
                                <c:when test="${empty project.dateEnd}">Not yet</c:when>
                                <c:otherwise><fmt:formatDate value="${project.dateEnd}" pattern="dd-MM-yyyy"/></c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                    <div class="info-item">
                        <p><strong>Project Status:</strong>
                            <c:choose>
                                <c:when test="${project.status == 1}">
                                    <span class="badge badge-secondary">Pending</span>
                                </c:when>
                                <c:when test="${project.status == 2}">
                                    <span class="badge badge-primary">Processing</span>
                                </c:when>
                                <c:when test="${project.status == 3}">
                                    <span class="badge badge-success">Completed</span>
                                </c:when>
                                <c:when test="${project.status == 4}">
                                    <span class="badge badge-warning">Canceled</span>
                                </c:when>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>

</html>

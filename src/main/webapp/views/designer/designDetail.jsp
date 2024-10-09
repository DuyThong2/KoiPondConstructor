<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Design Project Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <style>
            .left-column {
                width: 33%;
                margin: 15px 0px 15px 20px;
                padding: 25px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .right-column {
                width: 63%;
                padding: 25px;
                margin: 15px 0 15px 15px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .img-box {
                height: 300px;
                width: 100%;
                background-color: #e9ecef;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1.2rem;
                color: #6c757d;
                margin-bottom: 20px;
                border-radius: 8px;
            }
            .stage-tabs {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }
            .stage-tabs button {
                margin: 0 10px;
                border-radius: 15px;
                padding: 13px 15px;
                font-size: 14px;
            }
            .detail-name-bar {
                display: flex;
                flex-wrap: wrap;
                margin-top: 15px;
            }
            .badge-status {
                font-size: 14px;
                padding: 5px 13px;
                margin-right: 10px;
                margin-bottom: 10px;
                border-radius: 15px;
                text-transform: capitalize;
            }

            /* Màu sắc cho badge */
            .badge-status.success {
                background-color: #28a745;
                color: white;
            }
            .badge-status.proccessing {
                background-color: #0d6efd;
                color: white;
            }
            .badge-status.pending {
                background-color: #6c757d;
                color: white;
            }

            .badge-status.canceled {
                background-color: #ffc107;
                color: white;
            }

            .card {
                margin-bottom: 20px;
                border: none;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            }

            .card-body h4 {
                font-size: 1.5rem;
                margin-bottom: 15px;
            }

            .card-body p {
                font-size: 1rem;
                margin-bottom: 10px;
            }

            .notes-box {
                background-color: #f0f0f0;
                padding: 15px;
                height: 200px;
                border-radius: 5px;
            }
            h3 {
                font-size: 1.5rem;
                color: #343a40;
                margin-bottom: 20px;
                font-weight: bold;
                border-bottom: 2px solid #343a40;
                padding-bottom: 10px;
            }
            h2 {
                font-size: 2.2rem;
                color: #343a40;
                margin-bottom: 10px;
                font-weight: bold;
                border-bottom: 2px solid #343a40;
                padding-bottom: 10px;
            }
            .btn-info {
                font-weight: 600;
                font-size: 1rem;
                border-radius: 8px;
                width: 100%;
                max-width: 170px;
                display: inline-block;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: box-shadow 0.3s ease, transform 0.3s ease;
            }

            .btn-info:hover {
                box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
                transform: translateY(-2px);
            }
        </style>
    </head>

    <body>
        <div class="container mt-5">
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
                                <img src="/assets/imgs/logo/final_resized_colored_logo_image.png" alt="User Avatar" class="rounded-circle" width="40">
                                <span class="ml-2 user-name">${sessionScope.user.name}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
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

            <div class="row">
                <!-- Left Column -->
                <div class="left-column">
                    <div class="img-box">
                        <img src="/uploads/${project.imgURL}" alt="Project Image">
                    </div>
                    <!-- Notes Section -->
                    <div class="notes-box">
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
                </div>
                <!-- Right Column -->
                <div class="right-column">
                    <h2 class="card-title text-center">Design Project Information</h2>
                    <br>
                    <!-- Stage Selection Buttons -->
                    <div class="stage-tabs" id="stage-buttons">
                        <button class="btn btn-outline-dark" data-stage="Conceptual Design" data-status="0">Conceptual Design</button>
                        <button class="btn btn-outline-dark" data-stage="Detail Design" data-status="0">Detail Design</button>
                        <button class="btn btn-outline-dark" data-stage="Construction Design" data-status="0">Construction Design</button>
                    </div>

                    <!-- Display the Design Stages -->
                    <c:forEach var="stage" items="${designStages}">
                        <div class="card mb-4">
                            <div class="card-body">
                                <!-- Add Link to Blueprint Management Page -->
                                <h4><a href="${pageContext.request.contextPath}/designer/manage/blueprint/${stage.designStageId}">${stage.designStageName}</a></h4>
                                <p><strong>Stage Status:</strong>
                                    <c:choose>
                                        <c:when test="${stage.designStageStatus == 1}">
                                            <span class="badge badge-secondary badge-status">Pending</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 2}">
                                            <span class="badge badge-primary badge-status">Processing</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 3}">
                                            <span class="badge badge-secondary badge-status">Canceled</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 4}">
                                            <span class="badge badge-success badge-status">Complete</span>
                                        </c:when>
                                    </c:choose>
                                </p>

                                <!-- Display Detail Names with Status -->
                                <div class="detail-name-bar">
                                    <c:forEach var="detail" items="${stage.designDetail}">
                                        <span class="badge-status
                                              <c:if test="${detail.status == 1}">pending</c:if>
                                              <c:if test="${detail.status == 2}">proccessing</c:if>
                                              <c:if test="${detail.status == 3}">canceled</c:if>
                                              <c:if test="${detail.status == 4}">success</c:if> ">
                                                ${detail.name}
                                        </span>
                                    </c:forEach>
                                </div>

                                <p><strong>Price:</strong> ${stage.designStagePrice}</p>
                                <c:if test="${stage.designStageStatus == 4}">
                                    <p><strong>Summary File:</strong> <a href="/download/${stage.summaryFile}">Download</a></p>
                                </c:if>
                                <a href="/designer/updateStatus/designStage/${stage.designStageId}?designId=${designId}" class="btn btn-info">Update Progress</a>

                            </div>
                        </div>

                        <!-- Pass the stage status to the buttons via data attributes -->
                        <script>
                            document.querySelector(`[data-stage='${stage.designStageName}']`).setAttribute('data-status', '${stage.designStageStatus}');
                        </script>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- JavaScript to dynamically change button color based on stage status -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Loop over the buttons
                document.querySelectorAll('#stage-buttons button').forEach(function (button) {
                    const stageStatus = button.getAttribute('data-status');
                    if (stageStatus == 2 || stageStatus == 3) {
                        button.classList.remove('btn-outline-dark');
                        button.classList.add('btn-primary');
                    }
                    // If stage status is 4, change the button color to success
                    if (stageStatus == 4) {
                        button.classList.remove('btn-outline-dark');
                        button.classList.add('btn-success');
                    }
                });
            });
        </script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

</html>

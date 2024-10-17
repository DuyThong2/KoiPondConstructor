<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Construction Project Details</title>
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
            .feedback-section {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
                margin-top: 30px;
            }

            .feedback-section h3 {
                font-size: 2.7rem;
                margin-bottom: 15px;
            }

            .feedback-section textarea {
                border-radius: 8px;
                font-size: 15px;
            }
            .feedback-section {
                margin-top: 20px;
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .comment{
                margin: 10px;
                padding: 10px 10px;
                width: 400px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .feedback-content {
                max-height: 300px; /* Điều chỉnh chiều cao theo ý muốn */
                overflow-y: auto;  /* Hiển thị thanh cuộn dọc */
                    padding-right: 10px; /* Để không bị che nội dung bởi thanh cuộn */
            }
        </style>
        <script>
            // Hiển thị form edit khi người dùng nhấn vào nút Edit
            function editComment(commentId) {
                document.getElementById("comment-content-" + commentId).style.display = "none"; // Ẩn nội dung comment
                document.getElementById("edit-section-" + commentId).style.display = "block"; // Hiện textarea
            }

            // Ẩn form edit và hiển thị lại nội dung comment khi người dùng nhấn Cancel
            function cancelEdit(commentId) {
                document.getElementById("comment-content-" + commentId).style.display = "block"; // Hiện lại nội dung comment
                document.getElementById("edit-section-" + commentId).style.display = "none"; // Ẩn textarea
            }
        </script>
    </head>
    <body>
        <div class="container">
            <header>
                <div class="nav">
                    <a href="${pageContext.request.contextPath}/constructor/manage" class="nav-link">
                        <i class="fas fa-project-diagram"></i> My Projects
                    </a>
                    <a href="${pageContext.request.contextPath}/constructor/serviceDetailManage" class="nav-link">
                        <i class="fas fa-project-diagram"></i> My Service Details
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
                                <a class="dropdown-item" href="/constructor/profile">Profile</a>
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
                        <img src="/uploads/${construction.project.imgURL}" alt="Construction Project Image">
                    </div>

                    <!-- Feedback Section-->
                    <div class="feedback-section">
                        <h5 class="text-success " style="font-weight: bold">Box Chat:</h5>
                        <div class="feedback-content">
                            <c:forEach var="comment" items="${comments}">
                                <div class="feedback-item">
                                    <div class="d-flex justify-content-between">
                                        <div class="comment">
                                            <div id="comment-content-${comment.commentId}">
                                                <c:if test="${comment.customer != null}">
                                                    <p><strong>Customer: ${comment.customer.name}</strong></p>
                                                </c:if>

                                                <c:if test="${comment.staff != null}">
                                                    <p><strong>Staff: ${comment.staff.name}</strong></p>
                                                </c:if>
                                                <p class="text-muted small mb-0"><fmt:formatDate value="${comment.datePost.time}" pattern="dd-MM-yyyy HH:mm"/></p>
                                                <p class="mb-2"> ${comment.commentContent}</p>
                                            </div>

                                            <!-- Hiển thị textarea để chỉnh sửa khi nhấn nút Edit -->
                                            <div id="edit-section-${comment.commentId}" style="display: none;">
                                                <form action="${pageContext.request.contextPath}/staff/feedback/update" method="POST">
                                                    <input type="hidden" name="commentId" value="${comment.commentId}">
                                                    <textarea name="newContent" class="form-control mb-2">${comment.commentContent}</textarea>
                                                    <button type="submit" class="btn btn-primary btn-sm">Save</button>
                                                    <button type="button" class="btn btn-secondary btn-sm" onclick="cancelEdit(${comment.commentId})">Cancel</button>
                                                </form>
                                            </div>
                                        </div>

                                        <!-- Nút ba chấm ... -->
                                        <c:if test="${sessionScope.user.id == comment.staff.id}">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    ...
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                                    <!-- Nút Edit -->
                                                    <button type="button" class="dropdown-item" onclick="editComment(${comment.commentId})">Edit</button>

                                                    <!-- Nút Delete -->
                                                    <form action="${pageContext.request.contextPath}/staff/feedback/delete" method="POST" onsubmit="return confirm('Are you sure you want to delete this comment?');">
                                                        <input type="hidden" name="commentId" value="${comment.commentId}">
                                                        <button type="submit" class="dropdown-item text-danger">Delete</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!--End Feedback -->
                </div>

                <!-- Right Column -->
                <div class="right-column">
                    <h2 class="card-title mb-3 text-center">Construction Project Information</h2>
                    <br>
                    <!-- Stage Selection Buttons -->
                    <div class="stage-tabs" id="stage-buttons">
                        <button class="btn btn-outline-dark" data-stage="Raw Construction" data-status="0">Raw Construction</button>
                        <button class="btn btn-outline-dark" data-stage="Complete Construction" data-status="0">Complete Construction</button>
                    </div>

                    <!-- Display the Construction Stages -->
                    <c:forEach var="stage" items="${constructionStages}">
                        <div class="card mb-3">
                            <div class="card-body">
                                <!-- Add Link to Construction Stage Management Page -->
                                <h4>${stage.constructionStageName}</h4>
                                <p><strong>Stage Status:</strong>
                                    <c:choose>
                                        <c:when test="${stage.constructionStageStatus == 1}">
                                            <span class="badge badge-secondary badge-status">Pending</span>
                                        </c:when>
                                        <c:when test="${stage.constructionStageStatus == 2}">
                                            <span class="badge badge-primary badge-status">Processing</span>
                                        </c:when>
                                        <c:when test="${stage.constructionStageStatus == 3}">
                                            <span class="badge badge-secondary badge-status">Canceled</span>
                                        </c:when>
                                        <c:when test="${stage.constructionStageStatus == 4}">
                                            <span class="badge badge-success badge-status">Accepted</span>
                                        </c:when>
                                    </c:choose>
                                </p>
                                <p><strong>Price:</strong> ${stage.constructionStagePrice}</p>

                                <a href="/staff/updateStatus/constructionStage/${stage.constructionStageId}?constructionId=${constructionId}" class="btn btn-info">Update Status</a>

                            </div>
                        </div>

                        <!-- Pass the stage status to the buttons via data attributes -->
                        <script>
                            document.querySelector(`[data-stage='${stage.constructionStageName}']`).setAttribute('data-status', '${stage.constructionStageStatus}');
                        </script>
                    </c:forEach>
                </div>
            </div>

            <!-- Feedback Section -->
            <form action="${pageContext.request.contextPath}/staff/feedback/send" method="POST">
                <input type="hidden" name="constructionId" value="${construction.constructionId}">
                <div class="feedback-section">
                    <h3>Feedback</h3>
                    <div class="form-group">
                        <label for="feedback">Please provide your feedback:</label>
                        <textarea class="form-control" id="feedback" name="feedback" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" style="padding: 10px; font-size: 15px">Send Feedback</button>
                </div>
            </form>

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
                        button.classList.remove('btn-outline-primary');
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

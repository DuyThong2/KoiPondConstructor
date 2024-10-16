<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Construction Project Details</title>
        <!-- Use Bootstrap 4.3.1 from CDN -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <%@include file="../cssTemplate.jsp"%>

        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
            }

            .container {
                max-width: 95%;
                margin: 20px auto;
            }

            .btn {
                transition: all 0.3s ease;
            }

            .btn:hover {
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            }

            .left-column {
                width: 30%;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-right: 10px;
            }

            .right-column {
                width: 69%;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
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

            .badge-status.success {
                background-color: #28a745;
                color: white;
            }
            .badge-status.processing {
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

            .project-description, .additional-info {
                margin-top: 20px;
                padding: 15px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .image-gallery img {
                width: 30%; /* Điều chỉnh kích thước ảnh nếu cần */
                margin-right: 5px;
                margin-bottom: 5px;
                border-radius: 5px;
                transition: transform 0.3s ease;
            }

            .image-gallery img:hover {
                transform: scale(1.05); /* Phóng to nhẹ khi hover */
            }
            .payment-status {
                font-size: 1.8rem;
                color: #28a745;
                margin-bottom: 10px;
                font-weight: bold;
            }
            p {
                margin-bottom: 3px;
            }
            h4 {
                font-size: 2.4rem;
                color: #343a40;
                margin-bottom: 20px;
            }
            .btn-lg {
                font-size: 1.5rem; /* Điều chỉnh kích thước font */
                padding: 15px 30px; /* Điều chỉnh padding */
                margin: 10px;
                float: right;
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
            function createPayPalButton(detailId, constructionStageId, constructionId, amount, targetId) {
                const target = document.getElementById(targetId);
                if (!target) {
                    console.error('Target not found:', targetId);
                    return;
                }

                const form = document.createElement('form');
                form.action = '/paypal/pay/construction';
                form.method = 'post';

                form.innerHTML = `
                        <input type="hidden" name="detailId" value="` + detailId + `" />
                        <input type="hidden" name="constructionStageId" value="` + constructionStageId + `" />
                        <input type="hidden" name="constructionId" value="` + constructionId + `" />
                        <input type="hidden" name="amount" value="` + amount + `" />
                        <button type="submit" class="btn btn-primary btn-lg">Pay with PayPal</button>
                    `;

                target.appendChild(form);
            }

            // Function to create Approve and Reject buttons and insert them into the correct target location
            function createApproveRejectButtons(detailId, constructionStageId, constructionId, targetId) {
                const target = document.getElementById(targetId);
                if (!target) {
                    console.error('Target not found:', targetId);
                    return;
                }

                const approveForm = document.createElement('form');
                approveForm.action = '/customer/approveInspection';
                approveForm.method = 'post';
                approveForm.style = 'display:inline; margin-right: 10px;';
                approveForm.innerHTML = `
                        <input type="hidden" name="detailId" value="` + detailId + `" />
                        <input type="hidden" name="constructionStageId" value="` + constructionStageId + `" />
                        <input type="hidden" name="constructionId" value="` + constructionId + `" />
                        <button type="submit" class="btn btn-success btn-lg">Approve</button>
                    `;

                const rejectForm = document.createElement('form');
                rejectForm.action = '/customer/rejectInspection';
                rejectForm.method = 'post';
                rejectForm.style = 'display:inline;';
                rejectForm.innerHTML = `
                        <input type="hidden" name="detailId" value="` + detailId + `" />
                        <input type="hidden" name="constructionStageId" value="` + constructionStageId + `" />
                        <input type="hidden" name="constructionId" value="` + constructionId + `" />
                        <button type="submit" class="btn btn-danger btn-lg">Reject</button>
                    `;

                target.appendChild(approveForm);
                target.appendChild(rejectForm);
            }

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

    <%@include file="../homePageNavbar.jsp"%>

    <body>
        <div class="container ">
            <!-- Navigation -->


            <div class="row">
                <div class="col-md-4 left-column">
                    <div class="img-box">
                        <img src="/uploads/${construction.project.imgURL}" alt="Construction Image">
                    </div>
                    <!-- Project Description -->
                    <div class="project-description">
                        <h4>Construction Description</h4>
                        <p>${construction.project.description}</p>
                    </div>

                    <!-- Additional Information -->
                    <div class="additional-info">
                        <h4>Additional Information</h4>
                        <p><strong>Start Date:</strong><fmt:formatDate value="${construction.project.dateStart}" pattern="dd-MM-yyyy"/></p>
                        <p><strong>Expected End Date:</strong><fmt:formatDate value="${construction.project.dateEnd}" pattern="dd-MM-yyyy"/></p>
                        <p><strong>Team:</strong>
                            <c:forEach var="staff" items="${construction.constructionStaffs}">
                                | ${staff.staff.name} |
                            </c:forEach>
                        </p>
                    </div>

                    <!-- Feedback Section-->
                    <div class="feedback-section">
                        <h5 class="text-success">Box Chat:</h5>
                        <div class="feedback-content">
                            <c:forEach var="comment" items="${comments}">
                                <div class="feedback-item">
                                    <div class="d-flex justify-content-between">
                                        <div class="comment">
                                            <!-- Hiển thị nội dung comment hoặc textarea nếu đang edit -->
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
                                                <form action="${pageContext.request.contextPath}/customer/feedback/update" method="POST">
                                                    <input type="hidden" name="commentId" value="${comment.commentId}">
                                                    <textarea name="newContent" class="form-control mb-2">${comment.commentContent}</textarea>
                                                    <button type="submit" class="btn btn-primary btn-sm">Save</button>
                                                    <button type="button" class="btn btn-secondary btn-sm" onclick="cancelEdit(${comment.commentId})">Cancel</button>
                                                </form>
                                            </div>
                                        </div>

                                        <!-- Nút ba chấm ... -->
                                        <c:if test="${sessionScope.user.id == comment.customer.id}">
                                            <div class="dropdown">
                                                <button class="btn btn-link text-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    ...
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                                    <!-- Nút Edit -->
                                                    <button type="button" class="dropdown-item" onclick="editComment(${comment.commentId})">Edit</button>

                                                    <!-- Nút Delete -->
                                                    <form action="${pageContext.request.contextPath}/customer/feedback/delete" method="POST" onsubmit="return confirm('Are you sure you want to delete this comment?');">
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
                <div class="col-md-8 right-column">
                    <h2 class="card-title mb-3 text-center">Information Of Construction</h2>
                    <p>Construction Name: ${construction.constructionName}</p>
                    <p>Construction Status: 
                        <c:choose>
                            <c:when test="${construction.constructionStatus == 1}">
                                <span class="badge badge-secondary">Pending</span>
                            </c:when>
                            <c:when test="${construction.constructionStatus == 2}">
                                <span class="badge badge-primary">Processing</span>
                            </c:when>
                            <c:when test="${construction.constructionStatus == 3}">
                                <span class="badge badge-success">Completed</span>
                            </c:when>
                            <c:when test="${construction.constructionStatus == 4}">
                                <span class="badge badge-warning">Canceled</span>
                            </c:when>
                        </c:choose>
                    </p>
                    <p><strong>Area (m²):</strong> ${quote.quotesArea}</p>

                    <h2 class="card-title mb-3 text-center">Construction Stages</h2>

                    <div class="stage-tabs" id="stage-buttons">
                        <button class="btn btn-outline-dark" data-stage="Raw Construction" data-status="0">Raw Construction</button>
                        <button class="btn btn-outline-dark" data-stage="Complete Construction" data-status="0">Complete Construction</button>
                    </div>

                    <!-- Display the Construction Stages -->
                    <c:forEach var="stage" items="${constructionStages}">
                        <div class="card mb-3">
                            <div class="card-body">
                                <h4>
                                    <a data-status="${stage.constructionStageStatus}" class="construction-stage-link" 
                                       href="${pageContext.request.contextPath}/customer/project/construction/blueprint/${stage.constructionStageId}">
                                        ${stage.constructionStageName}
                                    </a>
                                </h4>
                                <p>Status: 
                                    <c:choose>
                                        <c:when test="${stage.constructionStageStatus == 1}">
                                            <span class="badge badge-secondary">Pending</span>
                                        </c:when>
                                        <c:when test="${stage.constructionStageStatus == 2}">
                                            <span class="badge badge-primary">Processing</span>
                                        </c:when>
                                        <c:when test="${stage.constructionStageStatus == 3}">
                                            <span class="badge badge-warning">Canceled</span>
                                        </c:when>
                                        <c:when test="${stage.constructionStageStatus == 4}">
                                            <span class="badge badge-success">Completed</span>
                                        </c:when>
                                    </c:choose>
                                </p>

                                <!-- Display Detail Names with Status -->
                                <div class="detail-name-bar">
                                    <c:forEach var="detail" items="${stage.constructionStageDetail}">
                                        <span class="badge-status
                                              <c:if test="${detail.constructionStageDetailStatus == 1}">pending</c:if>
                                              <c:if test="${detail.constructionStageDetailStatus == 2}">processing</c:if>
                                              <c:if test="${detail.constructionStageDetailStatus == 3}">canceled</c:if>
                                              <c:if test="${detail.constructionStageDetailStatus == 4}">success</c:if>">
                                            ${detail.constructionStageDetailName}
                                        </span>

                                        <!-- If the current stage detail is Payment and it's in processing or pending state -->
                                        <c:if test="${detail.constructionStageDetailName.equals('Payment') && detail.constructionStageDetailStatus == 2}">
                                            <script>
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    createPayPalButton(${detail.constructionStageDetailId}, ${stage.constructionStageId}, ${construction.constructionId}, ${stage.constructionStagePrice}, "button-placement-${stage.constructionStageId}");
                                                });
                                            </script>
                                        </c:if>

                                        <c:if test="${detail.constructionStageDetailName.equals('Inspection') && detail.constructionStageDetailStatus == 2}">
                                            <script>
                                                document.addEventListener('DOMContentLoaded', function () {
                                                    createApproveRejectButtons(${detail.constructionStageDetailId}, ${stage.constructionStageId}, ${construction.constructionId}, "button-placement-${stage.constructionStageId}");
                                                });
                                            </script>
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <p id="construction-stage-price">
                                    <strong>Price:</strong> ${stage.constructionStagePrice}
                                </p>

                                <p id="payment-status-${stage.constructionStageId}" class="payment-status"></p>
                                <!-- Display if payment status is complete -->
                                <script>
                                    (function () {
                                        var paymentStatusElement = document.getElementById('payment-status-${stage.constructionStageId}');
                                    <c:forEach var="detail" items="${stage.constructionStageDetail}">
                                        <c:choose>
                                            <c:when test="${detail.constructionStageDetailName == 'Payment' && detail.constructionStageDetailStatus == 4}">
                                        paymentStatusElement.innerHTML = 'Complete Payment';
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                        if (paymentStatusElement.innerHTML == '') {
                                            paymentStatusElement.style.display = 'none';
                                        }
                                    })();
                                </script>
                                <!-- Unique button placement for this stage -->
                                <div id="button-placement-${stage.constructionStageId}">
                                    <!-- Buttons will be inserted here dynamically -->
                                </div>

                            </div>
                        </div>

                        <script>
                            document.querySelector(`[data-stage='${stage.constructionStageName}']`).setAttribute('data-status', '${stage.constructionStageStatus}');
                        </script>
                    </c:forEach>
                </div>

                <!-- Feedback Section -->
                <form action="${pageContext.request.contextPath}/customer/feedback/send" method="POST">
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
        </div>

        <!-- Script to dynamically change button color based on stage status -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('#stage-buttons button').forEach(function (button) {
                    const stageStatus = button.getAttribute('data-status');
                    if (stageStatus == 2 || stageStatus == 3) {
                        button.classList.remove('btn-outline-dark');
                        button.classList.add('btn-primary');
                    }
                    if (stageStatus == 4) {
                        button.classList.remove('btn-outline-dark');
                        button.classList.add('btn-success');
                    }
                });
            });
        </script>

        <!-- Script for construction-stage link interaction -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelectorAll('.construction-stage-link').forEach(function (link) {
                    link.addEventListener('click', function (event) {
                        const stageStatus = this.getAttribute('data-status');
                        if (stageStatus == 1) {
                            event.preventDefault();
                            alert('Construction stage is pending. Please wait for the team to complete the work.');
                        }
                    });
                });
            });
        </script>



        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Design Project Details</title>
        <!-- Sử dụng Bootstrap 4.3.1 từ CDN -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                padding-top: 80px;
            }

            /* Sửa container để phù hợp hơn với Bootstrap grid */
            .container {
                max-width: 95%;
                margin: 20px auto;
            }

            /* Cải tiến header với đổ bóng và độ trong suốt */
            .nav {
                margin-bottom: 10px;
                padding: 20px;
                background-color: rgba(52, 58, 64, 0.9); /* Màu đen trong suốt */
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-radius: 10px;
                position: fixed;
                top: 0;
                width: 95%;
                z-index: 1000;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Đổ bóng và thêm hiệu ứng hover cho các button */
            .btn {
                transition: all 0.3s ease;
            }

            .btn:hover {
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            }

            .btn-logout {
                background-color: #dc3545;
                color: white;
                padding: 8px 15px;
                border-radius: 5px;
                border: none;
                font-size: 16px;
                font-weight: bold;
            }

            .btn-logout:hover {
                background-color: #c82333;
            }

            /* Cải thiện bố cục cột với Bootstrap */
            .left-column {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .right-column {
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
                margin-right: 10px;
            }

            .detail-name-bar {
                display: flex;
                flex-wrap: wrap;
                margin-top: 15px;
            }

            /* Badge trạng thái */
            .badge-status {
                font-size: 14px;
                padding: 8px 15px;
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

            /* Thêm độ bóng nhẹ cho các thẻ card */
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

            /* Image gallery cải thiện */
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
                font-size: 1rem;
                color: #28a745;
                margin-bottom: 10px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <!-- Navigation -->
            <header>
                <div class="nav">
                    <div class="nav-links">
                        <a href="#">Home</a>
                        <a href="#">Projects</a>
                        <a href="#">Team</a>
                    </div>
                    <button class="btn btn-logout">Logout</button>
                </div>
            </header>

            <div class="row">
                <div class="col-md-4 left-column">
                    <div class="img-box">
                        <img src="/uploads/${project.imgURL}" alt="Project Image">
                    </div>
                    <!-- Project Description -->
                    <div class="project-description">
                        <h4>Project Description</h4>
                        <p>${project.description}</p>
                    </div>

                    <!-- Additional Information -->
                    <div class="additional-info">
                        <h4>Additional Information</h4>
                        <p><strong>Start Date:</strong> ${project.dateStart}</p>
                        <p><strong>Expected End Date:</strong> ${project.dateEnd}</p>
                        <p><strong>Design Team:</strong>
                            <c:forEach var="staff" items="${design.staff}">
                                | ${staff.name} |
                            </c:forEach>
                        </p>
                    </div>
                </div>
                <!-- Right Column -->
                <div class="col-md-8 right-column">
                    <h2 class="card-title mb-3 text-center">Information Of Design</h2>
                    <p>Design's Name: ${design.designName}</p>
                    <p>Design Status: 
                        <c:choose>
                            <c:when test="${design.status == 1}">
                                <span class="badge badge-secondary">Pending</span>
                            </c:when>
                            <c:when test="${design.status == 2}">
                                <span class="badge badge-primary">Processing</span>
                            </c:when>
                            <c:when test="${design.status == 3}">
                                <span class="badge badge-success">Completed</span>
                            </c:when>
                            <c:when test="${design.status == 4}">
                                <span class="badge badge-warning">Canceled</span>
                            </c:when>
                        </c:choose>
                    </p>
                    <p>Area (m²): ${quote.quotesArea}</p>

                    <h2 class="card-title mb-3 text-center">Stage Of Design</h2>

                    <div class="stage-tabs" id="stage-buttons">
                        <button class="btn btn-outline-dark" data-stage="Conceptual Design" data-status="0">Conceptual Design</button>
                        <button class="btn btn-outline-dark" data-stage="Detail Design" data-status="0">Detail Design</button>
                        <button class="btn btn-outline-dark" data-stage="Construction Design" data-status="0">Construction Design</button>
                    </div>

                    <!-- Display the Design Stages -->
                    <c:forEach var="stage" items="${designStages}">
                        <div class="card mb-3">
                            <div class="card-body">
                                <h4>
                                    <a data-status="${stage.designStageStatus}" class="design-stage-link " 
                                       href="${pageContext.request.contextPath}/customer/project/design/blueprint/${stage.designStageId}">
                                        ${stage.designStageName}
                                    </a>
                                </h4>
                                <p>Status: 
                                    <c:choose>
                                        <c:when test="${stage.designStageStatus == 1}">
                                            <span class="badge badge-secondary">Pending</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 2}">
                                            <span class="badge badge-primary">Processing</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 3}">
                                            <span class="badge badge-secondary">Canceled</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 4}">
                                            <span class="badge badge-success">Accepted</span>
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

                                <p id="design-stage-price">
                                    <strong>Price:</strong> ${stage.designStagePrice}
                                </p>
                                <!-- Add a unique ID for each payment-status -->
                                <p id="payment-status-${stage.designStageId}" class="payment-status"></p>
                                <%--Display if payment of status is complete --%>
                                <script>
                                    // Check payment status for each stage
                                    (function () {
                                        var paymentStatusElement = document.getElementById('payment-status-${stage.designStageId}');
                                    <c:forEach var="detail" items="${stage.designDetail}">
                                        <c:choose>
                                            <c:when test="${detail.name == 'Payment' && detail.status == 4}">
                                        paymentStatusElement.innerHTML = 'Complete Payment';
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                        // If no payment status, hide the element
                                        if (paymentStatusElement.innerHTML == '') {
                                            paymentStatusElement.style.display = 'none';
                                        }
                                    })();
                                </script>

                                <c:if test="${stage.designStageStatus == 4}">
                                    <p><strong>Summary File:</strong> <a href="${stage.summaryFile}">Download</a></p>
                                </c:if>
                            </div>
                        </div>

                        <script>
                            document.querySelector(`[data-stage='${stage.designStageName}']`).setAttribute('data-status', '${stage.designStageStatus}');
                        </script>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Script to dynamically change button color based on stage status -->
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

        <!-- Script for design-stage link interaction -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Lắng nghe sự kiện click cho các liên kết của design stage
                document.querySelectorAll('.design-stage-link').forEach(function (link) {
                    link.addEventListener('click', function (event) {
                        const stageStatus = this.getAttribute('data-status');

                        // Kiểm tra trạng thái, nếu là 1 thì ngăn không cho chuyển trang
                        if (stageStatus == 1) {
                            event.preventDefault(); // Ngăn không cho chuyển trang
                            alert('Design stage is pending. Please wait for the design team to complete the work.'); // Hiển thị thông báo
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
</html>


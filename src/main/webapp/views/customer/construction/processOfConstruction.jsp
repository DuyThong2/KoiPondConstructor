<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Construction Project Details</title>
        <!-- Sử dụng Bootstrap 4.3.1 từ CDN -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
            <%@include file="../cssTemplate.jsp"%>

        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                padding-top: 80px;
            }

            .container {
                max-width: 95%;
                margin: 20px auto;
            }

            .nav {
                margin-bottom: 10px;
                padding: 20px;
                background-color: rgba(52, 58, 64, 0.9);
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

            .left-column, .right-column {
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

            .badge-status {
                font-size: 14px;
                padding: 8px 15px;
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

            .detail-name-bar {
                display: flex;
                flex-wrap: wrap;
                margin-top: 15px;
            }

            .payment-status {
                font-size: 1rem;
                color: #28a745;
                margin-bottom: 10px;
                font-weight: bold;
            }
        </style>
    </head><%@include file="../homePageNavbar.jsp"%>

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
                        <p><strong>Start Date:</strong> ${construction.project.dateStart}</p>
                        <p><strong>Expected End Date:</strong> ${construction.project.dateEnd}</p>
                        <p><strong>Team:</strong>
                            <c:forEach var="staff" items="${construction.constructionStaffs}">
                                | ${staff.staff.name} |
                            </c:forEach>
                        </p>
                    </div>
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

                                        <!-- Check if this is the inspection stage (ensure case-sensitive check) -->
                                        <c:if test="${detail.constructionStageDetailName.equals('Inspection') && detail.constructionStageDetailStatus == 2}">
                                            <div class="d-flex justify-content-center mt-2">
                                                <!-- Approve Button -->
                                                <form action="${pageContext.request.contextPath}/customer/approveInspection" method="post" style="display:inline; margin-right: 10px;">
                                                    <input type="hidden" name="detailId" value="${detail.constructionStageDetailId}" />
                                                    <input type="hidden" name="constructionStageId" value="${stage.constructionStageId}" />
                                                    <input type="hidden" name="constructionId" value="${construction.constructionId}" />
                                                    <button type="submit" class="btn btn-success btn-md">Approve</button>
                                                </form>

                                                <!-- Reject Button -->
                                                <form action="${pageContext.request.contextPath}/customer/rejectInspection" method="post" style="display:inline;">
                                                    <input type="hidden" name="detailId" value="${detail.constructionStageDetailId}" />
                                                    <input type="hidden" name="constructionStageId" value="${stage.constructionStageId}" />
                                                    <input type="hidden" name="constructionId" value="${construction.constructionId}" />
                                                    <button type="submit" class="btn btn-danger btn-md">Reject</button>
                                                </form>
                                            </div>
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


                            </div>
                        </div>

                        <script>
                            document.querySelector(`[data-stage='${stage.constructionStageName}']`).setAttribute('data-status', '${stage.constructionStageStatus}');
                        </script>
                    </c:forEach>
                </div>
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

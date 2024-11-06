<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Construction Stage Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .title {
                font-weight: bold;
                color: #007bff;
                border-bottom: 2px solid #007bff;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
            /* Table Styling */
            .table {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            .table th, .table td {
                vertical-align: middle;
                text-align: center;
            }

            .thead-dark th {
                background-color: #343a40;
                color: #ffffff;
                font-size: 1.1rem;
                padding: 15px;
            }

            .table td {
                padding: 15px;
                font-size: 0.95rem;
            }

            /* Badge Styling */
            .badge-status {
                font-size: 14px;
                padding: 8px 15px;
                border-radius: 15px;
                text-transform: capitalize;
            }

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
            /* Button Styling */
            .btn-custom {
                border-radius: 5px;
                padding: 10px 20px;
                font-size: 0.9rem;
                margin: 5px;
            }

            .btn-success, .btn-info {
                font-size: 0.9rem;
                padding: 10px 20px;
            }

            .detail-name-bar {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                margin-bottom: 20px;
            }

            .detail-name-bar .badge-status {
                margin-right: 10px;
                margin-bottom: 10px;
            }
            /* Styling for Collapse Card */
            .collapse-card {
                background-color: #ffffff;
                border: 1px solid #e0e0e0;
                border-radius: 5px;
                padding: 15px;
                margin-top: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                font-size: 1.1rem;
            }

            .collapse-header {
                font-weight: bold;
                color: #007bff;
                margin-bottom: 10px;
                font-size: 1.4rem; 
            }

            .collapse-detail {
                display: flex;
                align-items: center;
                padding-left: 15px; 
                margin: 0 0 10px 400px;
            }

            .collapse-detail strong {
                color: #343a40;
                min-width: 80px;
            }

            .collapse-detail .badge {
                margin-right: 5px;
            }
            .detail-value {
                flex: 1;
            }
            /* Media Query for Responsive Design */
            @media (max-width: 768px) {
                .table {
                    font-size: 0.85rem;
                }

                .btn-custom {
                    font-size: 0.85rem;
                }
            }
        </style>
    </head>
    <div style="height:6vh;"></div>
    <body>

        <!-- Main Container -->
        <!-- Main Container -->
        <div class="container-fluid">
            <div class="row">
                <!-- Header Section -->
                <%@include file="../navBar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
                    <h2 class="title">Manage Construction Stage Details</h2>

                    <!-- Project Info Section -->
                    <div class="project-info">
                        <h4>Project Information</h4>
                        <p><strong>Project Name:</strong> ${project.projectName}</p>
                        <p><strong>Project Address:</strong> ${project.address}</p>
                        <p><strong>Start Date:</strong> ${project.dateStart}</p>
                        <p><strong>End Date:</strong>
                            <c:choose>
                                <c:when test="${empty project.dateEnd}">Not yet</c:when>
                                <c:otherwise>${project.dateEnd}</c:otherwise>
                            </c:choose>
                        </p>
                        <p><strong>Project Description:</strong> ${project.description}</p>
                    </div>

                    <!-- Raw Construction Stage Table -->
                    <h4 class="text-center">Raw Construction</h4>
                    <table class="table table-hover table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Stage Name</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th style="width: 250px">Payment Process</th>
                                <th style="width: 150px">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Iterate over Raw Construction stages -->
                            <c:forEach var="rawStage" items="${rawConstructionStages}">
                                <tr>
                                    <td>${rawStage.constructionStageName}</td>
                                    <td>${rawStage.constructionStagePrice}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${rawStage.constructionStageStatus == 1}">
                                                <span class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when test="${rawStage.constructionStageStatus == 2}">
                                                <span class="badge badge-primary">Processing</span>
                                            </c:when>
                                            <c:when test="${rawStage.constructionStageStatus == 3}">
                                                <span class="badge badge-warning">Canceled</span>
                                            </c:when>
                                            <c:when test="${rawStage.constructionStageStatus == 4}">
                                                <span class="badge badge-success">Completed</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${rawStage.constructionStageDescription}</td>
                                    <td>

                                        <!-- Display action for payment -->
                                        <c:set var="allPreviousCompleted" value="true" />

                                        <!-- Iterate over all construction details to find the 'Payment' step -->
                                        <c:forEach var="detail" items="${rawStage.constructionStageDetail}">
                                            <!-- Check if any detail before 'Payment' is not completed -->
                                            <c:if test="${detail.constructionStageDetailStatus != 4 && detail.constructionStageDetailName != 'Payment'}">
                                                <c:set var="allPreviousCompleted" value="false" />
                                            </c:if>

                                            <!-- Show the form for payment if all previous are completed -->
                                            <c:if test="${detail.constructionStageDetailName == 'Payment' && allPreviousCompleted}">
                                                <form action="${pageContext.request.contextPath}/constructionStageDetail/updateStatus" method="post" onsubmit="return confirmStatusChange();">
                                                    <input type="hidden" name="detailId" value="${detail.constructionStageDetailId}">
                                                    <input type="hidden" name="constructionId" value="${construction.constructionId}">
                                                    <input type="hidden" name="constructionStageId" value="${rawStage.constructionStageId}">

                                                    <div class="action-buttons mt-2 d-flex align-items-center">
                                                        <select class="form-control text-center" name="newStatus" required
                                                                ${rawStage.constructionStageStatus != 2 || detail.constructionStageDetailStatus == 4 ? 'disabled' : ''}>
                                                            <option value="2" ${detail.constructionStageDetailStatus == 2 ? 'selected' : ''}>Processing</option>
                                                            <option value="4" ${detail.constructionStageDetailStatus == 4 ? 'selected' : ''}>Completed</option>
                                                        </select>
                                                        <button type="submit" class="btn btn-primary ml-1"
                                                                ${rawStage.constructionStageStatus != 2 || detail.constructionStageDetailStatus == 4 ? 'disabled' : ''}>
                                                            Update
                                                        </button>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                    <td><button class="btn btn-primary" data-toggle="collapse" data-target="#details-${rawStage.constructionStageId}" aria-expanded="false" aria-controls="details-${rawStage.constructionStageId}">
                                            View Details
                                        </button></td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <div id="details-${rawStage.constructionStageId}" class="collapse">
                                            <div class="collapse-card">
                                                <div class="collapse-header">Stage Details</div>
                                                <c:forEach var="detail" items="${rawStage.constructionStageDetail}">
                                                    <div class="collapse-detail">
                                                        <strong>Detail:</strong> ${detail.constructionStageDetailName},
                                                        <strong>Status:</strong>
                                                        <c:choose>
                                                            <c:when test="${detail.constructionStageDetailStatus == 1}">
                                                                <span class="badge badge-secondary">Pending</span>
                                                            </c:when>
                                                            <c:when test="${detail.constructionStageDetailStatus == 2}">
                                                                <span class="badge badge-primary">Processing</span>
                                                            </c:when>
                                                            <c:when test="${detail.constructionStageDetailStatus == 3}">
                                                                <span class="badge badge-warning">Canceled</span>
                                                            </c:when>
                                                            <c:when test="${detail.constructionStageDetailStatus == 4}">
                                                                <span class="badge badge-success">Completed</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </td>
                                </tr>


                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Complete Construction Stage Table -->
                    <h4 class="text-center">Complete Construction</h4>
                    <table class="table table-hover table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Stage Name</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th style="width: 250px">Payment Process</th>
                                <th style="width: 150px">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Iterate over Complete Construction stages -->
                            <c:forEach var="completeStage" items="${completeConstructionStages}">
                                <tr>
                                    <td>${completeStage.constructionStageName}</td>
                                    <td>${completeStage.constructionStagePrice}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${completeStage.constructionStageStatus == 1}">
                                                <span class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when test="${completeStage.constructionStageStatus == 2}">
                                                <span class="badge badge-primary">Processing</span>
                                            </c:when>
                                            <c:when test="${completeStage.constructionStageStatus == 3}">
                                                <span class="badge badge-warning">Canceled</span>
                                            </c:when>
                                            <c:when test="${completeStage.constructionStageStatus == 4}">
                                                <span class="badge badge-success">Completed</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${completeStage.constructionStageDescription}</td>
                                    <td>
                                        <c:set var="allPreviousCompleted" value="true" />

                                        <!-- Iterate over all construction details to find the 'Payment' step -->
                                        <c:forEach var="detail" items="${completeStage.constructionStageDetail}">
                                            <c:if test="${detail.constructionStageDetailStatus != 4 && detail.constructionStageDetailName != 'Payment'}">
                                                <c:set var="allPreviousCompleted" value="false" />
                                            </c:if>

                                            <!-- Show the form for payment if all previous are completed -->
                                            <c:if test="${detail.constructionStageDetailName == 'Payment' && allPreviousCompleted}">
                                                <form action="${pageContext.request.contextPath}/constructionStageDetail/updateStatus" method="post" onsubmit="return confirmStatusChange();">
                                                    <input type="hidden" name="detailId" value="${detail.constructionStageDetailId}">
                                                    <input type="hidden" name="constructionId" value="${construction.constructionId}">
                                                    <input type="hidden" name="constructionStageId" value="${completeStage.constructionStageId}">

                                                    <div class="action-buttons mt-2 d-flex align-items-center">
                                                        <select class="form-control text-center" name="newStatus" required
                                                                ${completeStage.constructionStageStatus != 2 || detail.constructionStageDetailStatus == 4 ? 'disabled' : ''}>
                                                            <option value="2" ${detail.constructionStageDetailStatus == 2 ? 'selected' : ''}>Processing</option>
                                                            <option value="4" ${detail.constructionStageDetailStatus == 4 ? 'selected' : ''}>Completed</option>
                                                        </select>
                                                        <button type="submit" class="btn btn-primary ml-1"
                                                                ${completeStage.constructionStageStatus != 2 || detail.constructionStageDetailStatus == 4 ? 'disabled' : ''}>
                                                            Update
                                                        </button>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <button class="btn btn-primary" data-toggle="collapse" data-target="#details-${completeStage.constructionStageId}" aria-expanded="false" aria-controls="details-${completeStage.constructionStageId}">
                                            View Details
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <div id="details-${completeStage.constructionStageId}" class="collapse">
                                            <div class="collapse-card">
                                                <div class="collapse-header">Stage Details</div>
                                                <c:forEach var="detail" items="${completeStage.constructionStageDetail}">
                                                    <div class="collapse-detail">
                                                        <strong>Detail:</strong> ${detail.constructionStageDetailName},
                                                        <strong>Status:</strong>
                                                        <c:choose>
                                                            <c:when test="${detail.constructionStageDetailStatus == 1}">
                                                                <span class="badge badge-secondary">Pending</span>
                                                            </c:when>
                                                            <c:when test="${detail.constructionStageDetailStatus == 2}">
                                                                <span class="badge badge-primary">Processing</span>
                                                            </c:when>
                                                            <c:when test="${detail.constructionStageDetailStatus == 3}">
                                                                <span class="badge badge-warning">Canceled</span>
                                                            </c:when>
                                                            <c:when test="${detail.constructionStageDetailStatus == 4}">
                                                                <span class="badge badge-success">Completed</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </td>
                                </tr>


                            </c:forEach>
                        </tbody>
                    </table>
                    <%--                    <div class="staff-info mt-5">
                                            <h4>Assigned Construction Staff</h4>
                                            <ul class="list-group d-inline-block list-group-horizontal d-flex flex-wrap">
                                                <c:forEach var="staff" items="${construction.constructionStaffs}">
                                                    <li class="list-group-item mx-2 p-2">${staff.staff.name}</li>
                                                    </c:forEach>
                                            </ul>
                                        </div>--%>
                </main>

            </div>
            <div style="height:25vh;"></div>
        </div>


        <script>
            function confirmStatusChange() {
                return confirm("Are you sure you want to change the status?");
            }
        </script>

        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Construction Stage Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                padding-top: 60px;
            }
            .container {
                max-width: 90%;
                margin: auto;
                background: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
                color: #007bff;
                font-weight: bold;
                margin-bottom: 30px;
            }
            .project-info, .staff-info {
                margin-bottom: 30px;
                padding: 20px;
                background-color: #e9ecef;
                border-radius: 10px;
            }
            .project-info h4, .staff-info h4 {
                color: #343a40;
                font-weight: bold;
            }
            table {
                background-color: #ffffff;
                margin-top: 20px;
                border-radius: 10px;
                overflow: hidden;
            }
            th, td {
                padding: 15px;
                text-align: center;
                vertical-align: middle;
            }
            th {
                background-color: #343a40;
                color: white;
            }
            td {
                font-size: 15px;
                background-color: #f9f9f9;
            }
            .btn-primary, .btn-secondary {
                font-size: 14px;
                padding: 8px 15px;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .btn-secondary {
                background-color: #6c757d;
                border: none;
            }
            .btn-secondary:hover {
                background-color: #5a6268;
            }
            .badge {
                font-size: 14px;
                padding: 8px 12px;
                border-radius: 15px;
            }
            .badge-secondary {
                background-color: #6c757d;
                color: white;
            }
            .badge-primary {
                background-color: #007bff;
                color: white;
            }
            .badge-warning {
                background-color: #ffc107;
                color: white;
            }
            .badge-success {
                background-color: #28a745;
                color: white;
            }
            .badge-danger {
                background-color: #dc3545;
                color: white;
            }
            .disabled-section {
                opacity: 0.5;
            }
        </style>
    </head>
    <body>

        <!-- Main Container -->
        <div class="container">
            <!-- Header Section -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <a href="/manager/construction" class="btn btn-secondary">Back to All Constructions</a>
                <h2>Manage Construction Stage Details</h2>
            </div>

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
                        <th>Action</th>
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
                            <td>${rawStage.constructionStageDetail[0].constructionStageDetailDescription}</td>
                            <td>
                                <!-- Iterate over details to find payment action -->
                                <c:forEach var="detail" items="${rawStage.constructionStageDetail}">
                                    <c:if test="${detail.constructionStageDetailName == 'Payment' && detail.constructionStageDetailStatus != 4}">
                                        <form action="${pageContext.request.contextPath}/constructionStageDetail/updateStatus" method="post" onsubmit="return confirmStatusChange();">
                                            <input type="hidden" name="detailId" value="${detail.constructionStageDetailId}">
                                            <input type="hidden" name="constructionId" value="${construction.constructionId}">
                                            <input type="hidden" name="constructionStageId" value="${rawStage.constructionStageId}">
                                            <div class="action-buttons mt-2">
                                                <select class="form-control text-center" name="newStatus" required>
                                                    <option value="1" ${detail.constructionStageDetailStatus == 1 ? 'selected' : ''}>Pending</option>
                                                    <option value="2" ${detail.constructionStageDetailStatus == 2 ? 'selected' : ''}>Processing</option>
                                                    <option value="3" ${detail.constructionStageDetailStatus == 3 ? 'selected' : ''}>Cancel</option>
                                                    <option value="4" ${detail.constructionStageDetailStatus == 4 ? 'selected' : ''}>Completed</option>
                                                </select>
                                                <button type="submit" class="btn btn-primary ml-2">Update Payment Status</button>
                                            </div>
                                        </form>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </tr>

                        <!-- Iterate over all construction details -->
                        <c:forEach var="detail" items="${rawStage.constructionStageDetail}">
                            <tr>
                                <td colspan="5">
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
                                </td>
                            </tr>
                        </c:forEach>
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
                        <th>Action</th>
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
                            <td>${completeStage.constructionStageDetail[0].constructionStageDetailDescription}</td>
                            <td>
                                <!-- Iterate over details to find payment action -->
                                <c:forEach var="detail" items="${completeStage.constructionStageDetail}">
                                    <c:if test="${detail.constructionStageDetailName == 'Payment' && detail.constructionStageDetailStatus != 4}">
                                        <!-- Button is disabled if raw construction is not complete -->
                                        <form action="${pageContext.request.contextPath}/constructionStageDetail/updateStatus" method="post">
                                            <input type="hidden" name="detailId" value="${detail.constructionStageDetailId}">
                                            <input type="hidden" name="constructionId" value="${construction.constructionId}">
                                            <input type="hidden" name="constructionStageId" value="${completeStage.constructionStageId}">
                                            <div class="action-buttons mt-2">
                                                <select class="form-control text-center" name="newStatus" required ${!isRawConstructionCompleted ? 'disabled' : ''}>
                                                    <option value="1" ${detail.constructionStageDetailStatus == 1 ? 'selected' : ''}>Pending</option>
                                                    <option value="2" ${detail.constructionStageDetailStatus == 2 ? 'selected' : ''}>Processing</option>
                                                    <option value="3" ${detail.constructionStageDetailStatus == 3 ? 'selected' : ''}>Cancel</option>
                                                    <option value="4" ${detail.constructionStageDetailStatus == 4 ? 'selected' : ''}>Completed</option>
                                                </select>
                                                <button type="submit" class="btn btn-primary ml-2" ${!isRawConstructionCompleted ? 'disabled' : ''}>Update Payment Status</button>
                                            </div>
                                        </form>
                                    </c:if>
                                </c:forEach>
                            </td>
                        </tr>

                        <!-- Iterate over all construction details -->
                        <c:forEach var="detail" items="${completeStage.constructionStageDetail}">
                            <tr>
                                <td colspan="5">
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
                                </td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Assigned Staff Section -->
            <div class="staff-info mt-5">
                <h4>Assigned Construction Staff</h4>
                <ul class="list-group d-inline-block list-group-horizontal d-flex flex-wrap">
                    <c:forEach var="staff" items="${construction.constructionStaffs}">
                        <li class="list-group-item mx-2 p-2">${staff.staff.name}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!-- Confirmation Script -->
        <script>
            function confirmStatusChange() {
                return confirm("Are you sure you want to change the status?");
            }
        </script>
    </body>
</html>

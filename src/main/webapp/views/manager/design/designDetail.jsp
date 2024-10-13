<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Design Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome for Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            h2 {
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

            /* Blueprint Section */
            .blueprint-row {
                background-color: #f0f0f0;
            }

            .blueprint-details {
                padding: 20px;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Blueprint Header */
            .blueprint-details h2 {
                font-size: 1.5rem;
                color: #007bff;
                margin-bottom: 20px;
                text-align: center;
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
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="../navBar.jsp" %>

                <!-- Main Content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
                    <h2>Design Details</h2>

                    <!-- Design Stages Table -->
                    <table class="table table-striped table-bordered mt-3">
                        <thead class="thead-dark">
                            <tr>
                                <th>Stage Name</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th>Summary File</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="stage" items="${design.designStage}">
                                <tr>
                                    <td>${stage.designStageName}</td>
                                    <td>${stage.designStagePrice}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${stage.designStageStatus == 1}">
                                                <span class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when test="${stage.designStageStatus == 2}">
                                                <span class="badge badge-primary">Processing</span>
                                            </c:when>
                                            <c:when test="${stage.designStageStatus == 3}">
                                                <span class="badge badge-warning">Canceled</span>
                                            </c:when>
                                            <c:when test="${stage.designStageStatus == 4}">
                                                <span class="badge badge-success">Completed</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${stage.designDetail[0].description}</td>

                                    <td>
                                        <c:if test="${stage.designStageStatus == 4}">
                                            <c:choose>
                                                <c:when test="${not empty contract.fileURL}">
                                                    <form action="/download/${stage.summaryFile}" method="get">
                                                        <button type="submit" class="btn btn-outline-primary">
                                                            <i class="fas fa-download"></i> Download file
                                                        </button>
                                                    </form>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="submit" class="btn btn-outline-danger">
                                                        <i class="fas fa-download"></i> File not available
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:forEach var="detail" items="${stage.designDetail}">
                                            <c:if test="${detail.name == 'Payment' && detail.status == 2}">
                                                <form action="${pageContext.request.contextPath}/manager/completePayment/" method="post" onsubmit="return confirmStatusChange();">
                                                    <input type="hidden" name="detailId" value="${detail.id}">
                                                    <input type="hidden" name="newStatus" value="4">
                                                    <input type="hidden" name="designStageId" value="${stage.designStageId}">
                                                    <input type="hidden" name="designId" value="${design.designId}">
                                                    <button type="submit" class="btn btn-success btn-custom">Complete Payment</button>
                                                </form>
                                            </c:if>
                                        </c:forEach>
                                        <button class="btn btn-info btn-custom" onclick="toggleBlueprint(${stage.designStageId})">View</button>
                                    </td>
                                </tr>
                                <!-- Blueprint Details -->
                                <tr class="blueprint-row" id="blueprint-row-${stage.designStageId}" style="display: none;">
                                    <td colspan="6">
                                        <div class="blueprint-details">
                                            <table class="table table-bordered">
                                                <div class="detail-name-bar  ">
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
                                                <h2 class = "text-center">Blue Print</h2>
                                                <thead>
                                                    <tr>
                                                        <th>Date Created</th>
                                                        <th>Status</th>
                                                        <th>Image Link</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="bluePrint" items="${stage.bluePrint}">
                                                        <tr>
                                                            <td>${bluePrint.dateCreate}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${bluePrint.bluePrintStatus == 1}">
                                                                        <span class="badge badge-secondary">Pending</span>
                                                                    </c:when>
                                                                    <c:when test="${bluePrint.bluePrintStatus == 2}">
                                                                        <span class="badge badge-primary">Editing</span>
                                                                    </c:when>
                                                                    <c:when test="${bluePrint.bluePrintStatus == 3}">
                                                                        <span class="badge badge-success">Approve By Customer</span>
                                                                    </c:when>
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <a href="/uploads/${bluePrint.imgUrl}" class="btn btn-link">View Image</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </main>
            </div>
        </div>

        <script>
            function toggleBlueprint(stageId) {
                var blueprintRow = document.getElementById('blueprint-row-' + stageId);
                blueprintRow.style.display = (blueprintRow.style.display === 'none' || blueprintRow.style.display === '') ? 'table-row' : 'none';
            }

            function confirmStatusChange() {
                return confirm("Do you confirm the customer completed the payment?");
            }
        </script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

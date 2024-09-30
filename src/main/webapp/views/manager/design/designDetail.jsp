<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Design Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/designStyle.css'/>" rel="stylesheet">
        <style>

            .detail-name-bar {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                align-items: center; 
                margin-top: 15px;
            }
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
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="../navBar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <h1 class="text-center">Design Detail</h1>
                    <table class="table table-striped table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Stage Name</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Description</th>
                                <th>Summary File</th>
                                <th></th> 
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
                                    <td>${stage.designDetail[0].description}</td> <!-- Show first detail description -->
                                    <td>
                                        <c:if test="${stage.designStageStatus == 4}">
                                            <a href="/download/${stage.summaryFile}" class="btn btn-link">Download Summary File</a>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:forEach var="detail" items="${stage.designDetail}">
                                            <c:if test="${detail.name == 'Payment' && detail.status == 2}">
                                                <form action="${pageContext.request.contextPath}/manager/completePayment/" 
                                                      method="post" onsubmit="return confirmStatusChange();">
                                                    <input type="hidden" name="detailId" value="${detail.id}">
                                                    <input type="hidden" name="newStatus" value="4">
                                                    <input type="hidden" name="designStageId" value="${stage.designStageId}">
                                                    <input type="hidden" name="designId" value="${design.designId}">
                                                    <button type="submit" class="btn btn-success">Complete Payment</button>
                                                </form>
                                            </c:if>
                                        </c:forEach>
                                        <button class="btn btn-info" onclick="toggleBlueprint(${stage.designStageId})">View</button>
                                    </td>
                                </tr>
                          
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
                                                                    <c:when test="${bluePrint.bluePrintStatus}">
                                                                        <span class="badge badge-success">APPROVED</span>
                                                                    </c:when>
                                                                    <c:when test="${!bluePrint.bluePrintStatus}">
                                                                        <span class="badge badge-danger">REJECTED</span>
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
                if (blueprintRow.style.display === 'none' || blueprintRow.style.display === '') {
                    blueprintRow.style.display = 'table-row';
                } else {
                    blueprintRow.style.display = 'none';
                }
            }
            function confirmStatusChange() {
                return confirm("Do you sure the customer complete payment?");
            }
        </script>


        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </div>
</body>
</html>

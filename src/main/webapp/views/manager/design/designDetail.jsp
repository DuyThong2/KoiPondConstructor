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
    </head>
    <body>
        <div class="container-fluid"> <!-- Thay đổi từ .container sang .container-fluid -->
            <div class="header-container d-flex justify-content-between align-items-center mt-3 mb-4">
                <a href="/manager/design" class="btn btn-secondary">Back</a>
                <h1 class="text-center">Design Detail</h1>
            </div>

            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Stage Name</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Description</th>
                        <th>Summary File</th>
                        <th></th> <!-- Thêm cột cho nút View -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stage" items="${designDetails.designStage}">
                        <c:forEach var="detail" items="${stage.designDetail}">
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
                                <td>${detail.description}</td>
                                <td>
                                    <c:if test="${stage.designStageStatus == 4}">
                                        <a href="/download/${stage.summaryFile}" class="btn btn-link">Download Summary File</a>
                                    </c:if>
                                </td>
                                <td>
                                    <button class="btn btn-info" onclick="toggleBlueprint(${stage.designStageId})">View</button>
                                </td>
                            </tr>

                            <tr class="blueprint-row" id="blueprint-row-${stage.designStageId}" style="display: none;">
                                <td colspan="6">
                                    <div class="blueprint-details">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Title</th>
                                                    <th>Date Created</th>
                                                    <th>Status</th>
                                                    <th>Image Link</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="bluePrint" items="${stage.bluePrint}">
                                                    <tr>
                                                        <td>${bluePrint.title}</td>
                                                        <td>${bluePrint.dateCreate}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${bluePrint.bluePrintStatus}">
                                                                    <span class="badge badge-success">APPROVED</span>
                                                                </c:when>
                                                                <c:when test="${bluePrint.bluePrintStatus}">
                                                                    <span class="badge badge-primary">REJECTED</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <a href="${bluePrint.imgUrl}" class="btn btn-link">View Image</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>

            <%-- Display staff in design Project --%>
            <div class="staff-container mt-5">
                <div class="staff-title d-inline-block" style="font-size: large; font-weight: bold;">Design Staff:</div>
                <ul class="list-group d-inline-block list-group-horizontal d-flex flex-wrap">
                    <c:forEach var="staff" items="${designDetails.staff}">
                        <li class="list-group-item mx-2 p-2">${staff.name}</li>
                        </c:forEach>
                </ul>
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
            </script>
            <!-- Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </div>

    </body>
</html>

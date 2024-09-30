<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Construction Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/constructionStyle.css'/>" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
            <div class="header-container d-flex justify-content-between align-items-center mt-3 mb-4">
                <a href="/manager/construction" class="btn btn-secondary">Back</a>
                <h1 class="text-center">Construction Detail</h1>
            </div>

            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Stage Name</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stage" items="${construction.constructionStage}">
                        <tr>
                            <td>${stage.constructionStageName}</td>
                            <td>${stage.constructionStagePrice}</td>
                            <td>
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
                            </td>
                            <td>${stage.constructionStageDetail[0].constructionStageDetailDescription}</td> <!-- Show first detail description -->
                        </tr>

                        <c:forEach var="detail" items="${stage.constructionStageDetail}">
                            <tr>
                                <td colspan="4">
                                    <div class="detail-container">
                                        <strong>Detail:</strong> ${detail.constructionStageDetailName}, 
                                        <strong>Price:</strong> ${detail.constructionStageDetailPrice}, 
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
                                </td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>

            <%-- Display staff in construction project --%>
            <div class="staff-container mt-5">
                <div class="staff-title d-inline-block" style="font-size: large; font-weight: bold;">Construction Staff:</div>
                <ul class="list-group d-inline-block list-group-horizontal d-flex flex-wrap">
                    <c:forEach var="staff" items="${construction.constructionStaffs}">
                        <li class="list-group-item mx-2 p-2">${staff.staff.name}</li>
                    </c:forEach>
                </ul>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </div>
    </body>
</html>

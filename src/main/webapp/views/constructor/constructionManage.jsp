<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Construction Manage</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <style>
            .filter-card {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <%@include file="navbarConsultruction.jsp" %>
            
            <div class="filter-card">
                <form method="get" action="${pageContext.request.contextPath}/constructor/manage">
                    <div class="form-row align-items-center">
                        <div class="col">
                            <label for="statusFilter">Status:</label>
                            <select name="statusFilter" id="statusFilter" class="form-control">
                                <option value="">All</option>
                                <option value="1" ${statusFilter == '1' ? 'selected' : ''}>Pending</option>
                                <option value="2" ${statusFilter == '2' ? 'selected' : ''}>Processing</option>
                                <option value="3" ${statusFilter == '3' ? 'selected' : ''}>Completed</option>
                                <option value="4" ${statusFilter == '4' ? 'selected' : ''}>Canceled</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="searchName">Construction Name:</label>
                            <input type="text" name="searchName" id="searchName" class="form-control" value="${searchName}">
                        </div>
                        <div class="col-auto mt-4">
                            <button type="submit" class="btn btn-primary">Apply</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered table-striped text-center">
                    <thead>
                        <tr>
                            <th>Construction Id</th>
                            <th>Construction Name</th>
                            <th>Project Name</th>
                            <th>Customer</th>
                            <th>Status</th>
                            <th class="action-column" style="width: 250px">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="construction" items="${constructions}">
                            <tr>
                                <td>${construction.constructionId}</td>
                                <td>${construction.constructionName}</td>
                                <td>${construction.project.projectName}</td>
                                <td>${construction.project.contract.customer.name}</td>
                                <td>
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
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/constructor/manage/viewDetail/${construction.constructionId}" class="btn btn-info">Detail</a>
                                    <a href="${pageContext.request.contextPath}/constructor/construction/${construction.constructionId}" class="btn btn-secondary">Manage Stages</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Pagination Controls -->
        <div class="pagination-controls d-flex justify-content-center mt-4">
            <!-- Previous Button -->
            <c:if test="${currentPage > 0}">
                <a href="?page=${currentPage - 1}&statusFilter=${statusFilter}&searchName=${searchName}" class="btn btn-primary">&lt;</a>
            </c:if>
            <c:if test="${currentPage == 0}">
                <button class="btn btn-primary" disabled>&lt;</button>
            </c:if>

            <!-- Page Indicator -->
            <span class="mx-3">Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

            <!-- Next Button -->
            <c:if test="${currentPage < totalPages - 1}">
                <a href="?page=${currentPage + 1}&statusFilter=${statusFilter}&searchName=${searchName}" class="btn btn-primary">&gt;</a>
            </c:if>
            <c:if test="${currentPage == totalPages - 1}">
                <button class="btn btn-primary" disabled>&gt;</button>
            </c:if>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

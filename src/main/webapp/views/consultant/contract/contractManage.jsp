<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contract Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .filter-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        h2 {
            font-weight: bold;
            border-bottom: 2px solid #343a40;
            padding-bottom: 10px;
            margin-bottom: 20px;
            width: 95%;
            margin-left: 5px;
        }
        .btn-sort {
            padding: 8px 20px;
            margin-top: 2rem;
        }
        .btn-primary{
            border-radius: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <jsp:include page="../consultantNav.jsp"/>

    <h2>Contract List</h2>

    <!-- Sort Form -->
    <div class="filter-card">
    <form method="get" action="${pageContext.request.contextPath}/consultant/contract">
        <div class="form-row align-items-center">
            <div class="col-auto">
                <label for="sortBy">Sort by:</label>
                <select name="sortBy" id="sortBy" class="form-control">
                    <option value="dateCreate" ${sortBy == 'dateCreate' ? 'selected' : ''}>Date Created</option>
                    <option value="totalPrice" ${sortBy == 'totalPrice' ? 'selected' : ''}>Total Price</option>

                </select>
            </div>
            <div class="col-auto">
                <label for="sortDirection">Direction:</label>
                <select name="sortDirection" id="sortDirection" class="form-control">
                    <option value="asc" ${sortDirection == 'asc' ? 'selected' : ''}>Ascending</option>
                    <option value="desc" ${sortDirection == 'desc' ? 'selected' : ''}>Descending</option>
                </select>
            </div>
            <input type="hidden" name="page" value="${currentPage}">
            <div class="col-auto">
                <button type="submit" class="btn btn-primary btn-sort">Sort</button>
            </div>
        </div>
    </form>
    </div>
    <!-- Table for contracts -->
    <table class="table table-bordered table-hover mt-3">
        <thead class="thead-dark">
        <tr>
            <th>Date Created</th>
            <th>File URL</th>
            <th>Total Price</th>
            <th>Contract Term</th>
            <th>Contract Status</th>
            <th>Contract Note</th>
            <th>View Detail</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="contract" items="${contracts}">
            <tr>
                <td>${contract.dateCreate}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty contract.fileURL}">
                            <form action="${pageContext.request.contextPath}/download/${contract.fileURL}" method="get">
                                <button type="submit" class="btn btn-outline-primary">
                                    <i class="fas fa-download"></i> Download Contract
                                </button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" class="btn btn-outline-danger">
                                <i class="fas fa-download"></i> File not available
                            </button>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${contract.totalPrice}</td>

                <td>${contract.contractTerm}</td>
                <td>
                    <c:choose>
                        <c:when test="${contract.contractStatus == 1}">
                            <span class="badge badge-warning badge-status">Pending</span>
                        </c:when>
                        <c:when test="${contract.contractStatus == 2}">
                            <span class="badge badge-success badge-status">Approved</span>
                        </c:when>
                        <c:when test="${contract.contractStatus == 3}">
                            <span class="badge badge-danger badge-status">Rejected (Customer)</span>
                        </c:when>
                        <c:when test="${contract.contractStatus == 4}">
                            <span class="badge badge-danger badge-status">Rejected (Manager)</span>
                        </c:when>
                        <c:when test="${contract.contractStatus == 5}">
                            <span class="badge badge-secondary badge-status">Canceled</span>
                        </c:when>
                        <c:when test="${contract.contractStatus == 6}">
                            <span class="badge badge-success badge-status">Accepted by customer</span>
                        </c:when>
                    </c:choose>
                </td>
                <td>${contract.contractNote}</td>
                <td><a href="${pageContext.request.contextPath}/consultant/contract/viewDetail/${contract.contractId}" class="btn btn-info">View</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Pagination Controls -->
    <div class="d-flex justify-content-between align-items-center mt-4">
        <!-- Previous Button -->
        <c:if test="${currentPage > 0}">
            <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}" class="btn btn-primary">&lt;</a>
        </c:if>
        <c:if test="${currentPage == 0}">
            <button class="btn btn-primary" disabled>&lt;</button>
        </c:if>

        <!-- Page Indicator -->
        <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

        <!-- Next Button -->
        <c:if test="${currentPage < totalPages - 1}">
            <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}" class="btn btn-primary">&gt;</a>
        </c:if>
        <c:if test="${currentPage == totalPages - 1}">
            <button class="btn btn-primary" disabled>&gt;</button>
        </c:if>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

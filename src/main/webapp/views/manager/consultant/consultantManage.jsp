<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Consultant List</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Mukta', sans-serif;
        }

        /* Custom header styling */
        h2 {
            font-weight: bold;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* Badge styles */
        .badge-status {
            padding: 10px 15px;
            font-size: 1em;
            border-radius: 20px;
        }

        /* Table Styling */
        table.table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Table Header Styling */
        thead.thead-dark th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        /* Pagination Controls */
        .pagination-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .pagination-controls a,
        .pagination-controls button {
            font-weight: bold;
        }

        /* Button Styles */
        .btn-info {
            background-color: #007bff;
            border-color: #007bff;
            font-weight: bold;
            padding: 8px 12px;
            transition: all 0.3s ease;
        }

        .btn-info:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        /* Filter Form Styling */
        .form-control {
            border-radius: 20px;
            padding: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            border-radius: 20px;
            padding: 8px 20px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        /* Custom Styles for Form */
        .form-row {
            margin-bottom: 20px;
        }

        /* Card Container for Form */
        .filter-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
    </style>
</head>
<div style="height:6vh;"></div>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="../navBar.jsp" %>

        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
            <h2 class="mb-4">Consultant List</h2>

            <!-- Filter Form -->
            <div class="filter-card">
                <form method="get" action="${pageContext.request.contextPath}/manager/consultant">
                    <div class="form-row align-items-center">
                        <!-- Sort By -->
                        <div class="col-auto">
                            <label for="sortBy">Sort by:</label>
                            <select name="sortBy" id="sortBy" class="form-control">
                                <option value="consultantDateTime" ${sortBy == 'consultantDateTime' ? 'selected' : ''}>Date Created</option>
                            </select>
                        </div>

                        <!-- Sort Direction -->
                        <div class="col-auto">
                            <label for="sortDirection">Direction:</label>
                            <select name="sortDirection" id="sortDirection" class="form-control">
                                <option value="asc" ${sortDirection == 'asc' ? 'selected' : ''}>Ascending</option>
                                <option value="desc" ${sortDirection == 'desc' ? 'selected' : ''}>Descending</option>
                            </select>
                        </div>

                        <!-- Filter By Status -->
                        <div class="col-auto">
                            <label for="statusFilter">Status:</label>
                            <select name="statusFilter" id="statusFilter" class="form-control">
                                <option value="" ${statusFilter == null ? 'selected' : ''}>All</option>
                                <option value="1" ${statusFilter == 1 ? 'selected' : ''}>Pending</option>
                                <option value="2" ${statusFilter == 2 ? 'selected' : ''}>Assigned</option>
                                <option value="3" ${statusFilter == 3 ? 'selected' : ''}>Processing</option>
                                <option value="4" ${statusFilter == 4 ? 'selected' : ''}>Completed</option>
                                <option value="5" ${statusFilter == 5 ? 'selected' : ''}>Canceled</option>
                            </select>
                        </div>

                        <input type="hidden" name="page" value="${currentPage}">
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary" style="margin-top: 2rem">Apply</button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Main Table -->
            <table class="table table-bordered table-hover mt-3">
                <thead class="thead-dark">
                <tr>
                    <th>Date Created</th>
                    <th>Customer Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Content</th>
                    <th>Pre Design</th>
                    <th>Staff</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="consultant" items="${consultants}">
                    <tr>
                        <td><fmt:formatDate value="${consultant.consultantDateTime.time}" pattern="yyyy-MM-dd HH:mm"/></td>
                        <td>${consultant.consultantCustomerName}</td>
                        <td>${consultant.consultantPhone}</td>
                        <td>${consultant.consultant_email}</td>
                        <td>${consultant.consultantContent}</td>
                        <td>${consultant.predesign.preDesignName}</td>
                        <td>${consultant.staff.name}</td>
                        <td>
                            <c:choose>
                                <c:when test="${consultant.consultantStatus == 1}">
                                    <span class="badge badge-warning badge-status">Pending</span>
                                </c:when>
                                <c:when test="${consultant.consultantStatus == 2}">
                                    <span class="badge badge-secondary badge-status">Assign</span>
                                </c:when>
                                <c:when test="${consultant.consultantStatus == 3}">
                                    <span class="badge badge-info badge-status">Processing</span>
                                </c:when>
                                <c:when test="${consultant.consultantStatus == 4}">
                                    <span class="badge badge-success badge-status">Completed</span>
                                </c:when>
                                <c:when test="${consultant.consultantStatus == 5}">
                                    <span class="badge badge-danger badge-status">Cancel</span>
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/manager/consultant/detail/${consultant.consultantId}" class="btn btn-info">View Detail</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Pagination Controls -->
            <div class="pagination-controls">
                <!-- Previous Button -->
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}" class="btn btn-primary">&lt;</a>
                </c:if>
                <c:if test="${currentPage == 0}">
                    <button class="btn btn-primary" disabled>&lt;</button>
                </c:if>

                <!-- Page Indicator -->
                <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                <!-- Next Button -->
                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}" class="btn btn-primary">&gt;</a>
                </c:if>
                <c:if test="${currentPage == totalPages - 1}">
                    <button class="btn btn-primary" disabled>&gt;</button>
                </c:if>
            </div>
        </main>

    </div>
</div>
<br>

<!-- Bootstrap 4 JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>
</html>

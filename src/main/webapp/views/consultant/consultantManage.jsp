
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contract Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Sidebar full height */
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: white;
            position: fixed;
        }
        .sidebar a {
            color: white;
            display: block;
            padding: 10px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .sidebar .nav-link.active {
            background-color: #007bff;
            color: white;
        }
        /* Adjust content area to account for fixed sidebar */
        main {
            margin-left: 200px;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="consultantNav.jsp"%>


        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <h2 class="mb-4">Consultant List</h2>
            <form method="get" action="${pageContext.request.contextPath}/consultant/viewConsultantList">
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
                        <button type="submit" class="btn btn-primary mt-2">Apply</button>
                    </div>
                </div>
            </form>

            <!-- Main Table -->
            <table class="table table-bordered table-hover">
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
                            <a href="${pageContext.request.contextPath}/consultant/viewConsultantDetail/${consultant.consultantId}" class="btn btn-info">View Detail</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Pagination Controls -->
            <div class="d-flex justify-content-between align-items-center mt-4">
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

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
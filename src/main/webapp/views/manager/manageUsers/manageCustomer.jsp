<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Users</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        h2 {
            font-weight: bold;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .search-form {
            margin-bottom: 20px;
        }
        .search-bar {
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .search-bar .form-control {
            border-radius: 25px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .pagination {
            justify-content: center;
        }
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

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="../navBar.jsp" %>

        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
            <h2 class="mb-4">Manage Customer</h2>
            <div class="filter-card">
                <!-- Search Form -->
                <form action="/manager/manageCustomer" method="GET" class="form-row">
                    <!-- Search by email -->
                    <div class="col-md-3 mb-3">
                        <input type="text" name="searchEmail" class="form-control" placeholder="Search by Email.." value="${param.searchEmail}">
                    </div>

                    <!-- Search by name -->
                    <div class="col-md-3 mb-3">
                        <input type="text" name="name" class="form-control" placeholder="Search by Name..." value="${param.name}">
                    </div>

                    <!-- Status Dropdown -->
                    <div class="col-md-2 mb-3">
                        <select name="status" class="form-control">
                            <option value="">All Statuses</option>
                            <option value="true" ${param.status == "true" ? 'selected' : ''}>Active</option>
                            <option value="false" ${param.status == "false" ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>

                    <!-- Search Button -->
                    <div class="col-md-2 mb-3">
                        <button type="submit" class="btn btn-primary btn-block">Search</button>
                    </div>
                </form>
            </div>

            <!-- Table to display customers -->
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th style="width: 165px">View Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="customers" items="${customers}">
                        <tr>
                            <td>${customers.id}</td>
                            <td>${customers.name}</td>
                            <td>${customers.email}</td>
                            <td>${customers.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${customers.enabled}">
                                        <span class="badge badge-success">Active</span>
                                    </c:when>
                                    <c:when test="${!customers.enabled}">
                                        <span class="badge badge-warning">Inactive</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/manager/manageCustomer/detail/${customers.id}" class="btn btn-info btn-block">
                                    <i class="fas fa-eye"></i>View Details</a>
                                <form action="/manager/manageUser/block/${customers.id}" method="post" style="display: inline">
                                    <c:if test="${customers.enabled}">
                                    <button type="submit" class="btn btn-outline-danger btn-block"
                                            onclick="return confirm('Are you sure you want to block this user?');">
                                        <i class="fas fa-ban"></i> Block
                                    </button>
                                    </c:if>
                                    <c:if test="${!customers.enabled}">
                                        <button type="submit" class="btn btn-outline-success btn-block"
                                                onclick="return confirm('Are you sure you want to unblock this user?');">
                                            <i class="fas fa-ban"></i> Unblock
                                        </button>
                                    </c:if>
                                </form>

                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination controls -->
            <div class="d-flex justify-content-between align-items-center mt-4">
                <!-- Previous Button -->
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}" class="btn btn-primary">&lt;</a>
                </c:if>
                <c:if test="${currentPage == 0}">
                    <button class="btn btn-primary" disabled>&lt;</button>
                </c:if>

                <!-- Page Indicator -->
                <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                <!-- Next Button -->
                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}" class="btn btn-primary">&gt;</a>
                </c:if>
                <c:if test="${currentPage == totalPages - 1}">
                    <button class="btn btn-primary" disabled>&gt;</button>
                </c:if>
            </div>
            <br>
        </main>
    </div>

</div>

<!-- Display email duplicate error if exists -->
<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>c:if>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

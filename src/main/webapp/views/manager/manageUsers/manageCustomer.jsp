<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>Manage Users</title>
            <!-- Bootstrap CSS -->
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
            <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
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

                .table th,
                .table td {
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

                .btn-block {
                    margin-bottom: 5px;
                }
                

                h2 {
                    font-weight: bold;
                    color: #007bff;
                    border-bottom: 2px solid #007bff;
                    padding-bottom: 10px;
                    margin-bottom: 20px;
                }

                /* Table styling */
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

                /* Badge styles */
                .badge-status {
                    padding: 10px 15px;
                    font-size: 1em;
                    border-radius: 20px;
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

                .btn-success {
                    border-radius: 20px;
                    padding: 8px 20px;
                }

                .btn-primary:hover {
                    background-color: #0056b3;
                    border-color: #0056b3;
                }

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
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-end;
                    /* Align the form elements to the bottom */
                    flex-wrap: wrap;
                    /* Allow wrapping for smaller screens */
                    gap: 15px;
                    /* Adjust gap between form elements */
                }

                .filter-card .form-control,
                .filter-card select,
                .filter-card .btn-primary {
                    flex: 1 1 150px;
                    /* Allows the fields to scale and ensures consistency in size */
                    margin-bottom: 10px;
                    /* Adds spacing between the form elements */
                }

                .filter-card label {
                    margin-bottom: 5px;
                    /* Space between labels and inputs */
                    display: inline-block;
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
                            <h2 class="mb-4">Manage Customer</h2>
                            <div class="filter-card">
                                <!-- Search Form -->
                                <form action="${pageContext.request.contextPath}/manager/manageCustomer" method="GET"
                                    class="form-row">
                                    <!-- Search by name -->
                                    <div class="col-md-3 mb-3">
                                        <input type="text" name="name" class="form-control"
                                            placeholder="Search by Name..." value="${param.name}">
                                    </div>
                                    <!-- Search by email -->
                                    <div class="col-md-3 mb-3">
                                        <input type="text" name="searchEmail" class="form-control"
                                            placeholder="Search by Email.." value="${param.searchEmail}">
                                    </div>

                                    <!-- Status Dropdown -->
                                    <div class="col-md-2 mb-3">
                                        <select name="status" class="form-control">
                                            <option value="">All Statuses</option>
                                            <option value="true" ${param.status=="true" ? 'selected' : '' }>Active
                                            </option>
                                            <option value="false" ${param.status=="false" ? 'selected' : '' }>Inactive
                                            </option>
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
                                                            <span class="badge badge-success badge-status">Active</span>
                                                        </c:when>
                                                        <c:when test="${!customers.enabled}">
                                                            <span class="badge badge-danger badge-status">Inactive</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/manager/manageCustomer/detail/${customers.id}"
                                                        class="btn btn-info btn-block">
                                                        Detail</a>
                                                    <form
                                                        action="${pageContext.request.contextPath}/manager/manageUser/block/${customers.id}"
                                                        method="post" style="display: inline">
                                                        <c:if test="${customers.enabled}">
                                                            <button type="submit"
                                                                class="btn btn-outline-danger btn-block"
                                                                onclick="return confirm('Are you sure you want to block this user?');">
                                                                <i class="fas fa-ban"></i> Block
                                                            </button>
                                                        </c:if>
                                                        <c:if test="${!customers.enabled}">
                                                            <button type="submit"
                                                                class="btn btn-outline-success btn-block"
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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </body>

        </html>
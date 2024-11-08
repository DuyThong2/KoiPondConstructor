<%-- 
    Document   : addStaff
    Created on : Oct 27, 2024, 12:06:33 AM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add staff page</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">

        <style>
            /* Custom styles to enhance UI performance */
            body {
                background-color: #f8f9fa;
                font-family: 'Mukta', sans-serif;
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
                align-items: flex-end; /* Align the form elements to the bottom */
                flex-wrap: wrap; /* Allow wrapping for smaller screens */
                gap: 15px; /* Adjust gap between form elements */
            }

            .filter-card .form-control,
            .filter-card select,
            .filter-card .btn-primary {
                flex: 1 1 150px; /* Allows the fields to scale and ensures consistency in size */
                margin-bottom: 10px; /* Adds spacing between the form elements */
            }

            .filter-card label {
                margin-bottom: 5px; /* Space between labels and inputs */
                display: inline-block;
            }
        </style>
    </head>
    <div style="height:6vh;"></div>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Include the Navbar -->
                <%@include file="../navBar.jsp" %>
                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
                    <h2 class="mb-4">Consultant Staff List</h2>

                    <div class="filter-card">
                        <!-- Sort and Search Form -->
                        <form method="get" action="${pageContext.request.contextPath}/manager/consultant/viewConsultantStaffList">
                            <div class="form-row align-items-center d-flex justify-content-between">
                                <!-- Search by Name -->
                                <div class="col-auto">
                                    <label for="searchName">Service Quote Name</label>
                                    <input type="text" name="searchName" id="searchName" class="form-control" value="${searchName}">
                                </div>

                                <input type="hidden" name="page" value="${currentPage}">
                                <input type="hidden" name="consultantId" value="${consultantId}">

                                <!-- Apply Button -->
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary" style="margin-top: 2rem">Apply</button>
                                </div>
                            </div>
                        </form>
                    </div>



                    <!-- Table for contracts -->
                    <table class="table table-bordered table-hover mt-3">
                        <thead class="thead-dark">
                            <tr>
                                <th>id</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="staff" items="${staff}">
                                <tr>
                                    <td>${staff.id}</td>
                                    <td>${staff.name}</td>
                                    <td>${staff.phone}</td>
                                    <td>${staff.email}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${staff.enabled}">
                                                <span class="badge badge-warning badge-status">Active</span>
                                            </c:when>
                                            <c:when test="${staff.enabled}">
                                                <span class="badge badge-secondary badge-status">Not Active</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form 
                                            action="${pageContext.request.contextPath}/manager/consultant/viewConsultantStaffList/editConsultantStaff" 
                                            method="POST" 
                                            class="d-inline"
                                            onsubmit="return confirm('Are you sure you want to update this staff member?');">

                                            <input type="hidden" name="id" value="${consultantId}">
                                            <input type="hidden" name="staffId" value="${staff.id}">
                                            <button type="submit" class="btn btn-info">Update Staff</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination Controls -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <!-- Previous Button -->
                        <c:if test="${currentPage > 0}">
                            <a href="?consultantId=${consultantId}&page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchName=${searchName}&fromDate=${fromDate}&toDate=${toDate}" class="btn btn-primary">&lt;</a>
                        </c:if>
                        <c:if test="${currentPage == 0}">
                            <button class="btn btn-primary" disabled>&lt;</button>
                        </c:if>

                        <!-- Page Indicator -->
                        <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                        <!-- Next Button -->
                        <c:if test="${currentPage < totalPages - 1}">
                            <a href="?consultantId=${consultantId}&page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchName=${searchName}&fromDate=${fromDate}&toDate=${toDate}" class="btn btn-primary">&gt;</a>
                        </c:if>
                        <c:if test="${currentPage == totalPages - 1}">
                            <button class="btn btn-primary" disabled>&gt;</button>
                        </c:if>
                    </div>
                </main>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>



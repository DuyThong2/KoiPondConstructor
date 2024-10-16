<%-- 
    Document   : serviceQuoteManage
    Created on : Oct 13, 2024, 11:09:51 PM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contract Management</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

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
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Include the Navbar -->                
                <%@include file="../navBar.jsp" %>
                <!-- Main content -->
                <main role="main" class="col-md-12 col-lg-9 ml-sm-auto px-4 mt-4">
                    <h2 class="mb-4">Service Quote List</h2>

                    <div class="filter-card">
                        <!-- Sort and Search Form -->
                        <form method="get" action="${pageContext.request.contextPath}/consultant/serviceQuote">
                            <div class="form-row align-items-center d-flex justify-content-between">
                                <!-- Sort By -->
                                <div class="col-auto">
                                    <label for="sortBy">Sort by:</label>
                                    <select name="sortBy" id="sortBy" class="form-control">
                                        <option value="serviceQuotesDate" ${sortBy == 'serviceQuotesDate' ? 'selected' : ''}>Date Created</option>
                                        <option value="serviceQuotesArea" ${sortBy == 'serviceQuotesArea' ? 'selected' : ''}>Area</option>
                                        <option value="serviceQuotesTotalPrice" ${sortBy == 'serviceQuotesTotalPrice' ? 'selected' : ''}>Total Price</option>
                                        <option value="serviceQuotesTotalPrice" ${sortBy == 'serviceQuotesTotalPrice' ? 'selected' : ''}>Total Price</option>
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

                                <!-- Filter By Status --1 pending, 2 approved(manager ok),3. rejected(by manage),4.accepted(customer), 5.refused(customer),6.refused(by staff),7. cancel -->
                                <div class="col-auto">
                                    <label for="statusFilter">Status:</label>
                                    <select name="statusFilter" id="statusFilter" class="form-control">
                                        <option value="" ${statusFilter == null ? 'selected' : ''}>All</option>
                                        <option value="1" ${statusFilter == 1 ? 'selected' : ''}>Pending</option>
                                        <option value="2" ${statusFilter == 2 ? 'selected' : ''}>Approved By Manager</option>
                                        <option value="3" ${statusFilter == 3 ? 'selected' : ''}>Rejected (Manager)</option>
                                        <option value="4" ${statusFilter == 4 ? 'selected' : ''}>Approved By Customer</option>
                                        <option value="5" ${statusFilter == 5 ? 'selected' : ''}>Rejected (Customer)</option>
                                        <option value="6" ${statusFilter == 6 ? 'selected' : ''}>Rejected (Staff)</option>
                                        <option value="7" ${statusFilter == 7 ? 'selected' : ''}>Cancel</option>
                                    </select>
                                </div>

                                <!-- Date Range Filter -->
                                <div class="col-auto">
                                    <label for="fromDate">From Date:</label>
                                    <input type="date" name="fromDate" id="fromDate" class="form-control" value="${fromDate}">
                                </div>

                                <div class="col-auto">
                                    <label for="toDate">To Date:</label>
                                    <input type="date" name="toDate" id="toDate" class="form-control" value="${toDate}">
                                </div>

                                <!-- Search by Name -->
                                <div class="col-auto">
                                    <label for="searchName">Service Quote Name</label>
                                    <input type="text" name="searchName" id="searchName" class="form-control" value="${searchName}">
                                </div>

                                <input type="hidden" name="page" value="${currentPage}">

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
                                <th>Date Created</th>
                                <th>Name</th>
                                <th>Area</th>
                                <th>Total Price</th>
                                <th>Status</th>               
                                <th>View Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="serviceQuote" items="${serviceQuote}">
                                <tr>
                                    <td>${serviceQuote.serviceQuotesDate}</td>
                                    <td>${serviceQuote.serviceQuotesName}</td>
                                    <td>${serviceQuote.serviceQuotesArea}</td>
                                    <td>${serviceQuote.serviceQuotesTotalPrice}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${serviceQuote.serviceQuotesStatus == 1}">
                                                <span class="badge badge-warning badge-status">Pending</span>
                                            </c:when>
                                            <c:when test="${serviceQuote.serviceQuotesStatus == 2}">
                                                <span class="badge badge-success badge-status">Approved By Manager</span>
                                            </c:when>
                                            <c:when test="${serviceQuote.serviceQuotesStatus == 3}">
                                                <span class="badge badge-warning badge-status">Rejected (Manager)</span>
                                            </c:when>
                                            <c:when test="${serviceQuote.serviceQuotesStatus == 4}">
                                                <span class="badge badge-success badge-status">Approved By Customer</span>
                                            </c:when>
                                            <c:when test="${serviceQuote.serviceQuotesStatus == 5}">
                                                <span class="badge badge-warning badge-status">Rejected (Customer)</span>
                                            </c:when>
                                            <c:when test="${serviceQuote.serviceQuotesStatus == 6}">
                                                <span class="badge badge-warning badge-status">Rejected (Staff)</span>
                                            </c:when>
                                            <c:when test="${serviceQuote.serviceQuotesStatus == 7}">
                                                <span class="badge badge-danger badge-status">Cancel</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td><a href="${pageContext.request.contextPath}/manager/serviceQuote/detail/${serviceQuote.serviceQuotesId}" class="btn btn-info">View</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination Controls -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <!-- Previous Button -->
                        <c:if test="${currentPage > 0}">
                            <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchName=${searchName}&fromDate=${fromDate}&toDate=${toDate}" class="btn btn-primary">&lt;</a>
                        </c:if>
                        <c:if test="${currentPage == 0}">
                            <button class="btn btn-primary" disabled>&lt;</button>
                        </c:if>

                        <!-- Page Indicator -->
                        <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                        <!-- Next Button -->
                        <c:if test="${currentPage < totalPages - 1}">
                            <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchName=${searchName}&fromDate=${fromDate}&toDate=${toDate}" class="btn btn-primary">&gt;</a>
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


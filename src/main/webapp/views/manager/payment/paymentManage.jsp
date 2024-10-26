<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Payment Management</title>
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
                    <h2 class="mb-4">Payment List</h2>

                    <div class="filter-card">
                        <!-- Sort and Search Form -->
                        <form method="get" action="${pageContext.request.contextPath}/manager/payment">
                            <div class="form-row align-items-center d-flex justify-content-between">
                                <!-- Sort By -->
                                <div class="col-auto">
                                    <label for="sortBy">Sort by:</label>
                                    <select name="sortBy" id="sortBy" class="form-control">
                                        <option value="paymentDate" ${sortBy == 'paymentDate' ? 'selected' : ''}>Payment Date</option>
                                        <option value="amount" ${sortBy == 'amount' ? 'selected' : ''}>Amount</option>
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

                                <!-- Search by Description -->
                                <div class="col-auto">
                                    <label for="searchDescription">Description:</label>
                                    <input type="text" name="searchDescription" id="searchDescription" class="form-control"
                                           placeholder="Search by description" value="${searchDescription}">
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

                                <!-- Include the customerId for filtering if necessary -->
                                <div class="col-auto">
                                    <label for="customerId">Customer ID:</label>
                                    <input type="text" name="customerId" id="customerId" class="form-control"
                                           placeholder="Enter Customer ID" value="${customerId}">
                                </div>

                                <input type="hidden" name="page" value="${currentPage}">

                                <!-- Apply Button -->
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary" style="margin-top: 2rem">Apply</button>
                                </div>
                            </div>
                        </form>
                    </div>


                    <!-- Table for payments -->
                    <table class="table table-bordered table-hover mt-3">
                        <thead class="thead-dark">
                            <tr>
                                <th>Id</th>
                                <th>Payment Date</th>
                                <th>Amount</th>
                                <th>Payment Method</th>
                                <th>Description</th>
                             
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="payment" items="${payments}">
                                <tr>
                                    <td>${payment.paymentId}</td>
                                    <td>${payment.formattedPaymentDate}</td>
                                    <td>${payment.amount}</td>
                                    <td>${payment.paymentMethod}</td>
                                    <td>${payment.description}</td>
                           
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination Controls -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <!-- Previous Button -->
                        <c:if test="${currentPage > 0}">
                            <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&searchDescription=${searchDescription}&fromDate=${fromDate}&toDate=${toDate}&customerId=${customerId}" class="btn btn-primary">&lt;</a>
                        </c:if>
                        <c:if test="${currentPage == 0}">
                            <button class="btn btn-primary" disabled>&lt;</button>
                        </c:if>

                        <!-- Page Indicator -->
                        <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                        <!-- Next Button -->
                        <c:if test="${currentPage < totalPages - 1}">
                            <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&searchDescription=${searchDescription}&fromDate=${fromDate}&toDate=${toDate}&customerId=${customerId}" class="btn btn-primary">&gt;</a>
                        </c:if>
                        <c:if test="${currentPage >= totalPages - 1}">
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

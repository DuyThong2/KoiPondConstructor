<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Payment History</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
        <%@include file="../cssTemplate.jsp"%>
        <%@include file="../cssCustom.jsp"%>
        <style>
            .form-control{
                font-size: 1.9rem;
            }
            @media (min-width: 992px) {
                .view-account .content-panel {
                    min-height: 800px;
                    border-left: 1px solid #f3f3f7;
                    margin-left: 250px;
                }
                .view-account .side-bar .side-menu .nav > li > a {
                    display: block;
                    color: #9499a3;
                    padding: 13px 15px;
                    padding-left: 30px;
                    width: 250px;
                }
            }
            .btn-default{
                padding: 10px 17px;
                font-size: 13px;
                border-radius: 10px;
            }

            .badge-default{
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 10px;
                transition: background-color 0.3s ease;
            }

            .badge-success{
                background-color: #28a745;
            }
            .badge-warning{
                background-color: #ffc107;
            }
            .badge-danger{
                background-color: #dc3545;
            }
            .badge-secondary{
                background-color: #6c757d;
            }
            body{
                background: #f9f9fb;
            }
            h2 {
                color: #2c3e50;
                font-weight: bold;
                margin-bottom: 20px;
                font-size: 3.5rem;
            }

            .filter-card {
                background-color: #ffffff;
                padding: 20px 30px;
                border-radius: 15px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .filter-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            }

            .filter-card label {
                font-weight: bold;
                color: #343a40;
                font-size: 16px;
            }

            .filter-card .form-control {
                border-radius: 10px;
                border: 1px solid #ced4da;
                padding: 10px;
                font-size: 18px;
                transition: box-shadow 0.3s ease;
            }

            .filter-card .form-control:focus {
                box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
                border-color: #007bff;
            }

            .filter-card button {
                background-color: #007bff;
                border: none;
                color: white;
                margin-top: 3rem;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s ease;
            }

            .filter-card button:hover {
                background-color: #0056b3;
                color: #ffffff;
            }
            /* Table Styling */
            .table {
                margin-top: 20px;
                border-collapse: collapse;
                width: 100%;
                font-size: 19px;
                background-color: #fff;
            }

            .table thead th {
                background-color: #2c3e50;
                color: white;
                padding: 10px;
                text-align: left;
                border-bottom: 2px solid #ddd;
            }

            .table tbody td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            .table tbody tr:hover {
                background-color: #f2f2f2;
            }
            .d-flex{
                margin-top: 0;
            }
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

    <body>
        <div class="container mt-5">
            <div class="view-account">
                <section class="module">
                    <div class="module-inner">
                        <%--User navbar--%>
                        <%@include file="../navbarUser.jsp"%>

                        <div class="content-panel">
                            <div class="container">
                                <h2>Payment History</h2>

                                <!-- Sort Form -->
                                <div class="filter-card">
                                    <form method="get" action="${pageContext.request.contextPath}/customer/payment">
                                        <div class="row align-items-center">
                                            <!-- Sort By and Direction -->
                                            <div class="col-auto">
                                                <label for="sortBy">Sort by:</label>
                                                <select name="sortBy" id="sortBy" class="form-control" size="padding: 20px">
                                                    <option value="paymentDate" ${sortBy == 'paymentDate' ? 'selected' : ''}>Payment Date</option>
                                                    <option value="amount" ${sortBy == 'amount' ? 'selected' : ''}>Amount</option>
                                                </select>
                                            </div>
                                            <div class="col-auto">
                                                <label for="sortDirection">Direction:</label>
                                                <select name="sortDirection" id="sortDirection" class="form-control" size="padding: 20px">
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

                                            <!-- Date Range Filters -->
                                            <div class="col-auto">
                                                <label for="fromDate">From Date:</label>
                                                <input type="date" name="fromDate" id="fromDate" class="form-control" value="${fromDate}">
                                            </div>
                                            <div class="col-auto">
                                                <label for="toDate">To Date:</label>
                                                <input type="date" name="toDate" id="toDate" class="form-control" value="${toDate}">
                                            </div>

                                            <!-- Hidden Page Parameter and Submit Button -->
                                            <input type="hidden" name="page" value="${currentPage}">
                                            <div class="col-auto">
                                                <button type="submit" class="btn btn-primary btn-default" style="margin-top: 3rem">Search & Sort</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <!-- Table for payments -->
                                <table class="table table-bordered table-hover mt-3">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Payment Date</th>
                                            <th>Amount</th>
                                            <th>Payment Method</th>
                                            <th>Description</th>
                                            <th>View Detail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="payment" items="${payments}">
                                            <tr>
                                                <td>${payment.formattedPaymentDate}</td>
                                                <td>${payment.amount}</td>
                                                <td>${payment.paymentMethod}</td>
                                                <td>${payment.description}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/payment/${payment.paymentId}" class="btn-default btn btn-info">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <!-- Pagination Controls -->
                                <div class="d-flex align-items-center mt-4">
                                    <!-- Previous Button -->
                                    <c:if test="${currentPage > 0}">
                                        <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&searchDescription=${searchDescription}&fromDate=${fromDate}&toDate=${toDate}" class="btn btn-custom">&lt;</a>
                                    </c:if>
                                    <c:if test="${currentPage == 0}">
                                        <button class="btn btn-custom" disabled>&lt;</button>
                                    </c:if>

                                    <!-- Page Indicator -->
                                    <span class="page-indicator"><strong>${currentPage + 1}</strong> / <strong>${totalPages}</strong></span>

                                    <!-- Next Button -->


                                    <c:if test="${currentPage < totalPages -1}">
                                        <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&searchDescription=${searchDescription}&fromDate=${fromDate}&toDate=${toDate}"class="btn btn-custom">&gt;</a>
                                    </c:if>
                                    <c:if test="${currentPage >= totalPages -1}">


                                        <button class="btn btn-custom" disabled>&gt;</button>
                                    </c:if>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script>
            document.querySelector('form').addEventListener('submit', function () {
                this.querySelectorAll('input, select').forEach(function (input) {
                    input.value = input.value.trim();
                });
            });
        </script>


    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <%@include file="../spacing.jsp"%>
    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>
</html>


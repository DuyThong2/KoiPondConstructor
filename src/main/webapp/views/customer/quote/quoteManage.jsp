
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Quote Manage Customer</title>
        <!-- Bootstrap CSS -->

        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <%@include file="../cssTemplate.jsp"%>

        <%@include file="../cssCustom.jsp"%>
        <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
        <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
        <style>
            .content-panel {
                width: 100%;
                padding: 0;
            }

            main {
                width: 100%;
                padding: 0 15px; /* You can adjust this padding as needed */
            }

            .container-fluid {
                padding-left: 0;
                padding-right: 0;
            }

            .view-account .module-inner {
                width: 100%; /* Ensure it takes the full width */
            }

            .collapse td {
                padding: 10px !important;
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
            .modal {
                opacity: 1 !important;
            }
            .d-flex{
                margin: 0;
            }
            .btn-modal{
                padding:5px 10px;
                font-size: 15px;
            }
            .btn-table{
                padding: 5px 15px;
                font-size: 17px;
                margin-bottom: 5px;
            }
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

    <body>
        <div class="container-fluid">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
            <div class="container mt-5">
                <div class="view-account">
                    <section class="module">
                        <div class="module-inner">
                            <%--User navbar--%>
                            <%@include file="../navbarUser.jsp"%>

                            <div class="content-panel">


                                <!-- Main content -->
                                <main role="main" class="col-md-12 col-lg-9 mx-auto px-4 mt-4">
                                    <h2 class="mb-4">My Quote List</h2>

                                    <div class="filter-card">
                                        <!-- Sort and Search Form -->
                                        <form method="get" action="${pageContext.request.contextPath}/customer/quote">
                                            <div class="row align-items-center d-flex justify-content-between">
                                                <!-- Sort By -->
                                                <div class="col-auto">
                                                    <label for="sortBy">Sort by:</label>
                                                    <select name="sortBy" id="sortBy" class="form-control" size="padding: 20px;">
                                                        <option value="quotesDate" ${sortBy == 'quotesDate' ? 'selected' : ''}>Date Created</option>
                                                        <option value="quotesArea" ${sortBy == 'quotesArea' ? 'selected' : ''}>Area</option>
                                                        <option value="quotesTotalPrice" ${sortBy == 'serviceQuotesTotalPrice' ? 'selected' : ''}>Total Price</option>
                                                        <option value="quotesDesignCost" ${sortBy == 'quotesDesignCost' ? 'selected' : ''}>Design Cost</option>
                                                        <option value="quotesConstructionCost" ${sortBy == 'quotesConstructionCost' ? 'selected' : ''}>Construction Cost</option>
                                                    </select>
                                                </div>

                                                <!-- Sort Direction -->
                                                <div class="col-auto">
                                                    <label for="sortDirection">Direction:</label>
                                                    <select name="sortDirection" id="sortDirection" class="form-control" size="padding: 20px;">
                                                        <option value="asc" ${sortDirection == 'asc' ? 'selected' : ''}>Ascending</option>
                                                        <option value="desc" ${sortDirection == 'desc' ? 'selected' : ''}>Descending</option>
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

                                                <input type="hidden" name="page" value="${currentPage}">

                                                <!-- Apply Button -->
                                                <div class="col-auto">
                                                    <button type="submit" class="btn btn-primary" style="margin-top: 3rem">Apply</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>



                                    <!-- Table for contracts -->
                                    <table class="table table-bordered table-hover mt-3">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th style="width: 13% ">Date Created</th>
                                                <th>Name</th>
                                                <th>Area</th>
                                                <th>Total Price</th>
                                                <th>Design Price</th>
                                                <th style="width: 10%">Construct Price</th>
                                                <th>Status</th>
                                                <th style="width: 10%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="Quote" items="${Quote}">
                                                <!-- Main Row -->
                                                <tr>
                                                    <td><fmt:formatDate value="${Quote.quotesDate}" pattern="dd-MM-yyyy"/></td>
                                                    <td>${Quote.quotesName}</td>
                                                    <td>${Quote.quotesArea} m²</td>
                                                    <td>${Quote.quotesTotalPrice}$</td>
                                                    <td>${Quote.quotesDesignCost}$</td>
                                                    <td>${Quote.quotesConstructionCost}$</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${Quote.quotesStatus == 2}">
                                                                <span class="badge badge-warning badge-status">Waiting Acceptance</span>
                                                            </c:when>
                                                            <c:when test="${Quote.quotesStatus == 4}">
                                                                <span class="badge badge-success badge-status">Accepted</span>
                                                            </c:when>
                                                            <c:when test="${Quote.quotesStatus == 5}">
                                                                <span class="badge badge-danger badge-status">Refused</span>
                                                            </c:when>
                                                            <c:when test="${Quote.quotesStatus == 6}">
                                                                <span class="badge badge-warning badge-status">In-progress</span>
                                                            </c:when>
                                                            <c:when test="${Quote.quotesStatus == 7}">
                                                                <span class="badge badge-danger badge-status">Canceled</span>
                                                            </c:when>
                                                            <c:when test="${Quote.quotesStatus == 8}">
                                                                <span class="badge badge-success badge-status">Completed</span>
                                                            </c:when>
                                                            
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${Quote.quotesStatus == 2}">
                                                                <button type="button" class="btn btn-success btn-table" data-toggle="modal" data-target="#acceptModal"
                                                                        onclick="document.getElementById('acceptForm').id.value = '${Quote.quotesId}';
                                                                                document.getElementById('acceptForm').status.value = '4';">Approve
                                                                </button>

                                                                <button style="margin-left: 7px" type="button" class="btn btn-danger btn-table" data-toggle="modal" data-target="#declineModal"
                                                                        onclick="document.getElementById('declineForm').id.value = '${Quote.quotesId}';
                                                                                document.getElementById('declineForm').toUserId.value = '${Quote.staff.id}';
                                                                                document.getElementById('declineForm').status.value = '5';">Reject
                                                                </button>
                                                            </c:when>                                                           
                                                            <c:when test="${serviceQuote.serviceQuotesStatus == 5}">
                                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#acceptModal"
                                                                        onclick="document.getElementById('acceptForm').id.value = '${Quote.quotesId}';
                                                                                document.getElementById('acceptForm').status.value = '7';">Cancel
                                                                </button>
                                                            </c:when>
                                                            
                                                        </c:choose>
                                                    </td>
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

                        <!-- Decline Modal -->
                        <div class="modal fade" id="declineModal" tabindex="-1" role="dialog" aria-labelledby="declineModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="declineModalLabel">Reason for Declining</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form id="declineForm" action="${pageContext.request.contextPath}/customer/quote/updateStatusAndFeedback" method="post">
                                            <input type="hidden" name="id" value="">
                                            <input type="hidden" name="status" value="">
                                            <input type="hidden" name="toUserId" value="">
                                            <div class="form-group">
                                                <label for="declineReason">Please provide a reason for declining this quote:</label>
                                                <textarea class="form-control" id="declineReason" name="declineReason" rows="4" required></textarea>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <button type="submit" form="declineForm" class="btn btn-danger">Submit Reason & Decline</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Accept Modal -->
                        <div class="modal fade" id="acceptModal" tabindex="-1" role="dialog" aria-labelledby="acceptModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="acceptModalLabel">Confirm Acceptance</h5>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to continue?
                                        <form id="acceptForm" action="${pageContext.request.contextPath}/customer/quote/updateStatus" method="post">
                                            <input type="hidden" name="id" value="">
                                            <input type="hidden" name="status" value="">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary btn-modal" data-dismiss="modal">Cancel</button>
                                        <button type="submit" form="acceptForm" class="btn btn-success btn-modal">Yes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>
                </div>
                <!-- Popup -->
                <%@include file="../../popup.jsp"%>
            </div>
        </div>
            <!-- Bootstrap JS and dependencies -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
    <%@include file="../spacing.jsp"%>

    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>

</html>

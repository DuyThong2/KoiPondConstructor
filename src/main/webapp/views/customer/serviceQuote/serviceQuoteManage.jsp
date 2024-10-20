<%-- 
    Document   : serviceQuoteManage
    Created on : Oct 16, 2024, 7:55:09 PM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Contract Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <%@include file="../cssTemplate.jsp"%>
        <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
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
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

    <body>
        <div class="container-fluid">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
            <div class="container">
                <div class="view-account">
                    <section class="module">
                        <div class="module-inner">
                            <div class="side-bar">
                                <div class="user-info">
                                    <img
                                        class="img-profile img-circle img-responsive center-block"
                                        src="${user.getShowingImg(user.imgURL)}"
                                        alt />
                                    <ul class="meta list list-unstyled">
                                        <li class="name">
                                            ${user.name}
                                            <br />
                                            <label class="label label-info">Customer</label>
                                        </li>
                                        <li class="email">
                                            <a href="#"><span>${user.email}</span></a>
                                        </li>
                                    </ul>
                                </div>
                                <nav class="side-menu">
                                    <ul class="nav">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/profile"
                                               ><span class="fa fa-user"></span> Profile</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/contract">
                                                <span class="fas fa-file-contract"></span> My Contract</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/projects/">
                                                <span class="fas fa-project-diagram"></span> My Project</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle active" id="quoteDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="bi bi-bar-chart-line"></span> Quotes
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="quoteDropdown">
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/customer/quote">Construction Quote</a>
                                                <a class="dropdown-item" href="${pageContext.request.contextPath}/customer/serviceQuote">Service Quotes</a>
                                            </div>
                                        </li>                                                                              
                                        <li>
                                            <a href="#"><span class="bi bi-bar-chart-line"></span> Service</a>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                            <div class="content-panel">


                                <!-- Main content -->
                                <main role="main" class="col-md-12 col-lg-9 mx-auto px-4 mt-4">
                                    <h2 class="mb-4">Service Quote List</h2>

                                    <div class="filter-card">
                                        <!-- Sort and Search Form -->
                                        <form method="get" action="${pageContext.request.contextPath}/customer/serviceQuote">
                                            <div class="form-row align-items-center d-flex justify-content-between">
                                                <!-- Sort By -->
                                                <div class="col-auto">
                                                    <label for="sortBy">Sort by:</label>
                                                    <select name="sortBy" id="sortBy" class="form-control">
                                                        <option value="serviceQuotesDate" ${sortBy == 'serviceQuotesDate' ? 'selected' : ''}>Date Created</option>
                                                        <option value="serviceQuotesArea" ${sortBy == 'serviceQuotesArea' ? 'selected' : ''}>Area</option>
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
                                                <th>Point Used</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                                <th>View Detail</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="serviceQuote" items="${serviceQuote}">
                                                <!-- Main Row -->
                                                <tr>
                                                    <td>${serviceQuote.serviceQuotesDate}</td>
                                                    <td>${serviceQuote.serviceQuotesName}</td>
                                                    <td>${serviceQuote.serviceQuotesArea} m²</td>
                                                    <td>${serviceQuote.serviceQuotesTotalPrice}</td>
                                                    <td>${serviceQuote.usedPoint}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${serviceQuote.serviceQuotesStatus == 2}">
                                                                <span class="badge badge-success badge-status">Pending</span>
                                                            </c:when>
                                                            <c:when test="${serviceQuote.serviceQuotesStatus == 4}">
                                                                <span class="badge badge-success badge-status">Approved By Customer</span>
                                                            </c:when>
                                                            <c:when test="${serviceQuote.serviceQuotesStatus == 5}">
                                                                <span class="badge badge-warning badge-status">Rejected (Customer)</span>
                                                            </c:when>
                                                            <c:when test="${serviceQuote.serviceQuotesStatus == 7}">
                                                                <span class="badge badge-danger badge-status">Cancel</span>
                                                            </c:when>
                                                            <c:when test="${serviceQuote.serviceQuotesStatus == 8}">
                                                                <span class="badge badge-success badge-status">Complete</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${serviceQuote.serviceQuotesStatus == 2}">
                                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#acceptModal"
                                                                        onclick="document.getElementById('acceptForm').id.value = '${serviceQuote.serviceQuotesId}';
                                                                                document.getElementById('acceptForm').status.value = '4';">Approve
                                                                </button>

                                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#declineModal"
                                                                        onclick="document.getElementById('declineForm').id.value = '${serviceQuote.serviceQuotesId}';
                                                                                document.getElementById('declineForm').toUserId.value = '${serviceQuote.staff.id}';
                                                                                document.getElementById('declineForm').status.value = '5';">Reject
                                                                </button>
                                                            </c:when>                                                           
                                                            <c:when test="${serviceQuote.serviceQuotesStatus == 5}">
                                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#acceptModal"
                                                                        onclick="document.getElementById('acceptForm').id.value = '${serviceQuote.serviceQuotesId}';
                                                                                document.getElementById('acceptForm').status.value = '7';">Cancel
                                                                </button>
                                                            </c:when>                                                           
                                                        </c:choose>

                                                    </td>
                                                    <td>
                                                        <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#details${serviceQuote.serviceQuotesId}" aria-expanded="false" aria-controls="details${serviceQuote.serviceQuotesId}">
                                                            View More
                                                        </button>
                                                    </td>
                                                </tr>

                                                <!-- Expandable/Collapsible Row -->
                                                <tr id="details${serviceQuote.serviceQuotesId}" class="collapse">
                                                    <td colspan="8"> 
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr class="table-info">
                                                                    <th>Service Name</th>
                                                                    <th>Service Description</th>
                                                                    <th>Service Price</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${serviceQuote.service}" var="service">
                                                                    <tr>
                                                                        <td>${service.serviceName}</td>
                                                                        <td>${service.serviceDescription}</td>
                                                                        <td>
                                                                            <c:set var="priceDisplayed" value="false" />
                                                                            <c:forEach var="servicePrice" items="${service.servicePrice}">
                                                                                <c:if test="${service.serviceId == servicePrice.service.serviceId and priceDisplayed == false}"> 
                                                                                    ${servicePrice.value * serviceQuote.serviceQuotesArea}
                                                                                    <c:set var="priceDisplayed" value="true" />
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>    
                                                            </tbody>
                                                        </table>
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
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="declineForm" action="${pageContext.request.contextPath}/customer/serviceQuote/saveStatus" method="post">
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
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to continue?
                                        <form id="acceptForm" action="${pageContext.request.contextPath}/customer/serviceQuote/saveStatus" method="post">
                                            <input type="hidden" name="id" value="">
                                            <input type="hidden" name="status" value="">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <button type="submit" form="acceptForm" class="btn btn-success">Yes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </section>
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

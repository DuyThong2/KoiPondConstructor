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
        <%@include file="../cssTemplate.jsp"%>
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
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

    <body>
        <div class="container mt-5">
            <div class="view-account">
                <section class="module">
                    <div class="module-inner">
                        <div class="side-bar">
                            <div class="user-info">
                                <img class="img-profile img-circle img-responsive center-block" src="${user.getShowingImg(user.imgURL)}" alt />
                                <ul class="meta list list-unstyled">
                                    <li class="name">${user.name}
                                        <br>
                                        <label class="label label-info">Customer</label>
                                    </li>
                                    <li class="email">
                                        <a href="#"><span>${user.email}</span></a>
                                    </li>
                                </ul>
                            </div>
                            <nav class="side-menu">
                                <nav class="side-menu">
                                    <ul class="nav">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/profile"><span class="fa fa-user"></span> Profile</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/consultant"
                                               style="font-size: 16px">
                                                <span class="bi bi-briefcase"></span> My
                                                Consultant</a>
                                        </li>
                                        <li class="active">
                                            <a href="${pageContext.request.contextPath}/customer/contract">
                                                <span class="fas fa-file-contract"></span> My Contract</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/projects/">
                                                <span class="fas fa-project-diagram"></span> My Project</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/quote"><span class="bi bi-bar-chart-line"></span> Quotes</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/serviceDetails/"><span class="bi bi-bar-chart-line"></span> Service</a>
                                        </li>
                                    </ul>
                                </nav>
                            </nav>
                        </div>
                        <div class="content-panel">
                            <div class="container">
                                <h2>Payment History</h2>

                                <!-- Sort Form -->
                                <form method="get" action="${pageContext.request.contextPath}/customer/payment">
                                    <div class="form-row align-items-center">
                                        <!-- Sort By and Direction -->
                                        <div class="col-auto">
                                            <label for="sortBy">Sort by:</label>
                                            <select name="sortBy" id="sortBy" class="form-control">
                                                <option value="paymentDate" ${sortBy == 'paymentDate' ? 'selected' : ''}>Payment Date</option>
                                                <option value="amount" ${sortBy == 'amount' ? 'selected' : ''}>Amount</option>
                                            </select>
                                        </div>
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
                                            <button type="submit" class="btn btn-primary btn-default mt-2">Search & Sort</button>
                                        </div>
                                    </div>
                                </form>


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
                                        <a href="?page=${currentPage - 1}
                                           &sortBy=${sortBy}
                                           &sortDirection=${sortDirection}
                                           &searchDescription=${searchDescription}
                                           &fromDate=${fromDate}
                                           &toDate=${toDate}" 
                                           class="btn btn-custom">&lt;</a>
                                    </c:if>
                                    <c:if test="${currentPage == 0}">
                                        <button class="btn btn-custom" disabled>&lt;</button>
                                    </c:if>

                                    <!-- Page Indicator -->
                                    <span class="page-indicator"><strong>${currentPage + 1}</strong> / <strong>${totalPages + 1}</strong></span>

                                    <!-- Next Button -->
                                    <c:if test="${currentPage < totalPages - 1}">
                                        <a href="?page=${currentPage + 1}
                                           &sortBy=${sortBy}
                                           &sortDirection=${sortDirection}
                                           &searchDescription=${searchDescription}
                                           &fromDate=${fromDate}
                                           &toDate=${toDate}" 
                                           class="btn btn-custom">&gt;</a>
                                    </c:if>
                                    <c:if test="${currentPage >= totalPages - 1}">
                                        <button class="btn btn-custom" disabled>&gt;</button>
                                    </c:if>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </body>
    <%@include file="../spacing.jsp"%>
    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>
</html>

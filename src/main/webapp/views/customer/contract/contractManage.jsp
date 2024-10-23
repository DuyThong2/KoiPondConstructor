<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Contract</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <%@include file="../cssTemplate.jsp"%>
        <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
        <%@include file="../cssCustom.jsp"%>
        <style>
            .form-control{
                font-size: 1.9rem;
            }

            .content-panel {
                background: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
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
            .d-flex{
                margin-top: 0px;
            }
            h2 {
                color: #2c3e50;
                font-weight: bold;
                margin-bottom: 20px;
                font-size: 3.5rem;
            }
            .btn-download{
                padding: 5px;
                font-size: 1.3rem;
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

        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

    <body>

        <section id="services"
                 class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
            <div class="container rr-shape-p-c_1">
                <div class="service__shape-1 rr-shape-p-s_1 leftRight">
                    <div></div>
                </div>

                <div class="row mb-30 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                    <div class="col-md-6">
                        <div class="section__title-wrapper text-center text-xl-start">
                            <span class="section__subtitle justify-content-start mb-13"><span data-width="40px"
                                                                                              class="left-separetor"></span>Yourself</span>
                            <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                data-cursor="-opaque">Information
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
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
                                            <a href="${pageContext.request.contextPath}/customer/quote">
                                                <i class="bi bi-file-earmark-text"></i> Quotes</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/serviceDetails/">
                                                <span class="bi bi-bar-chart-line"></span> Service</a>
                                        </li>
                                    </ul>
                                </nav>
                            </nav>
                        </div>
                        <div class="content-panel">
                            <div class="container">
                                <h2>Contract List</h2>

                                <!-- Sort Form -->
                                <div class="filter-card">
                                <form method="get" action="${pageContext.request.contextPath}/customer/contract">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <label for="sortBy">Sort by:</label>
                                            <select name="sortBy" id="sortBy" class="form-control" size="padding: 20px">
                                                <option value="dateCreate" ${sortBy == 'dateCreate' ? 'selected' : ''}>Date Created</option>
                                                <option value="totalPrice" ${sortBy == 'totalPrice' ? 'selected' : ''}>Total Price</option>

                                            </select>
                                        </div>
                                        <div class="col-auto">
                                            <label for="sortDirection">Direction:</label>
                                            <select name="sortDirection" id="sortDirection" class="form-control" size="padding: 20px">
                                                <option value="asc" ${sortDirection == 'asc' ? 'selected' : ''}>Ascending</option>
                                                <option value="desc" ${sortDirection == 'desc' ? 'selected' : ''}>Descending</option>
                                            </select>
                                        </div>
                                        <input type="hidden" name="page" value="${currentPage}">
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-primary btn-default">Sort</button>
                                        </div>
                                    </div>
                                </form>
                                </div>
                                <!-- Table for contracts -->
                                <table class="table table-bordered table-hover mt-3">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Date Created</th>
                                            <th>File URL</th>
                                            <th>Total Price</th>

                                            <th>Contract Term</th>
                                            <th>Contract Status</th>
                                            <th>Contract Note</th>
                                            <th>View Detail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="contract" items="${contracts}">
                                            <tr>
                                                <td> <fmt:formatDate value="${contract.dateCreate}" pattern="dd-MM-yyyy"/></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty contract.fileURL}">
                                                            <form action="${pageContext.request.contextPath}/download/${contract.fileURL}" method="get">
                                                                <button type="submit" class="btn btn-download btn-outline-primary">
                                                                    <i class="fas fa-download"></i> Download Contract
                                                                </button>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="submit" class="btn btn-download btn-outline-danger">
                                                                <i class="fas fa-download"></i> File not available
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${contract.totalPrice}</td>

                                                <td>${contract.contractTerm}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${contract.contractStatus == 1}">
                                                            <span class="badge badge-warning badge-default status-badge">Pending</span>
                                                        </c:when>
                                                        <c:when test="${contract.contractStatus == 2}">
                                                            <span class="badge badge-success badge-default status-badge">Approved</span>
                                                        </c:when>
                                                        <c:when test="${contract.contractStatus == 3}">
                                                            <span class="badge badge-danger badge-default status-badge">Rejected (Customer)</span>
                                                        </c:when>
                                                        <c:when test="${contract.contractStatus == 4}">
                                                            <span class="badge badge-danger badge-default status-badge">Rejected (Manager)</span>
                                                        </c:when>
                                                        <c:when test="${contract.contractStatus == 5}">
                                                            <span class="badge badge-secondary badge-default status-badge">Canceled</span>
                                                        </c:when>
                                                        <c:when test="${contract.contractStatus == 6}">
                                                            <span class="badge badge-success badge-default status-badge">Accepted</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${contract.contractNote}</td>
                                                <td><a href="${pageContext.request.contextPath}/customer/contract/viewDetail/${contract.contractId}" class="btn-default btn btn-info">View</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <br>
                                <!-- Pagination Controls -->
                                <div class="d-flex align-items-center mt-4">
                                    <!-- Previous Button -->
                                    <c:if test="${currentPage > 0}">
                                        <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}" class="btn btn-custom">&lt;</a>
                                    </c:if>
                                    <c:if test="${currentPage == 0}">
                                        <button class="btn btn-custom" disabled>&lt;</button>
                                    </c:if>

                                    <!-- Page Indicator -->
                                    <span class="page-indicator"><strong>${currentPage + 1}</strong> / <strong>${totalPages}</strong></span>

                                    <!-- Next Button -->


                                    <c:if test="${currentPage < totalPages -1}">
                                        <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}"class="btn btn-custom">&gt;</a>
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

    </body>
    <%@include file="../spacing.jsp"%>
    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>

</html>

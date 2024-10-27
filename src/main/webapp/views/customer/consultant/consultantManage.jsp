<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Consultant</title>
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <%@include file="../cssTemplate.jsp" %>
        <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
        <style>
            .view-account .side-bar .user-info .meta li span {
                display: inline-block;
                width: 190px;
                margin-right: 5px;
                text-align: right;
            }

            .btn-default {
                padding: 10px 17px;
                font-size: 15px;
                border-radius: 10px;
            }
            .row {
                margin-right: -190px;
                margin-left: -15px;
            }

            .content-panel {
                background: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
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

            .badge {
                font-size: 15px;
                padding: 10px;
            }

            .pagination-controls button {
                padding: 10px 20px;
                background-color: #3498db;
                border: none;
                color: white;
                border-radius: 6px;
                transition: background-color 0.3s ease;
            }

            .pagination-controls button:hover {
                background-color: #2980b9;
            }

            .pagination-controls span {
                font-weight: bold;
            }

            @media (min-width: 1200px) {
                .container {
                    width: 1400px;
                }
            }
            a{
                color: inherit;
            }
            .btn-danger{
                padding: 10px;
                font-size: 15px;
            }
            .badge-success{
                background-color: #28a745;
            }
            .badge-info{
                background-color: #08e8de ;
            }
            .badge-danger{
                background-color: #dc3545;
            }
            .badge-secondary{
                background-color: #6c757d;
            }
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp" %>

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

                        <%--User navbar--%>
                        <%@include file="../navbarUser.jsp"%>

                        <div class="content-panel">

                            <div class="row">
                                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 mt-4">
                                    <h2 class="mb-4">Consultant List</h2>

                                    <!-- Filter Card -->
                                    <div class="filter-card">
                                        <form method="get" action="${pageContext.request.contextPath}/customer/consultant">
                                            <div class="row align-items-center">
                                                <!-- Sort By -->
                                                <div class="col-auto">
                                                    <label for="sortBy">Sort by:</label>
                                                    <select name="sortBy" id="sortBy" class="form-control" size="padding: 20px">
                                                        <option value="consultantDateTime" ${sortBy=='consultantDateTime'? 'selected' : '' }>Consultant Date</option>
                                                        <option value="consultantType" ${sortBy=='consultantType'? 'selected' : '' }>Consultant Type</option>
                                                        <option value="consultantStatus" ${sortBy=='consultantStatus'? 'selected' : '' }>Consultant Status</option>
                                                    </select>
                                                </div>

                                                <!-- Sort Direction -->
                                                <div class="col-auto">
                                                    <label for="sortDirection">Sort Direction: </label>
                                                    <select name="sortDirection" id="sortDirection" class="form-control" size="padding: 20px">
                                                        <option value="asc" ${sortDirection=='asc'? 'selected' : '' }>Ascending</option>
                                                        <option value="desc" ${sortDirection=='desc'? 'selected' : '' }>Descending</option>
                                                    </select>
                                                </div>

                                                <!-- Filter By Status -->
                                                <div class="col-auto">
                                                    <label for="statusFilter">Status:</label>
                                                    <select name="statusFilter" id="statusFilter"
                                                            class="form-control"
                                                            size="padding: 20px">
                                                        <option value="" ${statusFilter==null
                                                                           ? 'selected' : '' }>All
                                                        </option>
                                                        <option value="1" ${statusFilter==1
                                                                            ? 'selected' : '' }>Pending
                                                        </option>
                                                        <option value="2" ${statusFilter==2
                                                                            ? 'selected' : '' }>Staff Assigned
                                                        </option>
                                                        <option value="3" ${statusFilter==3
                                                                            ? 'selected' : '' }>In-Progress
                                                        </option>
                                                        <option value="4" ${statusFilter==4
                                                                            ? 'selected' : '' }>Completed
                                                        </option>
                                                        <option value="5" ${statusFilter==5
                                                                            ? 'selected' : '' }>Cancel
                                                        </option>
                                                    </select>
                                                </div>

                                                <input type="hidden" name="page"
                                                       value="${currentPage}">
                                                <div class="col-auto">
                                                    <button type="submit"
                                                            class="btn btn-apply btn-default btn-primary">Apply</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <!-- Service Detail Table -->
                                    <table class="table table-bordered table-hover mt-3">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Consultant ID</th>
                                                <th>Date</th>
                                                <th>Consultant Type</th>
                                                <th>Consultant Status</th>
                                                <th>Staff Name</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="consultant" items="${consultant}">
                                                <!-- Main Service Row -->
                                                <tr>
                                                    <td>${consultant.consultantId}</td>
                                                    <td><fmt:formatDate value="${consultant.consultantDateTime.time}" pattern="yyyy-MM-dd HH:mm"/></td>
                                                    <td>${consultant.consultantType}</td>
                                                    <td style="text-align: center;">
                                                        <c:choose>
                                                            <c:when
                                                                test="${consultant.consultantStatus == 1}">
                                                                <span
                                                                    class="badge badge-secondary">Pending</span>
                                                            </c:when>
                                                            <c:when
                                                                test="${consultant.consultantStatus == 2}">
                                                                <span
                                                                    class="badge badge-info">Staff Assigned</span>
                                                            </c:when>
                                                            <c:when
                                                                test="${consultant.consultantStatus == 3}">
                                                                <span
                                                                    class="badge badge-primary">In-Progress</span>
                                                            </c:when>
                                                            <c:when
                                                                test="${consultant.consultantStatus == 4}">
                                                                <span
                                                                    class="badge badge-success">Complete</span>

                                                            </c:when>
                                                            <c:when
                                                                test="${consultant.consultantStatus == 5}">
                                                                <span
                                                                    class="badge badge-danger">Canceled</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose> 
                                                            <c:when test="${consultant.staff != null}"> ${consultant.staff.name}</c:when>
                                                            <c:otherwise>No Staff Available Yet</c:otherwise>
                                                        </c:choose>

                                                    </td>
                                                    <td>
                                                        <c:if test="${consultant.consultantStatus < 4}">
                                                            <form method="get" action="${pageContext.request.contextPath}/customer/consultant/updateStatus">
                                                                <input type="hidden" name="consultantId" value="${consultant.consultantId}">
                                                                <input type="hidden" name="statusId" value="${5}">
                                                                <button type="submit" class="btn btn-danger">Cancel</button>
                                                            </form>
                                                        </c:if>
                                                    </td>
                                                </tr>

                                                <!-- Collapsible Row for Customer and Staff Information -->

                                            </c:forEach>
                                            <c:if test="${empty consultant}">
                                                <tr>
                                                    <td colspan="6" class="text-center">No
                                                        Consultant Available
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <!-- Pagination Controls -->

                                    <div
                                        class="d-flex  justify-content-between align-items-center mt-4">
                                        <c:if test="${currentPage != 1}">

                                            <form method="get" action="${pageContext.request.contextPath}/customer/serviceDetails/">
                                                <button class="btn btn-primary" type="submit"><</button>
                                                <input type="hidden" name="page" value="${currentPage - 1}">
                                                <input type="hidden" name="size" value="${size}">
                                                <input type="hidden" name="sortBy" value="${sortBy}">
                                                <input type="hidden" name="sortType" value="${sortType}">
                                                <c:if test="${statusFilter != null}">
                                                    <input type="hidden" name="statusFilter" value="${statusFilter}">
                                                </c:if>
                                            </form>

                                        </c:if>


                                        <span>Page <strong>${currentPage}</strong> of
                                            <strong>${totalPage}</strong></span>


                                        <c:if test="${currentPage != totalPage}">

                                            <form method="get" action="${pageContext.request.contextPath}/customer/serviceDetails/">
                                                <button class="btn btn-primary" type="submit">></button>
                                                <input type="hidden" name="page" value="${currentPage + 1}">
                                                <input type="hidden" name="size" value="${size}">
                                                <input type="hidden" name="sortBy" value="${sortBy}">
                                                <input type="hidden" name="sortType" value="${sortType}">
                                                <c:if test="${statusFilter != null}">
                                                    <input type="hidden" name="statusFilter" value="${statusFilter}">
                                                </c:if>
                                            </form>

                                        </c:if>
                                    </div>
                                </main>
                            </div>
                        </div>
                    </div>

                </section>
            </div>
        </div>
    </body>
    <script>
        var currentDetailsRow = null;

    </script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <%@include file="../spacing.jsp" %>
    <%@include file="../footer.jsp" %>
    <%@include file="../scriptTemplate.jsp" %>

</html>

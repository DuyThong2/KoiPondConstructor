<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Quote Management</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
        <style>
            h2 {
                font-weight: bold;
                color: #007bff;
                border-bottom: 2px solid #007bff;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .filter-card {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
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
                    <h2 class="mb-4">Quote List</h2>
                    <div class="filter-card">
                        <form method="get" action="${pageContext.request.contextPath}/manager/quote">
                            <div class="form-row align-items-center">
                                <!-- Sort By -->
                                <div class="col-auto">
                                    <label for="sortBy">Sort by:</label>
                                    <select name="sortBy" id="sortBy" class="form-control">
                                        <option value="quotesDate" ${sortBy=='quotesDate' ? 'selected' : ''
                                                }>Date Created</option>
                                        <option value="quotesArea" ${sortBy=='quotesArea' ? 'selected' : ''
                                                }>Area</option>
                                        <option value="quotesTotalPrice" ${sortBy=='quotesTotalPrice'
                                                                           ? 'selected' : '' }>Total Cost</option>
                                        <option value="quotesDesignCost" ${sortBy=='quotesDesignCost'
                                                                           ? 'selected' : '' }>Design Cost</option>
                                        <option value="quotesConstructionCost"
                                                ${sortBy=='quotesConstructionCost' ? 'selected' : '' }>
                                            Construction Cost</option>
                                    </select>
                                </div>

                                <!-- Sort Direction -->
                                <div class="col-auto">
                                    <label for="sortDirection">Direction:</label>
                                    <select name="sortDirection" id="sortDirection" class="form-control">
                                        <option value="asc" ${sortDirection=='asc' ? 'selected' : '' }>
                                            Ascending</option>
                                        <option value="desc" ${sortDirection=='desc' ? 'selected' : '' }>
                                            Descending</option>
                                    </select>
                                </div>

                                <!-- Filter By Status -->
                                <div class="col-auto">
                                    <label for="statusFilter">Status:</label>
                                    <select name="statusFilter" id="statusFilter" class="form-control">
                                        <option value="" ${statusFilter==null ? 'selected' : '' }>All
                                        </option>
                                        <option value="1" ${statusFilter==1 ? 'selected' : '' }>Pending
                                        </option>
                                        <option value="2" ${statusFilter==2 ? 'selected' : '' }>Approved
                                        </option>
                                        <option value="3" ${statusFilter==3 ? 'selected' : '' }>Rejected
                                        </option>
                                        <option value="4" ${statusFilter==4 ? 'selected' : '' }>Approve By
                                            Customer</option>
                                        <option value="5" ${statusFilter==5 ? 'selected' : '' }>Rejected By
                                            Customer</option>
                                        <option value="6" ${statusFilter==6 ? 'selected' : '' }>Rejected By
                                            Staff</option>
                                        <option value="7" ${statusFilter==7 ? 'selected' : '' }>Cancel
                                        </option>
                                        <option value="8" ${statusFilter == 8 ? 'selected' : ''}>Contract Created</option>
                                    </select>
                                </div>

                                <input type="hidden" name="page" value="${currentPage}">
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary"
                                            style="margin-top: 1.9rem">Apply</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date</th>
                                <th>Quote Name</th>
                                <th>Content</th>
                                <th>Area In m&sup2</th>
                                <th>Design Cost</th>
                                <th>Construction Cost</th>
                                <th>Total Price</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="quote" items="${quoteList}">
                                <tr>
                                    <td><fmt:formatDate value="${quote.quotesDate}" pattern="MMM dd yyyy" /></td>
                                    <td>${quote.quotesName}</td>
                                    <td>${quote.quotesContent}</td>
                                    <td>${quote.quotesArea} m&sup2</td>
                                    <td>${quote.quotesDesignCost}$</td>
                                    <td>${quote.quotesConstructionCost}$</td>
                                    <td>${quote.quotesTotalPrice}$</td>
                                    <td>
                                        <!--1 pending, 2 approved(manager ok),3. rejected(by manage),4.accepted(customer),
                    5.refused(customer), 6.refused(by staff), 7. cancel -->
                                        <c:choose>
                                            <c:when test="${quote.quotesStatus == 1}">
                                                <span class="badge badge-warning badge-status">Pending</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 2}">
                                                <span class="badge badge-success badge-status">Approved</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 3}">
                                                <span class="badge badge-warning badge-status">Rejected By Manager</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 4}">
                                                <span class="badge badge-success badge-status">Accepted By Customer</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 5}">
                                                <span class="badge badge-warning badge-status">Refused By Customer</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 6}">
                                                <span class="badge badge-warning badge-status">Refuse By Staff</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 7}">
                                                <span class="badge badge-danger badge-status">cancel</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 8}">
                                                <span class="badge badge-success badge-status">Contract Created</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manager/quote/detail/${quote.quotesId}"
                                           class="btn btn-info">Detail</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination Controls -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <!-- Previous Button -->
                        <c:if test="${currentPage > 0}">
                            <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}"
                               class="btn btn-primary">&lt;</a>
                        </c:if>
                        <c:if test="${currentPage == 0}">
                            <button class="btn btn-primary" disabled>&lt;</button>
                        </c:if>

                        <!-- Page Indicator -->
                        <span>Page <strong>${currentPage + 1}</strong> of
                            <strong>${totalPages}</strong></span>

                        <!-- Next Button -->
                        <c:if test="${currentPage < totalPages - 1}">
                            <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}"
                               class="btn btn-primary">&gt;</a>
                        </c:if>
                        <c:if test="${currentPage == totalPages - 1}">
                            <button class="btn btn-primary" disabled>&gt;</button>
                        </c:if>
                    </div>
                </main>
            </div>
        </div>
        <br>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>

</html>
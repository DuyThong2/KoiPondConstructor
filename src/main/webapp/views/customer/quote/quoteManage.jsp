<%-- 
    Document   : quoteManage
    Created on : Sep 27, 2024, 12:36:33 AM
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
        <style>
            /* Custom styles for the sidebar */
            .sidebar {
                height: 100vh;
                background-color: #343a40;
                color: white;
            }
            .sidebar a {
                color: white;
                display: block;
                padding: 10px;
                text-decoration: none;
            }
            .sidebar a:hover {
                background-color: #495057;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">               
                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <h2 class="mb-4">Quote List</h2>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date</th>
                                <th>Quote Name</th>
                                <th>Content</th>
                                <th>Area</th>
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
                                    <td>${quote.quotesDate}</td>               
                                    <td>${quote.quotesName}</td>
                                    <td>${quote.quotesContent}</td>
                                    <td>${quote.quotesArea}</td>
                                    <td>${quote.quotesDesignCost}</td>
                                    <td>${quote.quotesConstructionCost}</td>
                                    <td>${quote.quotesTotalPrice}</td>
                                    <td>
                                        <!--1 pending, 2 approved(manager ok),3. rejected(by manage),4.accepted(customer), 
                                            5.refused(customer), 6.refused(by staff), 7. cancel -->
                                        <c:choose>                                
                                            <c:when test="${quote.quotesStatus == 2}">
                                                <span class="badge badge-secondary badge-status">Customer view</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 4}">
                                                <span class="badge badge-success badge-status">Accepted</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 5}">
                                                <span class="badge badge-warning badge-status">Refused</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 6}">
                                                <span class="badge badge-warning badge-status">Refused</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 7}">
                                                <span class="badge badge-danger badge-status">cancel</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${quote.quotesStatus == 2}"> 
                                                <form action="/customer/quote/updateStatus" method="post" class="d-inline">
                                                    <input type="hidden" name="quoteId" value="${quote.quotesId}">
                                                    <input type="hidden" name="statusId" value="4">
                                                    <button type="submit" class="btn btn-success">Accept</button>
                                                </form>
                                                <form action="/customer/quote/updateStatus" method="post" class="d-inline">
                                                    <input type="hidden" name="quoteId" value="${quote.quotesId}">
                                                    <input type="hidden" name="statusId" value="5">
                                                    <button type="submit" class="btn btn-danger">Deny</button>
                                                </form>
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
                        <c:if test="${currentPage > 1}">
                            <a href="?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
                        </c:if>
                        <c:if test="${currentPage == 1}">
                            <button class="btn btn-primary" disabled>Previous</button>
                        </c:if>

                        <!-- Page Indicator (Format: <1/99>) -->
                        <span>Page <strong>${currentPage}</strong> of <strong>${totalPages}</strong></span>

                        <!-- Next Button -->
                        <c:if test="${currentPage < totalPages}">
                            <a href="?page=${currentPage + 1}" class="btn btn-primary">Next</a>
                        </c:if>
                        <c:if test="${currentPage == totalPages}">
                            <button class="btn btn-primary" disabled>Next</button>
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



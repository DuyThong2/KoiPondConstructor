<%-- 
    Document   : ContractManage
    Created on : Sep 18, 2024, 9:25:58 AM
    Author     : Admin
--%>




<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
               

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <h2 class="mb-4">Contract List</h2>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date Created</th>
                                <th>File URL</th>
                                <th>Total Price</th>
                                <th>Price on Concept Design</th>
                                <th>Price on Construction Design</th>
                                <th>Price on Detail Design</th>
                                <th>Price on Raw Construction</th>
                                <th>Price on Complete Construction</th>
                                <th>Contract Term</th>
                                <th>Contract Status</th>
                                <th>Contract Note</th>
                                <th>View Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="contract" items="${contracts}">
                                <tr>
                                    <td>${contract.dateCreate}</td>
                                    <td><a href="/download/${contract.fileURL}">${contract.fileURL}</a></td>
                                    <td>${contract.totalPrice}</td>
                                    <td>${contract.priceOnConceptDesign}</td>
                                    <td>${contract.priceOnConstructionDesign}</td>
                                    <td>${contract.priceOnDetailDesign}</td>
                                    <td>${contract.priceOnRawConstruction}</td>
                                    <td>${contract.priceOnCompleteConstruction}</td>
                                    <td>${contract.contractTerm}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${contract.contractStatus == 1}">
                                                <span class="badge badge-warning">Pending</span>
                                            </c:when>
                                            <c:when test="${contract.contractStatus == 2}">
                                                <span class="badge badge-success">Approved</span>
                                            </c:when>
                                            <c:when test="${contract.contractStatus == 3}">
                                                <span class="badge badge-danger">Rejected</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${contract.contractNote}</td>
                                    <td><a href="/customer/contract/${contract.contractId}" class="btn btn-info">Click Here</a></td>
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

<%-- 
    Document   : addConsultantStaff
    Created on : Sep 20, 2024, 11:32:15 PM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            .current{
                background-color: #ECECEC;
            }
            h2 {
                font-weight: bold;
                color: #343a40;
                border-bottom: 2px solid #343a40;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="../navBar.jsp" %>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 mt-4">
                    <h2 class="mb-4">Consultant Staff List</h2>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Id</th>
                                <th>Staff Name</th>
                                <th>Phone</th>
                                <th>Email</th>                                                              
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="staff" items="${consultantStaffList}">

                                <tr class=${consultant.staff.id == staff.id?"current":""}>                                  
                                    <td>${staff.id}</td>
                                    <td>${staff.name}</td>
                                    <td>${staff.phone}</td>
                                    <td>${staff.email}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${staff.enabled}">
                                                <span class="badge badge-warning badge-status">Active</span>
                                            </c:when>
                                            <c:when test="${staff.enabled}">
                                                <span class="badge badge-secondary badge-status">Not Active</span>
                                            </c:when>                                          
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${consultant.staff.id != staff.id}">
                                                <form action="${pageContext.request.contextPath}/manager/consultant/viewConsultantStaffList/editConsultantStaff" method="POST" class="d-inline">
                                                    <input type="hidden" name="id" value="${consultant.consultantId}">
                                                    <input type="hidden" name="staffId" value="${staff.id}">
                                                    <button type="submit" class="btn btn-info">Update Staff</button>
                                                </form>             
                                            </c:when>
                                            <c:when test="${consultant.staff.id == staff.id}">
                                                <a class="btn btn-success" style="pointer-events: none;">Current Staff</a>
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
    </body>

</html>


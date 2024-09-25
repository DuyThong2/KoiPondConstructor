<%-- 
    Document   : projectManage
    Created on : Sep 21, 2024, 2:33:13 PM
    Author     : ASUS
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <title>Admin Dashboard - Projects</title>
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
                <!-- Sidebar -->
                <nav class="col-md-2 d-none d-md-block sidebar">
                    <div class="sidebar-sticky">
                        <h4 class="text-center py-3">Admin Dashboard</h4>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/contracts">Contracts</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/design">Design</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/projects">Projects</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/terms">Terms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/reports">Reports</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/settings">Settings</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    
                    <h2 class="mb-4">Project List</h2>
                    <form method="get" action="/manager/projects">
                        <div class="form-row align-items-center">
                            <!-- Sort By -->
                            <div class="col-auto">
                                <label for="sortBy">Sort by:</label>
                                <select name="sortBy" id="sortBy" class="form-control">
                                    <option value="status" ${sortBy == 'status' ? 'selected' : ''}>Status</option>
                                    <option value="dateStart" ${sortBy == 'dateStart' ? 'selected' : ''}>Date Start</option>
                                    <option value="projectName" ${sortBy == 'projectName' ? 'selected' : ''}>Project Name</option>
                                </select>
                            </div>
            
                            <!-- Sort Direction -->
                            <div class="col-auto">
                                <label for="sortType">Type:</label>
                                <select name="sortType" id="sortType" class="form-control">
                                    <option value="asc" ${sortType == 'asc' ? 'selected' : ''}>Ascending</option>
                                    <option value="desc" ${sortType == 'desc' ? 'selected' : ''}>Descending</option>
                                </select>
                            </div>
            
                            <!-- Filter By Status -->
                            <div class="col-auto">
                                <label for="statusFilter">Status:</label>
                                <select name="statusFilter" id="statusFilter" class="form-control">
                                    <option value="" ${statusFilter == null ? 'selected' : ''}>All</option>
                                    <option value="1" ${statusFilter == 1 ? 'selected' : ''}>Pending</option>
                                    <option value="2" ${statusFilter == 2 ? 'selected' : ''}>Processing</option>
                                    <option value="3" ${statusFilter == 3 ? 'selected' : ''}>Accepted</option>
                                    <option value="4" ${statusFilter == 4 ? 'selected' : ''}>Cancel</option>
                                </select>
                            </div>
                            <div class="col-auto">
                                <label for="stageFilter">Stage:</label>
                                <select name="stageFilter" id="stageFilterr" class="form-control">
                                    <option value="" ${stageFilter == null ? 'selected' : ''}>All</option>
                                    <option value="1" ${stageFilter == 1 ? 'selected' : ''}>Planing</option>
                                    <option value="2" ${stageFilter == 2 ? 'selected' : ''}>Design</option>
                                    <option value="3" ${stageFilter == 3 ? 'selected' : ''}>Construction</option>
                                    <option value="4" ${stageFilter == 4 ? 'selected' : ''}>Maintenance</option>
                                    <option value="5" ${stageFilter == 5 ? 'selected' : ''}>Finish</option>
                                </select>
                            </div>
            
                            <input type="hidden" name="page" value="${currentPage}">
                            <div class="col-auto">
                                <button type="submit" class="btn btn-primary mt-2">Apply</button>
                            </div>
                        </div>
                    </form>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Project Id</th>
                                <th>Project Name</th>
                                <th>Customer Name</th>
                                <th>Date Start</th>
                                <th>Status</th>
                                 <th>Stage</th>
                                <th>More</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Static data for example -->
                            <c:forEach var="project" items="${projectList}">
                                <tr>
                                    <td>${project.projectId}</td>
                                    <td>${project.projectName}</td>
                                    <td>${project.contract.quote.customer.name}</td>
                                    <td>${project.dateStart}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${project.status == 1}">
                                                <span class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when test="${project.status == 2}">
                                                <span class="badge badge-primary">In Progress</span>
                                            </c:when>
                                            <c:when test="${project.status == 3}">
                                                <span class="badge badge-success">Completed</span>
                                            </c:when>
                                            <c:when test="${project.status == 4}">
                                                <span class="badge badge-warning">Cancelled</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${project.stage == 1}">
                                                <span class="badge badge-secondary">Planning</span>
                                            </c:when>
                                            <c:when test="${project.stage == 2}">
                                                <span class="badge badge-primary">Design</span>
                                            </c:when>
                                            <c:when test="${project.stage == 3}">
                                                <span class="badge badge-success">Construction</span>
                                            </c:when>
                                            <c:when test="${project.stage == 4}">
                                                <span class="badge badge-warning">Maintenance</span>
                                            </c:when>
                                            <c:when test="${project.stage == 5}">
                                                <span class="badge badge-dark">Finish</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="/manager/projects/${project.projectId}" class="btn btn-info">Detail</a>
                                        <a href="/manager/projects/${project.projectId}" class="btn btn-warning">Edit Staff</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>    

                    <!-- Pagination Controls -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <!-- Previous Button -->
                        <c:if test="${currentPage!=1}">
                            <form href="manager/projects/">
                                <button class="btn btn-primary" type="submit">Previous</button>
                                <input type="hidden" name="page" value="${currentPage-1}">
                                <input type="hidden" name="size" value="${size}">
                                <input type="hidden" name="sortBy" value="${sortBy}">
                                <input type="hidden" name="sortType" value="${sortType}">
                            </form>
                        </c:if>
                        
                        <!-- Page Indicator (Static for this example) -->
                        <span>Page <strong>${currentPage}</strong> of <strong>${totalPage}</strong></span>
                        <!-- Next Button -->
                        <c:if test="${(currentPage)!=totalPage}">
                            <form href="manager/projects/">
                                <button class="btn btn-primary" type="submit">Previous</button>
                                <input type="hidden" name="page" value="${currentPage+1}">
                                <input type="hidden" name="size" value="${size}">
                                <input type="hidden" name="sortBy" value="${sortBy}">
                                <input type="hidden" name="sortType" value="${sortType}">
                            </form>
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

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
                                <a class="nav-link" href="/admin/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/contracts">Contracts</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/design">Design</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/projects">Projects</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/terms">Terms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/reports">Reports</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/settings">Settings</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <h2 class="mb-4">Project List</h2>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Project Id</th>
                                <th>Project Name</th>
                                <th>Date Start</th>
                                <th>Status</th>
                                <th>More</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Static data for example -->
                            <c:forEach var="project" items="${projectList}">
                                <tr>
                                    <td>${project.projectId}</td>
                                    <td>${project.projectName}</td>
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
                                        <a href="/manager/project/${project.projectId}" class="btn btn-info">Detail</a>
                                        <a href="/manager/project/${project.projectId}" class="btn btn-warning">Edit Staff</a>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>    

                    <!-- Pagination Controls -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <!-- Previous Button -->
                        <button class="btn btn-primary" disabled>Previous</button>
                        <!-- Page Indicator (Static for this example) -->
                        <span>Page <strong>1</strong> of <strong>1</strong></span>
                        <!-- Next Button -->
                        <button class="btn btn-primary" disabled>Next</button>
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
            <title>Document</title>
            <style>
                .sidebar {
                    height: 100vh;
                    background-color: #343a40;
                    color: white;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 200px;
                    z-index: 1000;
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

                .main-content {
                    margin-left: 200px;
                }
            </style>
        </head>

        <body>
            <div class="container-fluid">
                <div class="row">
                    <!-- Sidebar (already exists) -->
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
                        <h2 class="mb-4">Project Details</h2>

                        <!-- Project Design and Construction Information -->
                        <div class="row">
                            <!-- Design Card -->
                            <div class="col-md-6">
                                <div class="card mb-4">
                                    <div class="card-header bg-primary text-white">
                                        Design Information
                                    </div>
                                    <div class="card-body">
                                        <c:choose>
                                            <c:when test="${project.design == null}">
                                                <h5 class="card-title">Design: Not yet</h5>
                                            </c:when>
                                            <c:otherwise>
                                                <h5 class="card-title">Design Name: ${project.design.designName}</h5>
                                                <p class="card-text">Status:
                                                    <c:choose>
                                                        <c:when test="${project.design.status == 1}">Pending</c:when>
                                                        <c:when test="${project.design.status == 2}">In Progress
                                                        </c:when>
                                                        <c:when test="${project.design.status == 3}">Completed</c:when>
                                                    </c:choose>
                                                </p>

                                                <h6>Design Stages:</h6>
                                                <c:choose>
                                                    <c:when
                                                        test="${project.design.designStage == null || project.design.designStage.isEmpty()}">
                                                        <p>No stages available</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <ul>
                                                            <c:forEach var="stage"
                                                                items="${project.design.designStage}">
                                                                <li>
                                                                    <strong>Stage Name:</strong>
                                                                    ${stage.designStageName} <br>
                                                                    <strong>Status:</strong>
                                                                    <c:choose>
                                                                        <c:when test="${stage.designStageStatus == 1}">
                                                                            Pending</c:when>
                                                                        <c:when test="${stage.designStageStatus == 2}">
                                                                            Processing</c:when>
                                                                        <c:when test="${stage.designStageStatus == 3}">
                                                                            Completed</c:when>
                                                                        <c:when test="${stage.designStageStatus == 4}">
                                                                            Canceled</c:when>
                                                                    </c:choose> <br>
                                                                    <strong>Price:</strong> ${stage.designStagePrice}
                                                                    <br>
                                                                    <strong>Summary File:</strong> ${stage.summaryFile}
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </c:otherwise>
                                                </c:choose>

                                                <h6>Assigned Staff:</h6>
                                                <ul>
                                                    <c:choose>
                                                        <c:when test="${project.design.staff!=null}">
                                                            <c:forEach var="staff" items="${project.design.staff}">
                                                                <li>${staff.name}</li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p> Not Assign Yet</p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </ul>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>

                            <!-- Construction Card -->
                            <div class="col-md-6">
                                <div class="card mb-4">
                                    <div class="card-header bg-success text-white">
                                        Construction Information
                                    </div>
                                    <div class="card-body">
                                        <c:choose>
                                            <c:when test="${project.construction == null}">
                                                <h5 class="card-title">Construction: Not yet</h5>
                                            </c:when>
                                            <c:otherwise>
                                                <h5 class="card-title">Construction Name:
                                                    ${project.construction.constructionName}</h5>
                                                <p class="card-text">Status:
                                                    <c:choose>
                                                        <c:when test="${project.construction.constructionStatus == 1}">
                                                            Pending</c:when>
                                                        <c:when test="${project.construction.constructionStatus == 2}">
                                                            In Progress</c:when>
                                                        <c:when test="${project.construction.constructionStatus == 3}">
                                                            Completed</c:when>
                                                    </c:choose>
                                                </p>
                                                <h6>Construction Stages:</h6>
                                                <c:choose>
                                                    <c:when
                                                        test="${project.construction.constructionStage == null || project.construction.constructionStage.isEmpty()}">
                                                        <p>No stages available</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <ul>
                                                            <c:forEach var="stage"
                                                                items="${project.construction.constructionStage}">
                                                                <li>
                                                                    <strong>Stage Name:</strong>
                                                                    ${stage.constructionStageName} <br>
                                                                    <strong>Status:</strong>
                                                                    <c:choose>
                                                                        <c:when
                                                                            test="${stage.constructionStageStatus == 1}">
                                                                            Pending</c:when>
                                                                        <c:when
                                                                            test="${stage.constructionStageStatus == 2}">
                                                                            Processing</c:when>
                                                                        <c:when
                                                                            test="${stage.constructionStageStatus == 3}">
                                                                            Completed</c:when>
                                                                    </c:choose> <br>
                                                                    <strong>Price:</strong>
                                                                    ${stage.constructionStagePrice} <br>
                                                                    <strong>Description:</strong>
                                                                    ${stage.constructionStageDescription} <br>

                                                                    <!-- Display Construction Stage Details -->
                                                                   
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </c:otherwise>
                                                </c:choose>
                                                <h6>Assigned Staff:</h6>
                                                <ul>
                                                    <c:choose>
                                                        <c:when test="${project.construction.staff!=null}">
                                                            <c:forEach var="staff" items="${project.construction.staff}">
                                                                <li>${staff.name}</li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p> Not Assign Yet</p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </ul>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </main>
                </div>
            </div>
        </body>

        </html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

    <head>
        <title>Admin Dashboard - Projects</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
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

            body {
                background-color: #f8f9fa;
                font-family: 'Mukta', sans-serif;
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
                <%@include file="../navBar.jsp" %>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 mt-4">

                    <h2 class="mb-4">Project List</h2>
                    <div class="filter-card">
                        <form method="get" action="${pageContext.request.contextPath}/manager/projects">
                            <div class="form-row align-items-center d-flex justify-content-between">
                                <!-- Sort By -->
                                <div class="col-auto">
                                    <label for="sortBy">Sort by:</label>
                                    <select name="sortBy" id="sortBy" class="form-control">
                                        <option value="status" ${sortBy=='status' ? 'selected' : '' }>Status
                                        </option>
                                        <option value="dateStart" ${sortBy=='dateStart' ? 'selected' : '' }>Date
                                            Start</option>
                                        <option value="projectName" ${sortBy=='projectName' ? 'selected' : '' }>
                                            Project Name</option>
                                    </select>
                                </div>

                                <!-- Sort Direction -->
                                <div class="col-auto">
                                    <label for="sortType">Direction:</label>
                                    <select name="sortType" id="sortType" class="form-control">
                                        <option value="asc" ${sortType=='asc' ? 'selected' : '' }>Ascending
                                        </option>
                                        <option value="desc" ${sortType=='desc' ? 'selected' : '' }>Descending
                                        </option>
                                    </select>
                                </div>

                                <!-- Filter By Status -->
                                <div class="col-auto">
                                    <label for="statusFilter">Status:</label>
                                    <select name="statusFilter" id="statusFilter" class="form-control">
                                        <option value="" ${statusFilter==null ? 'selected' : '' }>All</option>
                                        <option value="1" ${statusFilter==1 ? 'selected' : '' }>Pending</option>
                                        <option value="2" ${statusFilter==2 ? 'selected' : '' }>Processing
                                        </option>
                                        <option value="3" ${statusFilter==3 ? 'selected' : '' }>Completed
                                        </option>
                                        <option value="4" ${statusFilter==4 ? 'selected' : '' }>Cancel</option>
                                    </select>
                                </div>
                                <div class="col-auto">
                                    <label for="stageFilter">Stage:</label>
                                    <select name="stageFilter" id="stageFilter" class="form-control">
                                        <option value="" ${stageFilter==null ? 'selected' : '' }>All</option>
                                        <option value="1" ${stageFilter==1 ? 'selected' : '' }>Planing</option>
                                        <option value="2" ${stageFilter==2 ? 'selected' : '' }>Design</option>
                                        <option value="3" ${stageFilter==3 ? 'selected' : '' }>Construction
                                        </option>
                                        <option value="4" ${stageFilter==4 ? 'selected' : '' }>Maintenance
                                        </option>
                                        <option value="5" ${stageFilter==5 ? 'selected' : '' }>Finish</option>
                                    </select>
                                </div>

                                <!-- Date Range Filter -->
                                <div class="col-auto">
                                    <label for="fromDate">From Date:</label>
                                    <input type="date" name="fromDate" id="fromDate" class="form-control"
                                           value="${fromDate}">
                                </div>

                                <div class="col-auto">
                                    <label for="endDate">To Date:</label>
                                    <input type="date" name="endDate" id="endDate" class="form-control"
                                           value="${endDate}">
                                </div>

                                <!-- Search by Name -->
                                <div class="col-auto">
                                    <label for="searchName">Project Name:</label>
                                    <input type="text" name="searchName" id="searchName" class="form-control"
                                           value="${searchName}">
                                </div>

                                <input type="hidden" name="page" value="${currentPage}">
                                <!-- Apply Button -->
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary"
                                            style="margin-top: 2rem">Apply</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Project Id</th>
                                <th>Project Name</th>
                                <th>Customer Name</th>
                                <th>Date Start</th>
                                <th>Estimated Date End </th>
                                <th>Status</th>
                                <th>Stage</th>
                                <th>More</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="project" items="${projectList}">
                                <!-- Main Project Row -->
                                <tr onclick="toggleDetails(${project.projectId})">
                                    <td>${project.projectId}</td>
                                    <td>${project.projectName}</td>
                                    <td>${project.contract.quote.customer.name}</td>
                                    <td class="date-cell" data-date="${project.dateStart}"></td>
                                    <td class="date-cell" data-date="${project.contract.estimatedEndDate}"></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${project.status == 1}">
                                                <span class="badge badge-secondary badge-status">Pending</span>
                                            </c:when>
                                            <c:when test="${project.status == 2}">
                                                <span class="badge badge-primary badge-status">Processing</span>
                                            </c:when>
                                            <c:when test="${project.status == 3}">
                                                <span class="badge badge-success badge-status">Completed</span>
                                            </c:when>
                                            <c:when test="${project.status == 4}">
                                                <span class="badge badge-danger badge-status">Cancelled</span>
                                            </c:when>
                                            <c:when test="${project.status == 5}">
                                                <span class="badge badge-warning badge-status">Request Cancel</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${project.stage == 1}">
                                                <span class="badge badge-secondary badge-status">Planning</span>
                                            </c:when>
                                            <c:when test="${project.stage == 2}">
                                                <span class="badge badge-primary badge-status">Design</span>
                                            </c:when>
                                            <c:when test="${project.stage == 3}">
                                                <span class="badge badge-success badge-status">Construction</span>
                                            </c:when>
                                            <c:when test="${project.stage == 4}">
                                                <span class="badge badge-warning badge-status">Maintenance</span>
                                            </c:when>
                                            <c:when test="${project.stage == 5}">
                                                <span class="badge badge-dark badge-status">Finish</span>
                                            </c:when>
                                        </c:choose>
                                    <td class="d-flex justify-content-between flex-column gy-3">
                                        <a class="btn btn-info mb-1"
                                           href="${pageContext.request.contextPath}/manager/projects/detail/${project.projectId}"
                                           onclick="event.stopPropagation()">Detail</a>
                                        <a href="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}"
                                           class="btn btn-warning mt-1 " onclick="event.stopPropagation()">Manage</a>

                                    </td>
                                </tr>
                                <!-- Combined Hidden Row for Design and Construction Details -->
                                <tr id="details-${project.projectId}" style="display: none;">
                                    <td colspan="12">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="table-info">
                                                    <th colspan="12">Design Information</th>
                                                </tr>
                                                <tr>
                                                    <th>Design Id</th>
                                                    <th>Design Name</th>
                                                    <th>Status</th>
                                                    <th>Stage</th>

                                                    <th colspan="4">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>${project.design.designId}</td>
                                                    <td>${project.design.designName}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${project.design.status == 1}">
                                                                <span
                                                                    class="badge badge-secondary badge-status">Pending</span>
                                                            </c:when>
                                                            <c:when test="${project.design.status == 2}">
                                                                <span
                                                                    class="badge badge-primary badge-status">Processing</span>
                                                            </c:when>
                                                            <c:when test="${project.design.status == 3}">
                                                                <span
                                                                    class="badge badge-success badge-status">Completed</span>
                                                            </c:when>
                                                            <c:when test="${project.design.status == 4}">
                                                                <span
                                                                    class="badge badge-warning badge-status">Cancelled</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <!-- Finding Latest Stage for Design based on Maximum ID -->
                                                        <c:set var="latestDesignStageName" value="N/A" />
                                                        <c:set var="maxDesignStageId" value="0" />
                                                        <c:forEach var="stage"
                                                                   items="${project.design.designStage}">
                                                            <c:if
                                                                test="${stage.designStageId > maxDesignStageId}">
                                                                <c:set var="maxDesignStageId"
                                                                       value="${stage.designStageId}" />
                                                                <c:set var="latestDesignStageName"
                                                                       value="${stage.designStageName}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:choose>
                                                            <c:when test="${latestDesignStageName == 'N/A'}">
                                                                <span class="badge badge-light badge-status">Not
                                                                    Yet</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <span
                                                                    class="badge badge-info badge-status">${latestDesignStageName}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td colspan="4">
                                                        <button class="btn btn-info"
                                                                onclick="window.location.href = '${pageContext.request.contextPath}/manager/design/detail/${project.design.designId}'">Design
                                                            Details</button>
                                                        <a href="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}"
                                                           class="btn btn-warning">Assign Staff</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            
                                            <thead>
                                                <tr class="table-info">
                                                    <th colspan="12">Construction Information</th>
                                                </tr>
                                                <tr>
                                                    <th>Construction Id</th>
                                                    <th>Construction Name</th>
                                                    <th>Status</th>
                                                    <th colspan="4">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>${project.construction.constructionId}</td>
                                                    <td>${project.construction.constructionName}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when
                                                                test="${project.construction.constructionStatus == 1}">
                                                                <span
                                                                    class="badge badge-secondary badge-status">Pending</span>
                                                            </c:when>
                                                            <c:when
                                                                test="${project.construction.constructionStatus == 2}">
                                                                <span
                                                                    class="badge badge-primary badge-status">Processing</span>
                                                            </c:when>
                                                            <c:when
                                                                test="${project.construction.constructionStatus == 3}">
                                                                <span
                                                                    class="badge badge-success badge-status">Completed</span>
                                                            </c:when>
                                                            <c:when
                                                                test="${project.construction.constructionStatus == 4}">
                                                                <span
                                                                    class="badge badge-warning badge-status">Cancelled</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <!-- Finding Latest Stage for Construction based on Maximum ID -->
                                                        <c:set var="latestConstructionStageName" value="N/A" />
                                                        <c:set var="maxConstructionStageId" value="0" />
                                                        <c:forEach var="stage"
                                                                   items="${project.construction.constructionStage}">
                                                            <c:if
                                                                test="${stage.constructionStageId > maxConstructionStageId}">
                                                                <c:set var="maxConstructionStageId"
                                                                       value="${stage.constructionStageId}" />
                                                                <c:set var="latestConstructionStageName"
                                                                       value="${stage.constructionStageName}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:choose>
                                                            <c:when
                                                                test="${latestConstructionStageName == 'N/A'}">
                                                                <span class="badge badge-light badge-status">Not
                                                                    Yet</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <span
                                                                    class="badge badge-info badge-status">${latestConstructionStageName}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td colspan="4">
                                                        <button class="btn btn-info"
                                                                onclick="window.location.href = '${pageContext.request.contextPath}/manager/construction/detail/${project.construction.constructionId}'">Construction
                                                            Details</button>
                                                        <a href="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}"
                                                           class="btn btn-warning">Assign Staff</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- Pagination Controls -->
                    <div class="pagination-controls">
                        <!-- Previous Button -->
                        <c:if test="${currentPage>1}">
                            <form href="${pageContext.request.contextPath}/manager/projects">
                                <button class="btn btn-primary" type="submit"><</button>
                                <input type="hidden" name="page" value="${currentPage-1}">
                                <input type="hidden" name="size" value="${size}">
                                <input type="hidden" name="sortBy" value="${sortBy}">
                                <input type="hidden" name="sortType" value="${sortType}">
                                <input type="hidden" name="fromDate" value="${fromDate}">
                                <input type="hidden" name="endDate" value="${endDate}">
                                <input type="hidden" name="searchName" value="${searchName}">

                            </form>
                        </c:if>
                        <c:if test="${currentPage == 1}">
                            <button class="btn btn-primary" disabled>&lt;</button>
                        </c:if>

                        <!-- Page Indicator (Static for this example) -->
                        <span>Page <strong>${currentPage}</strong> of <strong>${totalPage}</strong></span>
                        <!-- Next Button -->
                        <c:if test="${currentPage<totalPage}">
                            <form href="manager/projects/">
                                <button class="btn btn-primary" type="submit">></button>
                                <input type="hidden" name="page" value="${currentPage+1}">
                                <input type="hidden" name="size" value="${size}">
                                <input type="hidden" name="sortBy" value="${sortBy}">
                                <input type="hidden" name="sortType" value="${sortType}">
                                <input type="hidden" name="fromDate" value="${fromDate}">
                                <input type="hidden" name="endDate" value="${endDate}">
                                <input type="hidden" name="searchName" value="${searchName}">

                            </form>
                        </c:if>
                        <c:if test="${currentPage == totalPage}">
                            <button class="btn btn-primary" disabled>&gt;</button>
                        </c:if>
                    </div>

                </main>
                <div id="messageModal" class="modal fade" tabindex="-1" role="dialog"
                     aria-labelledby="messageModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="messageModalLabel">Message</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div id="messageModalBody" class="modal-body">
                                <!-- Success or Error Message -->
                                <c:if test="${not empty message}">
                                    <div class="alert alert-success" role="alert">
                                        ${message}
                                    </div>
                                </c:if>
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger" role="alert">
                                        ${error}
                                    </div>
                                </c:if>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="messageCloseButton" class="btn btn-secondary"
                                        data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height:15vh;"></div>
        <script>
            var currentDetailsRow = null;

            function toggleDetails(projectId) {
                var detailsRow = document.getElementById("details-" + projectId);

                // If the current row is already visible, hide it and clear the currentDetailsRow variable
                if (currentDetailsRow === detailsRow && detailsRow.style.display === "table-row") {
                    detailsRow.style.display = "none";
                    currentDetailsRow = null;
                } else {
                    // Hide the currently open details row if it's different from the one being clicked
                    if (currentDetailsRow !== null) {
                        currentDetailsRow.style.display = "none";
                    }

                    // Show the new details row
                    detailsRow.style.display = "table-row";
                    currentDetailsRow = detailsRow;
                }
            }
            $(document).ready(function () {
                // Check if there is a message or error in the model
                var hasMessage = "${not empty message}" === "true";
                var hasError = "${not empty error}" === "true";
                if (hasMessage || hasError) {
                    // Show the message modal
                    $('#messageModal').modal('show');
                }
            });
            document.addEventListener("DOMContentLoaded", function () {
                const dateCells = document.querySelectorAll(".date-cell");

                dateCells.forEach(cell => {
                    const rawDate = cell.getAttribute("data-date");
                    if (rawDate) {
                        // Convert raw date to a Date object
                        const date = new Date(rawDate);

                        // Format date as MM/dd/yyyy
                        const formattedDate =
                                ("0" + (date.getMonth() + 1)).slice(-2) + "/" +
                                ("0" + date.getDate()).slice(-2) + "/" +
                                date.getFullYear();

                        // Display formatted date in the cell
                        cell.textContent = formattedDate;
                    }
                });
            });
        </script>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

</html>
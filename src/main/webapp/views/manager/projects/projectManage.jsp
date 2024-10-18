
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


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
                    <div class="form-row align-items-center">
                        <!-- Sort By -->
                        <div class="col-auto">
                            <label for="sortBy">Sort by:</label>
                            <select name="sortBy" id="sortBy" class="form-control">
                                <option value="status" ${sortBy=='status' ? 'selected' : '' }>Status
                                </option>
                                <option value="dateStart" ${sortBy=='dateStart' ? 'selected' : '' }>
                                    Date
                                    Start</option>
                                <option value="projectName" ${sortBy=='projectName' ? 'selected'
                                        : '' }>
                                    Project Name</option>
                            </select>
                        </div>

                        <!-- Sort Direction -->
                        <div class="col-auto">
                            <label for="sortType">Type:</label>
                            <select name="sortType" id="sortType" class="form-control">
                                <option value="asc" ${sortType=='asc' ? 'selected' : '' }>Ascending
                                </option>
                                <option value="desc" ${sortType=='desc' ? 'selected' : '' }>
                                    Descending
                                </option>
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
                                <option value="2" ${statusFilter==2 ? 'selected' : '' }>Processing
                                </option>
                                <option value="3" ${statusFilter==3 ? 'selected' : '' }>Accepted
                                </option>
                                <option value="4" ${statusFilter==4 ? 'selected' : '' }>Cancel
                                </option>
                            </select>
                        </div>
                        <div class="col-auto">
                            <label for="stageFilter">Stage:</label>
                            <select name="stageFilter" id="stageFilterr" class="form-control">
                                <option value="" ${stageFilter==null ? 'selected' : '' }>All
                                </option>
                                <option value="1" ${stageFilter==1 ? 'selected' : '' }>Planing
                                </option>
                                <option value="2" ${stageFilter==2 ? 'selected' : '' }>Design
                                </option>
                                <option value="3" ${stageFilter==3 ? 'selected' : '' }>Construction
                                </option>
                                <option value="4" ${stageFilter==4 ? 'selected' : '' }>Maintenance
                                </option>
                                <option value="5" ${stageFilter==5 ? 'selected' : '' }>Finish
                                </option>
                            </select>
                        </div>

                        <input type="hidden" name="page" value="${currentPage}">
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
                            <a class="btn btn-info"
                               href="${pageContext.request.contextPath}/manager/projects/details/${project.projectId}">Details</a>
                            <a href="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}"
                               class="btn btn-warning">Manage</a>

                        </td>
                    </tr>
                    <!-- Combined Hidden Row for Design and Construction Details -->
                    <tr id="details-${project.projectId}" style="display: none;">
                        <td colspan="7">
                            <table class="table table-bordered">
                                <thead>
                                <tr class="table-info">
                                    <th colspan="7">Design Information</th>
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
                                                                        class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when test="${project.design.status == 2}">
                                                                <span
                                                                        class="badge badge-primary">Processing</span>
                                            </c:when>
                                            <c:when test="${project.design.status == 3}">
                                                                <span
                                                                        class="badge badge-success">Completed</span>
                                            </c:when>
                                            <c:when test="${project.design.status == 4}">
                                                                <span
                                                                        class="badge badge-warning">Cancelled</span>
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
                                            <c:when
                                                    test="${latestDesignStageName == 'N/A'}">
                                                                <span class="badge badge-light">Not
                                                                    Yet</span>
                                            </c:when>
                                            <c:otherwise>
                                                                <span
                                                                        class="badge badge-info">${latestDesignStageName}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td colspan="4">
                                        <button class="btn btn-info"
                                                onclick="window.location.href = '${pageContext.request.contextPath}/manager/design/viewDetail/${project.design.designId}'">Design
                                            Details</button>
                                        <a href="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}"
                                           class="btn btn-warning">Assign Staff</a>
                                    </td>
                                </tr>
                                </tbody>
                                <thead>
                                <tr class="table-info">
                                    <th colspan="7">Construction Information</th>
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
                                                                        class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when
                                                    test="${project.construction.constructionStatus == 2}">
                                                                <span
                                                                        class="badge badge-primary">Processing</span>
                                            </c:when>
                                            <c:when
                                                    test="${project.construction.constructionStatus == 3}">
                                                                <span
                                                                        class="badge badge-success">Completed</span>
                                            </c:when>
                                            <c:when
                                                    test="${project.construction.constructionStatus == 4}">
                                                                <span
                                                                        class="badge badge-warning">Cancelled</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <!-- Finding Latest Stage for Construction based on Maximum ID -->
                                        <c:set var="latestConstructionStageName"
                                               value="N/A" />
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
                                                                <span class="badge badge-light">Not
                                                                    Yet</span>
                                            </c:when>
                                            <c:otherwise>
                                                                <span
                                                                        class="badge badge-info">${latestConstructionStageName}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td colspan="4">
                                        <button class="btn btn-info"
                                                onclick="window.location.href = '${pageContext.request.contextPath}/manager/construction/viewDetail/${project.construction.constructionId}'">Construction
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
            <div class="d-flex justify-content-between align-items-center mt-4">
                <!-- Previous Button -->
                <c:if test="${currentPage!=1}">
                    <form href="${pageContext.request.contextPath}/manager/projects">
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
                <c:if test="${currentPage!=totalPage}">
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
</script>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>
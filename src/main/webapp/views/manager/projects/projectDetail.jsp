<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL Taglib Declaration -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
        <style>
            body {
                background-color: #f7f9fc;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            /* General Layout */
            .container {
                max-width: 1200px;
                margin: auto;
                padding: 20px;
            }

            .section-header {
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #007bff;
                font-weight: bold;
                color: #007bff;
            }

            /* Cards for sections */
            .section-card {
                background-color: #fff;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
                transition: transform 0.3s ease;
                max-width: 100%;
                /* Prevents overflow */
            }

            .section-card:hover {
                transform: translateY(-5px);
            }

            .btn-custom {
                margin-top: 20px;
                padding: 12px 25px;
                font-size: 1rem;
                border-radius: 5px;
                width: 100%;
            }


            .status-badge {
                padding: 8px 15px;
                text-transform: uppercase;
                border-radius: 12px;
            }

            /* Updated: Allow content to break within table cells */
            .table th,
            .table td {
                vertical-align: middle;
                padding: 15px;
                word-break: break-all;
                /* Forces word breaking */
                overflow-wrap: break-word;
                /* Ensures wrapping on long text */
            }

            .table th {
                background-color: #f0f0f0;
                font-weight: bold;
            }

            .icon-btn {
                margin-right: 8px;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .table {
                    font-size: 0.9rem;
                }

                .btn-custom {
                    font-size: 0.9rem;
                }
            }

            .action-buttons {
                display: flex;
                justify-content: center;
                gap: 15px;
            }

            .section-header i {
                margin-right: 8px;
            }

            /* Ensure customer card is properly aligned */
            .customer-card {
                height: auto;
                word-wrap: break-word;
                max-width: 100%;
                /* Make sure the card doesn't overflow */
            }

            .badge-custom {
                font-size: 16px !important;
            }



            /* Custom modal height and width */
            .modal-lg {
                max-width: 100%;
                /* You can adjust this to increase the width */
            }

            .modal-body {
                max-height: 90vh;
                /* This sets the maximum height of the modal body */
                overflow-y: auto;
                /* Adds scrolling for overflow */
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
                <!-- Sidebar -->
                <%@include file="../navBar.jsp" %>
                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

                    <div class="container-fluid">
                        <div class="row mt-4">
                            <!-- Sidebar -->


                            <!-- Main Content -->
                            <div class="col-md-9 p-4" id="main-content">
                                <div class="section-card">
                                    <div>
                                        <div class="section-header d-flex justify-content-between">
                                            <h4><i class="fas fa-project-diagram"></i>
                                                Project
                                                Information

                                            </h4>
                                            <button id="updateProjectButton" type="button"
                                                    onclick="showUpdateModal(${project.projectId}, '${project.projectName}', '${project.address}', '${project.style}', '${project.description}')"
                                                    class="btn btn-primary">
                                                Update Project
                                            </button>
                                        </div>
                                        <div class="row justify-content-between mt-2 mb-2">

                                            <!-- Planning Stage -->
                                            <c:set var="planningClass"
                                                   value="${(project.stage > 1) ? 'btn-success' : (project.stage == 1) ? 'btn-warning' : 'btn-secondary'}" />
                                            <div class="col text-center mb-2">
                                                <button type="button"
                                                        class="btn stage-button btn-md btn-block px-3 ${planningClass}">
                                                    Planning
                                                </button>
                                            </div>

                                            <!-- Design Stage -->
                                            <!-- Design Stage -->
                                            <c:set var="designClass"
                                                   value="${(project.stage > 2) ? 'btn-success' : (project.stage == 2) ? 'btn-warning' : 'btn-secondary'}" />
                                            <div class="col text-center mb-2">
                                                <c:choose>
                                                    <c:when
                                                        test="${designClass == 'btn-success' || designClass == 'btn-warning'}">
                                                        <a href="${pageContext.request.contextPath}/manager/design/detail/${project.design.designId}">
                                                            <button type="button"
                                                                    class="btn stage-button btn-md btn-block px-3 ${designClass}">
                                                                <i class="fas fa-info-circle"></i> Design                                                   

                                                            </button>
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button"
                                                                class="btn stage-button btn-md btn-block px-3 ${designClass}">
                                                            Design
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <!-- Construction Stage -->
                                            <c:set var="constructionClass"
                                                   value="${(project.stage > 3) ? 'btn-success' : (project.stage == 3) ? 'btn-warning' : 'btn-secondary'}" />
                                            <div class="col text-center mb-2">
                                                <c:choose>
                                                    <c:when
                                                        test="${constructionClass == 'btn-success' || constructionClass == 'btn-warning'}">
                                                        <a
                                                            href="${pageContext.request.contextPath}/manager/construction/detail/${project.construction.constructionId}">
                                                            <button type="button" class="btn stage-button btn-md btn-block px-3 ${constructionClass}">
                                                                <i class="fas fa-info-circle"></i>  Construction
                                                            </button>
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button"
                                                                class="btn stage-button btn-md btn-block px-3 ${constructionClass}">
                                                            Construction
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>


                                            <!-- Maintenance Stage -->
                                            <c:set var="maintenanceClass"
                                                   value="${(project.stage > 4) ? 'btn-success' : (project.stage == 4) ? 'btn-warning' : 'btn-secondary'}" />
                                            <div class="col text-center mb-2">
                                                <button type="button"
                                                        class="btn stage-button btn-md btn-block px-3 ${maintenanceClass}">
                                                    Maintenance
                                                </button>
                                            </div>

                                            <!-- Complete Stage -->
                                            <c:set var="completeClass"
                                                   value="${(project.stage == 5) ? 'btn-success'  : 'btn-secondary'}" />
                                            <div class="col text-center mb-2">
                                                <button type="button"
                                                        class="btn stage-button btn-md btn-block px-3 ${completeClass}">
                                                    Complete
                                                </button>
                                            </div>
                                        </div>
                                        <table class="table table-hover">
                                            <div class="row mt-3 mb-3">
                                                <th>Project Image</th>
                                                <td class="justify-content-center text-center">
                                                    <img src="${project.getShowingImg(project.imgURL)}" alternative="${project.projectName}"
                                                         style="height:200px; width:300px; object-fit:contain;">
                                                </td>
                                            </div>
                                            <tr>
                                                <th style="width: 20%">Project ID</th>
                                                <td>${project.projectId}</td>
                                            </tr>
                                            <tr>
                                                <th>Project Name</th>
                                                <td>${project.projectName}</td>
                                            </tr>
                                            <tr>
                                                <th>Address</th>
                                                <td>${project.address}</td>
                                            </tr>
                                            <tr>
                                                <th>Design Aesthetic</th>
                                                <td>${project.style}</td>
                                            </tr>
                                            <tr>
                                                <th>Description</th>
                                                <td>${project.description}</td>
                                            </tr>
                                            <c:if test="${project.preDesign.preDesignId != null}">
                                                 <tr>
                                                    <th>Design Following</th>
                                                    <td><a href="${pageContext.request.contextPath}/manager/preDesign/detail/${project.preDesign.preDesignId}">${project.preDesign.preDesignName}</a></td>
                                                </tr>
                                            </c:if>
                                            <tr>
                                                <th>Start Date</th>
                                                <td>${project.dateStart}</td>
                                            </tr>
                                            <tr>
                                                <th>End Date</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${project.dateEnd == null }">
                                                            Not yet
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatDate value="${project.dateEnd}" pattern="MMM dd yyyy" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Project Content</th>
                                                <td>
                                                    <button type="button" class="btn btn-info"
                                                            data-toggle="modal" data-target="#projectContentModal"
                                                            data-content="<c:out value='${project.content.content}' escapeXml='true' />"
                                                            onclick="showProjectContent(this)">
                                                        View Content
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Project Status</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${project.status == 1}">
                                                            <span
                                                                class="badge badge-secondary badge-status">Pending</span>
                                                        </c:when>
                                                        <c:when test="${project.status == 2}">
                                                            <span class="badge badge-primary badge-status">Processing</span>
                                                        </c:when>
                                                        <c:when test="${project.status == 3}">
                                                            <span
                                                                class="badge badge-success badge-status">Completed</span>
                                                        </c:when>
                                                        <c:when test="${project.status == 4}">
                                                            <span
                                                                class="badge badge-danger badge-status">Cancelled</span>
                                                        </c:when>
                                                        <c:when test="${project.status == 5}">
                                                            <span
                                                                class="badge badge-warning badge-status">Request Cancel</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                            </tr>


                                            <tr>
                                                <th>Is Shareable</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${project.isSharedAble == true}">
                                                            <span
                                                                class="badge badge-success badge-status">Shared</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge badge-danger badge-status">Not
                                                                Shared</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                </td>
                                            </tr>


                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-3 p-4" id="sidebar">
                                <div class="text-center">

                                    <div class="section-card customer-card">
                                        <h4 class="section-header"><i class="fas fa-user"></i> Customer
                                            Information</h4>
                                        <table class="table table-hover">
                                            <tr>
                                                <th style="text-wrap:nowrap"> Name </th>
                                                <td>${customer.name}</td>
                                            </tr>
                                            <tr>
                                                <th style="text-wrap:nowrap">Phone</th>
                                                <td>${customer.phone}</td>
                                            </tr>
                                            <tr>
                                                <th style="text-wrap:nowrap">Email</th>
                                                <td>${customer.email}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="section-card">
                                    <h3 class="section-header"><i class="fas fa-project-diagram"></i></h3>
                                    <div class="row  d-flex text-center justify-content-center">
                                        <a href="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}" class="btn btn-md btn-warning">Manage</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div style="height:25vh;">

                    </div>
                </main>
                <!-- Modal for Project Content -->
                <!-- Modal for Project Content -->
                <div class="modal fade" id="projectContentModal" tabindex="-1"
                     aria-labelledby="projectContentModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="max-width: 85vw;">
                        <!-- Use viewport width to make the modal nearly full-screen -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="projectContentModalLabel">Project Content</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="max-height: 85vh; overflow-y: auto;">
                                <!-- Make the modal higher and enable scrolling -->
                                <p id="modalProjectContent">
                                    <!-- Content will be loaded dynamically here -->
                                </p>
                            </div>
                            <div class="modal-footer">
                                <a href="${pageContext.request.contextPath}/manager/projectContent/updateDetail/${project.projectId}"
                                   type="button" class="btn btn-primary">Update Content</a>
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="updateProjectModal" class="modal fade" tabindex="-1" role="dialog"
                     aria-labelledby="updateProjectModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document" style="max-width: 70%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateProjectModalLabel">Update Project</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form method="POST" action="${pageContext.request.contextPath}/manager/projects/update" enctype="multipart/form-data">
                                <div class="modal-body"
                                     style="max-height: calc(100vh - 150px); overflow-y: auto;">
                                    <!-- Hidden input to store project ID -->
                                    <input type="hidden" id="updateProjectId" name="projectId">
                                    <input type="hidden" id="currentSite" name="currentSite"
                                           value="projectDetailSite">

                                    <!-- Project Name -->
                                    <div class="form-group">
                                        <label for="updateProjectName">Project Name</label>
                                        <input type="text" class="form-control" id="updateProjectName"
                                               name="projectName" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="updateProjectAddress">Project Address</label>
                                        <input type="text" class="form-control" id="updateProjectAddress"
                                               name="projectAddress" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="updateProjectStyle">Design Style</label>
                                        <input class="form-control" id="updateProjectStyle" name="projectStyle"
                                               rows="1" required></input>
                                    </div>
                                    <!-- Project Description -->
                                    <div class="form-group">
                                        <label for="updateProjectDescription">Project Description</label>
                                        <textarea class="form-control" id="updateProjectDescription"
                                                  name="projectDescription" rows="3" required></textarea>
                                    </div>

                                    <!-- Upload Project Image -->
                                    <div class="form-group">
                                        <label for="updateProjectImage">Upload Image</label>
                                        <input type="file" id="updateProjectImage" accept="image/*" name="projectImage"
                                               class="form-control-file">
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Update Project</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
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
            function showProjectContent(button) {
                // Get content from the data-content attribute
                var content = button.getAttribute('data-content');

                // Update modal content
                document.getElementById('modalProjectContent').innerHTML = content;
            }
            function showUpdateModal(projectId, projectName, address, style, description) {
                $('#updateProjectId').val(projectId);
                $('#updateProjectName').val(projectName);
                $('#updateProjectAddress').val(address);
                $('#updateProjectStyle').val(style);
                $('#updateProjectDescription').val(description);
                $('#updateProjectModal').modal('show');
            }
            $(document).ready(function () {
                // Check if there is a message or an error in the page
                if ($('.alert-success').length || $('.alert-danger').length) {
                    // If message or error exists, show the modal
                    $('#messageModal').modal('show');
                }
            });
        </script>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Project and Customer Information</title>
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
            <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
            <style>
                body {
                    background-color: #f8f9fa;
                    font-family: 'Arial', sans-serif;
                    padding-left: 220px;
                    min-height: 100vh;
                }

                .info-section {
                    margin-top: 20px;
                }

                .info-box {
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                    margin-bottom: 20px;
                }

                h4 {
                    font-size: 1.5rem;
                    margin-bottom: 20px;
                }

                .status-badge {
                    font-size: 1rem;
                    padding: 5px 10px;
                }

                .staff-img {
                    width: 100%;
                    height: 100px;
                    object-fit: cover;
                    border-radius: 5px;
                }

                .card {
                    position: relative;
                    overflow: hidden;
                }

                .delete-button {
                    position: absolute;
                    top: 10px;
                    right: 10px;
                    background-color: #dc3545;
                    color: white;
                    border: none;
                    border-radius: 50%;
                    width: 30px;
                    height: 30px;
                    text-align: center;
                    cursor: pointer;
                }

                .delete-button:hover {
                    background-color: #c82333;
                }

                .hover-row:hover {
                    transform: scale(1.02);
                    background-color: #e9ecef;
                }

                .stage-button {
                    margin-bottom: 10px;
                }

                .container {
                    max-width: 1200px;
                    margin-left: auto;
                    margin-right: auto;
                }

                .disabled-btn {
                    cursor: not-allowed;
                    opacity: 0.65;
                }

                .badge.status {
                    font-size: 16px;
                }

                .isbanned {
                    background-color: #f8d7da;
                    border-color: #f5c6cb;
                    opacity: 0.7;
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
        <div style="height:8vh;"></div>

        <body>
            <!-- Sidebar -->
            <%@include file="../navBar.jsp" %>
                <!-- Main Content -->
                <div class="container">
                    <header>
                        <h2>Assign Staffs</h2>
                    </header>
                    <div class="row info-section">
                        <!-- Customer Information Card -->
                        <div class="col-md-4">
                            <div class="info-box">
                                <h4>Customer Information</h4>
                                <div class="info-item">
                                    <p><strong>Name:</strong> ${customer.name}</p>
                                </div>
                                <div class="info-item">
                                    <p><strong>Phone Number:</strong> ${customer.phone}</p>
                                </div>
                                <div class="info-item">
                                    <p><strong>Email:</strong> ${customer.email}</p>
                                </div>
                            </div>
                            <!-- Project Information Card (Left Column) Below Customer Information -->
                            <div class="info-box">
                                <h4>Project Information</h4>
                                <div class="info-item">
                                    <p><strong>Project Name:</strong> ${project.projectName}</p>
                                </div>
                                <div class="info-item">
                                    <p><strong>Address:</strong> ${project.address}</p>
                                </div>
                                <div class="info-item">
                                </div>
                                <div class="info-item">
                                    <p><strong>Description:</strong> ${project.description}</p>
                                </div>
                                <div class="info-item">
                                    <p><strong>Start Date:</strong>
                                        <fmt:formatDate value="${project.dateStart}" pattern="yyyy-MM-dd" />
                                    </p>
                                </div>
                                <div class="info-item">
                                    <p><strong>End Date:</strong>
                                        <fmt:formatDate value="${project.dateEnd}" pattern="yyyy-MM-dd" />
                                    </p>
                                </div>
                                <div class="info-item">
                                    <p><strong>Project Status:</strong>
                                        <c:choose>
                                            <c:when test="${project.status == 1}">
                                                <span id="projectStatusBadge"
                                                    class="badge badge-secondary status">Pending</span>
                                            </c:when>
                                            <c:when test="${project.status == 2}">
                                                <span id="projectStatusBadge"
                                                    class="badge badge-primary status">Processing</span>
                                            </c:when>
                                            <c:when test="${project.status == 3}">
                                                <span id="projectStatusBadge"
                                                    class="badge badge-success status">Completed</span>
                                            </c:when>
                                            <c:when test="${project.status == 4}">
                                                <span id="projectStatusBadge"
                                                    class="badge badge-danger status">Cancel</span>
                                            </c:when>
                                            <c:when test="${project.status == 5}">
                                                <span id="projectStatusBadge" class="badge badge-warning status">Request
                                                    Cancel</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span id="projectStatusBadge"
                                                    class="badge badge-light status">Unknown</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>

                                </div>
                                <div class="info-item">
                                    <p><strong>Sharable:</strong>
                                        <c:choose>
                                            <c:when test="${project.isSharedAble == true}">
                                                <span id="shareBadge" class="badge badge-success status">Shared</span>
                                            </c:when>
                                            <c:when test="${project.isSharedAble== false}">
                                                <span id="shareBadge" class="badge  badge-danger status">Not
                                                    Shared</span>
                                            </c:when>

                                        </c:choose>
                                    </p>
                                </div>
                                <div class="info-item">
                                    <p><a href="${pageContext.request.contextPath}/download/${project.imgURL}"
                                            class="btn btn-link">Download Project
                                            Image</a>
                                    </p>
                                </div>
                                <div>
                                    <c:if test="${project.status!=4}">
                                        <hr>
                                        <div class="row justify-content-around ư">
                                            <input type="hidden" name="projectId" value="${project.projectId}">
                                            <c:if test="${project.status==3}">
                                                <div class="d-flex justify-content-center">


                                                    <c:choose>
                                                        <c:when test="${project.isSharedAble == true}">
                                                            <button class="btn btn-danger" id="shareBtn"
                                                                onclick="showConfirmationModal(${project.projectId}, 'share')">
                                                                Stop Share
                                                            </button>
                                                        </c:when>
                                                        <c:when test="${project.isSharedAble == false}">
                                                            <button class="btn btn-primary" id="shareBtn"
                                                                onclick="showConfirmationModal(${project.projectId}, 'share')">
                                                                Share Project
                                                            </button>
                                                        </c:when>
                                                    </c:choose>


                                                </div>
                                            </c:if>
                                            <!-- Cancel Project Button -->
                                            <c:if test="${project.status!=3}">
                                                <div class="d-flex justify-content-center ">

                                                    <c:if test="${project.status!=3}">
                                                        <div class="d-flex justify-content-center">
                                                            <c:choose>
                                                                <c:when test="${project.status == 5}">
                                                                    <button class="btn btn-danger" id="cancelProjectBtn"
                                                                        onclick="viewCancelRequest(${project.projectId})">View
                                                                        Request</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button class="btn btn-warning"
                                                                        id="cancelProjectBtn"
                                                                        onclick="showConfirmationModal(${project.projectId}, 'cancel')">Cancel
                                                                        Project</button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </c:if>

                                                </div>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="info-box">
                                <div class="row justify-content-center">
                                    <div class="col-6 mb-3">
                                        <h3>Project Stages Progress</h3>
                                    </div>
                                </div>
                                <div class="container-fluid">
                                    <div class="row justify-content-between">
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
                                        <c:set var="designClass"
                                            value="${(project.stage > 2) ? 'btn-success' : (project.stage == 2) ? 'btn-warning' : 'btn-secondary'}" />
                                        <div class="col text-center mb-2">
                                            <c:choose>
                                                <c:when
                                                    test="${designClass == 'btn-success' || designClass == 'btn-warning'}">
                                                    <a
                                                        href="${pageContext.request.contextPath}/manager/design/detail/${project.design.designId}"><button
                                                            type="button"
                                                            class="btn stage-button btn-md btn-block px-3 ${designClass}"> <i class="fas fa-info-circle"></i>Design
                                                           </button></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button"
                                                        class="btn stage-button btn-md btn-block px-3 ${designClass}">Design</button>
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
                                                        href="${pageContext.request.contextPath}/manager/construction/detail/${project.construction.constructionId}"><button
                                                            type="button"
                                                            class="btn stage-button btn-md btn-block px-3 ${constructionClass}"> <i class="fas fa-info-circle"></i>Construction
                                                            </button></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="button"
                                                        class="btn stage-button btn-md btn-block px-3 ${constructionClass}">Construction</button>
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
                                </div>
                            </div>
                            <div class="info-box">
                                <div class="content-box">
                                    <div class="row mb-3">
                                        <div class="col-6">
                                            <h3>Planning Stage</h3>
                                        </div>
                                        <div class="col-6 text-right" id="confirmPlanningStageButtonContainer">
                                            <c:if test="${project.status!=2 && project.status!=3 &&project.status!=4 &&project.status!=5}">
                                                <button type="button" id="confirmPlanningStageButton"
                                                    onclick="handleStageClick(2)" class="btn btn-primary btn-md">
                                                    Confirm Planning Stage
                                                </button>
                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- Staff Card Section -->
                                    <div id="staff-card-section">
                                        <!-- Designer Row -->
                                        <div class="row hover-row mb-4">
                                            <div class="col-12">
                                                <h5>Designer Staff</h5>
                                            </div>
                                            <div class="row w-100 justify-content-center">
                                                <input type="hidden" id="designStaffAssigned"
                                                    value="${empty designerStaff ? 'false' : 'true'}" />
                                                <c:choose>
                                                    <c:when test="${empty designerStaff}">
                                                        <div class="col-md-3 mb-3 d-flex justify-content-between">
                                                            <div class="card position-relative">
                                                                <!-- Empty Card -->
                                                                <div class="card-body text-center">
                                                                    <h5 class="card-title">No Staff Assigned Yet</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach items="${designerStaff}" var="staff"
                                                            varStatus="status">
                                                            <div class="col-md-3 mb-3 d-flex justify-content-between">
                                                                <div
                                                                    class="card position-relative ${staff.enabled ? '' : 'isbanned'}">
                                                                    <!-- Delete (X) Button -->


                                                                    <!-- Staff Image -->
                                                                    <img src="${pageContext.request.contextPath}/assets/imgs/mylogo/koi-background.jpg"
                                                                        class="card-img-top staff-img"
                                                                        alt="Staff Image" />
                                                                    <!-- Card Body -->
                                                                    <div class="card-body text-center">
                                                                        <h5 class="card-title">
                                                                            ${staff.name}

                                                                        </h5>

                                                                        <c:if
                                                                            test="${project.status!=3 &&project.status !=4}">
                                                                            <button type="button" class=" delete-button"
                                                                                aria-label="Close"
                                                                                onclick="confirmDelete(${staff.id}, ${project.projectId}, 'design')">&times;</button>
                                                                        </c:if>

                                                                        <a type="button" class="btn btn-info mb-2"
                                                                            href="${pageContext.request.contextPath}/manager/manageStaff/detail/${staff.id}">Detail</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Designer Staff Cards -->




                                        </div>


                                        <div class="row hover-row mb-4">
                                            <div class="col-12">
                                                <h5>Construction Staff</h5>
                                            </div>
                                            <input type="hidden" id="constructionStaffAssigned"
                                                value="${empty constructionStaff ? 'false' : 'true'}" />

                                            <!-- <div class="col-6 text-right">
                                            <button type="button" id="assignConstructionButton"
                                                class="btn btn-primary assign-button" data-toggle="modal"
                                                data-target="#assignConstructionModal"
                                                data-project-id="${project.projectId}">
                                                Assign Staff
                                            </button>
                                        </div> -->
                                            <div class="row w-100 justify-content-center">
                                                <c:choose>
                                                    <c:when test="${empty constructionStaff}">
                                                        <div class="col-md-3 mb-3 d-flex justify-content-between">
                                                            <div class="card position-relative">
                                                                <div class="card-body text-center">
                                                                    <h5 class="card-title">No Staff Assigned Yet</h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach items="${constructionStaff}" var="staff"
                                                            varStatus="status">
                                                            <div class="col-md-3 mb-3 d-flex justify-content-between">
                                                                <div
                                                                    class="card position-relative ${staff.enabled ? '' : 'isbanned'}">
                                                                    <!-- Delete (X) Button -->



                                                                    <!-- Staff Image -->
                                                                    <img src="${pageContext.request.contextPath}/assets/imgs/mylogo/koi-background.jpg"
                                                                        class="card-img-top staff-img"
                                                                        alt="Staff Image" />
                                                                    <!-- Card Body -->
                                                                    <div class="card-body text-center">
                                                                        <h5 class="card-title">
                                                                            ${staff.name}

                                                                        </h5>

                                                                        <c:if
                                                                            test="${project.status!=3 && project.status!=4}">
                                                                            <button type="button" class=" delete-button"
                                                                                aria-label="Close"
                                                                                onclick="confirmDelete(${staff.id}, ${project.projectId}, 'construction')">&times;</button>
                                                                        </c:if>
                                                                        <a type="button" class="btn btn-info mb-2"
                                                                            href="${pageContext.request.contextPath}/manager/manageStaff/detail/${staff.id}">Detail</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <!-- Construction Row -->
                                        </div>
                                    </div>
                                    <!-- Search and Assign Staff Section -->
                                    <c:if test="${project.status!=3 && project.status!=4}">
                                        <div class="search-section container mt-4">
                                            <h2>Search and Assign Staff</h2>

                                            <!-- Search Form -->
                                            <form
                                                action="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}"
                                                method="GET" class="form-inline mb-3">
                                                <input type="text" name="searchTerm" class="form-control mr-2"
                                                    placeholder="Search by name..." value="${param.searchTerm}">
                                                <button type="submit" class="btn btn-primary">Search</button>
                                            </form>

                                            <!-- Staff Table -->
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-hover">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>Staff ID</th>
                                                            <th>Name</th>
                                                            <th>Role</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${availableStaff}" var="staff">
                                                            <tr>
                                                                <td>${staff.id}</td>
                                                                <td>${staff.name}</td>
                                                                <td>${staff.department}</td>
                                                                <td>

                                                                    <!-- Show Add to Project button if not assigned -->


                                                                    <button type="submit" class="btn btn-primary"
                                                                        onclick="showAssignConfirmation('${staff.name}', ${staff.id}, '${staff.department}')">Add
                                                                        to
                                                                        Project</button>


                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <div
                                                    class="d-flex w-100 justify-content-between align-items-center mt-4">
                                                    <!-- Previous Button -->
                                                    <c:choose>
                                                        <c:when test="${currentPage > 1}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}"
                                                                method="GET">
                                                                <button class="btn btn-primary"
                                                                    type="submit">&lt;</button>
                                                                <input type="hidden" name="currentPage"
                                                                    value="${currentPage - 1}">
                                                                <input type="hidden" name="size" value="${size}">
                                                                <c:if test="${searchTerm != null}">
                                                                    <input type="hidden" name="searchTerm"
                                                                        value="${searchTerm}">
                                                                </c:if>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="btn btn-primary" type="submit"
                                                                disabled>&lt;</button>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <!-- Page Indicator -->
                                                    <span class="mx-3">Page <strong>${currentPage}</strong> of
                                                        <strong>${totalPage}</strong></span>

                                                    <!-- Next Button -->
                                                    <c:choose>
                                                        <c:when test="${currentPage < totalPage}">
                                                            <form
                                                                action="${pageContext.request.contextPath}/manager/projects/assign/${project.projectId}"
                                                                method="GET">
                                                                <button class="btn btn-primary"
                                                                    type="submit">&gt;</button>
                                                                <input type="hidden" name="currentPage"
                                                                    value="${currentPage + 1}">
                                                                <input type="hidden" name="size" value="${size}">
                                                                <c:if test="${searchTerm != null}">
                                                                    <input type="hidden" name="searchTerm"
                                                                        value="${searchTerm}">
                                                                </c:if>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="btn btn-primary" type="submit"
                                                                disabled>&gt;</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <!-- Search Section -->
                                            <div class="modal fade" id="assignDesignerModal" tabindex="-1" role="dialog"
                                                aria-labelledby="assignDesignerModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="assignDesignerModalLabel">Assign
                                                                Designer
                                                                Staff
                                                            </h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <input type="text" class="form-control mb-3"
                                                                placeholder="Search Designer Staff...">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Staff Name</th>
                                                                        <th>Assign</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="designerResults">
                                                                    <!-- Rows will be dynamically inserted here -->
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </c:if>
                                </div>
                                <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
                                    aria-labelledby="confirmModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmModalLabel"></h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- Modal body will be updated dynamically -->
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Cancel</button>
                                                <button type="button" class="btn" id="confirmActionButton"></button>
                                                <!-- Reusable button -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="viewRequestModal" tabindex="-1" role="dialog"
                                    aria-labelledby="viewRequestModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="viewRequestModalLabel">Cancellation Request
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p><strong>Reason for Cancellation:</strong></p>
                                                <p id="cancellationReason">${project.cancelMessage}</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-success"
                                                    onclick="cancelProject(${project.projectId},4);">
                                                    Accept Request
                                                </button>
                                                <button type="button" class="btn btn-danger"
                                                    onclick="cancelProject(${project.projectId},1);">
                                                    Deny Request
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Update Confirmation Modal -->
                                <div class="modal fade" id="updateStageModal" tabindex="-1" role="dialog"
                                    aria-labelledby="updateStageModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateStageModalLabel">Confirm Stage Update
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure you want to move to the next stage?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">No</button>
                                                <button type="button" class="btn btn-primary"
                                                    id="confirmUpdateButton">Yes</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="notificationModal" tabindex="-1" role="dialog"
                                    aria-labelledby="notificationModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="notificationModalLabel">Notification</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body" id="notificationModalBody">
                                                <!-- Message will be dynamically inserted here -->
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal"
                                                    onclick="$('#notificationModal').modal('hide');">OK</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog"
                                    aria-labelledby="deleteModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure you want to delete this staff member?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Cancel</button>
                                                <form id="deleteForm"
                                                    action="${pageContext.request.contextPath}/manager/projects/deleteStaff"
                                                    method="POST">
                                                    <input type="hidden" name="staffId" id="deleteStaffId">
                                                    <input type="hidden" name="projectId" id="deleteProjectId">
                                                    <input type="hidden" name="role" id="deleteRole">
                                                    <button type="submit" class="btn btn-danger">Delete</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Confirmation Modal for Assigning Staff -->
                                <div class="modal fade" id="assignStaffConfirmationModal" tabindex="-1" role="dialog"
                                    aria-labelledby="assignStaffConfirmationModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="assignStaffConfirmationModalLabel">Confirm
                                                    Staff
                                                    Assignment</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Are you sure you want to assign <strong
                                                        id="confirmStaffName"></strong>
                                                    to this project?</p>
                                                <!-- Form inside the modal -->
                                                <form id="assignStaffForm" method="POST"
                                                    action="${pageContext.request.contextPath}/manager/projects/assignStaff">
                                                    <input type="hidden" name="projectId" value="${project.projectId}">
                                                    <input type="hidden" name="staffId" id="assignStaffId">
                                                    <input type="hidden" name="role" id="assignStaffRole">
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Cancel</button>
                                                <button type="button" class="btn btn-primary"
                                                    id="confirmAssignButton">Confirm</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Share Confirmation Modal -->


                                </div>
                                <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                                <script
                                    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                                <script
                                    src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

                                <script>
                                    function confirmDelete(staffId, projectId, role) {
                                        // Set the form values in the modal
                                        document.getElementById('deleteStaffId').value = staffId;
                                        document.getElementById('deleteProjectId').value = projectId;
                                        document.getElementById('deleteRole').value = role;

                                        // Show the modal
                                        $('#deleteConfirmationModal').modal('show');
                                    }

                                    // Properly initialize the project variables from JSP
                                    function updateStage(projectId, newStage) {
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/updateStage', // Replace with the correct endpoint for your project
                                            type: 'POST',
                                            data: {
                                                projectId: projectId,
                                                projectStage: newStage
                                            },
                                            success: function (response) {
                                                // Show success message modal
                                                $('#notificationModalLabel').text('Success');
                                                $('#notificationModalBody').text('Stage updated successfully!');
                                                $('#notificationModal').modal('show');

                                                // Update the UI to reflect the new stage
                                                currentStage = newStage; // Update the current stage variable
                                                updateStageButtons(newStage, 2); // Update button styles
                                            },
                                            error: function (xhr, status, error) {
                                                // Display error modal with error details
                                                $('#notificationModalLabel').text('Error');
                                                $('#notificationModalBody').text('Failed to update the stage. Please try again.');
                                                $('#notificationModal').modal('show');
                                            }
                                        });
                                    }

                                    // Function to update button styles based on the new stage
                                    function updateStageButtons(newStage, newStatus) {
                                        // Update each button's class to reflect the new stage
                                        let buttons = document.querySelectorAll('.stage-button');
                                        buttons.forEach((button, index) => {
                                            if (index + 1 < newStage) {
                                                // Previous stages: set to green
                                                button.classList.remove('btn-secondary', 'btn-warning');
                                                button.classList.add('btn-success');
                                            } else if (index + 1 === newStage) {
                                                // Current stage: set to yellow
                                                button.classList.remove('btn-secondary', 'btn-success');
                                                button.classList.add('btn-warning');
                                            } else {
                                                // Future stages: set to default (secondary)
                                                button.classList.remove('btn-success', 'btn-warning');
                                                button.classList.add('btn-secondary');
                                            }
                                        });
                                        let button = document.querySelector('#confirmPlanningStageButton');
                                        if (button) {
                                            button.style.display = "none";
                                        }
                                        let statusBadge = document.querySelector('.status');
                                        statusBadge.classList.remove('badge-secondary', 'badge-primary', 'badge-success', 'badge-danger', 'badge-light'); // Remove existing badge classes

                                        if (newStatus == 1) {
                                            statusBadge.classList.add('badge-secondary');
                                            statusBadge.textContent = 'Pending';
                                        } else if (newStatus == 2) {
                                            statusBadge.classList.add('badge-primary');
                                            statusBadge.textContent = 'Processing';
                                        } else if (newStatus == 3) {
                                            statusBadge.classList.add('badge-success');
                                            statusBadge.textContent = 'Completed';
                                        } else if (newStatus == 4) {
                                            statusBadge.classList.add('badge-danger');
                                            statusBadge.textContent = 'Cancelled';
                                        } else {
                                            statusBadge.classList.add('badge-light');
                                            statusBadge.textContent = 'Unknown';
                                        }

                                    }

                                    var currentStage = parseInt(${ project.stage }, 10); // Initialize the current stage value

                                    // Function to handle clicking on a stage button
                                    function handleStageClick(clickStage) {
                                        var constructionStaffAssigned = document.getElementById('constructionStaffAssigned').value === "true";
                                        var designStaffAssigned = document.getElementById('designStaffAssigned').value === "true";

                                        console.log("Construction staff assigned:", constructionStaffAssigned);
                                        console.log("Construction staff assigned:", designStaffAssigned);

                                        // Example usage
                                        if (!constructionStaffAssigned || !designStaffAssigned) {
                                            // Show a notification or handle logic for no construction staff assigned
                                            $('#notificationModalLabel').text('Warning');
                                            $('#notificationModalBody').text('No construction staff have been assigned yet!');
                                            $('#notificationModal').modal('show');

                                        } else {
                                            // Show modal confirmation dialog
                                            $('#updateStageModal').modal('show');

                                            // Set the event listener for the "Yes" button to confirm the stage update
                                            document.getElementById("confirmUpdateButton").onclick = function () {
                                                updateStage(${ project.projectId }, clickStage);
                                                $('#updateStageModal').modal('hide'); // Close the modal after confirmation
                                            };
                                        }
                                    }
                                    //FUNCTION TO OPEN POPUP SEARCH
                                    function viewCancelRequest(projectId) {
                                        $('#viewRequestModal').modal('show');
                                    }
                                    function showConfirmationModal(projectId, action) {
                                        console.log('showConfirmationModal called with projectId:', projectId, 'action:', action);

                                        // Based on action (share or cancel), update modal content
                                        // Based on action (share or cancel), update modal content
                                        if (action === 'share') {
                                            console.log("share");
                                            var isShared = $('#shareBadge').hasClass("badge-success");

                                            if (isShared) {
                                                console.log("unshare");
                                                $('#confirmModalLabel').text('Confirm Unshare');
                                                $('.modal-body').text('Are you sure you want to stop sharing this project?');
                                                $('#confirmActionButton').text('Yes, Stop Sharing').removeClass('btn-primary btn-warning').addClass('btn-danger');
                                            } else {
                                                console.log("share");
                                                $('#confirmModalLabel').text('Confirm Share');
                                                $('.modal-body').text('Are you sure you want to share this project?');
                                                $('#confirmActionButton').text('Yes, Share Project').removeClass('btn-danger btn-warning').addClass('btn-primary');
                                            }

                                            // Set the click handler for the confirm button for sharing
                                            $('#confirmActionButton').off('click').on('click', function () {
                                                shareProject(projectId);
                                            });
                                        } else if (action === 'cancel') {
                                            $('#confirmModalLabel').text('Confirm Project Cancellation');
                                            $('.modal-body').text('Are you sure you want to cancel this project? This action cannot be undone.');
                                            $('#confirmActionButton').text('Yes, Cancel Project').removeClass('btn-primary btn-danger').addClass('btn-warning');

                                            // Set the click handler for the confirm button for canceling
                                            $('#confirmActionButton').off('click').on('click', function () {
                                                cancelProject(projectId,4);
                                            });
                                        }

                                        // Show the confirmation modal
                                        $('#confirmModal').modal('show');
                                        console.log("show");
                                    }

                                    // AJAX function to share the project
                                    function shareProject(projectId) {
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/manager/projects/shareProject',
                                            method: 'POST',
                                            data: { projectId: projectId },
                                            success: function (response) {
                                                $('#confirmModal').modal('hide');
                                                showNotification('Success', 'Project share state has been updated successfully!', 'success');
                                                toggleShareButtonState();
                                            },
                                            error: function (xhr, status, error) {
                                                $('#confirmModal').modal('hide');
                                                showNotification('Error', 'Failed to share the project. Please try again.', 'error');
                                            }
                                        });
                                    }
                                    function toggleShareButtonState() {
                                        var shareBtn = $('#shareBtn');
                                        var shareBadge = $('#shareBadge'); // Badge element to indicate share status

                                        if (shareBtn.hasClass('btn-primary')) {
                                            // Change button to "Stop Sharing"
                                            shareBtn.removeClass('btn-primary')
                                                .addClass('btn-danger')
                                                .text('Stop Sharing Project');

                                            // Update badge to show "Shared"
                                            shareBadge.removeClass('badge-danger')
                                                .addClass('badge-success')
                                                .text('Shared');
                                        } else {
                                            // Change button to "Share Project"
                                            shareBtn.removeClass('btn-danger')
                                                .addClass('btn-primary')
                                                .text('Share Project');

                                            // Update badge to show "Not Shared"
                                            shareBadge.removeClass('badge-success')
                                                .addClass('badge-danger')
                                                .text('Not Shared');
                                        }
                                    }
                                    // AJAX function to cancel the project
                                    function cancelProject(projectId, status) {
                                        let action = 'cancel';
                                        if (status == 4) {
                                            action = 'cancel';
                                        } else if (status == 1) {
                                            action = 'pending';
                                        } else if(status==2){
                                            action= 'processing';
                                        }

                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/manager/projects/cancelProject',
                                            method: 'POST',
                                            data: {
                                                projectId: projectId,
                                                status: status,
                                            },
                                            success: function (response) {
                                                $('#confirmModal').modal('hide');
                                                $('#viewRequestModal').modal('hide');
                                                if (action == "cancel") {
                                                    showNotification('Success', `Cancelled successfully!`, 'success');
                                                    if ($('#shareBadge').hasClass('badge-success')) {
                                                        toggleShareButtonState();
                                                    }
                                                }else if(action=='pending'||action=='processing'){
                                                    showNotification('Success', `Deny Request successfully!`, 'success');
                                                    $('#confirmPlanningStageButtonContainer').append('<button type="button" id="confirmPlanningStageButton" onclick="handleStageClick(2)" class="btn btn-primary btn-md">Confirm Planning Stage</button>');
                                                }
                                                toggleCancelButtonState(projectId,action);
                                            },
                                            error: function (xhr, status, error) {
                                                $('#confirmModal').modal('hide');
                                                $('#viewRequestModal').modal('hide');
                                                showNotification('Error', `Failed to ${action} the project. Please try again.`, 'error');
                                            }
                                        });
                                    }
                                    function toggleCancelButtonState(projectId,action) {
                                        let badgeClass, badgeText;
                                        if (action === 'cancel') {
                                            badgeClass = 'badge-danger';
                                            badgeText = 'Cancelled';
                                            $('#shareBtn, #cancelProjectBtn, #viewRequestBtn').remove();
                                            // Hide elements
                                            $('.delete-button, .search-section').hide();
                                            // Disable all input fields and buttons
                                        } else if (action === 'processing') {
                                            badgeClass = 'badge-primary';
                                            badgeText = 'Processing';
                                            $('#cancelProjectBtn').removeClass('btn-danger').addClass('btn-warning').text('Cancel Project');
                                            $('#cancelProjectBtn').attr('onclick', 'showConfirmationModal('+projectId+', "cancel")');                                            
                                        } else if(action=='pending'){
                                            badgeClass = 'badge-secondary';
                                            badgeText = 'Pending';
                                            $('#cancelProjectBtn').removeClass('btn-danger').addClass('btn-warning').text('Cancel Project');
                                            $('#cancelProjectBtn').attr('onclick', 'showConfirmationModal('+projectId+', "cancel")');    
                                        }
                                        // Update the status badge
                                        $('#projectStatusBadge')
                                            .removeClass('badge-secondary badge-primary badge-success badge-warning badge-danger')
                                            .addClass(badgeClass)
                                            .text(badgeText);
                                        // Remove buttons

                                    }
                                    // Utility function to show notification modal
                                    function showNotification(title, message, type) {
                                        $('#notificationModalLabel').text(title);
                                        $('#notificationModalBody').text(message);

                                        // Show the notification modal
                                        $('#notificationModal').modal('show');
                                    }
                                    function showAssignConfirmation(name, id, department) {
                                        document.getElementById('confirmStaffName').textContent = name;
                                        document.getElementById('assignStaffId').value = id;
                                        document.getElementById('assignStaffRole').value = department;

                                        $('#assignStaffConfirmationModal').modal("show");
                                    }
                                    $(document).ready(function () {
                                        $('#confirmAssignButton').on('click', function () {
                                            document.getElementById('assignStaffForm').submit();
                                        })
                                    });
                                </script>
                                <!-- Bootstrap JS -->

                            </div>
                        </div>
                    </div>
                </div>
        </body>

        </html>
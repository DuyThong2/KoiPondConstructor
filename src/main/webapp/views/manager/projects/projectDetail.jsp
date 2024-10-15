<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL Taglib Declaration -->
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Project Details</title>
            <!-- Bootstrap CSS -->
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
            <!-- FontAwesome Icons -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
            <!-- Custom Styles -->
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
            </style>
        </head>

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
                                                <h4 class="section-header"><i class="fas fa-project-diagram"></i>
                                                    Project
                                                    Information</h4>
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
                                                                <a
                                                                    href="/manager/design/viewDetail/${project.design.designId}">
                                                                    <button type="button"
                                                                        class="btn stage-button btn-md btn-block px-3 ${designClass}">
                                                                        Design
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
                                                                    href="/manager/construction/viewDetail/${project.construction.constructionId}">
                                                                    <button type="button"
                                                                        class="btn stage-button btn-md btn-block px-3 ${constructionClass}">
                                                                        Construction
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
                                                    <tr>
                                                        <th>Project ID</th>
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
                                                                    ${project.dateEnd}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Project Status</th>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${project.status == 1}">
                                                                    <span
                                                                        class="badge badge-secondary badge-custom">Pending</span>
                                                                </c:when>
                                                                <c:when test="${project.status == 2}">
                                                                    <span class="badge badge-primary badge-custom">In
                                                                        Progress</span>
                                                                </c:when>
                                                                <c:when test="${project.status == 3}">
                                                                    <span
                                                                        class="badge badge-success badge-custom">Completed</span>
                                                                </c:when>
                                                                <c:when test="${project.status == 4}">
                                                                    <span
                                                                        class="badge badge-danger badge-custom">Cancelled</span>
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
                                                                        class="badge badge-success badge-custom">Shared</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge badge-danger badge-custom">Not
                                                                        Shared</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <th>Note</th>
                                                        <td>
                                                            <p class="form-control" name="description" rows="3">
                                                                ${project.description}</p>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </div>
                                            <div>
                                                <h4 class="section-header"><i class="fas fa-project-diagram"></i>
                                                    Project
                                                    Content</h4>

                                                <div row="mt-2 mb-2">
                                                    <!-- show project content inside here -->
                                                    <p id='projectContent'>
                                                    </p>
                                                </div>
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
                                                        <th>Customer Name</th>
                                                        <td>${customer.name}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Phone</th>
                                                        <td>${customer.phone}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Email</th>
                                                        <td>${customer.email}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </main>
                </div>
            </div>
           <script>
            
           </script>
            <!-- Bootstrap JS and dependencies -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></scrip>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        </body>

        </html>
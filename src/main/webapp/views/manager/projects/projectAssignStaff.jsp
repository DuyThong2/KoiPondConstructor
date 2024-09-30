<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project and Customer Information</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="/css/designer/designerStyle.css" rel="stylesheet">
        <style>
            .sidebar {
                position: fixed;
                /* Make it stick to the left */
                top: 0;
                left: 0;
                height: 100vh;
                width: 250px;
                background-color: #343a40;
                color: white;
                padding-top: 20px;
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

            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
                min-height: 100vh;
                padding-left: 250px;
                /* Space for the fixed sidebar */
            }

            .info-section {
                margin-top: 20px;
            }

            .info-box {
                background-color: #fff;
                padding: 23px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .info-item p {
                background-color: #f0f0f0;
                padding: 12px;
                border-radius: 5px;
                margin-bottom: 15px;
                font-size: 1rem;
            }

            h4 {
                font-size: 1.5rem;
                margin-bottom: 20px;
            }

            .staff-img {
                width: 100%;
                height: 100px;
                /* Set a fixed height for uniformity */
                object-fit: cover;
                /* Ensures the image covers the area without being stretched */
                border-top-left-radius: 10px;
                /* Matches the card border-radius */
                border-top-right-radius: 10px;
                /* Matches the card border-radius */
            }

            .delete-button {
                position: absolute;
                top: 0px;
                right: 0px;
                width: 30px;
                height: 30px;
                background-color: #dc3545;
                /* Bootstrap danger red */
                color: #fff;
                border: none;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 18px;
                /* Adjust for proper centering */
                cursor: pointer;
            }

            .delete-button:hover {
                background-color: #c82333;
                /* Darker red on hover */
            }

            .hover-row {
                transition: transform 0.3s, background-color 0.3s;
            }

            .hover-row:hover {
                transform: scale(1.02);
                background-color: #e9ecef;
                /* A light gray background to highlight */
            }

            .card {
                position: relative;
                transition: transform 0.3s;
            }

            .card:hover .staff-img {
                transform: scale(1.1);
                /* Make the image bigger when hovering over the card */
            }

            .card form {
                position: absolute;
                top: 0px;
                right: 0px;
                z-index: 100;
            }
        </style>
    </head>

    <body>
        <!-- Sidebar -->
        <nav class="sidebar">
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
        </nav>

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
                                        <span class="badge badge-secondary">Pending</span>
                                    </c:when>
                                    <c:when test="${project.status == 2}">
                                        <span class="badge badge-primary">Processing</span>
                                    </c:when>
                                    <c:when test="${project.status == 3}">
                                        <span class="badge badge-success">Completed</span>
                                    </c:when>
                                    <c:when test="${project.status == 4}">
                                        <span class="badge badge-danger">Cancelled</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-light">Unknown</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>

                        </div>
                        <div class="info-item">
                            <p><a href="/download/${project.imgURL}" class="btn btn-link">Download Project Image</a></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="info-box">
                        <h4>Project Stages</h4>
                        <div class="container-fluid">
                            <div class="row justify-content-between">

                                <!-- Planning Stage -->
                                <c:set var="planningClass"
                                    value="${(project.stage >= 1 )? 'btn-success' : 'btn-secondary'}" />
                                <div class="col text-center mb-2">
                                    <button type="button"
                                        class="btn stage-button btn-md btn-block px-3 ${planningClass}"
                                        onclick="handleStageClick(1)">
                                        Planning
                                    </button>
                                </div>

                                <!-- Design Stage -->
                                <c:set var="designClass"
                                    value="${project.stage >= 2 ? 'btn-success' : 'btn-secondary'}" />
                                <div class="col text-center mb-2">
                                    <button type="button" class="btn stage-button btn-md btn-block px-3 ${designClass}"
                                        onclick="handleStageClick(2)">
                                        Design
                                    </button>
                                </div>

                                <!-- Construction Stage -->
                                <c:set var="constructionClass"
                                    value="${project.stage >= 3 ? 'btn-success' : 'btn-secondary'}" />
                                <div class="col text-center mb-2">
                                    <button type="button"
                                        class="btn  stage-button  btn-md btn-block px-3 ${constructionClass}"
                                        onclick="handleStageClick(3)">
                                        Construction
                                    </button>
                                </div>

                                <!-- Maintenance Stage -->
                                <c:set var="maintenanceClass"
                                    value="${project.stage >= 4 ? 'btn-success' : 'btn-secondary'}" />
                                <div class="col text-center mb-2">
                                    <button type="button"
                                        class="btn stage-button btn-md btn-block px-3 ${maintenanceClass}"
                                        onclick="handleStageClick(4)">
                                        Maintenance
                                    </button>
                                </div>

                                <!-- Complete Stage -->
                                <c:set var="completeClass"
                                    value="${project.stage == 5 ? 'btn-success' : 'btn-secondary'}" />
                                <div class="col text-center mb-2">
                                    <button type="button"
                                        class="btn stage-button btn-md btn-block px-3 ${completeClass}"
                                        onclick="handleStageClick(5)">
                                        Complete
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info-box">
                        <div class="content-box">
                            <!-- Staff Card Section -->
                            <div id="staff-card-section">
                                <!-- Designer Row -->
                                <div class="row hover-row mb-4">
                                    <div class="col-6">
                                        <h5>Designer Staff</h5>
                                    </div>
                                    <div class="col-6 text-right">
                                        <button type="button" id="assignDesignerButton"
                                            class="btn btn-success assign-button" data-toggle="modal"
                                            data-target="#assignDesignerModal" data-project-id="${project.projectId}">
                                            Assign Staff
                                        </button>
                                    </div>

                                    <!-- Designer Staff Cards -->
                                    <c:forEach items="${designerStaff}" var="staff" varStatus="status">
                                        <div class="col-md-3 mb-3 d-flex justify-content-between">
                                            <div class="card position-relative">
                                                <!-- Delete (X) Button -->
                                                <form action="/manager/projects/deleteStaff" method="POST"
                                                    class="position-absolute">
                                                    <input type="hidden" name="staffId" value="${staff.id}">
                                                    <input type="hidden" name="projectId" value="${project.projectId}">
                                                    <input type="hidden" name="role" value="design">
                                                    <button type="button" class="btn btn-danger delete-button" aria-label="Close"
                                                    onclick="confirmDelete(${staff.id}, ${project.projectId}, 'design')">&times;</button>
                                                </form>
                                                <!-- Staff Image -->
                                                <img src="/assets/imgs/mylogo/koi-background.jpg"
                                                    class="card-img-top staff-img" alt="Staff Image" />
                                                <!-- Card Body -->
                                                <div class="card-body text-center">
                                                    <h5 class="card-title">
                                                        <c:out value="${staff.name}" />
                                                    </h5>
                                                    <button type="button" class="btn btn-info mb-2">Detail</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <!-- Construction Row -->
                                <div class="row hover-row mb-4">
                                    <div class="col-6">
                                        <h5>Construction Staff</h5>
                                    </div>
                                    <div class="col-6 text-right">
                                        <button type="button" id="assignConstructionButton"
                                            class="btn btn-primary assign-button" data-toggle="modal"
                                            data-target="#assignConstructionModal"
                                            data-project-id="${project.projectId}">
                                            Assign Staff
                                        </button>
                                    </div>

                                    <!-- Construction Staff Cards -->
                                    <c:forEach items="${constructionStaff}" var="staff" varStatus="status">
                                        <div class="col-md-3 mb-3 d-flex justify-content-between">
                                            <div class="card position-relative">
                                                <!-- Delete (X) Button -->
                                                <form action="/manager/projects/deleteStaff" method="POST"
                                                    class="position-absolute">
                                                    <input type="hidden" name="staffId" value="${staff.id}">
                                                    <input type="hidden" name="projectId" value="${project.projectId}">
                                                    <input type="hidden" name="role" value="design">
                                                    <button type="button" class="btn btn-danger delete-button"
                                                        aria-label="Close"
                                                        onclick="confirmDelete(${staff.id}, ${project.projectId}, 'construction')">&times;</button>
                                                </form>
                                                <!-- Staff Image -->
                                                <img src="/assets/imgs/mylogo/koi-background.jpg"
                                                    class="card-img-top staff-img" alt="Staff Image" />
                                                <!-- Card Body -->
                                                <div class="card-body text-center">
                                                    <h5 class="card-title">
                                                        <c:out value="${staff.name}" />
                                                    </h5>
                                                    <button type="button" class="btn btn-info mb-2">Detail</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- Search and Assign Staff Section -->
                            <!-- Search and Assign Staff Section -->
                            <!-- Search and Assign Staff Section -->

                            <!-- Staff Table -->
                            <!-- Search and Assign Staff Section -->
                            <div class="container mt-4">
                                <h2>Search and Assign Staff</h2>

                                <!-- Search Form -->
                                <form action="/manager/projects/assign/${project.projectId}" method="GET"
                                    class="form-inline mb-3">
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
                                                        <c:set var="isAssigned" value="false" />

                                                        <!-- Check if staff is assigned to Designer role -->
                                                        <c:forEach items="${designerStaff}" var="assignedStaff">
                                                            <c:if test="${assignedStaff.id == staff.id}">
                                                                <c:set var="isAssigned" value="true" />
                                                                <button type="button" class="btn btn-secondary"
                                                                    disabled>Assigned as Designer</button>
                                                            </c:if>
                                                        </c:forEach>

                                                        <!-- Check if staff is assigned to Construction role -->
                                                        <c:forEach items="${constructionStaff}" var="assignedStaff">
                                                            <c:if test="${assignedStaff.id == staff.id}">
                                                                <c:set var="isAssigned" value="true" />
                                                                <button type="button" class="btn btn-secondary"
                                                                    disabled>Assigned as Construction Staff</button>
                                                            </c:if>
                                                        </c:forEach>

                                                        <!-- Show Add to Project button if not assigned -->
                                                        <c:if test="${isAssigned == false}">
                                                            <form action="/manager/projects/assignStaff" method="POST"
                                                                class="d-inline">
                                                                <input type="hidden" name="projectId"
                                                                    value="${project.projectId}">
                                                                <input type="hidden" name="staffId" value="${staff.id}">
                                                                <input type="hidden" name="role"
                                                                    value="${staff.department}">
                                                                <button type="submit" class="btn btn-primary">Add to
                                                                    Project</button>
                                                            </form>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>





                            <!-- Search Section -->
                            <div class="modal fade" id="assignDesignerModal" tabindex="-1" role="dialog"
                                aria-labelledby="assignDesignerModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="assignDesignerModalLabel">Assign Designer Staff
                                            </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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

                            <!-- Assign Construction Modal -->
                            <div class="modal fade" id="assignConstructionModal" tabindex="-1" role="dialog"
                                aria-labelledby="assignConstructionModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="assignConstructionModalLabel">Assign
                                                Construction Staff</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="text" class="form-control mb-3"
                                                placeholder="Search Construction Staff...">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Staff Name</th>
                                                        <th>Assign</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="constructionResults">

                                                    <!-- Add more rows as needed -->
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Search Section -->


                    <!-- Update Confirmation Modal -->
                    <div class="modal fade" id="updateStageModal" tabindex="-1" role="dialog"
                        aria-labelledby="updateStageModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="updateStageModalLabel">Confirm Stage Update</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to move to the next stage?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                    <button type="button" class="btn btn-primary" id="confirmUpdateButton">Yes</button>
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
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body" id="notificationModalBody">
                                    <!-- Message will be dynamically inserted here -->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
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
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Are you sure you want to delete this staff member?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <form id="deleteForm" action="/manager/projects/deleteStaff" method="POST">
                                        <input type="hidden" name="staffId" id="deleteStaffId">
                                        <input type="hidden" name="projectId" id="deleteProjectId">
                                        <input type="hidden" name="role" id="deleteRole">
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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
                                url: '/updateStage', // Replace with the correct endpoint for your project
                                type: 'POST',
                                data: {
                                    projectId: projectId,
                                    newStage: newStage
                                },
                                success: function (response) {
                                    // Show success message modal
                                    $('#notificationModalLabel').text('Success');
                                    $('#notificationModalBody').text('Stage updated successfully!');
                                    $('#notificationModal').modal('show');

                                    // Update the UI to reflect the new stage
                                    currentStage = newStage; // Update the current stage variable
                                    updateStageButtons(newStage); // Update button styles
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
                        function updateStageButtons(newStage) {
                            // Update each button's class to reflect the new stage
                            let buttons = document.querySelectorAll('.stage-button');
                            buttons.forEach((button, index) => {
                                if (index + 1 <= newStage) {
                                    button.classList.remove('btn-secondary');
                                    button.classList.add('btn-success');
                                } else {
                                    button.classList.remove('btn-success');
                                    button.classList.add('btn-secondary');
                                }
                            });
                        }

                        var currentStage = parseInt(${ project.stage }, 10); // Initialize the current stage value

                        // Function to handle clicking on a stage button
                        function handleStageClick(clickStage) {
                            if (clickStage === currentStage + 1) {
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
                        $(document).ready(function () {
                            $('#assignDesignerButton').on('click', function () {
                                $.ajax({
                                    url: '/getDesignerStaff',
                                    method: 'GET',
                                    success: function (response) {
                                        $('#designerResults').empty();
                                        response.forEach(function (staff) {
                                            $('#designerResults').append(`
                        <tr>
                            <td>${staff.name}</td>
                            <td><button type="button" class="btn btn-primary" onclick="assignStaff(${staff.id}, 'designer')">Assign</button></td>
                        </tr>
                    `);
                                        });
                                    },
                                    error: function (xhr, status, error) {
                                        console.error('Failed to fetch designer staff: ', error);
                                    }
                                });
                            });

                            $('#assignConstructionButton').on('click', function () {
                                $.ajax({
                                    url: '/getConstructionStaff',
                                    method: 'GET',
                                    success: function (response) {
                                        $('#constructionResults').empty();
                                        response.forEach(function (staff) {
                                            $('#constructionResults').append(`
                        <tr>
                            <td>${staff.name}</td>
                            <td><button type="button" class="btn btn-primary" onclick="assignStaff(${staff.id}, 'construction')">Assign</button></td>
                        </tr>
                    `);
                                        });
                                    },
                                    error: function (xhr, status, error) {
                                        console.error('Failed to fetch construction staff:', error);
                                    }
                                });
                            });
                        });

                    </script>
                    <!-- Bootstrap JS -->
                    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>

    </html>
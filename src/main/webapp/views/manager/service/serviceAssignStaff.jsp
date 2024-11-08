<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer and Service Information</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
        <style>
            /* CSS styling for layout */
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
        </style>
    </head>
    <div style="height:5vh;"></div>

    <body>

        <%@include file="../navBar.jsp" %>

        <div class="container">
            <!-- Customer and Service Information -->
            <div class="row info-section">
                <!-- Left column with customer and service details -->
                <div class="col-md-4">
                    <div class="info-box">
                        <h4>Customer Information</h4>
                        <p><strong>Name:</strong> ${serviceDetail.customer.name}</p>
                        <p><strong>Email:</strong> ${serviceDetail.customer.email}</p>
                        <p><strong>Phone:</strong> ${serviceDetail.customer.phone}</p>
                    </div>

                    <div class="info-box">
                        <h4>Service Information</h4>
                        <p><strong>Service Name:</strong> ${serviceDetail.service.serviceName}</p>
                        <p><strong>Description:</strong> ${serviceDetail.service.serviceDescription}</p>
                        <p><strong>Price:</strong> ${serviceDetail.price}</p>
                    </div>
                </div>

                <!-- Right column with service status and staff assignment -->
                <div class="col-md-8">
                    <div class="info-box">
                        <h4>Service Status</h4>
                        <p>
                            <strong>Status:</strong>
                            <c:choose>
                                <c:when test="${serviceDetail.serviceDetailStatus == 1}">
                                    <span class="badge badge-secondary status-badge">Pending</span>
                                </c:when>
                                <c:when test="${serviceDetail.serviceDetailStatus == 2}">
                                    <span class="badge badge-primary status-badge">Processing</span>
                                </c:when>
                                <c:when test="${serviceDetail.serviceDetailStatus == 3}">
                                    <span class="badge badge-success status-badge">Complete</span>
                                </c:when>
                                <c:when test="${serviceDetail.serviceDetailStatus == 4}">
                                    <span class="badge badge-warning status-badge">Requesting Cancel</span>
                                </c:when>
                                <c:when test="${serviceDetail.serviceDetailStatus == 5}">
                                    <span class="badge badge-danger status-badge">Cancelled</span>
                                </c:when>
                            </c:choose>
                        </p>
                    </div>

                    <!-- Assigned Staff Section -->
                    <div class="info-box">
                        <h4>Assigned Staff</h4>
                        <div class="row hover-row">
                            <c:if test="${serviceDetail.staff != null}">
                                <div class="col-md-4">
                                    <div class="card">
                                        
                                        <c:choose>
                                            <c:when test='${serviceDetail.staff.imgURL != null}'>
                                                <img class="staff-img"
                                                     src="${serviceDetail.staff.getShowingImg(serviceDetail.staff.imgURL)}"
                                                     alt="Staff Image"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img class="staff-img"
                                                     src="${pageContext.request.contextPath}/assets/imgs/mylogo/koi-background.jpg"
                                                     alt="Staff Image"/>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="card-body text-center">
                                            <h5 class="card-title">${serviceDetail.staff.name}</h5>
                                            <c:if
                                                test="${serviceDetail.serviceDetailStatus != 3 && serviceDetail.serviceDetailStatus != 5 &&serviceDetail.serviceDetailStatus!=4}">
                                                <button type="button" class="delete-button" data-toggle="modal"
                                                        data-target="#deleteStaffModal"
                                                        data-staffid="${serviceDetail.staff.id}"
                                                        data-staffname="${serviceDetail.staff.name}">
                                                    &times;
                                                </button>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/manager/manageStaff/detail/${serviceDetail.staff.id}"
                                               class="btn btn-info">Detail</a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${serviceDetail.staff == null}">
                                <div class="col-md-12">
                                    <p>No staff assigned yet.</p>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Search and Assign Staff Section -->
                    <c:if
                        test="${serviceDetail.serviceDetailStatus != 3 && serviceDetail.serviceDetailStatus != 5}">
                        <div class="info-box">
                            <h4>Search and Assign Staff</h4>
                            <!-- Search Form -->

                            <!-- Search and Assign Staff Section -->
                            <div class="info-box">
                                <h4>Search and Assign Staff</h4>
                                <!-- Search Form -->
                                <form
                                    action="${pageContext.request.contextPath}/manager/serviceDetails/assign/${serviceDetail.id}"
                                    method="GET" class="form-inline mb-3">
                                    <input type="text" name="searchTerm" class="form-control mr-2"
                                           placeholder="Search staff by name..." value="${param.searchTerm}">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </form>

                                <!-- Available Staff Table -->
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
                                        <c:forEach var="staff" items="${availableStaff}">
                                            <tr>
                                                <td>${staff.id}</td>
                                                <td>${staff.name}</td>
                                                <td>${staff.department}</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary assign-btn"
                                                            onclick="confirmAssignStaff(${staff.id}, '${staff.name}', '${staff.department}')">
                                                        Assign
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <!-- Pagination controls here -->
                            </div>
                            <div class="d-flex w-100 justify-content-between align-items-center mt-4">
                                <!-- Previous Button -->
                                <c:choose>
                                    <c:when test="${currentPage > 1}">
                                        <form
                                            action="${pageContext.request.contextPath}/manager/serviceDetails/assign/${serviceDetail.id}"
                                            method="GET">
                                            <button class="btn btn-primary" type="submit">&lt;</button>
                                            <input type="hidden" name="currentPage" value="${currentPage - 1}">
                                            <input type="hidden" name="size" value="${size}">
                                            <c:if test="${searchTerm != null}">
                                                <input type="hidden" name="searchTerm" value="${searchTerm}">
                                            </c:if>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary" type="submit" disabled>&lt;</button>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Page Indicator -->
                                <span class="mx-3">Page <strong>${currentPage}</strong> of
                                    <strong>${totalPage}</strong></span>

                                <!-- Next Button -->
                                <c:choose>
                                    <c:when test="${currentPage < totalPage}">
                                        <form
                                            action="${pageContext.request.contextPath}/manager/serviceDetails/assign/${serviceDetail.id}"
                                            method="GET">
                                            <button class="btn btn-primary" type="submit">&gt;</button>
                                            <input type="hidden" name="currentPage" value="${currentPage + 1}">
                                            <input type="hidden" name="size" value="${size}">
                                            <c:if test="${searchTerm != null}">
                                                <input type="hidden" name="searchTerm" value="${searchTerm}">
                                            </c:if>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary" type="submit" disabled>&gt;</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>



                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Modal for Assigning Staff -->
        <div class="modal fade" id="assignStaffModal" tabindex="-1" role="dialog"
             aria-labelledby="assignStaffModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="assignStaffModalLabel">Confirm Staff Assignment</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to assign <strong id="staffName"></strong> to this service?
                    </div>
                    <div class="modal-footer">
                        <form action="${pageContext.request.contextPath}/manager/serviceDetails/assignStaff"
                              method="POST">
                            <input type="hidden" id="staffId" name="staffId">
                            <input type="hidden" name="serviceDetailId" value="${serviceDetail.id}">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Assign</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="errorMessageInput" value="${errorMessage}">
        <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="errorModalLabel">Error</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="errorModalBody">
                        <!-- Error message will be inserted here -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteStaffModal" tabindex="-1" role="dialog"
             aria-labelledby="deleteStaffModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteStaffModalLabel">Confirm Staff Deletion</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to unassign <strong id="deleteStaffName"></strong> from this
                        service?
                    </div>
                    <div class="modal-footer">
                        <form action="${pageContext.request.contextPath}/manager/serviceDetails/deleteStaff"
                              method="POST">
                            <input type="hidden" name="staffId" value="${serviceDetail.staff.id}">
                            <input type="hidden" name="serviceDetailId" value="${serviceDetail.id}">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script>
                                                            function confirmAssignStaff(staffId, staffName, department) {
                                                                $('#staffName').text(staffName + ' (' + department + ')');
                                                                $('#staffId').val(staffId);
                                                                $('#assignStaffModal').modal('show');
                                                            }
                                                            function confirmDeleteStaff(staffId, staffName) {
                                                                // You should see this alert
                                                                console.log("staffId:", staffId, "staffName:", staffName); // You should see these logs in the browser console
                                                                $('#deleteStaffName').text(staffName); // Update modal content with staff name
                                                                $('#deleteStaffId').val(staffId); // Update hidden input with staff ID
                                                                $('#deleteStaffModal').modal('show'); // Show the modal
                                                            }
                                                            $(document).ready(function () {
                                                                var errorMessage = $('#errorMessageInput').val();
                                                                if (errorMessage && errorMessage.trim() !== '') {
                                                                    $('#errorModalBody').text(errorMessage);
                                                                    $('#errorModal').modal('show');
                                                                }
                                                            });
        </script>

    </body>

</html>
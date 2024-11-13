<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Admin Dashboard - Service Details</title>
            <!-- Bootstrap CSS -->
                <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
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
        <div style="height:5vh;"></div>
        <body>
            <div class="container-fluid">
                <div class="row">
                    <%@ include file="../navBar.jsp" %>

                        <!-- Main content -->
                        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 mt-4">
                            <h2 class="mb-4">Service Detail List</h2>

                            <!-- Filter Card -->
                            <div class="filter-card">
                                <form method="get" action="${pageContext.request.contextPath}/manager/serviceDetails">
                                    <div class="form-row align-items-center">
                                        <!-- Sort By -->
                                        <div class="col-auto">
                                            <label for="sortBy">Sort by:</label>
                                            <select name="sortBy" id="sortBy" class="form-control">
                                                <option value="serviceDetailStatus" ${sortBy=='serviceDetailStatus'
                                                    ? 'selected' : '' }>
                                                    Service Detail Status
                                                </option>
                                                <option value="price" ${sortBy=='price' ? 'selected' : '' }>Price
                                                </option>
                                                <option value="dateRegister" ${sortBy=='dateRegister' ? 'selected' : ''
                                                    }>
                                                    Date Registered
                                                </option>
                                                <option value="rating" ${sortBy=='rating' ? 'selected' : '' }>Rating
                                                </option>
                                            </select>
                                        </div>

                                        <!-- Sort Direction -->
                                        <div class="col-auto">
                                            <label for="sortType">Type:</label>
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
                                                <option value="2" ${statusFilter==2 ? 'selected' : '' }>In Progress
                                                </option>
                                                <option value="3" ${statusFilter==3 ? 'selected' : '' }>Completed
                                                </option>
                                                <option value="4" ${statusFilter==4 ? 'selected' : '' }>Requesting
                                                    Cancel
                                                <option value="5" ${statusFilter==5 ? 'selected' : '' }>Cancelled

                                                </option>
                                            </select>
                                        </div>
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
                                            <label for="searchName">Search:</label>
                                            <input type="text" name="searchName" id="searchName" class="form-control" placeholder="Search for Service Orders"
                                                value="${searchName}">
                                        </div>


                                        <input type="hidden" name="page" value="${currentPage}">
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-primary"
                                                style="margin-top: 2rem">Apply</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <!-- Service Detail Table -->
                            <table class="table table-bordered table-hover">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Service ID</th>
                                        <th>Service Name</th>
                                        <th>Pricing</th>
                                        <th>Date Register</th>
                                        <th>Status</th>
                                        <th>More</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="service" items="${serviceDetailsList}">
                                        <!-- Main Service Row -->
                                        <tr onclick="toggleDetails(${service.id})">
                                            <td>${service.id}</td>
                                            <td>${service.service.serviceName}</td>
                                            <td>${service.price}</td>
                                            <td><fmt:formatDate value="${service.dateRegister}" pattern="MMM dd yyyy" /></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${service.serviceDetailStatus == 1}">
                                                        <span id="badge-${service.id}"
                                                            class="badge badge-secondary badge-status">Pending</span>
                                                    </c:when>
                                                    <c:when test="${service.serviceDetailStatus == 2}">
                                                        <span id="badge-${service.id}"
                                                            class="badge badge-primary badge-status">Processing</span>
                                                    </c:when>
                                                    <c:when test="${service.serviceDetailStatus == 3}">
                                                        <span id="badge-${service.id}"
                                                            class="badge badge-success badge-status">Completed</span>
                                                    </c:when>
                                                    <c:when test="${service.serviceDetailStatus == 4}">
                                                        <span id="badge-${service.id}"
                                                            class="badge badge-warning badge-status">Requesting Cancel</span>
                                                    </c:when>
                                                    <c:when test="${service.serviceDetailStatus == 5}">
                                                        <span id="badge-${service.id}"
                                                            class="badge badge-danger badge-status">Canceled</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td class="d-flex flex-column">
                                                <a onclick="event.stopPropagation();" href="${pageContext.request.contextPath}/manager/serviceDetail/detail/${service.id}"
                                                    class="btn btn-info">Details</a>
                                                <c:if test="${service.serviceDetailStatus == 4}">
                                                    <!-- View Request Button -->
                                                    <button id="viewRequestBtn-${service.id}" type="button"
                                                        class="btn btn-danger btn-md mt-4"
                                                        data-cancel-message="${service.serviceCancelMessage}"
                                                        onclick="showModal(${service.id}, event,this)">
                                                        View Request
                                                    </button>
                                                </c:if>
                                            </td>
                                        </tr>

                                        <!-- Collapsible Row for Customer and Staff Information -->
                                        <tr id="details-${service.id}" style="display: none;">
                                            <td colspan="6">
                                                <table class="table table-bordered">
                                                    <!-- Customer Information -->
                                                    <thead>
                                                        <tr class="table-info">
                                                            <th colspan="5">Customer Information</th>
                                                        </tr>
                                                        <tr>
                                                            <th>Customer ID</th>
                                                            <th>Name</th>
                                                            <th>Contact</th>
                                                            <th>Email</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${not empty service.customer}">
                                                            <tr>
                                                                <td>${service.customer.id}</td>
                                                                <td>${service.customer.name}</td>
                                                                <td>${service.customer.phone}</td>
                                                                <td>${service.customer.email}</td>
                                                                <td>
                                                                    <button class="btn btn-info"
                                                                        onclick="window.location.href = '${pageContext.request.contextPath}/manager/manageCustomer/detail/${service.customer.id}'">
                                                                        Customer Details
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${empty service.customer}">
                                                            <tr>
                                                                <td colspan="5" class="text-center">No customer
                                                                    information
                                                                    available</td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>

                                                    <!-- Staff Information -->
                                                    <thead>
                                                        <tr class="table-info">
                                                            <th colspan="5">Staff Information</th>
                                                        </tr>
                                                        <tr>
                                                            <th>Staff ID</th>
                                                            <th>Name</th>
                                                            <th>Contact</th>
                                                            <th>Role</th>

                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${not empty service.staff}">
                                                            <tr>
                                                                <td>${service.staff.id}</td>
                                                                <td>${service.staff.name}</td>
                                                                <td>${service.staff.phone}</td>
                                                                <td>${service.staff.department}</td>

                                                                <td>
                                                                    <button class="btn btn-info"
                                                                        onclick="window.location.href = '${pageContext.request.contextPath}/manager/manageStaff/detail/${service.staff.id}'">
                                                                        Staff Details
                                                                    </button>
                                                                    <c:if
                                                                        test="${service.serviceDetailStatus!=3 && service.serviceDetailStatus!=5}">
                                                                        <a href="${pageContext.request.contextPath}/manager/serviceDetails/assign/${service.id}"
                                                                            class="btn btn-warning">Edit Staff</a>
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${empty service.staff}">
                                                            <c:choose>
                                                                <c:when
                                                                    test="${service.serviceDetailStatus!=3 && service.serviceDetailStatus!=5}">
                                                                    <tr>
                                                                        <td colspan="5" class="text-center">
                                                                            <a href="${pageContext.request.contextPath}/manager/serviceDetails/assign/${service.id}"
                                                                                class="btn btn-primary">Assign Staff</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td colspan="5" class="text-center">
                                                                        <h5>No Staff Assigned</h5>
                                                                    </td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty serviceDetailsList}">
                                        <tr>
                                            <td colspan="6" class="text-center">No services available</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                            <!-- Pagination Controls -->
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <c:if test="${currentPage > 1}">
                                    <form method="get" action="${pageContext.request.contextPath}/manager/serviceDetails">
                                        <button class="btn btn-primary" type="submit"> &lt; </button>
                                        <input type="hidden" name="page" value="${currentPage - 1}">
                                        <input type="hidden" name="size" value="${size}">
                                        <input type="hidden" name="sortBy" value="${sortBy}">
                                        <input type="hidden" name="sortType" value="${sortType}">
                                        <input type="hidden" name="fromDate" value="${fromDate}">
                                        <input type="hidden" name="endDate" value="${endDate}">
                                        <input type="hidden" name="searchName" value="${searchName}">
                                        <c:if test="${statusFilter != null}">
                                            <input type="hidden" name="statusFilter" value="${statusFilter}">
                                        </c:if>
                                    </form>
                                </c:if>
                                <c:if test="${currentPage == 1}">
                                    <button class="btn btn-primary" disabled>&lt;</button>
                                </c:if>
                                <span>Page <strong>${currentPage}</strong> of <strong>${totalPage}</strong></span>
                                <c:if test="${currentPage < totalPage}">
                                    <form method="get" action="${pageContext.request.contextPath}/manager/serviceDetails">
                                        <button class="btn btn-primary" type="submit">&gt;</button>
                                        <input type="hidden" name="page" value="${currentPage + 1}">
                                        <input type="hidden" name="size" value="${size}">
                                        <input type="hidden" name="sortBy" value="${sortBy}">
                                        <input type="hidden" name="sortType" value="${sortType}">
                                        <input type="hidden" name="fromDate" value="${fromDate}">
                                        <input type="hidden" name="endDate" value="${endDate}">
                                        <input type="hidden" name="searchName" value="${searchName}">
                                        <c:if test="${statusFilter != null}">
                                            <input type="hidden" name="statusFilter" value="${statusFilter}">
                                        </c:if>
                                    </form>
                                </c:if>
                                <c:if test="${currentPage == totalPage}">
                                    <button class="btn btn-primary" disabled>&gt;</button>
                                </c:if>
                            </div>
                        </main>
                        <!-- Modal for viewing the cancellation request -->
                        <!-- Modal for viewing the cancellation request -->
                        <div class="modal fade" id="viewRequestModal" tabindex="-1" role="dialog"
                            aria-labelledby="viewRequestModalLabel" aria-hidden="true" data-service-id="">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="viewRequestModalLabel">Cancellation Request</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p id="cancelMessage"><strong>Reason for Cancellation:</strong></p>
                                    </div>
                                    <div class="modal-footer">
                                        <!-- Accept Request Button -->
                                        <button type="button" class="btn btn-success" onclick="acceptRequest();">
                                            Accept Request
                                        </button>
                                        <!-- Deny Request Button -->
                                        <button type="button" class="btn btn-danger" onclick="denyRequest();">
                                            Deny Request
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
                            aria-labelledby="messageModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="messageModalLabel">Message</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" id="messageModalBody">
                                        <!-- Message content will be dynamically updated -->
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
            <div style="height:15vh;"></div>

                <!-- Bootstrap JS and dependencies -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
                <script>
                    var currentDetailsRow = null;
                
                    function showModal(serviceId,event,button) {
                        event.stopPropagation();
                        $('#viewRequestModal').attr('data-service-id', serviceId);
                        console.log(button.getAttribute('data-cancel-message'));
                        $('#cancelMessage').text(button.getAttribute('data-cancel-message'));
                        $('#viewRequestModal').modal('show');
                    }
                    function toggleDetails(serviceId) {
                        var detailsRow = document.getElementById("details-" + serviceId);

                        if (currentDetailsRow === detailsRow && detailsRow.style.display === "table-row") {
                            detailsRow.style.display = "none"; i
                            currentDetailsRow = null;
                        } else {
                            if (currentDetailsRow !== null) {
                                currentDetailsRow.style.display = "none";
                            }
                            detailsRow.style.display = "table-row";
                            currentDetailsRow = detailsRow;
                        }
                    };
                    // Use event delegation to handle the 'Accept Request' button clicks
                    // Show the modal for the specific service
                  
                    // Accept the cancellation request for the specific service
                    function acceptRequest() {

                        // Prevent the row's click event from triggering
                        var serviceId = $('#viewRequestModal').attr('data-service-id');

                        // Send AJAX request to accept cancellation
                        $.ajax({
                            url: '${pageContext.request.contextPath}/construction/serviceDetail/acceptCancelRequest',
                            method: 'POST',
                            data: {
                                serviceDetailId: serviceId
                            },
                            success: function (response) {
                                // Update the badge to "Canceled" and hide the modal
                                $('#badge-' + serviceId).removeClass('badge-warning').addClass('badge-danger').text('Canceled');
                                $('#viewRequestModal').modal('hide');

                                // Show success message in the message modal
                                $('#messageModalBody').text('Cancellation request accepted successfully!');
                                $('#messageModal').modal('show');

                                // Hide the "View Request" button after the request is accepted
                                $('#viewRequestBtn-' + serviceId).hide();
                            },
                            error: function (xhr, status, error) {
                                // Show error message in the message modal
                                $('#messageModalBody').text('An error occurred while accepting the cancellation request.');
                                $('#messageModal').modal('show');
                            }
                        });
                    }
                    function denyRequest() {
                        // Get the service ID from the modal's data attribute
                        var serviceId = $('#viewRequestModal').attr('data-service-id');

                        // Send AJAX request to deny the cancellation
                        $.ajax({
                            url: '${pageContext.request.contextPath}/construction/serviceDetail/denyCancelRequest',  // Update the URL as needed
                            method: 'POST',
                            data: {
                                serviceDetailId: serviceId
                            },
                            success: function (response) {
                                // Update the badge to "Processing" or other relevant status and hide the modal
                                $('#badge-' + serviceId).removeClass('badge-warning').addClass('badge-primary').text('Processing');
                                $('#viewRequestModal').modal('hide');

                                // Show success message in the message modal
                                $('#messageModalBody').text('Cancellation request denied successfully!');
                                $('#messageModal').modal('show');

                                // Hide the "View Request" button after the request is denied
                                $('#viewRequestBtn-' + serviceId).hide();
                            },
                            error: function (xhr, status, error) {
                                // Show error message in the message modal
                                $('#messageModalBody').text('An error occurred while denying the cancellation request.');
                                $('#messageModal').modal('show');
                            }
                        });
                    }


                </script>
        </body>

        </html>

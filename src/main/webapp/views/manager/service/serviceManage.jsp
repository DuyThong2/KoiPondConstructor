<%-- Document : serviceManage Created on : Oct 04, 2024, 4:20:00 PM Author : ASUS --%>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

            <html>

            <head>
                <title>Admin Dashboard - Services</title>
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

            <body>

                <div class="container-fluid">
                    <div class="row">
                        <%@include file="../navBar.jsp" %>

                            <!-- Main content -->
                            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 mt-4">

                                <h2 class="mb-4">Service List</h2>
                                <div class="row">
                                    <div class="filter-card col-md-6">
                                        <form method="get" action="/manager/services">
                                            <div class="form-row align-items-center">
                                                <!-- Sort By -->
                                                <div class="col-auto">
                                                    <label for="sortBy">Sort by:</label>
                                                    <select name="sortBy" id="sortBy" class="form-control">
                                                        <option value="serviceName" ${sortBy=='serviceName' ? 'selected'
                                                            : '' }>Service Name</option>
                                                        <option value="serviceId" ${sortBy=='serviceId' ? 'selected'
                                                            : '' }>Service ID</option>
                                                    </select>
                                                </div>

                                                <!-- Sort Direction -->
                                                <div class="col-auto">
                                                    <label for="sortType">Type:</label>
                                                    <select name="sortType" id="sortType" class="form-control">
                                                        <option value="asc" ${sortType=='asc' ? 'selected' : '' }>
                                                            Ascending</option>
                                                        <option value="desc" ${sortType=='desc' ? 'selected' : '' }>
                                                            Descending</option>
                                                    </select>
                                                </div>

                                                <!-- Filter By Status -->
                                                <div class="col-auto">
                                                    <label for="statusFilter">Status:</label>
                                                    <select name="statusFilter" id="statusFilter" class="form-control">
                                                        <option value="" ${statusFilter==null ? 'selected' : '' }>All
                                                        </option>
                                                        <option value="true" ${statusFilter=='true' ? 'selected' : '' }>
                                                            Active</option>
                                                        <option value="false" ${statusFilter=='false' ? 'selected' : ''
                                                            }>Inactive</option>
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
                                    <div class="col-md-2"></div>
                                    <div class="col-md-2 filter-card">
                                        <!-- Trigger the modal with a button -->
                                        <button type="button" class="btn btn-success" style="margin-top: 2rem"
                                            data-toggle="modal" data-target="#createServiceModal">Create New
                                            Service</button>
                                    </div>
                                </div>
                                <!-- Modal -->


                                <div id="createServiceModal" class="modal fade" tabindex="-1" role="dialog"
                                    aria-labelledby="createServiceModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-fullscreen" role="document"
                                        style="max-width: 70%; width: 70%; height: 85vh;">
                                        <div class="modal-content" style="height: 85vh;">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="createServiceModalLabel">Create New Service
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form method="POST" action="/manager/services/create">
                                                <div class="modal-body" style="height: calc(85vh - 120px);">
                                                    <!-- Service Information -->
                                                    <div class="form-group">
                                                        <label for="serviceName">Service Name</label>
                                                        <input type="text" class="form-control" id="serviceName"
                                                            name="serviceName" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="serviceDescription">Service Description</label>
                                                        <textarea class="form-control" id="serviceDescription"
                                                            name="serviceDescription" rows="3" required></textarea>
                                                    </div>

                                                    <!-- Content Information -->
                                                    <h5 class="mt-4">Content Information</h5>
                                                    <div class="form-group">
                                                        <label for="contentText">Content</label>
                                                        <textarea class="form-control" id="contentText"
                                                            name="contentText" rows="3" required></textarea>
                                                    </div>

                                                    <!-- Service Price Information -->
                                                    <h5 class="mt-4">Service Price Information</h5>
                                                    <div class="form-group">
                                                        <label for="servicePriceValue">Price Value</label>
                                                        <input type="number" class="form-control" id="servicePriceValue"
                                                            name="servicePriceValue" step="0.01" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save Service</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>



                                <!-- Message Modal -->
                                <div id="messageModal" class="modal fade" tabindex="-1" role="dialog"
                                    aria-labelledby="messageModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="messageModalLabel">Message</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
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
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>




                                <!-- Modal -->
                                <!-- Confirmation Modal for Status Change -->
                                <div id="confirmStatusChangeModal" class="modal fade" tabindex="-1" role="dialog"
                                    aria-labelledby="confirmStatusChangeLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmStatusChangeLabel">Confirm Status
                                                    Change</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure you want to change the status of this service?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Cancel</button>
                                                <button type="button" id="confirmChangeStatusBtn"
                                                    class="btn btn-primary">Yes, Change Status</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Update Service Modal -->
                                <!-- Update Service Modal -->
                                <div id="updateServiceModal" class="modal fade" tabindex="-1" role="dialog"
                                    aria-labelledby="updateServiceModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-fullscreen" role="document"
                                        style="max-width: 70%; width: 70%; height: 85vh;">
                                        <div class="modal-content" style="height: 85vh;">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateServiceModalLabel">Update Service</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form method="POST" action="/manager/services/update">
                                                <div class="modal-body" style="height: calc(85vh - 120px);">
                                                    <!-- Hidden input to store service ID -->
                                                    <input type="hidden" id="updateServiceId" name="serviceId">

                                                    <!-- Service Information -->
                                                    <div class="form-group">
                                                        <label for="updateServiceName">Service Name</label>
                                                        <input type="text" class="form-control" id="updateServiceName"
                                                            name="serviceName" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="updateServiceDescription">Service
                                                            Description</label>
                                                        <textarea class="form-control" id="updateServiceDescription"
                                                            name="serviceDescription" rows="3" required></textarea>
                                                    </div>

                                                    <!-- Content Information -->
                                                    <h5 class="mt-4">Content Information</h5>
                                                    <div class="form-group">
                                                        <label for="updateContentText">Content</label>
                                                        <textarea class="form-control" id="updateContentText"
                                                            name="contentText" rows="3" required></textarea>
                                                    </div>

                                                    <!-- Service Price Information -->
                                                    <h5 class="mt-4">Service Price Information</h5>
                                                    <div class="form-group">
                                                        <label for="updateServicePriceValue">Price Value</label>
                                                        <input type="number" class="form-control"
                                                            id="updateServicePriceValue" name="servicePriceValue"
                                                            step="0.01" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Update
                                                        Service</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>


                                <table class="table table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Service ID</th>
                                            <th>Service Name</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                            <th>More</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="service" items="${serviceList}">
                                            <!-- Main Service Row -->
                                            <tr onclick="toggleDetails(${service.serviceId})">
                                                <td>${service.serviceId}</td>
                                                <td>${service.serviceName}</td>
                                                <td>${service.serviceDescription}</td>
                                                <td style="z-index:100;">
                                                    <c:choose>
                                                        <c:when test="${service.serviceStatus}">
                                                            <button id="status-badge-${service.serviceId}"
                                                                class="badge badge-success"
                                                                onclick="confirmStatusChange(${service.serviceId}, event);"
                                                                style="cursor: pointer; border:none;">Active</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button id="status-badge-${service.serviceId}"
                                                                class="badge badge-danger"
                                                                onclick="confirmStatusChange(${service.serviceId}, event);"
                                                                style="cursor: pointer; border:none;">Inactive</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td style="z-index: 100;">
                                                    <button class="btn btn-info">Details</button>
                                                    <a href="javascript:void(0);" style="z-index: 100;"
                                                        class="btn btn-primary"
                                                        onclick="showUpdateModal(${service.serviceId}, event, '${service.serviceName}', '${service.serviceDescription}', '${service.content.content}', ${service.servicePrice[0].value})">Update</a>

                                                </td>
                                            </tr>
                                            <!-- Details Row for Service -->
                                            <tr id="details-${service.serviceId}" style="display: none;">
                                                <td colspan="5">
                                                    <table class="table table-bordered">
                                                        <!-- Content Information -->
                                                        <thead>
                                                            <tr class="table-info">
                                                                <th colspan="5">Content Information</th>
                                                            </tr>
                                                            <tr>
                                                                <th>Content ID</th>
                                                                <th>Content</th>
                                                                <th>Create Date</th>
                                                                <th>Last Updated Date</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:if test="${service.content != null}">
                                                                <tr>
                                                                    <td>${service.content.id}</td>
                                                                    <td>${service.content.content}</td>
                                                                    <td>${service.content.createDate}</td>
                                                                    <td>${service.content.lastUpdatedDate}</td>
                                                                    <td>
                                                                        <button class="btn btn-info"
                                                                            onclick="window.location.href = '/admin/content/viewDetail/${service.content.id}'">View
                                                                            Details</button>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${service.content == null}">
                                                                <tr>
                                                                    <td colspan="5">No content available</td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                        <thead>
                                                            <tr class="table-info">
                                                                <th colspan="5">Service Price Information</th>
                                                            </tr>
                                                            <tr>
                                                                <th>Price ID</th>
                                                                <th>Value</th>
                                                                <th>Date Apply</th>
                                                                <th>Status</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="price" items="${service.servicePrice}">
                                                                <tr>
                                                                    <td>${price.servicePriceId}</td>
                                                                    <td>${price.value}</td>
                                                                    <td>${price.dateApply}</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${price.servicePriceStatus}">
                                                                                <button
                                                                                    id="price-status-badge-${price.servicePriceId}"
                                                                                    class="badge badge-success"
                                                                                    onclick="changePriceStatus(${price.servicePriceId});"
                                                                                    style="cursor: pointer; border:none;">
                                                                                    Active
                                                                                </button>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <button
                                                                                    id="price-status-badge-${price.servicePriceId}"
                                                                                    class="badge badge-danger"
                                                                                    onclick="changePriceStatus(${price.servicePriceId});"
                                                                                    style="cursor: pointer; border:none;">
                                                                                    Inactive
                                                                                </button>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <button class="btn btn-info"
                                                                            onclick="window.location.href = '/admin/servicePrice/viewDetail/${price.servicePriceId}'">View
                                                                            Details</button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            <c:if test="${empty service.servicePrice}">
                                                                <tr>
                                                                    <td colspan="5">No price information available</td>
                                                                </tr>
                                                            </c:if>
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
                                    <c:if test="${currentPage != 1}">
                                        <form method="get" action="/manager/services">
                                            <button class="btn btn-primary" type="submit">Previous</button>
                                            <input type="hidden" name="page" value="${currentPage - 1}">
                                            <input type="hidden" name="size" value="${size}">
                                            <input type="hidden" name="sortBy" value="${sortBy}">
                                            <input type="hidden" name="sortType" value="${sortType}">
                                        </form>
                                    </c:if>

                                    <!-- Page Indicator -->
                                    <span>Page <strong>${currentPage}</strong> of <strong>${totalPage}</strong></span>

                                    <!-- Next Button -->
                                    <c:if test="${currentPage != totalPage}">
                                        <form method="get" action="/manager/services">
                                            <button class="btn btn-primary" type="submit">Next</button>
                                            <input type="hidden" name="page" value="${currentPage + 1}">
                                            <input type="hidden" name="size" value="${size}">
                                            <input type="hidden" name="sortBy" value="${sortBy}">
                                            <input type="hidden" name="sortType" value="${sortType}">
                                        </form>
                                    </c:if>
                                </div>
                            </main>
                    </div>
                </div>

                <script>
                    var currentDetailsRow = null;
                    function toggleDetails(serviceId) {
                        var detailsRow = document.getElementById("details-" + serviceId);
                        if (currentDetailsRow === detailsRow && detailsRow.style.display === "table-row") {
                            detailsRow.style.display = "none";
                            currentDetailsRow = null;
                        } else {
                            if (currentDetailsRow !== null) {
                                currentDetailsRow.style.display = "none";
                            }
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
                    var selectedServiceId;

                    // This function opens the confirmation modal
                    function confirmStatusChange(serviceId, event) {
                        if (event) {
                            event.stopPropagation(); // Prevent the row click from triggering
                        }

                        // Set the selected service ID for the AJAX call
                        selectedServiceId = serviceId;

                        // Show the confirmation modal
                        $('#confirmStatusChangeModal').modal('show');

                        // Event listener for the "Yes, Change Status" button in the modal
                        $('#confirmChangeStatusBtn').off('click').on('click', function () {
                            $.ajax({
                                url: '/manager/services/changeStatusAjax',
                                type: 'POST',
                                data: {
                                    serviceId: selectedServiceId
                                },
                                success: function (response) {
                                    // Update the badge in the UI
                                    var badge = $('#status-badge-' + selectedServiceId);
                                    var newStatus = badge.hasClass("badge-success") ? "Inactive" : "Active";

                                    if (newStatus === "Active") {
                                        badge.removeClass("badge-danger").addClass("badge-success").text("Active");
                                    } else {
                                        badge.removeClass("badge-success").addClass("badge-danger").text("Inactive");
                                    }

                                    // Hide the confirmation modal
                                    $('#confirmStatusChangeModal').modal('hide');

                                    // Optionally show a success message
                                },
                                error: function (xhr) {
                                    // Optionally handle the error
                                }
                            });
                        });
                    }
                    $(document).ready(function () {
                        // Function to open the Update Service modal and populate it with service data
                        window.showUpdateModal = function (serviceId, event, serviceName, serviceDescription, contentText, servicePriceValue) {
                            if (event) {
                                event.stopPropagation(); // Prevent the row click event from being triggered
                            }

                            // Log for debugging


                            // Set the input fields in the update modal with the values passed to the function
                            $('#updateServiceId').val(serviceId);
                            $('#updateServiceName').val(serviceName);
                            $('#updateServiceDescription').val(serviceDescription);
                            $('#updateContentText').val(contentText);
                            $('#updateServicePriceValue').val(servicePriceValue);

                            // Open the update modal
                            $('#updateServiceModal').modal('show');
                        };
                    });
                    var changePriceId;

                    // Function to change the price status and show the confirmation modal
                    function changePriceStatus(priceId) {
                        changePriceId = priceId;
                        $('#confirmStatusChangeModal').modal("show");

                        // Event listener for the "Yes, Change Status" button in the confirmation modal
                        $('#confirmChangeStatusBtn').one('click', function () {
                            // Trigger the AJAX request after the user confirms
                            $.ajax({
                                url: '/manager/services/changePriceStatusAjax',
                                type: 'POST',
                                data: {
                                    priceId: changePriceId
                                },
                                success: function (response) {
                                    // Update the badge in the UI
                                    var badge = $('#price-status-badge-' + changePriceId);
                                    var newStatus = badge.hasClass('badge-success') ? 'Inactive' : 'Active';

                                    // Toggle the badge between active and inactive states
                                    if (newStatus === 'Active') {
                                        badge.removeClass('badge-danger').addClass('badge-success').text('Active');
                                    } else {
                                        badge.removeClass('badge-success').addClass('badge-danger').text('Inactive');
                                    }

                                    // Hide the confirmation modal
                                    $('#confirmStatusChangeModal').modal('hide');

                                    // Optionally sort the rows to have the active prices on top
                                    sortPriceRows();
                                },
                                error: function (xhr) {
                                    // Optionally show an error message or handle errors appropriately
                                    console.error("Error changing service price status:", xhr.responseText);
                                }
                            });
                        });
                    }
                    // Function to sort the price rows so that active prices are on top
                    function sortPriceRows() {
                        var rows = $('table tbody tr').get();

                        rows.sort(function (a, b) {
                            // Sort by whether the price is active (active rows first)
                            var aStatus = $(a).find('.badge').hasClass('badge-success') ? 1 : 0;
                            var bStatus = $(b).find('.badge').hasClass('badge-success') ? 1 : 0;

                            return bStatus - aStatus; // Sort with active price on top
                        });

                        // Append rows back to the table in the new order
                        $.each(rows, function (index, row) {
                            $('table tbody').append(row);
                        });
                    }

                </script>
                <!-- Bootstrap JS and dependencies -->
                <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            </body>

            </html>
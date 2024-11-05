<%-- Document : serviceManage Created on : Oct 04, 2024, 4:20:00 PM Author : ASUS --%>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

                <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

                <html>

                <head>
                    <title>Admin Dashboard - Services</title>
                    <!-- Bootstrap CSS -->
                    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
                        rel="stylesheet">
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
                            margin: 0 0 30px 10px;
                        }

                        h2 {
                            font-weight: bold;
                            color: #007bff;
                            border-bottom: 2px solid #007bff;
                            padding-bottom: 10px;
                            margin-bottom: 20px;
                        }

                        .modal-body {
                            overflow-y: auto;
                            max-height: calc(100vh - 150px);
                            /* Ensures
            the modal is scrollable when it overflows */
                        }

                        .cke_dialog {
                            z-index: 1051 !important;
                            /* Adjust as needed */
                        }

                        .collapse {
                            transition: height 0.5s ease-in-out;
                            /* Adjust for smoother transition if needed */
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
                            flex-wrap: no-wrap;
                            /* Allow wrapping for smaller screens */
                            gap: 15px;
                            /* Adjust gap between form elements */
                        }

                        .filter-card .form-control,
                        .filter-card select,
                     

                        .filter-card label {
                            margin-bottom: 5px;
                            /* Space between labels and inputs */
                            display: inline-block;
                        }

                        .btn-primary,
                        .btn-success {
                            border-radius: 25px;
                            padding: 10px 20px;
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

                                    <h2 class="mb-4">Service List</h2>
                                    <div class="row">
                                        <div class="filter-card col-md-12">
                                            <form method="get"
                                                action="${pageContext.request.contextPath}/manager/services">
                                                <div class="form-row align-items-center">
                                                    <!-- Sort By -->
                                                    <div class="col-auto">
                                                        <label for="sortBy">Sort by:</label>
                                                        <select name="sortBy" id="sortBy" class="form-control">
                                                            <option value="serviceName" ${sortBy=='serviceName'
                                                                ? 'selected' : '' }>Service Name</option>
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
                                                        <select name="statusFilter" id="statusFilter"
                                                            class="form-control">
                                                            <option value="" ${statusFilter==null ? 'selected' : '' }>
                                                                All
                                                            </option>
                                                            <option value="true" ${statusFilter=='true' ? 'selected'
                                                                : '' }>
                                                                Active</option>
                                                            <option value="false" ${statusFilter=='false' ? 'selected'
                                                                : '' }>Inactive</option>
                                                        </select>
                                                    </div>

                                                    <input type="hidden" name="page" value="${currentPage}">
                                                    <div class="col-auto">
                                                        <button type="submit" class="btn btn-primary"
                                                            style="margin-top: 2rem">Apply</button>


                                                            <button type="button" class="btn btn-success" data-toggle="modal"  style="margin-top: 2rem"
                                                            data-target="#createServiceModal"><i class="fas fa-plus"></i> Create New
                                                            Service</button>
    
                                                    </div>
                                                  
                                                </div>
                                            </form>
                                        </div>


                                    </div>
                                    <!-- Modal -->


                                    <!-- Modal -->
                                    <div id="createServiceModal" class="modal fade" tabindex="-1" role="dialog"
                                        aria-labelledby="createServiceModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document" style="max-width: 70%;">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="createServiceModalLabel">Create New
                                                        Service
                                                    </h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form method="POST"
                                                    action="${pageContext.request.contextPath}/manager/services/create"
                                                    enctype="multipart/form-data">
                                                    <div class="modal-body"
                                                        style="max-height: calc(100vh - 150px); overflow-y: auto;">
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
                                                        <div class="form-group">
                                                            <label for="file">Upload Image</label>
                                                            <input type="file" id="file" name="file"
                                                                class="form-control-file" accept="image/*" required>
                                                        </div>
                                                        <!-- Content Information -->


                                                        <!-- Service Price Information -->
                                                        <h5 class="mt-4">Service Price Information</h5>
                                                        <div class="form-group">
                                                            <label for="servicePriceValue">Price Value</label>
                                                            <input type="number" class="form-control"
                                                                id="servicePriceValue" name="servicePriceValue"
                                                                step="0.01" required>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save
                                                            Service</button>
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
                                                    <button type="button" id="messageCloseButton"
                                                        class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                                    <!-- Update Service Modal -->
                                    <div id="updateServiceModal" class="modal fade" tabindex="-1" role="dialog"
                                        aria-labelledby="updateServiceModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document" style="max-width: 70%;">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="updateServiceModalLabel">Update Service
                                                    </h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form method="POST"
                                                    action="${pageContext.request.contextPath}/manager/services/update"
                                                    enctype="multipart/form-data">
                                                    <div class="modal-body"
                                                        style="max-height: calc(100vh - 150px); overflow-y: auto;">
                                                        <!-- Hidden input to store service ID -->
                                                        <input type="hidden" id="updateServiceId" name="serviceId">

                                                        <!-- Service Information -->
                                                        <div class="form-group">
                                                            <label for="updateServiceName">Service Name</label>
                                                            <input type="text" class="form-control"
                                                                id="updateServiceName" name="serviceName" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="updateServiceDescription">Service
                                                                Description</label>
                                                            <textarea class="form-control" id="updateServiceDescription"
                                                                name="serviceDescription" rows="3" required></textarea>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="file">Upload Image</label>
                                                            <input type="file" accept="image/*" id="file" name="file"
                                                                class="form-control-file">
                                                        </div>

                                                        <!-- Content Information -->


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
                                                                    class="badge badge-success badge-status"
                                                                    style="cursor: pointer; border:none;">Active</button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button id="status-badge-${service.serviceId}"
                                                                    class="badge badge-danger badge-status"
                                                                    style="cursor: pointer; border:none;">Inactive</button>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td style="z-index: 100;" class="d-flex flex-column g-2">
                                                        <a class="btn btn-info mb-2"" href="
                                                            ${pageContext.request.contextPath}/manager/service/detail/${service.serviceId}"
                                                            onclick="event.stopPropagation()">Detail</a>



                                                        <!-- Collapsible Section containing the Update and Activate/Deactivate buttons -->
                                                        <button class=" btn btn-outline-warning"
                                                            id="action-btn-${service.serviceId}" type="button"
                                                            onclick="toggleButtonList(${service.serviceId}, event)">
                                                            Actions
                                                        </button>

                                                        <!-- Section containing the Update and Activate/Deactivate buttons -->
                                                        <div id="buttonList-${service.serviceId}"
                                                            style="display: none; flex-direction: column; gap: 10px; margin-top: 10px;">
                                                            <button class="btn btn-primary mb-2"
                                                                onclick="showUpdateModal(${service.serviceId}, event, '${service.serviceName}', '${service.serviceDescription}', ${service.servicePrice[0].value})">Update</button>
                                                            <c:choose>
                                                                <c:when test="${service.serviceStatus}">
                                                                    <button class="btn btn-danger"
                                                                        id="deactivate-btn-${service.serviceId}"
                                                                        onclick="confirmStatusChange(${service.serviceId}, event)">Deactivate</button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button class="btn btn-success"
                                                                        id="deactivate-btn-${service.serviceId}"
                                                                        onclick="confirmStatusChange(${service.serviceId}, event)">Activate</button>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </div>
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
                                                                    <th>Create Date</th>
                                                                    <th>Last Updated Date</th>
                                                                    <th></th>
                                                                    <!-- Empty placeholder to make 5 columns -->
                                                                    <th>Actions</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:if test="${service.content != null}">
                                                                    <tr>
                                                                        <td>${service.content.id}</td>
                                                                        <td>${service.content.createDate}</td>
                                                                        <td>${service.content.lastUpdatedDate}</td>
                                                                        <td>
                                                                            <c:if
                                                                                test="${empty service.content.content}">
                                                                                <i class="fa fa-exclamation-triangle"
                                                                                    style="color: red;"></i>Please
                                                                                update Content
                                                                            </c:if>
                                                                        </td>
                                                                        <!-- Empty placeholder for alignment -->
                                                                        <td>
                                                                            <button type="button" class="btn btn-info"
                                                                                data-toggle="modal"
                                                                                data-target="#serviceContentModal"
                                                                                data-service="<c:out value='${service.serviceId}'/>"
                                                                                data-content="<c:out value='${service.content.content}' escapeXml='true' />"
                                                                                onclick="showServiceContent(this)">
                                                                                View Content
                                                                            </button>
                                                                            <button class="btn btn-success"
                                                                                onclick="window.location.href = '${pageContext.request.contextPath}/manager/serviceContent/updateDetail/${service.serviceId}'">
                                                                                Update Content
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                                <c:if test="${service.content == null}">
                                                                    <tr>
                                                                        <td colspan="5">No content available</td>
                                                                    </tr>
                                                                </c:if>
                                                            </tbody>

                                                            <!-- Service Price Information -->
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
                                                                                <c:when
                                                                                    test="${price.servicePriceStatus}">
                                                                                    <button
                                                                                        id="price-status-badge-${price.servicePriceId}"
                                                                                        class="badge badge-success badge-status"
                                                                                        style="cursor: pointer; border:none;">
                                                                                        Active
                                                                                    </button>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <button
                                                                                        id="price-status-badge-${price.servicePriceId}"
                                                                                        class="badge badge-danger badge-status"
                                                                                        style="cursor: pointer; border:none;">
                                                                                        Inactive
                                                                                    </button>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                <c:if test="${empty service.servicePrice}">
                                                                    <tr>
                                                                        <td colspan="5">No price information available
                                                                        </td>
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
                                            <form method="get"
                                                action="${pageContext.request.contextPath}/manager/services">
                                                <button class="btn btn-primary" type="submit">Previous</button>
                                                <input type="hidden" name="page" value="${currentPage - 1}">
                                                <input type="hidden" name="size" value="${size}">
                                                <input type="hidden" name="sortBy" value="${sortBy}">
                                                <input type="hidden" name="sortType" value="${sortType}">
                                            </form>
                                        </c:if>

                                        <!-- Page Indicator -->
                                        <span>Page <strong>${currentPage}</strong> of
                                            <strong>${totalPage}</strong></span>

                                        <!-- Next Button -->
                                        <c:if test="${currentPage != totalPage}">
                                            <form method="get"
                                                action="${pageContext.request.contextPath}/manager/services">
                                                <button class="btn btn-primary" type="submit">Next</button>
                                                <input type="hidden" name="page" value="${currentPage + 1}">
                                                <input type="hidden" name="size" value="${size}">
                                                <input type="hidden" name="sortBy" value="${sortBy}">
                                                <input type="hidden" name="sortType" value="${sortType}">
                                            </form>
                                        </c:if>
                                    </div>
                                </main>
                                <div class="modal fade" id="serviceContentModal" tabindex="-1"
                                    aria-labelledby="serviceContentModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" style="max-width: 85vw;">
                                        <!-- Use viewport width to make the modal nearly full-screen -->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="serviceContentModalLabel">Service Content
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body" style="max-height: 85vh; overflow-y: auto;">
                                                <!-- Make the modal higher and enable scrolling -->
                                                <p id="modalServiceContent">
                                                    <!-- Content will be loaded dynamically here -->
                                                </p>
                                            </div>
                                            <div class="modal-footer">
                                                <a id="updateContentBtn" type="button" class="btn btn-primary">Update
                                                    Content</a>
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div style="height:6vh;"></div>
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
                                    url: '${pageContext.request.contextPath}/manager/services/changeStatusAjax',
                                    type: 'POST',
                                    data: {
                                        serviceId: selectedServiceId
                                    },
                                    success: function (response) {
                                        // Update the badge in the UI
                                        var badge = $('#status-badge-' + selectedServiceId);
                                        var newStatus = badge.hasClass("badge-success") ? "Inactive" : "Active";

                                        if (newStatus === 'Active') {
                                            badge.removeClass('badge-danger').addClass('badge-success').text('Active');
                                            // Change button to outline-danger and text to 'Deactivate'
                                            $('#deactivate-btn-' + serviceId).removeClass('btn-success').addClass('btn-danger').text('Deactivate');
                                        } else {
                                            badge.removeClass('badge-success').addClass('badge-danger').text('Inactive');
                                            // Change button to outline-success and text to 'Activate'
                                            $('#deactivate-btn-' + serviceId).removeClass('btn-danger').addClass('btn-success').text('Activate');
                                        }

                                        // Hide the confirmation modal
                                        $('#confirmStatusChangeModal').modal('hide');

                                        // Optionally show a success message
                                    },
                                    error: function (xhr) {
                                        var errorMessage = xhr.responseText || "An error occurred while changing the status";
                                        console.log(errorMessage)
                                        // Optionally handle the error
                                        $('#confirmStatusChangeModal').modal('hide');
                                        $('#messageModalBody').html(
                                            '<div class="alert alert-danger" role="alert"> ' + errorMessage + ' </div>');
                                        $('#messageModal').modal('show');
                                        $('#messageCloseButton').off('click').on('click', function () {
                                            window.location.href = "${pageContext.request.contextPath}/manager/serviceContent/updateDetail/" + selectedServiceId;
                                        })

                                    }
                                });
                            });
                        }
                        $(document).ready(function () {
                            // Function to open the Update Service modal and populate it with service data
                            window.showUpdateModal = function (serviceId, event, serviceName, serviceDescription, servicePriceValue) {
                                if (event) {
                                    event.stopPropagation(); // Prevent the row click event from being triggered
                                }

                                // Log for debugging

                                // Set the input fields in the update modal with the values passed to the function
                                $('#updateServiceId').val(serviceId);
                                $('#updateServiceName').val(serviceName);
                                $('#updateServiceDescription').val(serviceDescription);

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
                                    url: '${pageContext.request.contextPath}/manager/services/changePriceStatusAjax',
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

                        function showServiceContent(button) {
                            // Get content from the data-content attribute
                            var content = button.getAttribute('data-content');
                            var serviceId = button.getAttribute('data-service');

                            // Update modal content
                            document.getElementById('modalServiceContent').innerHTML = content;

                            // Correct the href for the "Update Content" button
                            document.getElementById('updateContentBtn').href = "${pageContext.request.contextPath}/manager/serviceContent/updateDetail/" + serviceId;
                        }
                        function toggleButtonList(serviceId, event) {
                            // Prevent the row click event from firing
                            event.stopPropagation();

                            var buttonList = document.getElementById('buttonList-' + serviceId);
                            var displayStyle = buttonList.style.display;

                            // Toggle between showing and hiding the buttons
                            if (displayStyle === 'none' || displayStyle === '') {
                                buttonList.style.display = 'flex';  // Show the buttons
                            } else {
                                buttonList.style.display = 'none';  // Hide the buttons
                            }
                        }
                    </script>

                    <!-- Load Bootstrap -->
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
                    <!-- Load CKEditor -->
                    <script src="https://cdn.ckeditor.com/4.16.2/standard-all/ckeditor.js"></script>
                </body>

                </html>
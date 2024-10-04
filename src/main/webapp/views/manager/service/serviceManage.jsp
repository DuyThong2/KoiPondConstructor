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
                    <div class="filter-card">
                        <form method="get" action="/manager/services">
                            <div class="form-row align-items-center">
                                <!-- Sort By -->
                                <div class="col-auto">
                                    <label for="sortBy">Sort by:</label>
                                    <select name="sortBy" id="sortBy" class="form-control">
                                        <option value="serviceName" ${sortBy=='serviceName' ? 'selected' : ''}>Service Name</option>
                                        <option value="serviceId" ${sortBy=='serviceId' ? 'selected' : ''}>Service ID</option>
                                    </select>
                                </div>

                                <!-- Sort Direction -->
                                <div class="col-auto">
                                    <label for="sortType">Type:</label>
                                    <select name="sortType" id="sortType" class="form-control">
                                        <option value="asc" ${sortType=='asc' ? 'selected' : ''}>Ascending</option>
                                        <option value="desc" ${sortType=='desc' ? 'selected' : ''}>Descending</option>
                                    </select>
                                </div>

                                <!-- Filter By Status -->
                                <div class="col-auto">
                                    <label for="statusFilter">Status:</label>
                                    <select name="statusFilter" id="statusFilter" class="form-control">
                                        <option value="" ${statusFilter==null ? 'selected' : ''}>All</option>
                                        <option value="true" ${statusFilter=='true' ? 'selected' : ''}>Active</option>
                                        <option value="false" ${statusFilter=='false' ? 'selected' : ''}>Inactive</option>
                                    </select>
                                </div>

                                <input type="hidden" name="page" value="${currentPage}">
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary" style="margin-top: 2rem">Apply</button>
                                </div>
                            </div>
                        </form>
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
                                    <td>
                                        <c:choose>
                                            <c:when test="${service.serviceStatus}">
                                                <span class="badge badge-success">Active</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-danger">Inactive</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button class="btn btn-info">Details</button>
                                        <a href="/admin/services/edit/${service.serviceId}" class="btn btn-warning">Edit</a>
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
                                                                   onclick="window.location.href = '/admin/content/viewDetail/${service.content.id}'">View Details</button>
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
                                                                 <span class="badge badge-success">Active</span>
                                                             </c:when>
                                                             <c:otherwise>
                                                                 <span class="badge badge-danger">Inactive</span>
                                                             </c:otherwise>
                                                         </c:choose>
                                                     </td>
                                                     <td>
                                                         <button class="btn btn-info"
                                                                 onclick="window.location.href = '/admin/servicePrice/viewDetail/${price.servicePriceId}'">View Details</button>
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
        </script>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

</html>

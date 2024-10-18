<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <title>Contract Management</title>
    <%@include file="../cssTemplate.jsp" %>

</head>
<%@include file="../homePageNavbar.jsp" %>
<%@include file="../spacing.jsp" %>

<body>

<div class="container">
    <div class="row">
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
                                <option value="serviceDetailStatus"
                                ${sortBy=='serviceDetailStatus' ? 'selected' : ''
                                        }>
                                    Service Detail Status
                                </option>
                                <option value="price" ${sortBy=='price' ? 'selected'
                                        : '' }>Price
                                </option>
                                <option value="dateRegister" ${sortBy=='dateRegister'
                                        ? 'selected' : '' }>
                                    Date Registered
                                </option>
                                <option value="rating" ${sortBy=='rating' ? 'selected'
                                        : '' }>
                                    Rating</option>
                            </select>
                        </div>

                        <!-- Sort Direction -->
                        <div class="col-auto">
                            <label for="sortType">Type:</label>
                            <select name="sortType" id="sortType" class="form-control">
                                <option value="asc" ${sortType=='asc' ? 'selected' : ''
                                        }>
                                    Ascending</option>
                                <option value="desc" ${sortType=='desc' ? 'selected'
                                        : '' }>
                                    Descending</option>
                            </select>
                        </div>

                        <!-- Filter By Status -->
                        <div class="col-auto">
                            <label for="statusFilter">Status:</label>
                            <select name="statusFilter" id="statusFilter"
                                    class="form-control">
                                <option value="" ${statusFilter==null ? 'selected' : ''
                                        }>All
                                </option>
                                <option value="1" ${statusFilter==1 ? 'selected' : ''
                                        }>Pending
                                </option>
                                <option value="2" ${statusFilter==2 ? 'selected' : ''
                                        }>In
                                    Progress</option>
                                <option value="3" ${statusFilter==3 ? 'selected' : ''
                                        }>Completed
                                </option>
                                <option value="4" ${statusFilter==4 ? 'selected' : ''
                                        }>Cancelled
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
                        <td>${service.dateRegister}</td>

                        <td>
                            <c:choose>
                                <c:when
                                        test="${service.serviceDetailStatus == 1}">
                                                <span
                                                        class="badge badge-secondary">Pending</span>
                                </c:when>
                                <c:when
                                        test="${service.serviceDetailStatus == 2}">
                                                <span
                                                        class="badge badge-primary">Processing</span>
                                </c:when>
                                <c:when
                                        test="${service.serviceDetailStatus == 3}">
                                                <span
                                                        class="badge badge-success">Completed</span>
                                </c:when>
                                <c:when
                                        test="${service.serviceDetailStatus == 4}">
                                                <span
                                                        class="badge badge-warning">Cancelled</span>
                                </c:when>
                                <c:otherwise>
                                                <span class="badge badge-light">Unknown
                                                    Status</span>
                                </c:otherwise>
                            </c:choose>

                        </td>
                        <td>
                            <button class="btn btn-info">Details</button>
                        </td>
                    </tr>

                    <!-- Collapsible Row for Customer and Staff Information -->
                    <tr id="details-${service.id}" style="display: none;">
                        <td colspan="6">
                            <table class="table table-bordered">
                                <!-- Customer Information -->
                                <thead>
                                <tr class="table-info">
                                    <th colspan="5">Customer Information
                                    </th>
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
                                                    onclick="window.location.href = '${pageContext.request.contextPath}/customer/manageCustomer/detail/${service.customer.id}'">
                                                Customer Details
                                            </button>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${empty service.customer}">
                                    <tr>
                                        <td colspan="5"
                                            class="text-center">No
                                            customer information
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
                                        <td>${service.staff.department}
                                        </td>

                                        <td>

                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${empty service.staff}">
                                    <tr>
                                        <td colspan="5" class="text-center">
                                            <a href="${pageContext.request.contextPath}/customer/serviceDetails/assign/${service.id}"
                                               class="btn btn-primary">Assign Staff</a>
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty serviceDetailsList}">
                    <tr>
                        <td colspan="6" class="text-center">No services available
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <!-- Pagination Controls -->

            <div class="d-flex  justify-content-between align-items-center mt-4">
                <c:if test="${currentPage != 1}">

                    <form method="get" action="${pageContext.request.contextPath}/customer/serviceDetails/">
                        <button class="btn btn-primary" type="submit"><
                        </button>
                        <input type="hidden" name="page" value="${currentPage - 1}">
                        <input type="hidden" name="size" value="${size}">
                        <input type="hidden" name="sortBy" value="${sortBy}">
                        <input type="hidden" name="sortType" value="${sortType}">
                        <c:if test="${statusFilter != null}">
                            <input type="hidden" name="statusFilter"
                                   value="${statusFilter}">
                        </c:if>
                    </form>

                </c:if>


                <span>Page <strong>${currentPage}</strong> of
                            <strong>${totalPage}</strong></span>


                <c:if test="${currentPage != totalPage}">

                    <form method="get" action="${pageContext.request.contextPath}/customer/serviceDetails/">
                        <button class="btn btn-primary" type="submit">></button>
                        <input type="hidden" name="page" value="${currentPage + 1}">
                        <input type="hidden" name="size" value="${size}">
                        <input type="hidden" name="sortBy" value="${sortBy}">
                        <input type="hidden" name="sortType" value="${sortType}">
                        <c:if test="${statusFilter != null}">
                            <input type="hidden" name="statusFilter"
                                   value="${statusFilter}">
                        </c:if>
                    </form>

                </c:if>
            </div>
        </main>
    </div>
</div>
</body>
<script>
    var currentDetailsRow = null;

    function toggleDetails(serviceId) {
        var detailsRow = document.getElementById("details-" + serviceId);

        if (currentDetailsRow === detailsRow && detailsRow.style.display === "table-row") {
            detailsRow.style.display = "none";
            i
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

<%@include file="../spacing.jsp" %>
<%@include file="../footer.jsp" %>
<%@include file="../scriptTemplate.jsp" %>

</html>
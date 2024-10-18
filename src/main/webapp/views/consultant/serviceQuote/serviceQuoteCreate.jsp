<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Service Quote</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .quote-info {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .quote-info h4 {
            margin-bottom: 15px;
        }
        .customer-avatar {
            max-width: 150px;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        .customer-info {
            text-align: center;
        }
        .modal-body {
            max-height: 400px;
            overflow-y: auto;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <!-- Left Column for Customer Information -->
        <div class="col-md-4">
            <div class="quote-info">
                <h4>Customer Information</h4>
                <!-- Customer Avatar -->
                <div class="customer-info">
                    <img src="" alt="Customer Avatar" class="customer-avatar img-fluid"/>
                    <p><strong>${customer.name}</strong></p>
                </div>
                <!-- Customer Information -->
                <p><strong>Phone:</strong> ${customer.phone}</p>
                <p><strong>Email:</strong> ${customer.email}</p>
                <p><strong>Content:</strong> ${consultant.consultantContent}</p>
            </div>
        </div>

        <!-- Right Column for Contract Creation Form -->
        <div class="col-md-8">
            <h2 class="mb-4">Create Service Quote</h2>

            <!-- Bind the form to the "contract" object -->
            <form:form action="/consultant/serviceQuote/save" modelAttribute="newServiceQuote" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true">

                <form:hidden path="consultant.consultantId" value="${consultant.consultantId}"/>
                <form:hidden path="customer.id" value="${customer.id}" />
                <form:hidden path="staff.id" value="${staff.id}" />

                <!-- Hidden input to store selected service IDs -->
                <input type="hidden" id="selectedServiceIds" name="serviceIds" />

                <!-- Quotes Name -->
                <div class="form-group">
                    <label for="serviceQuotesName">Quote Name:</label>
                    <form:input path="serviceQuotesName" id="serviceQuotesName" class="form-control" />
                </div>

                <!-- Quotes Content -->
                <div class="form-group">
                    <label for="serviceQuotesContent">Quote Content:</label>
                    <form:input path="serviceQuotesContent" id="serviceQuotesContent" class="form-control" />
                </div>

                <!-- Area -->
                <div class="form-group">
                    <label for="serviceQuotesArea">Area (m²):</label>
                    <form:input path="serviceQuotesArea" id="serviceQuotesArea" step="0.01" class="form-control" />
                </div>

                <!-- Current Services -->
                <div class="services-container">
                    <label>Current Services:</label>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Service Name</th>
                            </tr>
                        </thead>
                        <tbody id="currentServicesList">
                            <c:choose>
                                <c:when test="${empty newServiceQuote.service}">
                                    <tr>
                                        <td>No Service Now</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="service" items="${newServiceQuote.service}">
                                        <tr>
                                            <td>${service.serviceName}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

                <!-- Button to Open Service Selection Modal -->
                <div class="form-group">
                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#serviceModal">Add Service</button>
                </div>

                <!-- Total Price (Read-Only, auto-calculated) -->
                <div class="form-group">
                    <label for="serviceQuotesTotalPrice">Total Price:</label>
                    <form:input path="serviceQuotesTotalPrice" id="serviceQuotesTotalPrice" class="form-control" readonly="readonly" />
                </div>

                <!-- Button to Auto Calculate Costs -->
                <div class="form-group">
                    <button type="button" class="btn btn-warning" onclick="updateCostsBasedOnParcel()">Auto Adjust Costs</button>
                </div>

                <button type="submit" class="btn btn-primary">Create Contract</button>
            </form:form>
        </div>
    </div>

    <!-- Modal for Service Selection -->
    <div class="modal fade" id="serviceModal" tabindex="-1" role="dialog" aria-labelledby="serviceModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="serviceModalLabel">Select Services</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Select</th>
                                <th>Service Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="service" items="${services}">
                                <tr>
                                    <td>
                                        <input type="checkbox" value="${service.serviceId}" id="service-${service.serviceId}" onchange="updateServiceList(this, '${service.serviceName}', '${service.serviceId}')" />
                                    </td>
                                    <td>
                                        <label for="service-${service.serviceId}">${service.serviceName}</label>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript for Adding Services -->
    <script>
        function updateServiceList(checkbox, serviceName, serviceId) {
            const servicesList = document.getElementById('currentServicesList');
            const selectedServiceIds = document.getElementById('selectedServiceIds');

            // Split the existing IDs into an array
            let currentServiceIds = selectedServiceIds.value ? selectedServiceIds.value.split(',') : [];

            if (checkbox.checked) {
                // Create a new table row for the selected service
                const newRow = document.createElement('tr');
                const newCell = document.createElement('td');
                newCell.textContent = serviceName;
                newRow.appendChild(newCell);
                servicesList.appendChild(newRow);

                // Add the service ID to the array and update the hidden input
                currentServiceIds.push(serviceId);
            } else {
                // Remove the service if it is unchecked
                const rows = servicesList.getElementsByTagName('tr');
                for (let i = 0; i < rows.length; i++) {
                    if (rows[i].textContent === serviceName) {
                        servicesList.removeChild(rows[i]);
                        break;
                    }
                }
                // Remove the service ID from the array
                currentServiceIds = currentServiceIds.filter(id => id !== serviceId);
            }
            // Update the hidden input value with the selected service IDs
            selectedServiceIds.value = currentServiceIds.join(',');
        }
    </script>

</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
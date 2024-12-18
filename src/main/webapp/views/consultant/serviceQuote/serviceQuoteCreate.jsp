<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Create Service Quote</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
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
            input:invalid {
                border-color: #dc3545; /* Bootstrap danger color for invalid fields */
            }

            input:valid {
                border-color: #28a745; /* Bootstrap success color for valid fields */
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <jsp:include page="../consultantNav.jsp"/>
            <div class="row">
                <!-- Left Column for Customer Information -->
                <div class="col-md-4">
                    <div class="quote-info">
                        <h4>Customer Information</h4>
                        <!-- Customer Avatar -->
                        <div class="customer-info">
                            <c:choose>
                                <c:when test="${customer.imgURL != null}">
                                    <img class="customer-avatar img-fluid"
                                         src="${customer.getShowingImg(customer.imgURL)}" alt />
                                </c:when>
                                <c:otherwise>
                                    <img class="customer-avatar img-fluid"
                                         src="${pageContext.request.contextPath}/assets/imgs/logo/final_resized_colored_logo_image.png" alt />
                                </c:otherwise>
                            </c:choose>
                            <p><strong>${customer.name}</strong></p>
                        </div>
                        <!-- Customer Information -->
                        <p><strong>Phone:</strong> ${customer.phone}</p>
                        <p><strong>Email:</strong> ${customer.email}</p>
                        <p><strong>Content:</strong> ${consultant.consultantContent}</p>
                        <p><strong>Point:</strong> ${totalPoint}</p>
                    </div>
                </div>

                <!-- Right Column for Contract Creation Form -->
                <div class="col-md-8">
                    <h2 class="mb-4">Create Service Quote</h2>

                    <!-- Bind the form to the "contract" object -->
                    <form:form action="${pageContext.request.contextPath}/consultant/serviceQuote/save" modelAttribute="newServiceQuote" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true">

                        <form:hidden path="consultant.consultantId" value="${consultant.consultantId}"/>
                        <form:hidden path="customer.id" value="${customer.id}" />
                        <form:hidden path="staff.id" value="${staff.id}" />

                        <!-- Hidden input to store selected service IDs -->
                        <input type="hidden" id="selectedServiceIds" name="serviceIds" />

                        <!-- Quotes Name -->
                        <div class="form-group">
                            <label for="serviceQuotesName">Quote Name:</label>
                            <form:input path="serviceQuotesName" id="serviceQuotesName" class="form-control" required="true" minlength="3" maxlength="50" />
                            <div class="invalid-feedback">Quote name must be between 3 and 50 characters.</div>
                        </div>

                        <!-- Quotes Content -->
                        <div class="form-group">
                            <label for="serviceQuotesContent">Quote Content:</label>
                            <form:input path="serviceQuotesContent" id="serviceQuotesContent" class="form-control" required="true" />
                            <div class="invalid-feedback">Quote content is required.</div>
                        </div>

                        <!-- Area -->
                        <div class="form-group">
                            <label for="serviceQuotesArea">Area (in square meters):</label>
                            <form:input path="serviceQuotesArea" id="serviceQuotesArea" class="form-control" type="number" step="0.01"  required="true" />
                            <form:errors path="serviceQuotesArea" cssClass="text-danger" />
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
                            <form:input path="serviceQuotesTotalPrice" id="serviceQuotesTotalPrice" class="form-control" readonly="true" />
                        </div>

                        <!-- Checkbox for 'isPayAfter' -->
                        <div class="form-group form-check">
                            <form:checkbox path="isPayAfter" id="isPayAfter" class="form-check-input" />
                            <label for="isPayAfter" class="form-check-label">Pay All</label>
                        </div>

                        <!-- Hidden input to store points used -->
                        <input type="hidden" id="pointsUsed" name="pointsUsed" value="0" />

                        <div class="form-group">
                            <input type="checkbox" id="subtractPoints" onchange="updateCostsBasedOnParcel()" />
                            <label for="subtractPoints">Use Customer Points (${totalPoint})</label>
                        </div>

                        <!-- Display Points Used and Remaining Points -->
                        <p><strong>Points Used:</strong> <span id="pointsUsedDisplay">0</span></p>
                        <p><strong>Remaining Points:</strong> <span id="remainingPoints">${totalPoint}</span></p>

                        <!-- Button to Auto Calculate Costs -->
                        <div class="form-group">
                            <button type="button" class="btn btn-warning" onclick="updateCostsBasedOnParcel()">Auto Adjust Costs</button>
                        </div>
                        <button type="submit" class="btn btn-primary">Create Service Quote</button>
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
                                        <th>Service Name</th>
                                        <th>Service Price Per Square</th>
                                        <th>Select</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="service" items="${services}">
                                        <tr>                                           
                                            <td>
                                                <label for="service-${service.serviceId}">${service.serviceName}</label>
                                            </td>
                                            <td>
                                                <c:set var="priceDisplayed" value="false" />
                                                <c:forEach var="servicePrice" items="${service.servicePrice}">
                                                    <c:if test="${service.serviceId == servicePrice.service.serviceId and priceDisplayed == false}"> 
                                                        <label id="service-price-${service.serviceId}">${servicePrice.value}</label>
                                                        <c:set var="priceValue" value="${servicePrice.value}" />
                                                        <c:set var="priceDisplayed" value="true" />
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <input type="checkbox" value="${service.serviceId}" id="service-${service.serviceId}" onchange="updateServiceList(this, '${service.serviceName}', '${service.serviceId}', '${priceValue}')" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-warning" onclick="updateCostsBasedOnParcel()">Auto Adjust Costs</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- JavaScript for Adding Services -->
            <script>
                function updateServiceList(checkbox, serviceName, serviceId, servicePricePerSquare) {
                    const servicesList = document.getElementById('currentServicesList');
                    const selectedServiceIds = document.getElementById('selectedServiceIds');

                    // Split the existing IDs into an array
                    let currentServiceIds = selectedServiceIds.value ? selectedServiceIds.value.split(',') : [];

                    if (checkbox.checked) {
                        // Create a new table row for the selected service
                        const newRow = document.createElement('tr');
                        newRow.setAttribute('data-service-id', serviceId); // Store the service ID as a data attribute
                        newRow.setAttribute('data-price', servicePricePerSquare); // Store the service price as a data attribute

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
                            if (rows[i].getAttribute('data-service-id') === serviceId) {
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

                function updateCostsBasedOnParcel() {
                    const area = parseFloat(document.getElementById('serviceQuotesArea').value); // Get the area input
                    const servicesList = document.getElementById('currentServicesList'); // Get the selected services list
                    const rows = servicesList.getElementsByTagName('tr'); // Rows for selected services
                    let totalCost = 0; // Initialize total cost

                    if (isNaN(area) || area <= 0) {
                        alert('Please enter a valid area');
                        return;
                    }

                    // Loop through each selected service and calculate the cost
                    for (let i = 0; i < rows.length; i++) {
                        const pricePerSquare = parseFloat(rows[i].getAttribute('data-price')); // Assuming you store price as a data attribute on the row

                        if (!isNaN(pricePerSquare)) {
                            totalCost += pricePerSquare * area; // Calculate and sum the cost for each service
                        } else {
                            console.error(`Invalid price for service`);
                        }
                    }

                    // Subtract the customer's points if the checkbox is checked
                    const subtractPointsCheckbox = document.getElementById('subtractPoints');
                    const customerPoints = parseInt("${totalPoint}", 10); // Ensure points are treated as an integer
                    let pointsUsed = 0;
                    let remainingPoints = customerPoints;

                    if (subtractPointsCheckbox.checked && !isNaN(customerPoints)) {
                        // If total cost is less than or equal to available points, use total cost as points
                        if (totalCost <= customerPoints) {
                            pointsUsed = Math.floor(totalCost); // Use integer value for points
                        } else {
                            // Otherwise, use all available points
                            pointsUsed = customerPoints;
                        }
                        remainingPoints = customerPoints - pointsUsed; // Calculate remaining points
                    }

                    // Update the hidden input with the points used (as integer)
                    document.getElementById('pointsUsed').value = pointsUsed;

                    // Update the points used and remaining points display
                    document.getElementById('pointsUsedDisplay').textContent = pointsUsed;
                    document.getElementById('remainingPoints').textContent = remainingPoints;

                    // Update the total price field with the calculated value
                    document.getElementById('serviceQuotesTotalPrice').value = totalCost.toFixed(2); // Keep the total price intact
                    (function () {
                        'use strict';
                        window.addEventListener('load', function () {
                            var forms = document.getElementsByClassName('needs-validation');
                            var validation = Array.prototype.filter.call(forms, function (form) {
                                form.addEventListener('submit', function (event) {
                                    if (form.checkValidity() === false) {
                                        event.preventDefault();
                                        event.stopPropagation();
                                    }
                                    form.classList.add('was-validated');
                                }, false);
                            });
                        }, false);
                    })();
                }
                document.addEventListener("DOMContentLoaded", function () {
                    const form = document.querySelector('form');
                    const serviceQuotesArea = document.getElementById('serviceQuotesArea');

                    form.addEventListener('submit', function (event) {
                        // If the field is empty or invalid, set it to 0.0
                        if (!serviceQuotesArea.value || isNaN(parseFloat(serviceQuotesArea.value))) {
                            serviceQuotesArea.value = 0.0;
                        }
                    });
                });
                
                document.querySelectorAll('input[type="number"]').forEach(input => {
                    input.addEventListener('input', function () {
                        // Allow only digits and one decimal point
                        if (/[^0-9.]/.test(this.value)) {
                            this.value = "0";  // Reset to 0 if invalid characters are found
                            return;
                        }

                        // Split input on '.' to manage decimal points
                        const parts = this.value.split('.');

                        // If more than one '.' or invalid numeric parts, reset to 0
                        if (parts.length > 2 || !/^\d*$/.test(parts[0]) || (parts[1] && !/^\d*$/.test(parts[1]))) {
                            this.value = "0";
                            return;
                        }

                        // If the value is less than or equal to 0, reset to 0
                        if (parseFloat(this.value) <= 0) {
                            this.value = "0";
                            return;
                        }
                    });

                    input.addEventListener('blur', function () {
                        // If input is empty, NaN, or less than or equal to 0 after blur, reset to 0
                        if (this.value === "" || parseFloat(this.value) <= 0 || isNaN(parseFloat(this.value))) {
                            this.value = "0";
                        }
                    });
                });

            </script>
            <%@include file="../../popup.jsp"%>
        </div>

        <!-- Bootstrap JS and dependencies -->

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>

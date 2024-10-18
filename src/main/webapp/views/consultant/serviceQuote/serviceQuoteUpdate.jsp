<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Update Service Quote</title>
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
            .modal-dialog.modal-lg {
                max-width: 90%;
            }
            .table th, .table td {
                vertical-align: middle;
                padding: 8px;
            }
            .table thead th {
                text-align: center;
                background-color: #f8f9fa;
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <div class="row">
                <!-- Right Column for Service Quote Update Form -->
                <div class="col-md-12">
                    <h2 class="mb-4">Update Service Quote</h2>

                    <form:form action="${pageContext.request.contextPath}/consultant/serviceQuote/saveUpdate" modelAttribute="serviceQuote" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true" onsubmit="return validateForm()">
                        <form:hidden path="serviceQuotesId" value="${serviceQuote.serviceQuotesId}"/>
                        <form:hidden path="consultant.consultantId" value="${consultant.consultantId}"/>
                        <form:hidden path="customer.id" value="${customer.id}" />
                        <form:hidden path="staff.id" value="${staff.id}" />

                        <!-- Quote Name -->
                        <div class="form-group">
                            <label for="serviceQuotesName">Quote Name:</label>
                            <form:input path="serviceQuotesName" id="serviceQuotesName" class="form-control" value="${serviceQuote.serviceQuotesName}" />
                        </div>

                        <!-- Quote Content -->
                        <div class="form-group">
                            <label for="serviceQuotesContent">Quote Content:</label>
                            <form:input path="serviceQuotesContent" id="serviceQuotesContent" class="form-control" value="${serviceQuote.serviceQuotesContent}" />
                        </div>

                        <!-- Area -->
                        <div class="form-group">
                            <label for="serviceQuotesArea">Area (m²):</label>
                            <form:input path="serviceQuotesArea" id="serviceQuotesArea" step="0.01" class="form-control" value="${serviceQuote.serviceQuotesArea}" />
                        </div>

                        <!-- Service Selection -->
                        <div class="form-group">
                            <label for="service">Select Service:</label>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#serviceModal">
                                Choose Service
                            </button>
                            <input type="hidden" id="selectedServiceId" name="service.serviceId" value="${serviceQuote.service.serviceId}" required />
                            <input type="text" id="selectedServiceName" name="serviceName" value="${serviceQuote.service.serviceName}" readonly class="form-control" />
                        </div>

                        <!-- Total Price (Read-Only, auto-calculated) -->
                        <div class="form-group">
                            <label for="serviceQuotesTotalPrice">Total Price:</label>
                            <form:input path="serviceQuotesTotalPrice" id="serviceQuotesTotalPrice" class="form-control" readonly="readonly" value="${serviceQuote.serviceQuotesTotalPrice}" />
                        </div>

                        <button type="submit" class="btn btn-primary">Update Quote</button>
                    </form:form>
                </div>
            </div>

            <!-- Service Selection Modal -->
            <!-- Service Selection Modal -->
            <div class="modal fade" id="serviceModal" tabindex="-1" role="dialog" aria-labelledby="serviceModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="serviceModalLabel">Select Service</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Table to display all services -->
                            <table class="table table-bordered table-striped">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Service Name</th>
                                        <th>Description</th>
                                        <th>Image</th>
                                        <th>Status</th>
                                        <th>Price per Square Meter</th>
                                        <th>Select</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="service" items="${serviceList}">
                                        <c:if test="${service.serviceStatus}">
                                            <tr>
                                                <td>${service.serviceName}</td>
                                                <td>${service.serviceDescription}</td>
                                                <td class="text-center">
                                                    <img src="${service.serviceImgUrl}" alt="${service.serviceName}" style="max-width: 100px;" class="img-fluid"/>
                                                </td>
                                                <td class="text-center">Active</td>
                                                <td>
                                                    <c:forEach var="price" items="${service.servicePrice}">
                                                        <c:if test="${price.servicePriceStatus}">
                                                            ${price.priceValue}
                                                            <c:break/>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td class="text-center">
                                                    <button type="button" class="btn btn-sm btn-primary" onclick="selectService(${service.serviceId}, '${service.serviceName}', ${price.priceValue})">
                                                        Select
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:if>
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


            <!-- JavaScript for handling service selection and validation -->
            <script>
                let selectedServicePricePerSquareMeter = 0;

                function selectService(serviceId, serviceName, pricePerSquareMeter) {
                    document.getElementById('selectedServiceId').value = serviceId;
                    document.getElementById('selectedServiceName').value = serviceName;
                    selectedServicePricePerSquareMeter = pricePerSquareMeter;

                    calculateCosts();
                    $('#serviceModal').modal('hide');
                }

                function calculateCosts() {
                    const area = parseFloat(document.getElementById('serviceQuotesArea').value) || 0;
                    const totalPrice = area * selectedServicePricePerSquareMeter;

                    document.getElementById('serviceQuotesTotalPrice').value = totalPrice.toFixed(2);
                }

                function validateForm() {
                    const area = parseFloat(document.getElementById('serviceQuotesArea').value) || 0;
                    const totalPrice = parseFloat(document.getElementById('serviceQuotesTotalPrice').value) || 0;
                    const serviceId = document.getElementById('selectedServiceId').value;

                    if (!serviceId) {
                        alert('Please select a service before submitting the form.');
                        return false;
                    }

                    if (area <= 0) {
                        alert('Area must be greater than 0.');
                        return false;
                    }

                    if (totalPrice <= 0) {
                        alert('Total price must be greater than 0.');
                        return false;
                    }

                    return true;
                }

                // Automatically adjust costs every second
                setInterval(function () {
                    calculateCosts();
                }, 1000);
            </script>

        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>

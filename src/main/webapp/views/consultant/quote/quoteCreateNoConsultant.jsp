<%-- 
    Document   : quoteCreateNoConsultant
    Created on : Nov 1, 2024, 10:48:05 AM
    Author     : HP
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Create Quote</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
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
            .table th, .table td {
                padding: 10px; /* Ensure consistent padding */
                vertical-align: middle; /* Ensure content is vertically centered */
                text-align: center; /* Center align text for uniform appearance */
            }
            .table thead th {
                background-color: #f8f9fa;
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <jsp:include page="../consultantNav.jsp"/>
            <div class="d-flex justify-content-center">
                <!-- Right Column for Quote Creation Form -->
                <div class="col-md-8">
                    <h2 class="mb-4">Create Quote</h2>

                    <form:form action="${pageContext.request.contextPath}/consultant/quote/save" modelAttribute="newQuote" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true" onsubmit="return validateForm()">
                        <form:hidden path="staff.id" value="${staff.id}" />

                        <!-- Quotes Name -->
                        <div class="form-group">
                            <label for="quoteName">Quote Name:</label>
                            <form:input path="quotesName" id="quoteName" class="form-control" />
                        </div>

                        <!-- Quotes Content -->
                        <div class="form-group">
                            <label for="quoteContent">Quote Content:</label>
                            <form:input path="quotesContent" id="quoteContent" class="form-control" />
                        </div>

                        <!-- Area -->
                        <div class="form-group">
                            <label for="area">Area (m<sub>2</sub>):</label>
                            <form:input type ="number" path="quotesArea" id="area" step="0.01" class="form-control" />
                        </div>

                        <!-- Parcel Selection -->
                        <div class="form-group">
                            <label for="parcel">Select Parcel:</label>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#parcelModal">
                                Choose Parcel
                            </button>
                            <input type="hidden" id="selectedParcelId" name="parcel.packageId" required />
                            <input type="text" id="selectedParcelName" name="parcelName" readonly class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="selectedCustomer">Select Customer For Quote</label>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addCustomerModal">
                                Choose Customer
                            </button>
                            <input type="hidden" id="selectedCustomerId" name="customer.id" required />
                            <input type="text" id="selectedCustomerName" name="customerName" readonly class="form-control" />
                        </div>

                        <!-- Design Cost -->
                        <div class="form-group">
                            <label for="designCost">Design Cost:</label>
                            <form:input path="quotesDesignCost" id="designCost" step="0.01" class="form-control" readonly="true"/>
                        </div>

                        <!-- Construction Cost -->
                        <div class="form-group">
                            <label for="constructionCost">Construction Cost:</label>
                            <form:input path="quotesConstructionCost" id="constructionCost" step="0.01" class="form-control" readonly="true"/>
                        </div>

                        <!-- Total Price (Read-Only, auto-calculated) -->
                        <div class="form-group">
                            <label for="totalPrice">Total Price:</label>
                            <form:input path="quotesTotalPrice" id="totalPrice" step="0.01" class="form-control" readonly="true"/>
                        </div>
                        
                        <div class="form-group">
                            <label for="depositOnContract">Deposit On Contract:</label>
                            <form:input type ="number" path="depositOnContract" id="depositOnContract" step="0.01" class="form-control" />
                        </div>

                        <button type="submit" class="btn btn-primary">Create Quote</button>
                    </form:form>
                </div>
            </div>



            <!-- Customer Selection Modal -->
            <div class="modal fade" id="addCustomerModal" tabindex="-1" role="dialog" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document"> <!-- Using modal-lg for a larger modal if needed -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addCustomerModalLabel">Select Customer for New Service Quote</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="text" id="customerSearch" class="form-control" placeholder="Search by name or gmail...">
                            </div>
                            <div class="table-responsive">
                                <!-- Table of Customers -->
                                <table class="table table-hover">
                                    <thead class="thead-light">
                                        <tr>
                                            <th style="width: 35%;">Name</th>
                                            <th style="width: 30%;">Email</th>
                                            <th style="width: 25%;">Phone</th>
                                            <th style="width: 10%;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="customerTableBody">
                                        <c:forEach var="customer" items="${customerList}">
                                            <tr>
                                                <td>${customer.name != null ? customer.name:'N/A'}</td>
                                                <td>${customer.email}</td>
                                                <td>${customer.phone != null ? customer.phone:'N/A'}</td>
                                                <td>
                                                    <c:if test="${customer.name != null && customer.phone != null}">
                                                        <button type="button" class="btn btn-sm btn-primary" onclick="selectCustomer(${customer.id}, '${customer.name}')">
                                                            Select
                                                        </button>
                                                    </c:if>    
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>  


            <!-- Parcel Selection Modal -->
            <div class="modal fade" id="parcelModal" tabindex="-1" role="dialog" aria-labelledby="parcelModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="parcelModalLabel">Select Parcel</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Table to display all parcels -->
                            <table class="table table-bordered table-striped">
                                <thead class="thead-light">
                                    <tr>
                                        <th style="width: 20%;">Package Name</th>
                                        <th style="width: 20%;">Description</th>
                                        <th style="width: 15%;">Design Price per m<sub>2</sub></th>
                                        <th style="width: 15%;">Construction Price per m<sub>2</sub></th>
                                        <th style="width: 10%;">Select</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="parcel" items="${parcelList}">
                                        <tr>
                                            <td>${parcel.packageName}</td>
                                            <td>${parcel.packageDescription}</td>
                                            <td class="text-center">${parcel.designOnSquareRoot}</td>
                                            <td class="text-center">${parcel.constructionPriceOnSquareRoot}</td>
                                            <td class="text-center">
                                                <button type="button" class="btn btn-sm btn-primary" onclick="selectParcel(${parcel.packageId}, '${parcel.packageName}', ${parcel.designOnSquareRoot}, ${parcel.constructionPriceOnSquareRoot})">
                                                    Select
                                                </button>
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


            <!-- JavaScript for handling parcel selection -->
            <script>
                // Store selected parcel details for cost calculation
                let selectedParcelDetails = {
                    designCostPerSquareMeter: 0,
                    constructionCostPerSquareMeter: 0
                };

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
                function selectCustomer(customerId, customerName) {
                    // Set the selected customer ID and name in the form fields
                    document.getElementById('selectedCustomerId').value = customerId;
                    document.getElementById('selectedCustomerName').value = customerName;

                    // Close the modal
                    $('#addCustomerModal').modal('hide');
                }
                function selectParcel(packageId, packageName, designCostPerSquareMeter, constructionCostPerSquareMeter) {
                    document.getElementById('selectedParcelId').value = packageId;
                    document.getElementById('selectedParcelName').value = packageName;
                    selectedParcelDetails = {
                        designCostPerSquareMeter: designCostPerSquareMeter,
                        constructionCostPerSquareMeter: constructionCostPerSquareMeter
                    };

                    calculateCosts();
                    $('#parcelModal').modal('hide');
                }

                function calculateCosts() {
                    const area = parseFloat(document.getElementById('area').value) || 0;
                    const designCost = area * selectedParcelDetails.designCostPerSquareMeter;
                    const constructionCost = area * selectedParcelDetails.constructionCostPerSquareMeter;
                    const totalPrice = designCost + constructionCost;

                    document.getElementById('designCost').value = designCost.toFixed(2);
                    document.getElementById('constructionCost').value = constructionCost.toFixed(2);
                    document.getElementById('totalPrice').value = totalPrice.toFixed(2);
                }


                // Validate the form before submission
                function validateForm() {
                    const area = parseFloat(document.getElementById('area').value) || 0;
                    const designCost = parseFloat(document.getElementById('designCost').value) || 0;
                    const constructionCost = parseFloat(document.getElementById('constructionCost').value) || 0;
                    const totalPrice = parseFloat(document.getElementById('totalPrice').value) || 0;
                    const selectedParcelId = document.getElementById('selectedParcelId').value;
                    const selectedCustomerId = document.getElementById('selectedCustomerId').value;
                    const depositOnContract = parseFloat(document.getElementById('depositOnContract').value) || 0; // Get the deposit value

                        // Validate depositOnContract field
                    if (isNaN(depositOnContract) || depositOnContract <= 0) {
                        alert('Deposit on contract must be a valid number greater than 0.');
                        return false;
                    }
                    
                    if (!selectedParcelId) {
                        alert('Please select a parcel before submitting the form.');
                        return false;
                    }

                    if (!selectedCustomerId) {
                        alert('Please select a customer before submitting the form.');
                        return false;
                    }

                    if (area <= 0 || designCost <= 0 || constructionCost <= 0 || totalPrice <= 0) {
                        alert('Area, design cost, construction cost, and total price must all be greater than 0.');
                        return false;
                    }

                    return true;
                }

                document.getElementById('customerSearch').addEventListener('input', function () {
                    const searchValue = this.value.toLowerCase();
                    const customerRows = document.querySelectorAll('#customerTableBody tr');

                    customerRows.forEach(row => {
                        const customerName = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
                        const customerEmail = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                        if (customerName.includes(searchValue) || customerEmail.includes(searchValue)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                });

                // Automatically adjust costs every second
                setInterval(function () {
                    calculateCosts();
                }, 1000);
            </script>

        </div>

        <!-- Bootstrap JS and dependencies -->

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>

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
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .quote-info h4 {
                margin-bottom: 15px;
                color: #333;
            }
            .section-title {
                font-weight: bold;
                text-align: center;
                padding-bottom: 10px;
                color: #007bff;
            }
            .form-section {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
                width: 66%;
            }
            .customer-avatar {
                max-width: 150px;
                border-radius: 50%;
                margin-bottom: 15px;
            }
            .customer-info {
                text-align: center;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                padding: 10px 15px;
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
            <jsp:include page="../consultantNav.jsp"/>
            <div class="row">
                <!-- Left Column for Customer Information -->
                <div class="col-md-4">
                    <div class="quote-info">
                        <h4>Customer Information</h4>
                        <div class="customer-info">
                            <c:choose>
                                <c:when test="${quote.customer.imgURL != null}">
                                    <img class="customer-avatar img-fluid"
                                         src="${quote.customer.getShowingImg(quote.customer.imgURL)}" alt />
                                </c:when>
                                <c:otherwise>
                                    <img class="customer-avatar img-fluid"
                                         src="${pageContext.request.contextPath}/assets/imgs/logo/final_resized_colored_logo_image.png" alt />
                                </c:otherwise>
                            </c:choose>

                            <p><strong>${customer.name}</strong></p>
                        </div>
                        <p><strong>Phone:</strong> ${customer.phone}</p>
                        <p><strong>Email:</strong> ${customer.email}</p>
                        <p><strong>Consultation Content:</strong> ${consultant.consultantContent}</p>
                    </div>
                </div>

                <!-- Right Column for Quote Creation Form -->
                <div class="form-section">
                    <div class="section-title">
                        <h2>Create Quote</h2>
                    </div>
                    <form:form action="${pageContext.request.contextPath}/consultant/quote/saveNewQuotes" modelAttribute="newQuote" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true" onsubmit="return validateForm()">
                        <form:hidden path="consultant.consultantId" value="${consultant.consultantId}"/>
                        <form:hidden path="customer.id" value="${customer.id}" />
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
                            <label for="area">Area (m<sup>2</sup>):</label>
                            <form:input type ="number" path="quotesArea" id="area" step="0.01" class="form-control" />
                        </div>

                        <!-- Parcel Selection -->
                        <div class="form-group">
                            <label for="parcel">Select Parcel:</label>
                            <button style="margin-bottom: 5px" type="button" class="btn btn-info" data-toggle="modal" data-target="#parcelModal">
                                Choose Parcel
                            </button>
                            <input type="hidden" id="selectedParcelId" name="parcel.packageId" required />
                            <input type="text" id="selectedParcelName" name="parcelName" readonly class="form-control" />
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
                                        <th style="width: 15%;">Design Price/m<sup>2</sup></th>
                                        <th style="width: 15%;">Construction Price/m<sup>2</sup></th>

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
                let isConfirmed = false; // Track if the user has already confirmed

                function validateForm() {
                    if (!isConfirmed) {
                        const area = parseFloat(document.getElementById('area').value) || 0;
                        const designCost = parseFloat(document.getElementById('designCost').value) || 0;
                        const constructionCost = parseFloat(document.getElementById('constructionCost').value) || 0;
                        const totalPrice = parseFloat(document.getElementById('totalPrice').value) || 0;
                        const selectedParcelId = document.getElementById('selectedParcelId').value;
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

                        if (area <= 0 || designCost <= 0 || constructionCost <= 0 || totalPrice <= 0) {
                            alert('Area, design cost, construction cost, and total price must all be greater than 0.');
                            return false;
                        }

                        // Show the confirmation message only the first time
                        if (!confirm('Are you sure you want to create this quote?')) {
                            return false;
                        }

                        isConfirmed = true; // Mark as confirmed if the user clicks "Yes"
                    }

                    return true; // Proceed with form submission
                }

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
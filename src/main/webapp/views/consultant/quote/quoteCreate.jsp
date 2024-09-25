<%-- 
    Document   : quoteCreate
    Created on : Sep 21, 2024, 9:26:56 PM
    Author     : HP
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Create Contract</title>
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
                            <p><strong>${customer.username}</strong></p>
                        </div>
                        <!-- Customer Information -->
                        <p><strong>Phone:</strong> ${customer.customerPhone}</p>
                        <p><strong>Email:</strong> ${customer.customerEmail}</p>
                        <p><strong>Content:</strong> ${consultant.consultantContent}</p>
                    </div>
                </div>

                <!-- Right Column for Contract Creation Form -->
                <div class="col-md-8">
                    <h2 class="mb-4">Create Quote</h2>

                    <!-- Bind the form to the "contract" object -->
                    <form:form action="/consultant/quote/createNewQuotes" modelAttribute="newQuote" method="post" enctype="multipart/form-data" class="needs-validation" novalidate="true">

                        <form:hidden path="consultant.consultantId" value="${consultant.consultantId}"/>

                        <form:hidden path="customer.customerId" value="${customer.customerId}" />

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
                            <label for="area">Area (m²):</label>
                            <form:input path="quotesArea" id="area" step="0.01" class="form-control" />
                        </div>

                        <!-- Parcel Selection -->
                        <div class="form-group">
                            <label for="parcel">Select Parcel:</label>
                            <form:select path="parcel.packageId" id="parcel" class="form-control">
                                <form:options items="${parcelList}" itemValue="packageId" itemLabel="packageName" />
                            </form:select>
                        </div>

                        <!-- Design Cost -->
                        <div class="form-group">
                            <label for="designCost">Design Cost:</label>
                            <form:input path="quotesDesignCost" id="designCost" step="0.01" class="form-control" />
                        </div>

                        <!-- Construction Cost -->
                        <div class="form-group">
                            <label for="constructionCost">Construction Cost:</label>
                            <form:input path="quotesConstructionCost" id="constructionCost" step="0.01" class="form-control" />
                        </div>



                        <!-- Total Price (Read-Only, auto-calculated) -->
                        <div class="form-group">
                            <label for="totalPrice">Total Price:</label>
                            <form:input path="quotesTotalPrice" id="totalPrice" class="form-control" readonly="readonly" />
                        </div>

                        <!-- Button to Auto Calculate Costs -->
                        <div class="form-group">
                            <button type="button" class="btn btn-warning" onclick="updateCostsBasedOnParcel()">Auto Adjust Costs</button>
                        </div>

                        <button  type="submit" class="btn btn-primary">Create Contract</button>
                    </form:form>
                </div>       
            </div>

            <!-- JavaScript for Auto Adjustment -->
            <script>
                // These variables will hold the design and construction costs per square meter from the selected parcel
                let designCostPerSquareMeter = 0;
                let constructionCostPerSquareMeter = 0;

                // Function to update costs based on the selected parcel
                function updateCostsBasedOnParcel() {
                    // Get the selected parcel ID
                    const packageId = document.getElementById('parcel').value;

                    // Find the selected parcel's cost rates from the parcelList (sent from backend)
                    const selectedParcel = ${parcelList}.find(parcel => parcel.packageId === packageId);

                    // Update the design and construction cost per square meter based on the selected parcel
                    designCostPerSquareMeter = selectedParcel.designOnSquareRoot;
                    constructionCostPerSquareMeter = selectedParcel.constructionPriceOnSquareRoot;

                    // Call the calculateCosts function to auto-update the calculated values
                    calculateCosts();
                }

                function calculateCosts() {
                    // Get the entered area
                    const area = parseFloat(document.getElementById('area').value) || 0;

                    // Calculate design and construction costs based on the area and parcel-specific cost rates
                    const designCost = area * designCostPerSquareMeter;
                    const constructionCost = area * constructionCostPerSquareMeter;

                    // Update the form inputs with the calculated values
                    document.getElementById('designCost').value = designCost.toFixed(2);
                    document.getElementById('constructionCost').value = constructionCost.toFixed(2);

                    // Calculate total price (design + construction costs)
                    const totalPrice = designCost + constructionCost;
                    document.getElementById('totalPrice').value = totalPrice.toFixed(2);
                }
            </script>

        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>



<%-- 
    Document   : serviceQuoteUpdate
    Created on : Oct 13, 2024, 2:34:35 PM
    Author     : HP
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <div class="row">
                <!-- Left Column for Customer Information -->

                <!-- Right Column for Contract Creation Form -->
                <div class="col-md-12">
                    <h2 class="mb-4">Update Service Quote</h2>

                    <!-- Bind the form to the "contract" object -->
                    <form:form action="/consultant/serviceQuote/saveUpdate" modelAttribute="serviceQuote" method="Post" enctype="multipart/form-data" class="needs-validation" novalidate="true">

                        <form:hidden path="serviceQuotesId" value="${serviceQuote.serviceQuotesId}"/>

                        <form:hidden path="consultant.consultantId" value="${consultant.consultantId}"/>

                        <form:hidden path="customer.id" value="${customer.id}" />

                        <form:hidden path="staff.id" value="${staff.id}" />

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

                        <!-- Parcel Selection -->
                        <div class="form-group">
                            <label for="service">Select Service:</label>
                            <form:select path="service.serviceId" id="service" class="form-control">
                                <form:options items="${service}" itemValue="serviceId" itemLabel="serviceName" />
                            </form:select>
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

                        <button  type="submit" class="btn btn-primary">Create Contract</button>
                    </form:form>
                </div>       
            </div>

            <!-- JavaScript for Auto Adjustment -->
            <script>

            </script>

        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>

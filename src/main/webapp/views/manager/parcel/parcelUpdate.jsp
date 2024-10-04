<%-- 
    Document   : parcelUpdate
    Created on : Oct 1, 2024, 12:40:28 PM
    Author     : HP
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Create Parcel</title>
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
                <!-- Right Column for Contract Creation Form -->
                <div class="col-md-12">
                    <h2 class="mb-4">Update Package</h2>

                    <!-- Bind the form to the "contract" object -->
                    <form:form action="/manager/parcel/update" modelAttribute="newParcel" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true">
                        <form:hidden path="packageId" value="${newParcel.packageId}"/>
                        
                        <!-- Package Name -->
                        <div class="form-group">
                            <label for="packageName">Package name:</label>
                            <form:input path="packageName" id="packageName" class="form-control" />
                        </div>

                        <!-- Construction Price On Square Root -->
                        <div class="form-group">
                            <label for="constructionPriceOnSquareRoot">Construction Price On Square Root:</label>
                            <form:input path="constructionPriceOnSquareRoot" id="constructionPriceOnSquareRoot" class="form-control" />
                        </div>

                        <!-- Design On Square Root -->
                        <div class="form-group">
                            <label for="designOnSquareRoot">Design On Square Root:</label>
                            <form:input path="designOnSquareRoot" id="designOnSquareRoot" class="form-control" />
                        </div>

                        <!-- Description -->
                        <div class="form-group">
                            <label for="packageDescription">package Description: </label>
                            <form:input path="packageDescription" id="packageDescription" class="form-control" />
                        </div>
                        
                        <div class="form-group">
                            <label for="package_status">Select Status: </label>
                            <form:select path="package_status" id="package_status" class="form-control">
                                <form:option value="True">Active</form:option>
                                <form:option value="false">Inactive</form:option>                               
                            </form:select>
                        </div>
                        <button  type="submit" class="btn btn-primary">Update</button>
                    </form:form>
                </div>       
            </div>


        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>


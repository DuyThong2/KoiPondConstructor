<%-- 
    Document   : consultantCreate
    Created on : Sep 26, 2024, 9:59:35 PM
    Author     : HP
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Create Consultant</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <%@include file="../cssTemplate.jsp"%>

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
    <%@include file="../homePageNavbar.jsp"%>

    <body>

        <div class="container mt-5">
            <div class="row">                
                <!-- Right Column for Contract Creation Form -->
                <div class="col-md-12">
                    <h2 class="mb-4">Create Consultant</h2>

                    <!-- Bind the form to the "contract" object -->
                    <form:form action="/customer/consultant/save" modelAttribute="newConsultant" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true">

                        <form:hidden path="customer.id" value="${customer.id}" />

                        <!-- Customer Name -->
                        <div class="form-group">
                            <label for="cusName">Customer name:</label>
                            <form:input path="consultantCustomerName" id="cusName" class="form-control" />
                        </div>

                        <!-- Customer phone -->
                        <div class="form-group">
                            <label for="cusPhone">Phone:</label>
                            <form:input path="consultantPhone" id="cusPhone" class="form-control" />
                        </div>

                        <!-- Customer Email -->
                        <div class="form-group">
                            <label for="cusEmail">Email:</label>
                            <form:input path="consultant_email" id="cusEmail" class="form-control" />
                        </div>

                        <!-- Content -->
                        <div class="form-group">
                            <label for="content">Content</label>
                            <form:input path="consultantContent" id="content" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="type">Select Service:</label>
                            <form:select path="consultantType" id="type" class="form-control">
                                <form:option value="Construction">Construction</form:option>
                                <form:option value="Upgrade">Upgrade</form:option>
                                <form:option value="Take care">Take care</form:option>
                            </form:select>
                        </div>

                        <button  type="submit" class="btn btn-primary">Create Contract</button>
                    </form:form>
                </div>       
            </div>


        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>

</html>

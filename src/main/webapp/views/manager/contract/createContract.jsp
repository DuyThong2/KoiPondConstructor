<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Contract</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Create Contract</h2>

    <!-- Bind the form to the "contract" object -->
    
    
    
<form:form action="${pageContext.request.contextPath}/manager/contract/create" modelAttribute="contract" method="post" enctype="multipart/form-data" class="needs-validation" novalidate="true">

        <!-- Total Price -->
        <div class="form-group">
            <label for="totalPrice">Total Price:</label>
            <form:input path="totalPrice" type="number" step="0.01" class="form-control" required="true"/>
            <div class="invalid-feedback">Please provide a valid total price.</div>
        </div>

        <!-- Price on Concept Design -->
        <div class="form-group">
            <label for="priceOnConceptDesign">Price on Concept Design:</label>
            <form:input path="priceOnConceptDesign" type="number" step="0.01" class="form-control" required="true"/>
            <div class="invalid-feedback">Please provide a valid price for the concept design.</div>
        </div>

        <!-- Price on Construction Design -->
        <div class="form-group">
            <label for="priceOnConstructionDesign">Price on Construction Design:</label>
            <form:input path="priceOnConstructionDesign" type="number" step="0.01" class="form-control" required="true"/>
            <div class="invalid-feedback">Please provide a valid price for the construction design.</div>
        </div>

        <!-- Price on Detail Design -->
        <div class="form-group">
            <label for="priceOnDetailDesign">Price on Detail Design:</label>
            <form:input path="priceOnDetailDesign" type="number" step="0.01" class="form-control" required="true"/>
            <div class="invalid-feedback">Please provide a valid price for the detail design.</div>
        </div>

        <!-- Price on Raw Construction -->
        <div class="form-group">
            <label for="priceOnRawConstruction">Price on Raw Construction:</label>
            <form:input path="priceOnRawConstruction" type="number" step="0.01" class="form-control" required="true"/>
            <div class="invalid-feedback">Please provide a valid price for the raw construction.</div>
        </div>

        <!-- Price on Complete Construction -->
        <div class="form-group">
            <label for="priceOnCompleteConstruction">Price on Complete Construction:</label>
            <form:input path="priceOnCompleteConstruction" type="number" step="0.01" class="form-control" required="true"/>
            <div class="invalid-feedback">Please provide a valid price for the complete construction.</div>
        </div>

        <!-- Contract Term -->
        <div class="form-group">
            <label for="contractTerm">Contract Term:</label>
            <form:input path="contractTerm" class="form-control" required="true"/>
            <div class="invalid-feedback">Please provide a valid contract term.</div>
        </div>

        <!-- Contract Status -->
        <div class="form-group">
            <label for="contractStatus">Contract Status:</label>
            <form:input path="contractStatus" type="number" class="form-control" required="true"/>
            <div class="invalid-feedback">Please provide a valid contract status.</div>
        </div>

        <!-- Contract Note -->
        <div class="form-group">
            <label for="contractNote">Contract Note:</label>
            <form:textarea path="contractNote" class="form-control"/>
        </div>

        <!-- Term (Dropdown) -->
        <div class="form-group">
            <label for="term">Select Term:</label>
            <form:select path="term.termId" class="form-control">
                <form:options items="${terms}" itemValue="termId" itemLabel="description"/>
            </form:select>
            <div class="invalid-feedback">Please select a valid term.</div>
        </div>

        <!-- File Input (for file upload) -->
        <div class="form-group">
            <label for="file">Choose file:</label>
            <input type="file" id="file" name="file" class="form-control-file" required/>
            <div class="invalid-feedback">Please select a file.</div>
        </div>

        <button type="submit" class="btn btn-primary">Create Contract</button>
    </form:form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Optional JavaScript for form validation -->
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

</body>
</html>

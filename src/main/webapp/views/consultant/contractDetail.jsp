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
        <!-- Left Column for Quote Information -->
        <div class="col-md-4">
            <div class="quote-info">
                <h4>Quote Information</h4>
                <!-- Customer Avatar -->
                <div class="customer-info">
                    <img src="${quote.customer.avatarURL}" alt="Customer Avatar" class="customer-avatar img-fluid"/>
                    <p><strong>${quote.customer.username}</strong></p>
                </div>
                <!-- Quote Information -->
                <p><strong>Quote ID:</strong> ${quote.quotesId}</p>
                <p><strong>Quote Name:</strong> ${quote.quotesName}</p>
                <p><strong>Customer:</strong> ${quote.customer.username}</p>
                <p><strong>Total Design Cost:</strong> ${quote.quotesDesignCost}</p>
                <p><strong>Total Construction Cost:</strong> ${quote.quotesConstructionCost}</p>
                <p><strong>Area:</strong> ${quote.quotesArea} m�</p>
                <p><strong>Total Price:</strong> ${quote.quotesTotalPrice}</p>
            </div>
        </div>

        <!-- Right Column for Contract Creation Form -->
        <div class="col-md-8">
            <h2 class="mb-4">Create Contract</h2>

            <!-- Bind the form to the "contract" object -->
            <form:form action="${pageContext.request.contextPath}/consultant/contract/create" modelAttribute="contract" method="post" enctype="multipart/form-data" class="needs-validation" novalidate="true">

                <!-- Total Price (Read-Only, auto-calculated) -->
                <div class="form-group">
                    <label for="totalPrice">Total Price:</label>
                    <form:input path="totalPrice" step="0.01" class="form-control" readonly="readonly"/>
                </div>

                <!-- Design Costs -->
                <h4>Design Phases</h4>

                <!-- Conceptual Design -->
                <div class="form-group">
                    <label for="priceOnConceptDesign">Conceptual Design:</label>
                    <form:input path="priceOnConceptDesign" step="0.01" class="form-control"/>
                </div>

                <!-- Detailed Design -->
                <div class="form-group">
                    <label for="priceOnDetailDesign">Detailed Design:</label>
                    <form:input path="priceOnDetailDesign" step="0.01" class="form-control"/>
                </div>

                <!-- Construction Design -->
                <div class="form-group">
                    <label for="priceOnConstructionDesign">Construction Design:</label>
                    <form:input path="priceOnConstructionDesign" step="0.01" class="form-control"/>
                </div>

                <!-- Construction Costs -->
                <h4>Construction Phases</h4>

                <!-- Raw Construction -->
                <div class="form-group">
                    <label for="priceOnRawConstruction">Raw Construction:</label>
                    <form:input path="priceOnRawConstruction" step="0.01" class="form-control"/>
                </div>

                <!-- Complete Construction -->
                <div class="form-group">
                    <label for="priceOnCompleteConstruction">Complete Construction:</label>
                    <form:input path="priceOnCompleteConstruction" step="0.01" class="form-control"/>
                </div>

                <!-- Term Selection Dropdown -->
                <div class="form-group">
                    <label for="term">Select Term:</label>
                    <form:select path="term.termId" class="form-control">
                        <form:options items="${terms}" itemValue="termId" itemLabel="description"/>
                    </form:select>
                </div>

                <!-- Button to Adjust Costs -->
                <div class="form-group">
                    <button type="button" class="btn btn-warning" onclick="autoAdjust()">Auto Adjust Costs</button>
                </div>

                <!-- Contract Note -->
                <div class="form-group">
                    <label for="contractNote">Contract Note:</label>
                    <form:textarea path="contractNote" class="form-control"/>
                </div>

                <!-- File Input (for file upload) -->
                <div class="form-group">
                    <label for="file">Choose file:</label>
                    <input type="file" id="file" name="file" class="form-control-file" required/>
                </div>

                <button type="submit" class="btn btn-primary">Create Contract</button>
            </form:form>
        </div>
    </div>

    <!-- JavaScript for Auto Adjustment -->
    <script>
        const maxDesignCost = ${quote.quotesDesignCost};  // Design cost from the Quote
        const maxConstructionCost = ${quote.quotesConstructionCost};  // Construction cost from the Quote

        function autoAdjust() {
            adjustDesignCosts();
            adjustConstructionCosts();
            updateTotalPrice();
        }

        function adjustDesignCosts() {
            let concept = parseFloat(document.getElementById('conceptDesign').value) || 0;
            let detail = parseFloat(document.getElementById('detailDesign').value) || 0;
            let construction = parseFloat(document.getElementById('constructionDesign').value) || 0;

            let totalDesign = concept + detail + construction;

            if (totalDesign !== maxDesignCost) {
                let difference = maxDesignCost - totalDesign;

                // Adjust values proportionally
                let proportion = difference / totalDesign;
                concept += concept * proportion;
                detail += detail * proportion;
                construction += construction * proportion;

                // Set the adjusted values back to the input fields
                document.getElementById('conceptDesign').value = concept.toFixed(2);
                document.getElementById('detailDesign').value = detail.toFixed(2);
                document.getElementById('constructionDesign').value = construction.toFixed(2);

                totalDesign = maxDesignCost;  // Ensure the total matches the quote design cost
            }
        }

        function adjustConstructionCosts() {
            let raw = parseFloat(document.getElementById('rawConstruction').value) || 0;
            let complete = parseFloat(document.getElementById('completeConstruction').value) || 0;

            let totalConstruction = raw + complete;

            if (totalConstruction !== maxConstructionCost) {
                let difference = maxConstructionCost - totalConstruction;

                // Adjust values proportionally
                let proportion = difference / totalConstruction;
                raw += raw * proportion;
                complete += complete * proportion;

                // Set the adjusted values back to the input fields
                document.getElementById('rawConstruction').value = raw.toFixed(2);
                document.getElementById('completeConstruction').value = complete.toFixed(2);
            }
        }

        function updateTotalPrice() {
            const totalDesignCost = parseFloat(document.getElementById('conceptDesign').value) || 0;
            const totalConstructionCost = parseFloat(document.getElementById('rawConstruction').value) || 0;
            const totalPrice = totalDesignCost + totalConstructionCost;

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

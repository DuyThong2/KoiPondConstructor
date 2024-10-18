<%-- 
    Document   : editContract
    Created on : Sep 20, 2024, 1:43:13 PM
    Author     : Admin
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Contract</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Page Background and Font */
        body {
            background-color: #f8f9fa;
            font-family: 'Mukta', sans-serif;
        }

        /* Container Padding */
        .container {
            margin-top: 30px;
        }

        /* Quote Information Box */
        .quote-info {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .quote-info h4 {
            color: #007bff;
            font-weight: bold;
            text-align: center;
        }

        .customer-avatar {
            max-width: 120px;
            border-radius: 50%;
            margin-bottom: 15px;
            transition: transform 0.3s ease-in-out;
        }

        .customer-avatar:hover {
            transform: scale(1.1);
        }

        .customer-info {
            text-align: center;
        }

        /* Form Section */
        .form-section {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .form-section h2 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Input Styles */
        .form-group label {
            font-weight: bold;
        }

        input[type="number"],
        input[type="file"],
        textarea {
            border-radius: 5px;
            padding: 12px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease;
        }

        input[type="number"]:focus,
        input[type="file"]:focus,
        textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        input[type="number"][readonly] {
            background-color: #f1f3f5;
        }

        /* Button Styles */
        .btn-custom {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            font-weight: bold;
            border-radius: 20px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #218838;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .left-col {
            max-width: 20%;
        }

        .right-col {
            max-width: 55%;
        }

        @media (max-width: 768px) {
            .left-col,
            .right-col {
                max-width: 100%;
            }

            .container {
                padding: 0 15px;
            }
        }


        .modal-dialog.modal-lg {
            max-width: 90%; /* Increase the width of the modal */
        }
        .table th, .table td {
            vertical-align: middle; /* Center content vertically */
            padding: 8px; /* Add padding for better readability */
        }
        .table thead th {
            text-align: center; /* Center-align header text */
            background-color: #f8f9fa; /* Light background for the header */
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2; /* Alternate row colors for better distinction */
        }

    </style>
</head>
<div style="height:6vh;"></div>
<body>

<div class="container-fluid mt-4">
    <div class="row">
        <%@include file="../navBar.jsp" %>

        <!-- Left Column for Quote Information -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 d-flex">

            <div class="col-md-4 left-col">
                <div class="quote-info">
                    <h4>Quote Information</h4>
                    <!-- Customer Avatar -->
                    <div class="customer-info">
                        <img src="${quote.customer.getShowingImg(quote.customer.imgURL)}" alt="Customer Avatar" class="customer-avatar img-fluid"/>
                        <p><strong>${quote.customer.name}</strong></p>
                    </div>
                    <!-- Quote Information -->
                    <p><strong>Quote ID:</strong> ${quote.quotesId}</p>
                    <p><strong>Quote Name:</strong> ${quote.quotesName}</p>
                    <p><strong>Customer:</strong> ${quote.customer.name}</p>
                    <p><strong>Total Design Cost:</strong> ${quote.quotesDesignCost}</p>
                    <p><strong>Total Construction Cost:</strong> ${quote.quotesConstructionCost}</p>
                    <p><strong>Area:</strong> ${quote.quotesArea} m�</p>
                    <p><strong>Total Price:</strong> ${quote.quotesTotalPrice}</p>
                </div>
            </div>

            <!-- Right Column for Contract Creation Form -->
            <div class="col-md-8 right-col">
                <div class="form-section">
                    <h2 class="mb-4">Create Contract</h2>

                    <!-- Bind the form to the "contract" object -->
                    <form:form action="${pageContext.request.contextPath}/manager/contract/edit" modelAttribute="contract" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true">
                        <form:hidden path="contractId" value="${contract.contractId}"/>
                        <form:hidden path="quote.quotesId" value="${quote.quotesId}"/>
                        <form:hidden path="customer.id" value="${customer.id}" />
                        <form:hidden path="fileURL" value="${contract.fileURL}" />

                        <!-- Total Price (Read-Only, auto-calculated) -->
                        <div class="form-group">
                            <label for="totalPrice">Total Price:</label>
                            <form:input path="totalPrice" id="totalPrice" step="0.01" value="${contract.totalPrice}" class="form-control" readonly="true"/>
                        </div>

                        <!-- Design Costs -->
                        <h4>Design Phases</h4>

                        <!-- Conceptual Design -->
                        <div class="form-group">
                            <label for="priceOnConceptDesign">Conceptual Design:</label>
                            <form:input type="number" path="priceOnConceptDesign" value="${contract.priceOnConceptDesign}" id="conceptDesign" step="0.01" class="form-control"/>
                        </div>

                        <!-- Detailed Design -->
                        <div class="form-group">
                            <label for="priceOnDetailDesign">Detailed Design:</label>
                            <form:input type="number" path="priceOnDetailDesign" value="${contract.priceOnDetailDesign}" id="detailDesign" step="0.01" class="form-control"/>
                        </div>

                        <!-- Construction Design -->
                        <div class="form-group">
                            <label for="priceOnConstructionDesign">Construction Design:</label>
                            <form:input type="number" path="priceOnConstructionDesign" value="${contract.priceOnConstructionDesign}" id="constructionDesign" step="0.01" class="form-control"/>
                        </div>

                        <!-- Total Design Cost (Used for calculation only) -->
                        <div class="form-group">
                            <label for="totalDesignCost">Total Design Cost:</label>
                            <input type="number" id="totalDesignCost" step="0.01"  class="form-control" readonly/>
                        </div>

                        <!-- Construction Costs -->
                        <h4>Construction Phases</h4>

                        <!-- Raw Construction -->
                        <div class="form-group">
                            <label for="priceOnRawConstruction">Raw Construction:</label>
                            <form:input type="number" path="priceOnRawConstruction" value="${contract.priceOnRawConstruction}" id="rawConstruction" step="0.01" class="form-control"/>
                        </div>

                        <!-- Complete Construction -->
                        <div class="form-group">
                            <label for="priceOnCompleteConstruction">Complete Construction:</label>
                            <form:input type="number" path="priceOnCompleteConstruction" value="${contract.priceOnCompleteConstruction}" id="completeConstruction" step="0.01" class="form-control"/>
                        </div>

                        <!-- Total Construction Cost (Used for calculation only) -->
                        <div class="form-group">
                            <label for="totalConstructionCost">Total Construction Cost:</label>
                            <input type="number" id="totalConstructionCost" step="0.01" class="form-control" readonly="readonly"/>
                        </div>

                        <!-- Term Selection Dropdown -->
                        <div class="form-group">
                            <label for="term">Select Term:</label>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#termModal">
                                Choose Term
                            </button>
                            <input type="hidden" id="selectedTermId" name="term.termId" value="${contract.term.termId}" />
                            <input type="text" id="term" name="termDescription" readonly="readonly" class="form-control" value="${contract.term.description}"/>
                        </div>

                        <!-- Button to Adjust Costs -->
                        <div class="form-group">
                            <button type="button" class="btn btn-warning" onclick="autoAdjust()">Auto Adjust Costs</button>
                        </div>

                        <!-- Contract Note -->
                        <div class="form-group">
                            <label for="contractNote">Contract Note:</label>
                            <form:textarea path="contractNote" value = "${contract.contractNote}" id="contractNote" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="contractNote">Contract Term:</label>
                            <form:textarea path="contractTerm" value = "${contract.contractTerm}" id="contractNote" class="form-control"/>
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
            <!-- Term Selection Modal -->
            <!-- Term Selection Modal -->
            <div class="modal fade" id="termModal" tabindex="-1" role="dialog" aria-labelledby="termModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document"> <!-- Make the modal larger -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="termModalLabel">Select Term</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Table to display all terms -->
                            <table class="table table-bordered table-striped">
                                <thead class="thead-light">
                                <tr>
                                    <th style="width: 25%;">Description</th>
                                    <th style="width: 10%;">Percent on Design 1</th>
                                    <th style="width: 10%;">Percent on Design 2</th>
                                    <th style="width: 10%;">Percent on Design 3</th>
                                    <th style="width: 10%;">Percent on Construction 1</th>
                                    <th style="width: 10%;">Percent on Construction 2</th>
                                    <th style="width: 10%;">Pay on Start of Design</th>
                                    <th style="width: 10%;">Pay on Start of Construction</th>
                                    <th style="width: 5%;">Select</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="term" items="${terms}">
                                    <tr>
                                        <td>${term.description}</td>
                                        <td class="text-center">${term.percentOnDesign1}</td>
                                        <td class="text-center">${term.percentOnDesign2}</td>
                                        <td class="text-center">${term.percentOnDesign3}</td>
                                        <td class="text-center">${term.percentOnConstruct1}</td>
                                        <td class="text-center">${term.percentOnConstruct2}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${term.payOnStartOfDesign}">
                                                    Yes
                                                </c:when>
                                                <c:otherwise>
                                                    No
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${term.payOnStartOfConstruction}">
                                                    Yes
                                                </c:when>
                                                <c:otherwise>
                                                    No
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-sm btn-primary" onclick="selectTerm(${term.termId}, '${term.description}')">
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

            <!-- JavaScript for Auto Adjustment -->
            <script>
                function selectTerm(termId, description) {
                    console.log("Selected Term ID: ", termId);
                    console.log("Selected Description: ", description);

                    // Set the selected term's values
                    document.getElementById('selectedTermId').value = termId;
                    document.getElementById('term').value = description;

                    $('#termModal').modal('hide');  // Close the modal
                }
            </script>

            <!-- JavaScript for Auto Adjustment and Validation -->
            <script>
                const maxDesignCost = ${quote.quotesDesignCost};  // Design cost from the Quote
                const maxConstructionCost = ${quote.quotesConstructionCost};  // Construction cost from the Quote
                const totalQuotePrice = ${quote.quotesTotalPrice};  // Total price from the Quote

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

                    if (totalDesign === 0) {
                        concept = maxDesignCost / 3;
                        detail = maxDesignCost / 3;
                        construction = maxDesignCost / 3;
                    } else if (totalDesign !== maxDesignCost) {
                        let difference = maxDesignCost - totalDesign;

                        let proportion = difference / totalDesign;
                        concept += concept * proportion;
                        detail += detail * proportion;
                        construction += construction * proportion;
                    }

                    document.getElementById('conceptDesign').value = concept.toFixed(2);
                    document.getElementById('detailDesign').value = detail.toFixed(2);
                    document.getElementById('constructionDesign').value = construction.toFixed(2);
                    document.getElementById('totalDesignCost').value = maxDesignCost.toFixed(2);
                }

                function adjustConstructionCosts() {
                    let raw = parseFloat(document.getElementById('rawConstruction').value) || 0;
                    let complete = parseFloat(document.getElementById('completeConstruction').value) || 0;

                    let totalConstruction = raw + complete;

                    if (totalConstruction === 0) {
                        raw = maxConstructionCost / 2;
                        complete = maxConstructionCost / 2;
                    } else if (totalConstruction !== maxConstructionCost) {
                        let difference = maxConstructionCost - totalConstruction;

                        let proportion = difference / totalConstruction;
                        raw += raw * proportion;
                        complete += complete * proportion;
                    }

                    document.getElementById('rawConstruction').value = raw.toFixed(2);
                    document.getElementById('completeConstruction').value = complete.toFixed(2);
                    document.getElementById('totalConstructionCost').value = maxConstructionCost.toFixed(2);
                }

                function updateTotalPrice() {
                    const totalDesignCost = parseFloat(document.getElementById('totalDesignCost').value) || 0;
                    const totalConstructionCost = parseFloat(document.getElementById('totalConstructionCost').value) || 0;
                    const totalPrice = totalDesignCost + totalConstructionCost;

                    document.getElementById('totalPrice').value = totalPrice.toFixed(2);
                }

                // Prevent form submission if the total price does not match the total quote price
                document.querySelector('form').addEventListener('submit', function (event) {
                    const totalPrice = parseFloat(document.getElementById('totalPrice').value) || 0;
                    if (totalPrice !== totalQuotePrice) {
                        event.preventDefault();
                        alert('The total price must match the total quote price.');
                    }
                });

                // Function to prevent negative values in input fields
                function validateFields() {
                    let fields = ['conceptDesign', 'detailDesign', 'constructionDesign', 'rawConstruction', 'completeConstruction', 'totalDesignCost', 'totalConstructionCost', 'totalPrice'];

                    let isValid = true;  // Assume valid unless we find an invalid field

                    fields.forEach(function (fieldId) {
                        let field = document.getElementById(fieldId);
                        let value = parseFloat(field.value);

                        if (value < 0) {
                            isValid = false;
                            field.classList.add('is-invalid');  // Mark the field as invalid
                            alert('Value for ' + fieldId + ' cannot be less than 0.');
                        } else {
                            field.classList.remove('is-invalid');  // Remove the invalid class if value is valid
                        }
                    });

                    return isValid;
                }

                // Listen for form submission and validate
                document.addEventListener('DOMContentLoaded', function () {
                    document.querySelector('form').addEventListener('submit', function (event) {
                        if (!validateFields()) {
                            event.preventDefault();  // Prevent form submission if validation fails
                        }
                    });
                });
            </script>

        </main>
    </div>

</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>

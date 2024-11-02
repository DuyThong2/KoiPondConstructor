<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Create Contract</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .quote-info {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .quote-info h3 {
                margin-bottom: 15px;
                color: #333;
            }
            .section-title {
                font-weight: bold;
                text-align: center;
                padding-bottom: 10px;
            }
            .form-section {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
                width: 66%;
            }
            .grid-container {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 20px;
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
            .btn-warning {
                background-color: #ffc107;
                border: none;
                border-radius: 5px;
                padding: 8px 12px;
            }
            .modal-content {
                border-radius: 8px;
            }
            .modal-header {
                background-color: #007bff;
                color: #fff;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
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
            .form-check-inline {
                margin-right: 15px; /* Tạo khoảng cách giữa các lựa chọn */
            }
            label{
                font-size: 20px;
            }
            .section-title h2 {
                font-size: 2.8em;
                font-weight: bold;
                margin-bottom: 10px;
                padding-top: 25px;
                color: #007bff;
                border-bottom: none;
            }
            .section-title h3 {
                font-size: 1.8em;
                font-weight: bold;
                margin-bottom: 10px;
                padding-top: 25px;
                color: #2f2829;
                border-bottom: none;
                border-bottom: 1px solid #ccc;
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <jsp:include page="../consultantNav.jsp"/>
            <div class="row">
                <!-- Left Column for Quote Information -->
                <div class="col-md-4">
                    <div class="quote-info">
                        <h4>Quote Information</h4>
                        <!-- Customer Avatar -->
                        <div class="customer-info">
                            <img src="${quote.customer.imgURL != null ? quote.customer.getShowingImg(quote.customer.imgURL) : "/SWPKoiConstructor/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt="Customer Avatar" class="customer-avatar img-fluid"/>
                            <p><strong>${quote.customer.name}</strong></p>
                        </div>
                        <!-- Quote Information -->
                        <p><strong>Quote ID:</strong> ${quote.quotesId}</p>
                        <p><strong>Quote Name:</strong> ${quote.quotesName}</p>
                        <p><strong>Customer:</strong> ${quote.customer.name}</p>
                        <p><strong>Total Design Cost:</strong> ${quote.quotesDesignCost}</p>
                        <p><strong>Total Construction Cost:</strong> ${quote.quotesConstructionCost}</p>
                        <p><strong>Area:</strong> ${quote.quotesArea}m<sup>2</sup></p>
                        <p><strong>Total Price:</strong> ${quote.quotesTotalPrice}</p>
                    </div>
                </div>

                <!-- Right Column for Contract Creation Form -->
                <div class="form-section">
                    <div class="section-title">
                        <h2>Create Contract</h2>
                    </div>
                    <form:form action="${pageContext.request.contextPath}/consultant/contract/create" modelAttribute="contract" method="post" enctype="multipart/form-data" class="needs-validation" novalidate="true">
                        <form:hidden path="term.termId" id="selectedTermId" value="${term.termId != null ? term.termId : 0}"/>
                        <form:hidden path="quote.quotesId" value="${quote.quotesId}"/>
                        <form:hidden path="customer.id" value="${customer.id}" />



                        <!-- Design Phases -->
                        <div class="section-title">
                            <h3>Design Phases</h3>
                        </div>
                        <div class="grid-container">
                            <div class="form-group">
                                <label for="priceOnConceptDesign">Conceptual Design:</label>
                                <form:input type="number" path="priceOnConceptDesign" id="conceptDesign" step="0.01" min="0" max="${quote.quotesDesignCost}" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="priceOnDetailDesign">Detailed Design:</label>
                                <form:input type="number" path="priceOnDetailDesign" id="detailDesign" step="0.01" min="0" max="${quote.quotesDesignCost}" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="priceOnConstructionDesign">Construction Design:</label>
                                <form:input type="number" path="priceOnConstructionDesign" id="constructionDesign" step="0.01" min="0" max="${quote.quotesDesignCost}" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="totalDesignCost">Total Design Cost:</label>
                            <input type="number" id="totalDesignCost" step="0.01" class="form-control" value="${quote.quotesDesignCost}" readonly/>
                        </div>

                        <!-- Construction Phases -->
                        <div class="section-title">
                            <h3>Construction Phases</h3>
                        </div>
                        <div class="grid-container ">
                            <div class="form-group">
                                <label for="priceOnRawConstruction">Raw Construction:</label>
                                <form:input type="number" path="priceOnRawConstruction" id="rawConstruction" step="0.01" min="0" max="${quote.quotesConstructionCost}" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="priceOnCompleteConstruction">Complete Construction:</label>
                                <form:input type="number" path="priceOnCompleteConstruction" id="completeConstruction" step="0.01" min="0" max="${quote.quotesConstructionCost}" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="totalConstructionCost">Total Construction Cost:</label>
                                <input type="number" id="totalConstructionCost" step="0.01" class="form-control" readonly value="${quote.quotesConstructionCost}" />
                            </div>
                        </div>
                        <div class="section-title">
                            <h3>Choose Term Option</h3>
                        </div>
                        <div class="form-group"  style="text-align: center">
                            <div class="form-check form-check-inline">
                                <input type="radio" name="termOption" id="customTerm" value="custom" class="form-check-input" onclick="showCustomTermInput()">
                                <label class="form-check-label" for="customTerm">Custom Term</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" name="termOption" id="chooseExistingTerm" value="existing" class="form-check-input" onclick="showTermSelectionModal()">
                                <label class="form-check-label" for="chooseExistingTerm">Choose Existing Term</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" name="termOption" id="followContractTerm" value="contract" class="form-check-input" onclick="setFollowContract()">
                                <label class="form-check-label" for="followContractTerm">Follow Contract Default Term</label>
                            </div>
                        </div>

                        <!-- Existing Term Selection -->
                        <div class="form-group" id="existingTermFields" style="display: none;">
                            <label for="term">Select Term:</label>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#termModal">Choose Term</button>
                            <input type="text" id="term" name="termDescription" readonly class="form-control mt-2"/>
                        </div>

                        <!-- Custom Term Fields -->
                        <div id="customTermFields" style="display: none;">
                            <div class="section-title">
                                <h3>Custom Term Percentages</h3>
                            </div>
                            <div class="grid-container">
                                <div class="form-group">
                                    <label for="percent_on_design1">Percent on Design 1:</label>
                                    <form:input path="term.percentOnDesign1" id="percent_on_design1" class="form-control" type="number" min="0" max="100"/>
                                </div>
                                <div class="form-group">
                                    <label for="percent_on_design2">Percent on Design 2:</label>
                                    <form:input path="term.percentOnDesign2" id="percent_on_design2" class="form-control" type="number" min="0" max="100"/>
                                </div>
                                <div class="form-group">
                                    <label for="percent_on_design3">Percent on Design 3:</label>
                                    <form:input path="term.percentOnDesign3" id="percent_on_design3" class="form-control" type="number" min="0" max="100"/>
                                </div>
                                <div class="form-group">
                                    <label for="percent_on_construct1">Percent on Construction 1:</label>
                                    <form:input path="term.percentOnConstruct1" id="percent_on_construct1" class="form-control" type="number" min="0" max="100"/>
                                </div>
                                <div class="form-group">
                                    <label for="percent_on_construct2">Percent on Construction 2:</label>
                                    <form:input path="term.percentOnConstruct2" id="percent_on_construct2" class="form-control" type="number" min="0" max="100"/>
                                </div>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" id="pay_on_start_of_design" name="term.payOnStartOfDesign" class="form-check-input">
                                <label class="form-check-label" for="pay_on_start_of_design">Pay on Start of Design</label>
                            </div>
                            <div class="form-check mt-2">
                                <input type="checkbox" id="pay_on_start_of_construction" name="term.payOnStartOfConstruction" class="form-check-input">
                                <label class="form-check-label" for="pay_on_start_of_construction">Pay on Start of Construction</label>
                            </div>
                        </div>
                        <div id="defaultTermFields" style="display: none;">
                            <div class="section-title">
                                <h3>Default Term Options</h3>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" id="default_pay_on_start_of_design" name="term.payOnStartOfDesign" class="form-check-input">
                                <label class="form-check-label" for="default_pay_on_start_of_design">Pay on Start of Design</label>
                            </div>
                            <div class="form-check mt-2">
                                <input type="checkbox" id="default_pay_on_start_of_construction" name="term.payOnStartOfConstruction" class="form-check-input">
                                <label class="form-check-label" for="default_pay_on_start_of_construction">Pay on Start of Construction</label>
                            </div>
                        </div>

                        <!-- Contract Note and Term -->
                        <div class="form-group" style="margin-top: 20px">
                            <label for="contractNote">Contract Note:</label>
                            <form:textarea path="contractNote" id="contractNote" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="contractTerm">Contract Term:</label>
                            <form:textarea path="contractTerm" id="contractTerm" class="form-control"/>
                        </div>
                        <!-- Terminate Date -->
                        <div style="margin: 25px 0 0 0">
                            <div class="form-group form-check-inline">
                                <label for="estimatedEndDate">Estimated End Date:</label>
                                <input type="date" id="estimatedEndDate" name="estimatedEndDate" class="form-control" style="width: 50%;" min="" required>
                            </div>
                        </div>
                        <!-- Total Price -->
                        <div class="form-group">
                            <label for="totalPrice">Total Price:</label>
                            <form:input path="totalPrice" id="totalPrice" step="0.01" class="form-control" readonly="true"/>
                        </div>
                        <!-- Button to Adjust Costs -->
                        <div class="form-group">
                            <button type="button" class="btn btn-warning" onclick="autoAdjust()">Auto Adjust Costs</button>
                        </div>
                        <!-- File Input -->
                        <div class="form-group">
                            <label for="file">Choose file:</label>
                            <input type="file" id="file" name="file" class="form-control-file"/>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Create Contract</button>
                    </form:form>
                </div>
            </div>

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







            <!-- JavaScript for handling term selection -->
            <script>
                const today = new Date().toISOString().split("T")[0];
                document.getElementById("estimatedEndDate").setAttribute("min", today);

                function selectTerm(termId, description) {
                    document.getElementById('selectedTermId').value = termId; // Set the selected term ID
                    document.getElementById('term').value = description; // Display the description in the read-only field
                    $('#termModal').modal('hide'); // Close the modal
                }

            </script>

            <!-- JavaScript for Auto Adjustment and Validation -->
            <script>
                // Existing Functionality: JavaScript for Auto Adjustment and Validation
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

                        // Adjust values proportionally
                        let proportion = difference / totalDesign;
                        concept += concept * proportion;
                        detail += detail * proportion;
                        construction += construction * proportion;
                    }

                    // Set the adjusted values back to the input fields
                    document.getElementById('conceptDesign').value = concept.toFixed(2);
                    document.getElementById('detailDesign').value = detail.toFixed(2);
                    document.getElementById('constructionDesign').value = construction.toFixed(2);
                    document.getElementById('totalDesignCost').value = maxDesignCost.toFixed(2);
                }

                function adjustConstructionCosts() {
                    let raw = parseFloat(document.getElementById('rawConstruction').value) || 0;
                    let complete = parseFloat(document.getElementById('completeConstruction').value) || 0;

                    let totalConstruction = raw + complete;

                    // Set default values if nothing is input
                    if (totalConstruction === 0) {
                        raw = maxConstructionCost / 2;
                        complete = maxConstructionCost / 2;
                    } else if (totalConstruction !== maxConstructionCost) {
                        let difference = maxConstructionCost - totalConstruction;

                        // Adjust values proportionally
                        let proportion = difference / totalConstruction;
                        raw += raw * proportion;
                        complete += complete * proportion;
                    }

                    // Set the adjusted values back to the input fields
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

// Existing Functionality: JavaScript for handling term selection
                function selectTerm(termId, description) {
                    document.getElementById('selectedTermId').value = termId; // Set the selected term ID
                    document.getElementById('term').value = description; // Display the description in the read-only field
                    $('#termModal').modal('hide'); // Close the modal
                }

// Existing Functionality: Show/hide term selection and custom term input
                function showTermSelectionModal() {
                    document.getElementById('existingTermFields').style.display = 'block';
                    document.getElementById('customTermFields').style.display = 'none';
                    document.getElementById('defaultTermFields').style.display = 'none';

                    
                    $('#termModal').modal('show'); // Show the modal for selecting existing terms
                }

                function showCustomTermInput() {
                    document.getElementById('customTermFields').style.display = 'block';
                    document.getElementById('existingTermFields').style.display = 'none';
                    document.getElementById('selectedTermId').value = '0'; // Ensure a valid integer value is set
                    document.getElementById('term').value = ''; // Clear selected term description
                    document.getElementById('defaultTermFields').style.display = 'none';

                }

//                function setFollowContract() {
//                    document.getElementById('customTermFields').style.display = 'none';
//                    document.getElementById('existingTermFields').style.display = 'none';
//                    document.getElementById('selectedTermId').value = '0'; // Clear selected term ID
//                    document.getElementById('term').value = 'Following contract terms';
//                }
                function setFollowContract() {
                    // Hide other term input sections
                    document.getElementById('customTermFields').style.display = 'none';
                    document.getElementById('existingTermFields').style.display = 'none';

                    // Show default term checkboxes
                    document.getElementById('defaultTermFields').style.display = 'block';

                    // Reset values to avoid conflicts
                    document.getElementById('selectedTermId').value = '0'; // Clear selected term ID
                    document.getElementById('term').value = 'Following contract terms';
                }

// New Functionality: Prevent special characters and negative values in inputs
                document.querySelectorAll('input[type="number"]').forEach(input => {
                    input.addEventListener('input', function () {
                        // Remove any characters that are not digits or dots (allowing decimal numbers)
                        this.value = this.value.replace(/[^0-9.]/g, '');
                    });

                    input.addEventListener('blur', function () {
                        // Prevent negative values by setting any negative number to zero
                        if (parseFloat(this.value) < 0) {
                            this.value = 0;
                        }
                    });
                });

// New Functionality: Validate custom term inputs for negative values
                function validateCustomTermInputs() {
                    const customTermFields = [
                        'percent_on_design1',
                        'percent_on_design2',
                        'percent_on_design3',
                        'percent_on_construct1',
                        'percent_on_construct2'
                    ];

                    let isValid = true;

                    customTermFields.forEach(fieldId => {
                        const field = document.getElementById(fieldId);
                        const value = parseFloat(field.value);

                        // Check if the value is negative or NaN (if the field is empty)
                        if (isNaN(value) || value < 0) {
                            isValid = false;
                            field.classList.add('is-invalid'); // Add invalid class for styling
                            alert('Values in custom term fields must be zero or positive.');
                        } else {
                            field.classList.remove('is-invalid'); // Remove the invalid class if valid
                        }
                    });

                    return isValid;
                }

// Prevent form submission if validation fails
                document.querySelector('form').addEventListener('submit', function (event) {
                    const termOption = document.querySelector('input[name="termOption"]:checked');
                    const estimatedEndDate = document.getElementById('estimatedEndDate').value;

                    // Check if estimated end date is provided
                    if (!estimatedEndDate) {
                        alert('Please select an estimated end date.');
                        event.preventDefault();
                        return;
                    }
                    // Check if a term option is selected
                    if (!termOption) {
                        alert('Please select a term option.');
                        event.preventDefault();
                        return;
                    }

                    // Validate custom term fields if the custom option is selected
                    if (termOption.value === 'custom') {
                        if (!validateCustomTermInputs()) {
                            event.preventDefault();
                            return;
                        }

                        // Validate that the total percentage is between 99% and 100.5%
                        const totalPercent =
                                parseFloat(document.getElementById('percent_on_design1').value || 0) +
                                parseFloat(document.getElementById('percent_on_design2').value || 0) +
                                parseFloat(document.getElementById('percent_on_design3').value || 0) +
                                parseFloat(document.getElementById('percent_on_construct1').value || 0) +
                                parseFloat(document.getElementById('percent_on_construct2').value || 0);

                        if (totalPercent < 99 || totalPercent > 100.5) {
                            alert('Total percentage for all stages must be between 99% and 100.5%.');
                            event.preventDefault();
                            return;
                        }
                    }

                    // Validate for existing term selection if "existing" option is selected
                    if (termOption.value === 'existing' && !document.getElementById('selectedTermId').value) {
                        alert('Please select an existing term.');
                        event.preventDefault();
                        return;
                    }

                    // Ensure the total price matches the quote price
                    const totalPrice = parseFloat(document.getElementById('totalPrice').value) || 0;
                    if (totalPrice !== totalQuotePrice) {
                        alert('The total price must match the total quote price.');
                        event.preventDefault();
                        return;
                    }

                    // Ensure the total design cost matches the quote's design cost
                    const totalDesign = parseFloat(document.getElementById('conceptDesign').value || 0) +
                            parseFloat(document.getElementById('detailDesign').value || 0) +
                            parseFloat(document.getElementById('constructionDesign').value || 0);
                    if (totalDesign !== maxDesignCost) {
                        alert('The total of design costs must match the quoted design cost.');
                        event.preventDefault();
                        return;
                    }

                    // Ensure the total construction cost matches the quote's construction cost
                    const totalConstruction = parseFloat(document.getElementById('rawConstruction').value || 0) +
                            parseFloat(document.getElementById('completeConstruction').value || 0);
                    if (totalConstruction !== maxConstructionCost) {
                        alert('The total of construction costs must match the quoted construction cost.');
                        event.preventDefault();
                        return;
                    }

                    // Validate all number fields for negative values
                    if (!validateFields()) {
                        event.preventDefault();
                        return;
                    }
                });

// Function to prevent negative values in input fields (called during submission)
                function validateFields() {
                    let fields = ['conceptDesign', 'detailDesign', 'constructionDesign', 'rawConstruction', 'completeConstruction', 'totalDesignCost', 'totalConstructionCost', 'totalPrice'];
                    let isValid = true;

                    fields.forEach(function (fieldId) {
                        let field = document.getElementById(fieldId);
                        let value = parseFloat(field.value);

                        if (value < 0) {
                            isValid = false;
                            field.classList.add('is-invalid'); // Mark the field as invalid
                            alert('Value for ' + fieldId + ' cannot be less than 0.');
                        } else {
                            field.classList.remove('is-invalid'); // Remove the invalid class if value is valid
                        }
                    });

                    return isValid;
                }

            </script>

        </div>

        <!-- Bootstrap JS and dependencies -->

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>

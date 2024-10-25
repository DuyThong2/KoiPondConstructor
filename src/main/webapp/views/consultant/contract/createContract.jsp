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
                        <p><strong>Area:</strong> ${quote.quotesArea} m�</p>
                        <p><strong>Total Price:</strong> ${quote.quotesTotalPrice}</p>
                    </div>
                </div>

                <!-- Right Column for Contract Creation Form -->
                <div class="col-md-8">
                    <h2 class="mb-4">Create Contract</h2>

                    <!-- Bind the form to the "contract" object -->
                    <form:form action="${pageContext.request.contextPath}/consultant/contract/create" modelAttribute="contract" method="post" enctype="multipart/form-data" class="needs-validation" novalidate="true">
                        <form:hidden path="term.termId" id="selectedTermId" value="${term.termId != null ? term.termId : 0}"/>

                        <form:hidden path="quote.quotesId" value="${quote.quotesId}"/>
                        <form:hidden path="customer.id" value="${customer.id}" />

                        <!-- Total Price (Read-Only, auto-calculated) -->
                        <div class="form-group">
                            <label for="totalPrice">Total Price:</label>
                            <form:input path="totalPrice" id="totalPrice" step="0.01" class="form-control" readonly="true"/>
                        </div>

                        <!-- Design Costs -->
                        <h4>Design Phases</h4>

                        <!-- Conceptual Design -->
                        <div class="form-group">
                            <label for="priceOnConceptDesign">Conceptual Design:</label>
                            <form:input type="number" path="priceOnConceptDesign" id="conceptDesign" step="0.01" min="0" max="${quote.quotesDesignCost}" class="form-control"/>
                        </div>

                        <!-- Detailed Design -->
                        <div class="form-group">
                            <label for="priceOnDetailDesign">Detailed Design:</label>
                            <form:input type="number" path="priceOnDetailDesign" id="detailDesign" step="0.01" min="0" max="${quote.quotesDesignCost}" class="form-control"/>
                        </div>

                        <!-- Construction Design -->
                        <div class="form-group">
                            <label for="priceOnConstructionDesign">Construction Design:</label>
                            <form:input type="number" path="priceOnConstructionDesign" id="constructionDesign" step="0.01" min="0" max="${quote.quotesDesignCost}" class="form-control"/>
                        </div>

                        <!-- Total Design Cost (Used for calculation only) -->
                        <div class="form-group">
                            <label for="totalDesignCost">Total Design Cost:</label>
                            <input type="number" id="totalDesignCost" step="0.01" class="form-control" readonly/>
                        </div>

                        <!-- Construction Costs -->
                        <h4>Construction Phases</h4>

                        <!-- Raw Construction -->
                        <div class="form-group">
                            <label for="priceOnRawConstruction">Raw Construction:</label>
                            <form:input type="number" path="priceOnRawConstruction" id="rawConstruction" step="0.01" min="0" max="${quote.quotesConstructionCost}" class="form-control"/>
                        </div>

                        <!-- Complete Construction -->
                        <div class="form-group">
                            <label for="priceOnCompleteConstruction">Complete Construction:</label>
                            <form:input type="number" path="priceOnCompleteConstruction" id="completeConstruction" step="0.01" min="0" max="${quote.quotesConstructionCost}" class="form-control"/>
                        </div>

                        <!-- Total Construction Cost (Used for calculation only) -->
                        <div class="form-group">
                            <label for="totalConstructionCost">Total Construction Cost:</label>
                            <input type="number" id="totalConstructionCost" step="0.01" class="form-control" readonly/>
                        </div>

                        <!-- Term Selection Dropdown -->
                        <div class="form-group">
                            <label>Choose Term Option:</label>
                            <div class="form-check">
                                <input type="radio" name="termOption" id="customTerm" value="custom" class="form-check-input" onclick="showCustomTermInput()">
                                <label class="form-check-label" for="customTerm">Custom Term</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" name="termOption" id="chooseExistingTerm" value="existing" class="form-check-input" onclick="showTermSelectionModal()">
                                <label class="form-check-label" for="chooseExistingTerm">Choose Existing Term</label>
                            </div>

                            <div class="form-check">
                                <input type="radio" name="termOption" id="followContractTerm" value="contract" class="form-check-input" onclick="setFollowContract()">
                                <label class="form-check-label" for="followContractTerm">Follow Contract Default Term</label>
                            </div>
                        </div>

                        <div class="form-group" id="existingTermFields" style="display: none;">
                            <label for="term">Select Term:</label>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#termModal">
                                Choose Term
                            </button>

                            <input type="text" id="term" name="termDescription" readonly class="form-control" />
                        </div>
                        <div id="customTermFields" style="display: none;">
                            <h4>Custom Term Percentages</h4>
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
                            <div class="form-group">
                                <label for="pay_on_start_of_design">Pay on Start of Design:</label>
                                <input type="checkbox" id="pay_on_start_of_design" name="term.payOnStartOfDesign" style="margin-left: 10px" class="form-check-input">
                            </div>
                            <div class="form-group">
                                <label for="pay_on_start_of_construction">Pay on Start of Construction:</label>
                                <input type="checkbox" id="pay_on_start_of_construction" name="term.payOnStartOfConstruction" style="margin-left: 10px" class="form-check-input">
                            </div>
                        </div>


                        <!-- Button to Adjust Costs -->
                        <div class="form-group">
                            <button type="button" class="btn btn-warning" onclick="autoAdjust()">Auto Adjust Costs</button>
                        </div>

                        <!-- Contract Note -->
                        <div class="form-group">
                            <label for="contractNote">Contract Note:</label>
                            <form:textarea path="contractNote" id="contractNote" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label for="contractTerm">Contract Term:</label>
                            <form:textarea path="contractTerm" id="contractTerm" class="form-control"/>
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


                function selectTerm(termId, description) {
                    document.getElementById('selectedTermId').value = termId; // Set the selected term ID
                    document.getElementById('term').value = description; // Display the description in the read-only field
                    $('#termModal').modal('hide'); // Close the modal
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

                // Prevent form submission if the total price does not match the total quote price
                document.querySelector('form').addEventListener('submit', function (event) {
                    const termOption = document.querySelector('input[name="termOption"]:checked');
                    if (!termOption) {
                        alert('Please select a term option.');
                        event.preventDefault();
                        return;
                    }

                    // Validation for Custom Term Option
                    if (termOption.value === 'custom') {
                        const totalPercent = parseFloat(document.getElementById('percent_on_design1').value || 0) +
                                parseFloat(document.getElementById('percent_on_design2').value || 0) +
                                parseFloat(document.getElementById('percent_on_design3').value || 0) +
                                parseFloat(document.getElementById('percent_on_construct1').value || 0) +
                                parseFloat(document.getElementById('percent_on_construct2').value || 0);

                        if (totalPercent < 99 || totalPercent > 100.5) {
                            alert('Total percentage for all stages must be between 99% and 100.5%.');
                            event.preventDefault();
                            return;
                        }

                        // No need to check for selected term ID if custom term is chosen
                        document.getElementById('selectedTermId').value = '0';
                    }

                    // Validation for Existing Term Option
                    if (termOption.value === 'existing') {
                        const selectedTermId = document.getElementById('selectedTermId').value;
                        if (!selectedTermId) {
                            alert('Please select an existing term.');
                            event.preventDefault();
                            return;
                        }
                    }

                    // Ensure the total price matches the quote price
                    const totalPrice = parseFloat(document.getElementById('totalPrice').value) || 0;
                    if (totalPrice !== totalQuotePrice) {
                        alert('The total price must match the total quote price.');
                        event.preventDefault();
                        return;
                    }

                    // Validate fields for negative values
                    if (!validateFields()) {
                        event.preventDefault();
                        return;
                    }
                });

// Function to prevent negative values in input fields
                function validateFields() {
                    let fields = ['conceptDesign', 'detailDesign', 'constructionDesign', 'rawConstruction', 'completeConstruction', 'totalDesignCost', 'totalConstructionCost', 'totalPrice'];
                    let isValid = true; // Assume valid unless we find an invalid field

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


                document.querySelector('form').addEventListener('submit', function (event) {
                    const termOption = document.querySelector('input[name="termOption"]:checked');
                    if (!termOption) {
                        alert('Please select a term option.');
                        event.preventDefault();
                        return;
                    }

                    if (termOption.value === 'custom') {
                        // Validate custom term percentages
                        const totalPercent = parseFloat(document.getElementById('percent_on_design1').value) +
                                parseFloat(document.getElementById('percent_on_design2').value) +
                                parseFloat(document.getElementById('percent_on_design3').value) +
                                parseFloat(document.getElementById('percent_on_construct1').value) +
                                parseFloat(document.getElementById('percent_on_construct2').value);

                        if (totalPercent !== 100) {
                            alert('Total percentage for all stages must equal 100%.');
                            event.preventDefault();
                            return;
                        }
                    } else if (termOption.value === 'existing' && !document.getElementById('selectedTermId').value) {
                        alert('Please select an existing term.');
                        event.preventDefault();
                        return;
                    }
                });




                function showTermSelectionModal() {
                    document.getElementById('existingTermFields').style.display = 'block';
                    document.getElementById('customTermFields').style.display = 'none';
                    $('#termModal').modal('show'); // Show the modal for selecting existing terms
                }

                function showCustomTermInput() {
                    document.getElementById('customTermFields').style.display = 'block';
                    document.getElementById('existingTermFields').style.display = 'none';
                    document.getElementById('selectedTermId').value = '0'; // Ensure a valid integer value is set
                    document.getElementById('term').value = ''; // Clear selected term description
                }


                function setFollowContract() {
                    document.getElementById('customTermFields').style.display = 'none';
                    document.getElementById('existingTermFields').style.display = 'none';
                    document.getElementById('selectedTermId').value = '0'; // Clear selected term ID
                    document.getElementById('term').value = 'Following contract terms';
                }
            </script>

        </div>

        <!-- Bootstrap JS and dependencies -->
       
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>

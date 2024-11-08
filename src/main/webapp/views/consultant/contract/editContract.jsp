<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Contract</title>
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
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <jsp:include page="../consultantNav.jsp"/>
            <div class="row">
                <div class="col-md-4">
                    <div class="quote-info">
                        <h4>Quote Information</h4>
                        <div class="customer-info">
                            <c:choose>
                                <c:when test='${quote.customer.imgURL != null}'>
                                    <img src="${quote.customer.getShowingImg(quote.customer.imgURL)}"
                                         alt="Customer Avatar" class="customer-avatar img-fluid" />
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/assets/imgs/logo/final_resized_colored_logo_image.png"
                                         alt="Customer Avatar" class="customer-avatar img-fluid" />
                                </c:otherwise>
                            </c:choose>
                            <p><strong>${quote.customer.name}</strong></p>
                        </div>
                        <p><strong>Quote ID:</strong> ${quote.quotesId}</p>
                        <p><strong>Quote Name:</strong> ${quote.quotesName}</p>
                        <p><strong>Customer:</strong> ${quote.customer.name}</p>
                        <p><strong>Total Design Cost:</strong> ${quote.quotesDesignCost}</p>
                        <p><strong>Total Construction Cost:</strong> ${quote.quotesConstructionCost}</p>
                        <p><strong>Area:</strong> ${quote.quotesArea} m�</p>
                        <p><strong>Total Price:</strong> ${quote.quotesTotalPrice}</p>
                    </div>
                </div>

                <div class="col-md-8">
                    <h2 class="mb-4">Edit Contract</h2>

                    <form:form action="${pageContext.request.contextPath}/consultant/contract/edit" modelAttribute="contract" method="post" enctype="multipart/form-data" class="needs-validation" novalidate="true">
                        <form:hidden path="contractId"/>
                        <form:hidden path="term.termId" id="selectedTermId"/>
                        <form:hidden path="quote.quotesId"/>
                        <form:hidden path="customer.id"/>
                        <form:hidden path="fileURL"/>

                        <div class="form-group">
                            <label for="totalPrice">Total Price:</label>
                            <form:input path="totalPrice" id="totalPrice" step="0.01" class="form-control" readonly="true"/>
                        </div>

                        <h4>Design Phases</h4>
                        <div class="form-group">
                            <label for="priceOnConceptDesign">Conceptual Design:</label>
                            <form:input type="number" path="priceOnConceptDesign" id="conceptDesign" step="0.01" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="priceOnDetailDesign">Detailed Design:</label>
                            <form:input type="number" path="priceOnDetailDesign" id="detailDesign" step="0.01" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="priceOnConstructionDesign">Construction Design:</label>
                            <form:input type="number" path="priceOnConstructionDesign" id="constructionDesign" step="0.01" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="totalDesignCost">Total Design Cost:</label>
                            <input type="number" id="totalDesignCost" step="0.01" class="form-control" readonly/>
                        </div>

                        <h4>Construction Phases</h4>
                        <div class="form-group">
                            <label for="priceOnRawConstruction">Raw Construction:</label>
                            <form:input type="number" path="priceOnRawConstruction" id="rawConstruction" step="0.01" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="priceOnCompleteConstruction">Complete Construction:</label>
                            <form:input type="number" path="priceOnCompleteConstruction" id="completeConstruction" step="0.01" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="totalConstructionCost">Total Construction Cost:</label>
                            <input type="number" id="totalConstructionCost" step="0.01" class="form-control" readonly/>
                        </div>

                        <div class="form-group">
                            <label>Choose Term Option:</label>
                            <div class="form-check">
                                <input type="radio" name="termOption" id="customTerm" value="custom" class="form-check-input" onclick="showCustomTermInput()" <c:if test="${contract.term != null && !contract.term.isTemplate}">checked</c:if>>
                                    <label class="form-check-label" for="customTerm">Custom Term</label>
                                </div>
                                <div class="form-check">
                                    <input type="radio" name="termOption" id="chooseExistingTerm" value="existing" class="form-check-input" onclick="showTermSelectionModal()" <c:if test="${contract.term != null && contract.term.isTemplate}">checked</c:if>>
                                    <label class="form-check-label" for="chooseExistingTerm">Choose Existing Term</label>
                                </div>
                                <div class="form-check">
                                    <input type="radio" name="termOption" id="followContractTerm" value="contract" class="form-check-input" onclick="setFollowContract()" <c:if test="${contract.term != null && contract.term.followContract && !contract.term.isTemplate}">checked</c:if>>
                                    <label class="form-check-label" for="followContractTerm">Follow Contract Default Term</label>
                                </div>
                            </div>

                            <div class="form-group" id="existingTermFields" style="display: none;">
                                <label for="term">Select Term:</label>
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#termModal">Choose Term</button>
                                <input type="text" id="term" name="termDescription" readonly class="form-control" value="${contract.term.description}"/>
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

                        <div class="form-group">
                            <button type="button" class="btn btn-warning" onclick="autoAdjust()">Auto Adjust Costs</button>
                        </div>

                        <div class="form-group">
                            <label for="contractNote">Contract Note:</label>
                            <form:textarea path="contractNote" id="contractNote" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="contractTerm">Contract Term:</label>
                            <form:textarea path="contractTerm" id="contractTerm" class="form-control"/>
                        </div>
                        <div style="margin: 25px 0 0 0">
                            <div class="form-group form-check-inline">
                                <div class="form-group form-check-inline">
                                    <label for="estimatedEndDate">Estimated End Date:</label>
                                    <input type="date" id="estimatedEndDate" name="estimatedEndDate" class="form-control" style="width: 50%;" min="" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="file">Choose file:</label>
                            <input type="file" id="file" name="file" class="form-control-file"/>
                        </div>

                        <button type="submit" class="btn btn-primary">Update Contract</button>
                    </form:form>
                </div>
            </div>

            <!-- Include modal for term selection and scripts as before -->
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


                document.addEventListener('DOMContentLoaded', function () {
                    const termOption = document.querySelector('input[name="termOption"]:checked');
                    if (termOption) {
                        if (termOption.value === 'custom') {
                            showCustomTermInput();
                        } else if (termOption.value === 'existing') {
                            showTermSelectionModal();
                        } else if (termOption.value === 'contract') {
                            setFollowContract();
                        }
                    }
                });

                const maxDesignCost = ${quote.quotesDesignCost};  // Design cost from the Quote
                const maxConstructionCost = ${quote.quotesConstructionCost};  // Construction cost from the Quote
                const totalQuotePrice = ${quote.quotesTotalPrice};  // Total price from the Quote

                function autoAdjust() {
                    adjustDesignCosts();
                    adjustConstructionCosts();
                    updateTotalPrice();
                }

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

                    const estimatedEndDate = document.getElementById('estimatedEndDate').value;

                    // Check if estimated end date is provided
                    if (!estimatedEndDate) {
                        alert('Please select an estimated end date.');
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
                            alert('Total percentage for all stages must be 100%.');
                            event.preventDefault();
                            return;
                        }

                        // No need to check for selected term ID if custom term is chosen
                        document.getElementById('selectedTermId').value = '0';
                    }

                    // Validation for Existing Term Option
                    if (termOption.value === 'existing' && (!document.getElementById('selectedTermId').value || parseInt(document.getElementById('selectedTermId').value) <= 0)) {
                        alert('Please select a valid existing term.');
                        event.preventDefault();
                        return;
                    }

                    // Ensure the total price matches the quote price
                    const totalPrice = parseFloat(document.getElementById('totalPrice').value) || 0;
                    if (Math.abs(totalPrice - totalQuotePrice) > 0.1) {
                        alert('The total price must match the total quote price.');
                        event.preventDefault();
                        return;
                    }

// Ensure the total design cost matches the quote's design cost with a precision tolerance
                    const totalDesign = parseFloat(document.getElementById('conceptDesign').value || 0) +
                            parseFloat(document.getElementById('detailDesign').value || 0) +
                            parseFloat(document.getElementById('constructionDesign').value || 0);

                    if (Math.abs(totalDesign - maxDesignCost) > 0.1) {
                        alert('The total of design costs must match the quoted design cost.');
                        event.preventDefault();
                        return;
                    }

// Ensure the total construction cost matches the quote's construction cost with a precision tolerance
                    const totalConstruction = parseFloat(document.getElementById('rawConstruction').value || 0) +
                            parseFloat(document.getElementById('completeConstruction').value || 0);

                    if (Math.abs(totalConstruction - maxConstructionCost) > 0.1) {
                        alert('The total of construction costs must match the quoted construction cost.');
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
                    document.getElementById('defaultTermFields').style.display = 'none';
                    $('#termModal').modal('show'); // Show the modal for selecting existing terms
                }

                function showCustomTermInput() {
                    document.getElementById('customTermFields').style.display = 'block';
                    document.getElementById('existingTermFields').style.display = 'none';
                    document.getElementById('selectedTermId').value = '0'; // Ensure a valid integer value is set
                    document.getElementById('defaultTermFields').style.display = 'none';
                    document.getElementById('term').value = ''; // Clear selected term description
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

            </script>
        </div>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

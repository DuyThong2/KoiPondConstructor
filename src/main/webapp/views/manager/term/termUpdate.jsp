<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Input Term Information</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                padding-top: 50px;
            }
            .container {
                max-width: 900px;
                margin: auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
                color: #007bff;
                margin-bottom: 30px;
            }
            .form-row {
                display: flex;
                justify-content: space-between;
            }
            .form-box {
                background-color: #f0f2f5;
                padding: 20px;
                border-radius: 10px;
                width: 48%;
            }
            .form-box h5 {
                color: #343a40;
                margin-bottom: 15px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .custom-control-label {
                margin-left: 10px;
            }
            textarea {
                resize: none;
            }
            .btn-submit, .btn-adjust {
                background-color: #007bff;
                color: white;
                font-size: 16px;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                margin-top: 15px;
            }
            .btn-submit:hover, .btn-adjust:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Term Information</h2>

            <!-- Form Binding with Spring -->
            <form:form modelAttribute="term" action="/manager/updateTerm" method="PUT">
                <form:hidden path="termId" value="${term.termId}" />

                <!-- Design and Construction Percentages Row -->
                <div class="form-row">
                    <!-- Design Box -->
                    <div class="form-box">
                        <h5>Design Percentages</h5>
                        <div class="form-group">
                            <label for="percent_on_design1">Percent on Design 1</label>
                            <form:input path="percentOnDesign1" value="${term.percentOnDesign1}" class="form-control" id="percent_on_design1" min="0" max="100" step="0.01" />
                            <form:errors path="percentOnDesign1" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="percent_on_design2">Percent on Design 2</label>
                            <form:input path="percentOnDesign2" value="${term.percentOnDesign2}" class="form-control" id="percent_on_design2" min="0" max="100" step="0.01" />
                            <form:errors path="percentOnDesign2" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="percent_on_design3">Percent on Design 3</label>
                            <form:input path="percentOnDesign3" value="${term.percentOnDesign3}" class="form-control" id="percent_on_design3" min="0" max="100" step="0.01" />
                            <form:errors path="percentOnDesign3" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="pay_on_start_of_design">Pay on Start of Design</label>
                            <form:checkbox path="payOnStartOfDesign" class="custom-control-input" id="pay_on_start_of_design" checked="${term.payOnStartOfDesign}" />
                            <label class="custom-control-label" for="pay_on_start_of_design">Yes</label>
                        </div>
                    </div>

                    <!-- Construction Box -->
                    <div class="form-box">
                        <h5>Construction Percentages</h5>
                        <div class="form-group">
                            <label for="percent_on_construct1">Percent on Raw construction</label>
                            <form:input path="percentOnConstruct1" value="${term.percentOnConstruct1}" class="form-control" id="percent_on_construct1" min="0" max="100" step="0.01" />
                            <form:errors path="percentOnConstruct1" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="percent_on_construct2">Percent on Complete construction</label>
                            <form:input path="percentOnConstruct2" value="${term.percentOnConstruct2}" class="form-control" id="percent_on_construct2" min="0" max="100" step="0.01" />
                            <form:errors path="percentOnConstruct2" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="pay_on_start_of_construction">Pay on Start of Construction</label>
                            <form:checkbox path="payOnStartOfConstruction" class="custom-control-input" id="pay_on_start_of_construction" checked="${term.payOnStartOfConstruction}" />
                            <label class="custom-control-label" for="pay_on_start_of_construction">Yes</label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Description or Comments</label>
                    <form:textarea path="description" value="${term.description}" class="form-control" id="description" rows="4" />
                    <form:errors path="description" cssClass="text-danger" />
                </div>

                <!-- Adjust Button -->
                <div class="text-center">
                    <button type="button" class="btn-adjust" onclick="adjustPercentages()">Adjust Percentages</button>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="btn btn-submit">Submit</button>
                </div>
            </form:form>
        </div>

        <!-- JavaScript to adjust and validate percentages -->
        <script>
            const maxTotalCost = 100; // The combined total of all design and construction stages should be 100%

            document.addEventListener('DOMContentLoaded', function () {
                // Add event listener to the form to prevent submission if the combined total is not 100% or negative values exist
                document.querySelector('form').addEventListener('submit', function (event) {
                    const total = getTotal();
                    if (!(99.6 <= total <= 100)) {
                        event.preventDefault(); // Prevent form submission
                        alert('The total percentage for all Design and Construction stages combined must add up to 100%.');
                    }

                    // Validate negative values
                    if (!validateFields()) {
                        event.preventDefault(); // Prevent form submission if there are invalid fields
                    }
                });
            });

            function adjustPercentages() {
                adjustCombinedCosts();
            }

            function adjustCombinedCosts() {
                let design1 = parseFloat(document.getElementById('percent_on_design1').value) || 0;
                let design2 = parseFloat(document.getElementById('percent_on_design2').value) || 0;
                let design3 = parseFloat(document.getElementById('percent_on_design3').value) || 0;
                let construct1 = parseFloat(document.getElementById('percent_on_construct1').value) || 0;
                let construct2 = parseFloat(document.getElementById('percent_on_construct2').value) || 0;

                let total = design1 + design2 + design3 + construct1 + construct2;

                if (total !== maxTotalCost) {
                    let difference = maxTotalCost - total;

                    // Adjust values proportionally
                    let proportion = difference / total;
                    design1 += design1 * proportion;
                    design2 += design2 * proportion;
                    design3 += design3 * proportion;
                    construct1 += construct1 * proportion;
                    construct2 += construct2 * proportion;

                    // Set the adjusted values back to the input fields
                    document.getElementById('percent_on_design1').value = design1.toFixed(2);
                    document.getElementById('percent_on_design2').value = design2.toFixed(2);
                    document.getElementById('percent_on_design3').value = design3.toFixed(2);
                    document.getElementById('percent_on_construct1').value = construct1.toFixed(2);
                    document.getElementById('percent_on_construct2').value = construct2.toFixed(2);
                }
            }

            function getTotal() {
                let design1 = parseFloat(document.getElementById('percent_on_design1').value) || 0;
                let design2 = parseFloat(document.getElementById('percent_on_design2').value) || 0;
                let design3 = parseFloat(document.getElementById('percent_on_design3').value) || 0;
                let construct1 = parseFloat(document.getElementById('percent_on_construct1').value) || 0;
                let construct2 = parseFloat(document.getElementById('percent_on_construct2').value) || 0;
                return design1 + design2 + design3 + construct1 + construct2;
            }

            // Function to validate negative values in the input fields
            function validateFields() {
                let isValid = true;  // Assume valid unless we find invalid input

                const fields = ['percent_on_design1', 'percent_on_design2', 'percent_on_design3', 'percent_on_construct1', 'percent_on_construct2'];

                fields.forEach(function (fieldId) {
                    let field = document.getElementById(fieldId);
                    let value = parseFloat(field.value);

                    if (value < 0) {
                        isValid = false;  // Set to false if any invalid field is found
                        field.classList.add('is-invalid');  // Add invalid class to highlight the field
                        alert('Value for ' + fieldId + ' cannot be less than 0.');
                    } else {
                        field.classList.remove('is-invalid');  // Remove the invalid class if value is valid
                    }
                });

                return isValid;
            }

            // Add 'input' event listeners to prevent typing negative values
            document.getElementById('percent_on_design1').addEventListener('input', preventNegative);
            document.getElementById('percent_on_design2').addEventListener('input', preventNegative);
            document.getElementById('percent_on_design3').addEventListener('input', preventNegative);
            document.getElementById('percent_on_construct1').addEventListener('input', preventNegative);
            document.getElementById('percent_on_construct2').addEventListener('input', preventNegative);

            // Prevent negative values in real-time as users type
            function preventNegative(event) {
                if (event.target.value < 0) {
                    event.target.value = 0;  // Reset to 0 if a negative value is typed
                }
            }
        </script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>

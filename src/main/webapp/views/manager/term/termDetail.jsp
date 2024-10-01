<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Term Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Term Details</h2>

            <div class="card">
                <div class="card-header">
                    Term ID: ${term.termId}
                </div>
                <div class="card-body">
                    <h5 class="card-title">Description: ${term.description}</h5>
                    <p class="card-text"><strong>Template:</strong> <c:if test="${term.isTemplate}">Yes</c:if><c:if test="${!term.isTemplate}">No</c:if></p>
                    <p class="card-text"><strong>Follow Contract:</strong> <c:if test="${term.followContract}">Yes</c:if><c:if test="${!term.followContract}">No</c:if></p>
                    <p class="card-text"><strong>Percent on Design Stage 1:</strong> ${term.percentOnDesign1}%</p>
                    <p class="card-text"><strong>Percent on Design Stage 2:</strong> ${term.percentOnDesign2}%</p>
                    <p class="card-text"><strong>Percent on Design Stage 3:</strong> ${term.percentOnDesign3}%</p>
                    <p class="card-text"><strong>Percent on Construction Stage 1:</strong> ${term.percentOnConstruct1}%</p>
                    <p class="card-text"><strong>Percent on Construction Stage 2:</strong> ${term.percentOnConstruct2}%</p>
                    <p class="card-text"><strong>Pay on Start of Design:</strong> <c:if test="${term.payOnStartOfDesign}">Yes</c:if><c:if test="${!term.payOnStartOfDesign}">No</c:if></p>
                    <p class="card-text"><strong>Pay on Start of Construction:</strong> <c:if test="${term.payOnStartOfConstruction}">Yes</c:if><c:if test="${!term.payOnStartOfConstruction}">No</c:if></p>
                    <p class="card-text"><strong>Description:</strong> ${term.description}</p>
                </div>
            </div>

            <!-- Back Button -->
            <div class="mt-4">
                <a href="/manager/terms" class="btn btn-primary">Back to Term List</a>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
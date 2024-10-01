<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Term Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table th, .table td {
            vertical-align: middle;
        }
        .pagination {
            justify-content: center;
        }
        .form-inline .form-group {
            margin-bottom: 15px;
        }
        /* Add styling for the detail row */
        .details-row {
            display: none;
        }
        .details-row td {
            background-color: #f9f9f9;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Term Management</h2>

        <!-- Insert New Term Button -->
        <div class="mb-4 text-right">
            <a href="/manager/term/new" class="btn btn-success">Insert New Term</a>
        </div>

        <!-- Filter, Sort, and Search Form -->
        <form method="get" action="/manager/term" class="form-inline justify-content-center row">
            <div class="form-group col-12 col-md-4 mb-2">
                <label for="searchDescription" class="mr-2">Search by Description:</label>
                <input type="text" class="form-control" name="searchDescription" id="searchDescription" value="${searchDescription}" placeholder="Enter description">
            </div>

            <div class="form-group col-12 col-md-3 mb-2">
                <label for="statusFilter" class="mr-2">Filter by Status:</label>
                <select name="statusFilter" id="statusFilter" class="form-control">
                    <option value="">All</option>
                    <option value="1" ${statusFilter == 1 ? 'selected' : ''}>Template</option>
                    <option value="0" ${statusFilter == 0 ? 'selected' : ''}>Non-Template</option>
                </select>
            </div>

            <div class="form-group col-12 col-md-3 mb-2">
                <label for="sortBy" class="mr-2">Sort by:</label>
                <select name="sortBy" id="sortBy" class="form-control">
                    <option value="termId" ${sortBy == 'termId' ? 'selected' : ''}>ID</option>
                    <option value="description" ${sortBy == 'description' ? 'selected' : ''}>Description</option>
                </select>
            </div>

            <div class="form-group col-12 col-md-2 mb-2">
                <label for="sortDirection" class="mr-2">Order:</label>
                <select name="sortDirection" id="sortDirection" class="form-control">
                    <option value="asc" ${sortDirection == 'asc' ? 'selected' : ''}>Ascending</option>
                    <option value="desc" ${sortDirection == 'desc' ? 'selected' : ''}>Descending</option>
                </select>
            </div>

            <div class="col-12 text-center">
                <button type="submit" class="btn btn-primary">Apply Filter and Sort</button>
            </div>
        </form>

        <br/>

        <!-- Table to display terms -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Description</th>
                        <th>Template</th>
                        <th>Follow Contract</th>
                        <th>Actions</th> <!-- Actions column for buttons -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="term" items="${terms}">
                        <tr>
                            <td>${term.termId}</td>
                            <td>${term.description}</td>
                            <td><c:if test="${term.isTemplate}">Yes</c:if><c:if test="${!term.isTemplate}">No</c:if></td>
                            <td><c:if test="${term.followContract}">Yes</c:if><c:if test="${!term.followContract}">No</c:if></td>
                            <td>
                                <!-- View Details Button -->
                                <button type="button" class="btn btn-info btn-sm" onclick="showDetails(${term.termId})">View Details</button>
                                <!-- Update Button -->
                                <a href="/manager/term/update/${term.termId}" class="btn btn-warning btn-sm">Update</a>
                                <!-- Enable/Disable Button -->
                                <c:if test="${term.isTemplate}">
                                    <a href="/manager/term/disable/${term.termId}" class="btn btn-danger btn-sm">Disable</a>
                                </c:if>
                                <c:if test="${!term.isTemplate}">
                                    <a href="/manager/term/enable/${term.termId}" class="btn btn-success btn-sm">Enable</a>
                                </c:if>
                            </td>
                        </tr>
                        <!-- Row for displaying term details dynamically -->
                        <tr id="details-row-${term.termId}" class="details-row">
                            <td colspan="5">
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
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${currentPage > 0}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${currentPage - 1}&size=${size}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchDescription=${searchDescription}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                </c:if>

                <li class="page-item disabled">
                    <span class="page-link">Page ${currentPage + 1} of ${totalPages}</span>
                </li>

                <c:if test="${currentPage + 1 < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="?page=${currentPage + 1}&size=${size}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchDescription=${searchDescription}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- JavaScript to toggle the detail rows -->
    <script>
        function showDetails(termId) {
            // Toggle the visibility of the details row
            const detailsRow = document.getElementById(`details-row-${termId}`);
            if (detailsRow.style.display === 'none' || detailsRow.style.display === '') {
                detailsRow.style.display = 'table-row';
            } else {
                detailsRow.style.display = 'none';
            }
        }
    </script>
</body>
</html>

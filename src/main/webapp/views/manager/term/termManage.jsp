<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Term Management</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
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


            .filter-card {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
            }
            h2 {
                font-weight: bold;
                color: #007bff;
                border-bottom: 2px solid #007bff;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .btn{
                font-size: 0.9rem;
                padding: 10px;
                border-radius: 8px;
            }
            .btn-filter{
                margin-top: 1.6rem;
                font-size: 1.1rem;
            }
            .table-responsive{
                width: 98%;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid mt-5">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="../navBar.jsp" %>

                <!-- Main content -->
                <main role="main" class="col-md-10 ml-sm-auto col-lg-10 mt-4">
                    <h2 class="mb-4">Term Management</h2>
                    <div class="row">

                    <!-- Filter, Sort, and Search Form -->
                        <div class="filter-card col-md-11">
                            <!-- Filter Form from Parcel Manager Styled for Term Management -->
                            <form method="get" action="${pageContext.request.contextPath}/manager/terms" class="row">
                                <!-- Search by description -->
                                <div class="form-group col-12 col-md-3">
                                    <label for="searchDescription">Search by Description:</label>
                                    <input type="text" class="form-control" name="searchDescription" id="searchDescription" value="${searchDescription}" placeholder="Enter description">
                                </div>

                                <!-- Filter by status -->
                                <div class="form-group col-12 col-md-2">
                                    <label for="termStatusFilter">Filter by Status:</label>
                                    <select name="termStatusFilter" id="termStatusFilter" class="form-control">
                                        <option value="">All</option>
                                        <option value="false" ${termStatusFilter == false ? 'selected' : ''}>Enabled</option>
                                        <option value="true" ${termStatusFilter == true ? 'selected' : ''}>Disabled</option>
                                    </select>
                                </div>

                                <!-- Sorting options -->
                                <div class="form-group col-12 col-md-2">
                                    <label for="sortBy">Sort by:</label>
                                    <select name="sortBy" id="sortBy" class="form-control">
                                        <option value="percentOnDesign1" ${sortBy == 'percentOnDesign1' ? 'selected' : ''}>Percent on conceptual</option>
                                        <option value="percentOnDesign2" ${sortBy == 'percentOnDesign2' ? 'selected' : ''}>Percent on detail</option>
                                        <option value="percentOnDesign1" ${sortBy == 'percentOnDesign3' ? 'selected' : ''}>Percent on construction</option>
                                        <option value="percentOnDesign2" ${sortBy == 'percentOnConstruct1' ? 'selected' : ''}>Percent on raw construction</option>
                                        <option value="percentOnDesign1" ${sortBy == 'percentOnConstruct2' ? 'selected' : ''}>Percent on complete construction</option>
                                        
                                        <!-- Add more sorting options as needed -->
                                    </select>
                                </div>

                                <!-- Sorting order (ascending/descending) -->
                                <div class="form-group col-12 col-md-2">
                                    <label for="sortDirection">Order:</label>
                                    <select name="sortDirection" id="sortDirection" class="form-control">
                                        <option value="asc" ${sortDirection == 'asc' ? 'selected' : ''}>Ascending</option>
                                        <option value="desc" ${sortDirection == 'desc' ? 'selected' : ''}>Descending</option>
                                    </select>
                                </div>

                                <!-- Submit Button -->
                                <div class="col-12 text-center col-md-1">
                                    <button type="submit" class="btn-filter btn btn-primary">Apply</button>
                                </div>

                                <!-- Insert New Term Button -->
                                <div class="text-right col-md-2">
                                    <a href="${pageContext.request.contextPath}/manager/termCreate" class="btn-filter btn btn-success">Add New Term</a>
                                </div>

                            </form>
                        </div>

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
                                            <a href="${pageContext.request.contextPath}/manager/updateTerm/${term.termId}" class="btn btn-warning btn-sm">Update</a>
                                            <!-- Enable/Disable Button -->
                                            <form action="${pageContext.request.contextPath}/manager/term/updateStatus/${term.termId}" method="POST" style="display:inline;">

                                                <input type="hidden" name="termStatus" value="${!term.termStatus}" />
                                                <button type="submit" class="btn ${term.termStatus ? 'btn-danger' : 'btn-success'}">
                                                    ${term.termStatus ? 'Disable' : 'Enable'}
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <!-- Row for displaying term details dynamically -->
                                    <tr id="details-row-${term.termId}" class="collapse">
                                        <td colspan="5">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead class="thead-light">
                                                    <tr>

                                                        <th>Design Stage 1</th>
                                                        <th>Design Stage 2</th>
                                                        <th>Design Stage 3</th>
                                                        <th>Construction Stage 1</th>
                                                        <th>Construction Stage 2</th>
                                                        <th>Pay on Start of Design</th>
                                                        <th>Pay on Start of Construction</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>

                                                        <td>${term.percentOnDesign1}%</td>
                                                        <td>${term.percentOnDesign2}%</td>
                                                        <td>${term.percentOnDesign3}%</td>
                                                        <td>${term.percentOnConstruct1}%</td>
                                                        <td>${term.percentOnConstruct2}%</td>
                                                        <td><c:if test="${term.payOnStartOfDesign}">Yes</c:if><c:if test="${!term.payOnStartOfDesign}">No</c:if></td>
                                                        <td><c:if test="${term.payOnStartOfConstruction}">Yes</c:if><c:if test="${!term.payOnStartOfConstruction}">No</c:if></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
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
                </main>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!-- JavaScript to toggle the detail rows -->
        <script>
            function showDetails(termId) {
                console.log("Toggling details for termId:", termId);
                const detailsRow = document.getElementById(`details-row-` + termId);
                if (detailsRow) {console.log("Found details row:", detailsRow);
                    if (detailsRow.style.display === 'none' || detailsRow.style.display === '') {
                        detailsRow.style.display = 'table-row';
                    } else {
                        detailsRow.style.display = 'none';
                    }
                } else {
                    console.error("Details row not found for termId:", termId);
                }
            }
        </script>
    </body>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Contract Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
        <style>
            .section-header {
                margin-bottom: 20px;
                border-bottom: 2px solid #007bff;
                padding-bottom: 5px;
            }
            .consultant-section {
                margin-bottom: 40px;
            }
            .quotes-section, .PreDesign-section, .customer-section {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 8px;
            }
            .btn-custom {
                margin-top: 20px;
                padding: 10px 20px;
            }
            .status-badge {
                font-size: 1.2em;
                padding: 10px 15px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <jsp:include page="consultantNav.jsp"/>

            <div class="row">


                <!-- Consultant Details Section (70%) -->
                <div class="col-md-8 consultant-section">
                    <h2 class="section-header text-primary">Consultant Details</h2>
                    <table class="table table-hover table-striped">
                        <tr>
                            <th>Consultant ID</th>
                            <td>${consultant.consultantId}</td>
                        </tr>
                        <tr>
                            <th>Date Created</th>
                            <td><fmt:formatDate value="${consultant.consultantDateTime.time}" pattern="yyyy-MM-dd HH:mm"/></td>
                        </tr>
                        <tr>
                            <th>Consultant Status</th>
                            <td>
                                <!-- 1: Pending 2: Assign 3: Processing 4:Completed(khi hợp đồng đc ký) 5.Cancel(khi khác ko muốn tư vấn)-->
                                <c:choose>
                                    <c:when test="${consultant.consultantStatus == 1}">
                                        <span class="badge badge-warning badge-status">Pending</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 2}">
                                        <span class="badge badge-info badge-status">Assigned</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 3}">
                                        <span class="badge badge-info badge-status">Processing</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 4}">
                                        <span class="badge badge-success badge-status">Completed</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 5}">
                                        <span class="badge badge-danger badge-status">Canceled</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 6}">
                                        <span class="badge badge-success badge-status">Quote Created</span>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>consultation client</th>
                            <td>${consultant.consultantCustomerName}</td>
                        </tr>
                        <tr>
                            <th>Consultant type</th>
                            <td>${consultant.consultantType}</td>
                        </tr>
                        <tr>
                            <th>Client Phone</th>
                            <td>${consultant.consultantPhone}</td>
                        </tr>
                        <tr>
                            <th>Client Email</th>
                            <td>${consultant.consultant_email}</td>
                        </tr>
                        <tr>
                            <th>Consultant Content</th>
                            <td>${consultant.consultantContent}</td>
                        </tr>

                        <!-- Contract Status moved back into the table -->
                    </table>

                    <!-- Approve/Reject buttons placed below the main table -->
                    <c:choose>
                        <c:when test="${consultant.consultantStatus == 2}">
                            <div class="">
                                <form action="${pageContext.request.contextPath}/consultant/viewConsultantDetail/updateStatus" method="get" class="d-inline">
                                    <input type="hidden" name="consultantId" value="${consultant.consultantId}" >
                                    <input type="hidden" name="statusId" value="3">
                                    <button type="submit" class="btn btn-secondary">Begin</button>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${consultant.consultantStatus == 3}">
                            <div class="">
                                <form 
                                    action="${pageContext.request.contextPath}/consultant/viewConsultantDetail/updateStatus" 
                                    method="get" 
                                    class="d-inline" 
                                    onsubmit="return validateForm();">

                                    <input type="hidden" name="consultantId" value="${consultant.consultantId}">
                                    <input type="hidden" name="statusId" value="4">
                                    <button type="submit" class="btn btn-success">Completed</button>
                                </form>

                                <form 
                                    action="${pageContext.request.contextPath}/consultant/viewConsultantDetail/updateStatus" method="get" class="d-inline" onsubmit="return confirm('Are you sure you want to cancel this?');">
                                    <input type="hidden" name="consultantId" value="${consultant.consultantId}">
                                    <input type="hidden" name="statusId" value="5">
                                    <button type="submit" class="btn btn-danger">Cancel</button>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${consultant.consultantStatus == 4 && empty consultant.quotes && 
                                        not empty consultant.customer && empty consultant.serviceQuotes}">
                            <c:if test="${consultant.consultantType == 'Service'}">
                                <div class="">
                                    <form action="${pageContext.request.contextPath}/consultant/serviceQuote/create" method="get" class="d-inline">
                                        <input type="hidden" name="consultantId" value="${consultant.consultantId}" >
                                        <button type="submit" class="btn btn-success">Create New Service Quote</button>
                                    </form>
                                </div>
                            </c:if>
                            <c:if test="${consultant.consultantType == 'Construction'}">
                                <div class="">
                                    <form action="${pageContext.request.contextPath}/consultant/quote/createNewQuotes" method="get" class="d-inline">
                                        <input type="hidden" name="consultantId" value="${consultant.consultantId}" >
                                        <button type="submit" class="btn btn-success">Create New Quote</button>
                                    </form>
                                </div>
                            </c:if>
                        </c:when>
                    </c:choose>
                </div>

                <!-- customer and quotes and predesign Details Section (30%) -->
                <div class="col-md-4">
                    <!-- Associated Quotes Details -->
                    <div class="quotes-section mb-4">
                        <c:choose>
                            <c:when test="${not empty consultant.quotes}">
                                <h4 class="section-header text-primary">Associated Quotes</h4>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Quotes ID</th>
                                        <td>${consultant.quotes.quotesId}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Name</th>
                                        <td>${consultant.quotes.quotesName}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Total Price</th>
                                        <td>${consultant.quotes.quotesTotalPrice}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Description</th>
                                        <td>${consultant.quotes.quotesContent}</td>
                                    </tr>
                                </table>
                            </c:when>
                            <c:when test="${not empty consultant.serviceQuotes}">
                                <h4 class="section-header text-primary">Associated Quotes</h4>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Quotes ID</th>
                                        <td>${consultant.serviceQuotes.serviceQuotesId}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Name</th>
                                        <td>${consultant.serviceQuotes.serviceQuotesName}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Total Price</th>
                                        <td>${consultant.serviceQuotes.serviceQuotesTotalPrice}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Description</th>
                                        <td>${consultant.serviceQuotes.serviceQuotesContent}</td>
                                    </tr>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <h4 class="section-header text-primary">Associated Quotes</h4>
                                <p class="text-muted">No Quotes is associated with this consultant.</p>
                            </c:otherwise>
                        </c:choose>    
                    </div>

                    <!-- Associated customer Details -->
                    <div class="customer-section mb-4">
                        <h4 class="section-header text-primary">Associated Customer</h4>
                        <c:if test="${not empty consultant.customer}">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Customer ID</th>
                                    <td>${consultant.customer.id}</td>
                                </tr>
                                <tr>
                                    <th>Customer Name</th>
                                    <td>${consultant.customer.name != null? consultant.customer.name:' N/A'}</td>
                                </tr>
                                <tr>
                                    <th>Customer Email</th>
                                    <td>${consultant.customer.email}</td>
                                </tr>
                                <tr>
                                    <th>Customer phone</th>
                                    <td>${consultant.customer.phone != null? consultant.customer.phone:' N/A'}</td>
                                </tr>
                            </table>
                            <c:if test="${consultant.consultantStatus < 4}">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCustomerModal">
                                    Edit Customer
                                </button>
                            </c:if>
                        </c:if>
                        <c:if test="${empty consultant.customer}">
                            <p>No Pre-Design are associated with this Consultant.</p>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCustomerModal">
                                Select Customer
                            </button>
                        </c:if>
                    </div>

                    <!-- Associated Pre-Design Details -->
                    <div class="PreDesign-section mb-4">
                        <h4 class="section-header text-primary">Associated Pre-Design</h4>
                        <c:if test="${not empty consultant.predesign}">
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <th>Pre-Design ID</th>
                                        <td>${consultant.predesign.preDesignId}</td>
                                    </tr>
                                    <tr>
                                        <th>Pre-design Name</th>
                                        <td>${consultant.predesign.preDesignName}</td>
                                    </tr>
                                    <tr>
                                        <th>Pre-design Description</th>
                                        <td>${consultant.predesign.preDesignDescription}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <c:if test="${consultant.consultantStatus < 4}">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createPreDesignModal">
                                    Select Pre Design
                                </button>
                            </c:if>
                        </c:if>
                        <c:if test="${empty consultant.predesign}">
                            <p>No Pre-Design are associated with this Consultant.</p>
                            <c:if test="${consultant.consultantStatus < 4}"> 
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createPreDesignModal">
                                    Select Pre Design
                                </button>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>


        <!-- Customer Selection Modal -->
        <div class="modal fade" id="addCustomerModal" tabindex="-1" role="dialog" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document"> <!-- Using modal-lg for a larger modal if needed -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCustomerModalLabel">Select Customer for New Service Quote</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" id="customerSearch" class="form-control" placeholder="Search by name or email...">
                        </div>
                        <div class="table-responsive">
                            <!-- Table of Customers -->
                            <table class="table table-hover">
                                <thead class="thead-light">
                                    <tr>
                                        <th style="width: 35%;">Name</th>
                                        <th style="width: 30%;">Email</th>
                                        <th style="width: 25%;">Phone</th>
                                        <th style="width: 10%;">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="customerTableBody">
                                    <c:forEach var="customer" items="${customerList}">
                                        <tr>
                                            <td>${customer.name != null? customer.name:' N/A '}</td>
                                            <td>${customer.email}</td>
                                            <td>${customer.phone != null? customer.phone:' N/A '}</td>
                                            <td>
                                                <form action="${pageContext.request.contextPath}/consultant/addCustomerToConsultant" method="post" class="d-inline">
                                                    <input type="hidden" name="consultantId" value="${consultant.consultantId}">
                                                    <input type="hidden" name="customerId" value="${customer.id}">
                                                    <button type="submit" class="btn btn-success btn-sm">Add</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>        

        <!-- Pre-Design Selection Modal -->
        <div class="modal fade" id="createPreDesignModal" tabindex="-1" role="dialog" aria-labelledby="createPreDesignModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document"> <!-- Using modal-lg for a larger modal if needed -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createPreDesignModalLabel">Select Pre-Design for Consultant</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" id="preDesignSearch" class="form-control" placeholder="Search by name or description...">
                        </div>
                        <div class="table-responsive">
                            <!-- Table of Pre-Designs -->
                            <table class="table table-hover">
                                <thead class="thead-light">
                                    <tr>
                                        <th style="width: 40%;">Pre-Design Name</th>
                                        <th style="width: 45%;">Description</th>
                                        <th style="width: 15%;">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="preDesignTableBody">
                                    <c:forEach var="preDesign" items="${preDesignList}">
                                        <tr>
                                            <td>${preDesign.preDesignName}</td>
                                            <td>${preDesign.preDesignDescription}</td>
                                            <td>
                                                <form action="${pageContext.request.contextPath}/consultant/addPreDesignToConsultant" method="post" class="d-inline">
                                                    <input type="hidden" name="consultantId" value="${consultant.consultantId}">
                                                    <input type="hidden" name="preDesignId" value="${preDesign.preDesignId}">
                                                    <button type="submit" class="btn btn-success btn-sm">Select</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script>
                                        document.getElementById('customerSearch').addEventListener('input', function () {
                                            const searchValue = this.value.toLowerCase();
                                            const customerRows = document.querySelectorAll('#customerTableBody tr');

                                            customerRows.forEach(row => {
                                                const customerName = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
                                                const customerEmail = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                                                if (customerName.includes(searchValue) || customerEmail.includes(searchValue)) {
                                                    row.style.display = '';
                                                } else {
                                                    row.style.display = 'none';
                                                }
                                            });
                                        });
                                        document.getElementById('preDesignSearch').addEventListener('input', function () {
                                            const searchValue = this.value.toLowerCase();
                                            const preDesignRows = document.querySelectorAll('#preDesignTableBody tr');

                                            preDesignRows.forEach(row => {
                                                const preDesignName = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
                                                const preDesignDescription = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                                                if (preDesignName.includes(searchValue) || preDesignDescription.includes(searchValue)) {
                                                    row.style.display = '';
                                                } else {
                                                    row.style.display = 'none';
                                                }
                                            });
                                        });
                                        function validateForm() {
                                            // Assuming you have access to the customer information in JavaScript
                                            var customerName = "${consultant.customer.name}";
                                            var customerPhone = "${consultant.customer.phone}";

                                            // Check if customer name or phone is null or empty
                                            if (!customerName || !customerPhone) {
                                                alert("Cannot mark as completed. Customer information is incomplete.");
                                                return false;
                                            }

                                            // If both fields are filled, ask for confirmation
                                            return confirm("Are you sure you want to mark this as completed?");
                                        }
        </script>
    </body>
</html>


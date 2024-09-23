<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Contract Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .contract-details th {
                width: 30%;
                background-color: #f8f9fa;
            }
            .badge-status {
                font-size: 1rem;
            }
            .mt-5-custom {
                margin-top: 3rem; /* Add custom space between sections */
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <h2 class="mb-4 text-center">Contract Details</h2>

            <div class="row">
                <!-- Main Contract Details on the Left -->
                <div class="col-md-8">
                    <table class="table table-hover contract-details">
                        <tbody>
                            <tr>
                                <th>Contract ID</th>
                                <td>${contract.contractId}</td>
                            </tr>
                            <tr>
                                <th>Date Created</th>
                                <td>${contract.dateCreate}</td>
                            </tr>
                            <tr>
                                <th>File URL</th>
                                <td><a href="/download/${contract.fileURL}" class="btn btn-link"><i class="fas fa-download"></i> Download Contract</a></td>
                            </tr>
                            <tr>
                                <th>Total Price</th>
                                <td>${contract.totalPrice}</td>
                            </tr>
                            <tr>
                                <th>Price on Concept Design</th>
                                <td>${contract.priceOnConceptDesign}</td>
                            </tr>
                            <tr>
                                <th>Price on Construction Design</th>
                                <td>${contract.priceOnConstructionDesign}</td>
                            </tr>
                            <tr>
                                <th>Price on Detail Design</th>
                                <td>${contract.priceOnDetailDesign}</td>
                            </tr>
                            <tr>
                                <th>Price on Raw Construction</th>
                                <td>${contract.priceOnRawConstruction}</td>
                            </tr>
                            <tr>
                                <th>Price on Complete Construction</th>
                                <td>${contract.priceOnCompleteConstruction}</td>
                            </tr>
                            <tr>
                                <th>Contract Term</th>
                                <td>${contract.contractTerm}</td>
                            </tr>
                            <tr>
                                <th>Contract Status</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${contract.contractStatus == 1}">
                                            <span class="badge badge-warning badge-status">Pending</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 2}">
                                            <span class="badge badge-success badge-status">Approved</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 3}">
                                            <span class="badge badge-danger badge-status">Rejected (Customer)</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 4}">
                                            <span class="badge badge-danger badge-status">Rejected (Manager)</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 5}">
                                            <span class="badge badge-secondary badge-status">Canceled</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 6}">
                                            <span class="badge badge-success badge-status">Accepted</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>Contract Note</th>
                                <td>${contract.contractNote}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Associated Project and Term Details on the Right -->
                <div class="col-md-4">
                    <h3 class="mt-5">Associated Project Details</h3>
                    <c:if test="${not empty contract.project}">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>Project ID</th>
                                    <td>${contract.project.projectId}</td>
                                </tr>
                                <tr>
                                    <th>Project Name</th>
                                    <td>${contract.project.projectName}</td>
                                </tr>
                                <tr>
                                    <th>Project Description</th>
                                    <td>${contract.project.description}</td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty contract.project}">
                        <p>No project is associated with this contract.</p>
                    </c:if>

                    <!-- Space between project and term -->
                    <h3 class="mt-5-custom">Associated Term Details</h3>
                    <c:if test="${not empty contract.term}">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>Term ID</th>
                                    <td>${contract.term.termId}</td>
                                </tr>
                                <tr>
                                    <th>Term Description</th>
                                    <td>${contract.term.description}</td>
                                </tr>

                                <!-- Payment on Design Stages -->
                                <tr>
                                    <th>Payment on Concept Design</th>
                                    <td>${contract.term.percentOnDesign1}%</td>
                                </tr>
                                <tr>
                                    <th>Payment on Detailed Design</th>
                                    <td>${contract.term.percentOnDesign2}%</td>
                                </tr>
                                <tr>
                                    <th>Payment on Construction Design</th>
                                    <td>${contract.term.percentOnDesign3}%</td>
                                </tr>

                                <!-- Payment on Construction Stages -->
                                <tr>
                                    <th>Payment on Rough Construction</th>
                                    <td>${contract.term.percentOnConstruct1}%</td>
                                </tr>
                                <tr>
                                    <th>Payment on Final Construction</th>
                                    <td>${contract.term.percentOnConstruct2}%</td>
                                </tr>

                                <!-- Conditional Message for Payment Timing -->
                                <tr>
                                    <th>Payment Timing for Design</th>
                                    <td>
                                        <c:if test="${contract.term.payOnStartOfDesign}">
                                            Pay at the start of the design stage.
                                        </c:if>
                                        <c:if test="${!contract.term.payOnStartOfDesign}">
                                            Payment follows normal design stage completion.
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Payment Timing for Construction</th>
                                    <td>
                                        <c:if test="${contract.term.payOnStartOfConstruction}">
                                            Pay at the start of the construction stage.
                                        </c:if>
                                        <c:if test="${!contract.term.payOnStartOfConstruction}">
                                            Payment follows normal construction stage completion.
                                        </c:if>
                                    </td>
                                </tr>

                                <!-- Conditional Message for Follow Contract -->
                                <tr>
                                    <th>Payment Based on Contract</th>
                                    <td>
                                        <c:if test="${contract.term.followContract}">
                                            Pay the amount stated in the contract at the end of each stage.
                                        </c:if>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty contract.term}">
                        <p>No terms are associated with this contract.</p>
                    </c:if>

                    <!-- Action Buttons (Moved below term details) -->
                    <c:choose>
                        <c:when test="${contract.contractStatus == 1}">
                            <div class="mt-4 text-center">
                                <form action="/manager/contract/editStatus" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="${contract.contractId}">
                                    <input type="hidden" name="status" value="2">
                                    <button type="submit" class="btn btn-success">Approve</button>
                                </form>
                                <form action="/manager/contract/editStatus" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="${contract.contractId}">
                                    <input type="hidden" name="status" value="4">
                                    <button type="submit" class="btn btn-warning">Reject</button>
                                </form>
                                <form action="/manager/contract/editStatus" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="${contract.contractId}">
                                    <input type="hidden" name="status" value="5">
                                    <button type="submit" class="btn btn-danger">Cancel</button>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${contract.contractStatus == 3}">
                            <div class="mt-4 text-center">
                                <p>Status: <span class="badge badge-danger">Refused by Customer</span></p>
                                <form action="/manager/contract/edit" method="GET" class="d-inline">
                                    <input type="hidden" name="id" value="${contract.contractId}">
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                </form>
                                <form action="/manager/contract/editStatus" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="${contract.contractId}">
                                    <input type="hidden" name="status" value="5">
                                    <button type="submit" class="btn btn-danger">Cancel</button>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${contract.contractStatus == 6 && empty contract.project}">
                            <div class="mt-4 text-center">
                                <p>Status: <span class="badge badge-success">Accept by Customer</span></p>
                                <form action="/manager/project/create" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="${contract.contractId}">
                                    <button type="submit" class="btn btn-primary">CREATE PROJECT</button>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- FontAwesome for icons -->
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Design Project Details</title>
        <!-- Sử dụng Bootstrap 4.3.1 từ CDN -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <%@include file="../cssTemplate.jsp"%>
        <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
            }


            .container {
                max-width: 95%;
                margin: 20px auto;
            }


            .btn {
                transition: all 0.3s ease;
            }

            .btn:hover {
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            }

            .left-column {
                width: 30%;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-right: 10px;
            }

            .right-column {
                width: 69%;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .img-box {
                height: 300px;
                width: 100%;
                background-color: #e9ecef;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1.2rem;
                color: #6c757d;
                margin-bottom: 20px;
                border-radius: 8px;
            }

            .stage-tabs {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

            .stage-tabs button {
                margin: 0 10px;
                border-radius: 15px;
                padding: 13px 15px;
                font-size: 14px;
            }

            .detail-name-bar {
                display: flex;
                flex-wrap: wrap;
                margin-top: 15px;
            }

            .badge-status {
                font-size: 14px;
                padding: 5px 13px;
                margin-right: 10px;
                margin-bottom: 10px;
                border-radius: 15px;
                text-transform: capitalize;
            }

            .badge-status.success {
                background-color: #28a745;
                color: white;
            }
            .badge-status.proccessing {
                background-color: #0d6efd;
                color: white;
            }
            .badge-status.pending {
                background-color: #6c757d;
                color: white;
            }

            .badge-status.canceled {
                background-color: #ffc107;
                color: white;
            }

            .card {
                margin-bottom: 20px;
                border: none;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            }

            .project-description, .additional-info {
                margin-top: 20px;
                padding: 15px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .image-gallery img {
                width: 30%; /* Điều chỉnh kích thước ảnh nếu cần */
                margin-right: 5px;
                margin-bottom: 5px;
                border-radius: 5px;
                transition: transform 0.3s ease;
            }

            .image-gallery img:hover {
                transform: scale(1.05); /* Phóng to nhẹ khi hover */
            }
            .payment-status {
                font-size: 1.8rem;
                color: #28a745;
                margin-bottom: 10px;
                font-weight: bold;
            }
            p {
                margin-bottom: 10px;
                font-size: 19px;
            }
            h4 {
                font-size: 2.6rem;
                color: #343a40;
                margin-bottom: 20px;
            }

            button.btn-info {
                font-weight: 600;
                font-size: 1.5rem;
                padding: 15px 25px;
                border-radius: 8px;
                width: 100%;
                max-width: 300px;
                display: inline-block;
                text-align: center;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: box-shadow 0.3s ease, transform 0.3s ease;
            }

            button.btn-info:hover {
                box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
                transform: translateY(-2px);
            }
            .btn{
                padding: 10px 25px;
                font-size: 1.5rem;
            }
            .modal-content {
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                border: none;
            }
            .modal-header {
                background-color: #c65252;
                color: white;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                padding: 15px 20px;
            }
            .modal-title {
                font-size: 2.4rem;
                font-weight: 700;
                margin-left: 172px;
            }
            .modal-body {
                font-size: 1.8rem; /* Tăng kích thước chữ */
                color: #555; /* Màu chữ dễ đọc hơn */
            }
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>
    <body>
        <section id="services"
                 class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
            <div class="container rr-shape-p-c_1">
                <div class="service__shape-1 rr-shape-p-s_1 leftRight">
                    <div></div>
                </div>

                <div class="row mb-30 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                    <div class="col-md-6">
                        <div class="section__title-wrapper text-center text-xl-start">
                            <span class="section__subtitle justify-content-start mb-13"><span data-width="40px"
                                                                                              class="left-separetor">
                                </span><a href="${pageContext.request.contextPath}/customer/projects/" class="theme-color">Project</a></span>
                            <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                data-cursor="-opaque">Design Detail
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div style="height:5vh;"></div>                    
        <div class="container mt-5">
            <!-- Navigation -->


            <div class="row">
                <div class="col-md-4 left-column">
                    <div class="img-box">
                        <img src="/uploads/${project.imgURL}" alt="Project Image">
                    </div>
                    <!-- Project Description -->
                    <div class="project-description">
                        <h4>Project Description</h4>
                        <p>${project.description}</p>
                    </div>

                    <!-- Additional Information -->
                    <div class="additional-info">
                        <h4>Additional Information</h4>
                        <p><strong>Start Date:</strong><fmt:formatDate value="${project.dateStart}" pattern="MMM dd yyyy"/></p>
                        <p><strong>Expected End Date:</strong><fmt:formatDate value="${project.dateEnd}" pattern="MMM dd yyyy"/></p>
                        <p><strong>Design Team:</strong>
                            <c:forEach var="staff" items="${design.staff}"> | ${staff.name} | </c:forEach>
                            </p>
                        </div>
                    </div>
                    <!-- Right Column -->
                    <div class="col-md-8 right-column">
                        <h2 class="card-title mb-3 text-center">Information Of Design</h2>
                        <p>Design's Name: ${design.designName}</p>
                    <c:if test="${project.preDesign.preDesignId != null}">
                        <p>Template Design:<a href="${pageContext.request.contextPath}/home/preDesign/${project.preDesign.preDesignId}">  
                                ${project.preDesign.preDesignName}</a></p></c:if>

                        <p>Design Status:
                        <c:choose>
                            <c:when test="${design.status == 1}">
                                <span class="badge badge-secondary">Pending</span>
                            </c:when>
                            <c:when test="${design.status == 2}">
                                <span class="badge badge-primary">Processing</span>
                            </c:when>
                            <c:when test="${design.status == 3}">
                                <span class="badge badge-success">Completed</span>
                            </c:when>
                            <c:when test="${design.status == 4}">
                                <span class="badge badge-warning">Canceled</span>
                            </c:when>
                        </c:choose>
                    </p>
                    <p><strong>Area (m²):</strong> ${quote.quotesArea}</p>

                    <h2 class="card-title mb-3 text-center">Stage Of Design</h2>

                    <div class="stage-tabs" id="stage-buttons">
                        <button class="btn btn-outline-dark" data-stage="Conceptual Design" data-status="0">Conceptual Design</button>
                        <button class="btn btn-outline-dark" data-stage="Detail Design" data-status="0">Detail Design</button>
                        <button class="btn btn-outline-dark" data-stage="Construction Design" data-status="0">Construction Design</button>
                    </div>

                    <!-- Display the Design Stages -->
                    <c:forEach var="stage" items="${designStages}">
                        <div class="card mt-4">
                            <div class="card-body">
                                <h4>
                                    <a data-status="${stage.designStageStatus}" class="design-stage-link "
                                       href="${pageContext.request.contextPath}/customer/project/design/blueprint/${stage.designStageId}?designId=${design.designId}">
                                        ${stage.designStageName}
                                    </a>
                                </h4>
                                <p>Status:
                                    <c:choose>
                                        <c:when test="${stage.designStageStatus == 1}">
                                            <span class="badge badge-secondary">Pending</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 2}">
                                            <span class="badge badge-primary">Processing</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 3}">
                                            <span class="badge badge-secondary">Canceled</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 4}">
                                            <span class="badge badge-success">Complete</span>
                                        </c:when>
                                    </c:choose>
                                </p>

                                <!-- Display Detail Names with Status -->
                                <div class="detail-name-bar">
                                    <c:forEach var="detail" items="${stage.designDetail}">
                                        <span class="badge-status
                                              <c:if test="${detail.status == 1}">pending</c:if>
                                              <c:if test="${detail.status == 2}">proccessing</c:if>
                                              <c:if test="${detail.status == 3}">canceled</c:if>
                                              <c:if test="${detail.status == 4}">success</c:if> ">
                                            ${detail.name}
                                        </span>
                                    </c:forEach>
                                </div>

                                <c:forEach var="detail" items="${stage.designDetail}">
                                    <c:if test="${detail.name == 'Payment' && detail.status == 2}">
                                        <div style="float: right;">
                                            <!-- PayPal Payment Button -->
                                            <form action="${pageContext.request.contextPath}/paypal/pay/design" method="post" style="display:inline-block;">
                                                <input type="hidden" name="detailId" value="${detail.id}" />
                                                <input type="hidden" name="designId" value="${design.designId}" />
                                                <input type="hidden" name="amount" value="${stage.designStagePrice}" />
                                                <button type="submit" class="btn btn-info">Pay with PayPal</button>
                                            </form>
                                        </div>
                                    </c:if>

                                    <!-- Existing "Complete Editing" Button -->
                                    <c:if test="${detail.name == 'Editing' && detail.status == 2}">
                                        <div style="float: right; margin-right: 10px;">
                                            <form action="${pageContext.request.contextPath}/customer/designStageDetail/updateStatus/"
                                                  method="post" style="display:inline-block;"  onsubmit="return checkSummaryFile(${stage.summaryFile != null});">
                                                <input type="hidden" name="detailId" value="${detail.id}">
                                                <input type="hidden" name="newStatus" value="4"> <!-- Status for 'Completed' -->
                                                <input type="hidden" name="designStageId" value="${stage.designStageId}">
                                                <input type="hidden" name="designId" value="${design.designId}">
                                                <button type="submit" class="btn btn-info">Complete Editing</button>
                                            </form>
                                        </div>
                                    </c:if>
                                </c:forEach>

                                <p id="design-stage-price">
                                    <strong>Price:</strong> ${stage.designStagePrice}
                                </p>
                                <!-- Add a unique ID for each payment-status -->
                                <p id="payment-status-${stage.designStageId}" class="payment-status"></p>
                                <%--Display if payment of status is complete --%>
                                <script>
                                    // Check payment status for each stage
                                    (function () {
                                        var paymentStatusElement = document.getElementById('payment-status-${stage.designStageId}');
                                    <c:forEach var="detail" items="${stage.designDetail}">
                                        <c:choose>
                                            <c:when test="${detail.name == 'Payment' && detail.status == 4}">
                                        paymentStatusElement.innerHTML = 'Complete Payment';
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                        // If no payment status, hide the element
                                        if (paymentStatusElement.innerHTML == '') {
                                            paymentStatusElement.style.display = 'none';
                                        }
                                    })();
                                </script>



                                <p><strong>Summary File:</strong>
                                    <c:choose>
                                        <c:when test="${not empty stage.summaryFile}">
                                        <form action="${pageContext.request.contextPath}/download/${stage.summaryFile}" method="get">
                                            <button type="submit" class="btn btn-outline-primary">
                                                <i class="fas fa-download"></i> Download file
                                            </button>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="btn btn-outline-danger">
                                            <i class="fas fa-download"></i> File not available
                                        </button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>

                        <script>
                            document.querySelector(`[data-stage='${stage.designStageName}']`).setAttribute('data-status', '${stage.designStageStatus}');
                        </script>
                    </c:forEach>
                </div>

                <!-- Popup -->
                <%@include file="../../popup.jsp"%>

            </div>
        </div>
        <!-- Popup Warning -->
        <div class="modal fade" id="alertModal" tabindex="-2" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="alertModalLabel">Warning</h5>
                    </div>
                    <div class="modal-body">
                        The summary file has not been uploaded. <br>Please contact our hotline: <strong>0123-456-789</strong> for assistance.
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../footer.jsp"%>
        <%@include file="../scriptTemplate.jsp"%>
        <!-- Script to dynamically change button color based on stage status -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Loop over the buttons
                document.querySelectorAll('#stage-buttons button').forEach(function (button) {
                    const stageStatus = button.getAttribute('data-status');
                    if (stageStatus == 2 || stageStatus == 3) {
                        button.classList.remove('btn-outline-dark');
                        button.classList.add('btn-primary');
                    }
                    // If stage status is 4, change the button color to success
                    if (stageStatus == 4) {
                        button.classList.remove('btn-outline-dark');
                        button.classList.add('btn-success');
                    }
                });
            });

            document.addEventListener('DOMContentLoaded', function () {
                // Lắng nghe sự kiện click cho các liên kết của design stage
                document.querySelectorAll('.design-stage-link').forEach(function (link) {
                    link.addEventListener('click', function (event) {
                        const stageStatus = this.getAttribute('data-status');

                        // Kiểm tra trạng thái, nếu là 1 thì ngăn không cho chuyển trang
                        if (stageStatus == 1) {
                            event.preventDefault(); // Ngăn không cho chuyển trang
                            alert('Design stage is pending. Please wait for the design team to complete the work.'); // Hiển thị thông báo
                        }
                    });
                });
            });

            function checkSummaryFile(hasSummaryFile) {
                if (!hasSummaryFile) {
                    // Hiển thị popup cảnh báo
                    $('#alertModal').modal('show');
                    return false; // Ngăn chặn form submit
                }
                return confirm("Do you want to complete this phase design?");
            }
        </script>

        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>


</html>


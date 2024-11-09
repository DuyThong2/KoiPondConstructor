<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Blueprints</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <%@include file="../cssTemplate.jsp"%>
        <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f9;
                font-family: 'Arial', sans-serif;
            }

            .page-header {
                padding: 15px;
                margin: 30px 0;
                background-color: #fff;
                color: white;
                border-radius: 8px;
            }

            .page-header h2 {
                font-weight: bold;
                font-size: 3rem;
            }
            h3 {
                font-weight: bold;
                margin: 5px 0 15px;
                font-size: 2.6rem;
            }
            .btn {
                transition: all 0.3s ease;
                border-radius: 5px;
            }

            .btn-secondary {
                background-color: #6c757d;
            }

            .btn-secondary:hover {
                background-color: #5a6268;
            }

            .back-button {
                padding: 8px 16px;
                font-size: 1rem;
            }

            .existing-blueprints {
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                margin-bottom: 40px;
            }

            .card {
                position: relative;
                border: none;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            }

            .card-img-top {
                height: 200px;
                object-fit: cover;
                border-radius: 8px 8px 0 0;
            }

            .form-check {
                position: absolute;
                top: 10px;
                left: 10px;
            }

            .form-check-input {
                width: 30px;
                height: 30px;
            }

            .feedback-section {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
                margin-top: 30px;
            }

            .feedback-section h3 {
                font-size: 2.7rem;
                margin-bottom: 15px;
            }

            .feedback-section textarea {
                border-radius: 8px;
                font-size: 15px;
            }

            .alert {
                margin-top: 20px;
            }
            .blueprint-gallery .col-md-4 {
                margin-bottom: 30px;
            }

            .blueprint-gallery .card {
                width: 350px;
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
                border-radius: 10px;
                overflow: hidden;
            }

            .blueprint-gallery .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            }

            .blueprint-gallery .card-img-top {
                height: 220px;
                object-fit: cover;
                border-radius: 5px;
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
                            <span class="section__subtitle justify-content-start mb-13"><span
                                                                                              class="left-separetor">
                                </span><a href="${pageContext.request.contextPath}/customer/design/detail/${designId}" class="theme-color">Project - Design</a></span>
                            <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                data-cursor="-opaque">${designStage.designStageName}
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div style="height:10vh;"></div>   
        <div class="container-fluid mt-5">
            <!-- Page Header -->
        
            <!-- Existing Blueprints Section -->
            <div class="existing-blueprints">
                <h3>Existing Blueprints</h3>
                <form id="feedbackForm" action="${pageContext.request.contextPath}/feedback/send/" method="post">
                    <input type="hidden" name="designId" value="${designId}">
                    <input type="hidden" name="designStageId" value="${designStage.designStageId}">
                    <div class="blueprint-gallery">
                        <div class="row">
                            <c:forEach var="blueprint" items="${blueprints}">
                                <div class="col-md-4">
                                    <div class="card mb-4">
                                        <a href="${blueprint.getShowingImg(blueprint.imgUrl)}" target="_blank">
                                            <img class="card-img-top" src="${blueprint.getShowingImg(blueprint.imgUrl)}" alt="Blueprint Image">
                                        </a>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="blueprintsId" value="${blueprint.bluePrintId}">
                                        </div>
                                        <div class="form-check">
                                            <c:if test="${blueprint.bluePrintStatus != 3}">
                                                <input class="form-check-input" type="checkbox" name="blueprintsId" value="${blueprint.bluePrintId}">
                                            </c:if>
                                        </div>

                                        <div class="card-body">

                                            <p><strong>Date Uploaded:</strong> <fmt:formatDate value="${blueprint.dateCreate}" pattern="dd-MM-yyyy"/>.</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- Feedback Section -->
                    <div class="feedback-section">
                        <h3>Feedback</h3>
                        <div class="form-group">
                            <label for="feedback">Please provide your feedback:</label>
                            <textarea class="form-control" id="feedback" name="feedback" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" style="padding: 10px; font-size: 15px">Send Feedback</button>
                    </div>

                    <!-- Popup cho success -->
                    <div id="successPopup" class="popup-background">
                        <div class="popup-box success">
                            <i class="fas fa-check-circle"></i> <!-- Icon success -->
                            <h2 class="success">Success!</h2>
                            <p>${success}</p>
                            <button class="close-btn" onclick="closePopup()">Close</button>
                        </div>
                    </div>

                    <!-- Popup cho error -->
                    <div id="errorPopup" class="popup-background">
                        <div class="popup-box error">
                            <i class="fas fa-exclamation-circle"></i> <!-- Icon lỗi -->
                            <h2 class="error">Error!</h2>
                            <p>${error}</p>
                            <button class="close-btn" onclick="closePopup()">Close</button>
                        </div>
                    </div>


                    <script>
                        function showSuccessPopup() {
                            const successPopup = document.getElementById('successPopup');
                            successPopup.classList.add('show');
                            const popupBox = successPopup.querySelector('.popup-box');
                            setTimeout(() => {
                                popupBox.classList.add('show');
                            }, 10);
                        }

                        function showErrorPopup() {
                            const errorPopup = document.getElementById('errorPopup');
                            errorPopup.classList.add('show');
                            const popupBox = errorPopup.querySelector('.popup-box');
                            setTimeout(() => {
                                popupBox.classList.add('show');
                            }, 10);
                        }

                        function closePopup() {
                            const popups = document.querySelectorAll('.popup-background.show');
                            popups.forEach(popup => {
                                const popupBox = popup.querySelector('.popup-box');
                                popupBox.classList.remove('show');
                                setTimeout(() => {
                                    popup.classList.remove('show');
                                }, 300);
                            });
                        }

                    </script>

                    <c:if test="${not empty success}">
                        <script>
                            showSuccessPopup();
                        </script>
                    </c:if>

                    <c:if test="${not empty error}">
                        <script>
                            showErrorPopup();
                        </script>
                    </c:if>

                </form>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>
    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>


</html>

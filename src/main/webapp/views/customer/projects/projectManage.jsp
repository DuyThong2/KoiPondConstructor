<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My Project</title>
        <meta name="description" content="Ribuild - Construction Company HTML5 Template">
        <meta name="author" content="ahmmedsabbirbd">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Place favicon.ico in the root directory -->
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/imgs/favicon.svg' />">
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

        <%@include file="../cssTemplate.jsp"%>
        <%@include file="../cssCustom.jsp"%>
        <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
        <style>

            .card-active p,
            .card-active span,
            .card-active i {
                color: #FFFFFF !important;
            }

            .card-success p,
            .card-success span,
            .card-success i {
                color: #28a745 !important;
            }

            .card-white {
                background-color: #FFFFFF;
                /* White background */
                border: 2px solid #df2453;
                color: #000000;
            }

            .card-white p,
            .card-white span,
            .card-white i {
                color: #000000;
            }

            .customer-button-large {
                padding: 15px 30px;
                font-size: 1.2rem;
                font-weight: bold;
            }
            .btn-md{
                font-weight: 600;
                font-size: 1.5rem;
                padding: 10px 25px;
                border-radius: 8px;
                width: 100%;
                max-width: 300px;
                display: inline-block;
                text-align: center;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: box-shadow 0.3s ease, transform 0.3s ease;
            }
            .btn-md:hover {
                box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15); /* Thêm đổ bóng khi hover */
                transform: translateY(-2px); /* Di chuyển nhẹ nút khi hover */
            }
            .form-control{
                font-size: 1.9rem;
            }
            @media (min-width: 1201px) {
                .view-account .content-panel {
                    min-height: 800px;
                    border-left: 1px solid #f3f3f7;
                    margin-left: 250px;
                }
                .view-account .side-bar .side-menu .nav > li > a {
                    display: block;
                    color: #9499a3;
                    padding: 13px 15px;
                    padding-left: 30px;
                    width: 250px;
                }
                .current-project-details, .done-project {
                    width: 1130px;
                }
            }
            @media (min-width: 768px) and  (max-width: 1200px){
                .current-project-details, .done-project {
                    width: 550px;
                }
            }

            .content-panel {
                background: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            h2 {
                color: #2c3e50;
                font-weight: bold;
                margin-bottom: 20px;
                font-size: 3.5rem;
            }

            /* Mouse-over effect for current and done project sections */
            /* Mouse-over effect for current and done project sections */
            /* Mouse-over effect for current and done project sections */
            .project-details-container .current-project-details,
            .project-details-container .done-project {
                transition: all 0.3s ease-in-out;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1) !important;
                cursor: pointer;
            }

            .project-details-container .current-project-details:hover,
            .project-details-container .done-project:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2) !important;
            }

            .project-details-container .current-project-details:hover h4.project-title,
            .project-details-container .current-project-details:hover h4.done-project-title,
            .project-details-container .done-project:hover h4.project-title,
            .project-details-container .done-project:hover h4.done-project-title {
                color: var(--rr-theme-primary) !important;
            }

            .project-stages-container {
                width: 100%;
                position: relative;
                margin: 30px 0;
                display: flex;
                justify-content: center;
            }

            .project-stages-container .row {
                width: 100%;
            }

            .project-stages-container .btn {
                width: 100%;
                max-width: 120px;
                font-size: 1.3rem;
                padding: 0.5rem 0.25rem;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .project-stages-container .btn {
                    font-size: 1.1rem;
                    padding: 0.4rem 0.2rem;
                }
                .stage-button {
                    padding: 0.5rem 0.75rem;
                    font-size: 1.1rem;
                }

                .stage-button i {
                    font-size: 1rem;
                }
            }

            /* Styles for stage buttons */
            .stage-button {
                transition: all 0.3s ease;
                padding: 1.5rem 2rem !important;
                font-size: 1rem;
                border: none;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .stage-button:hover {
                background-color: var(--rr-theme-primary);
                color: white;
            }

            /* Specific styles for different stage states */
            .btn-outline-secondary:hover,
            .btn-primary:hover,
            .btn-success:hover {
                background-color: var(--rr-theme-primary);
                border-color: var(--rr-theme-primary);
                color: white;
            }

            /* Icon styles */
            .stage-button i {
                font-size: 1.2rem;
                margin-right: 0.5rem;
            }
            .d-flex{
                margin: 0;
            }
        </style>
    </head>

    <body>

        <div class="cursor-wrapper relative">
            <div class="cursor"></div>
            <div class="cursor-follower"></div>
        </div>
        <!-- cursorAnimation end -->

        <!-- search popup start -->
        <div class="search__popup">
            <div class="container">
                <div class="row gx-30">
                    <div class="col-xxl-12">
                        <div class="search__wrapper">
                            <div class="search__top d-flex justify-content-between align-items-center">
                                <div class="search__logo">
                                    <a href="index.html">
                                        <img src="${pageContext.request.contextPath}/assets/imgs/logo/logo-white.svg"
                                             alt="img">
                                    </a>
                                </div>
                                <div class="search__close">
                                    <button type="button" class="search__close-btn search-close-btn">
                                        <svg width="18" height="18" viewBox="0 0 18 18" fill="none">
                                        <path d="M17 1L1 17" stroke="currentColor" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round" />
                                        <path d="M1 1L17 17" stroke="currentColor" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div class="search__form">
                                <form action="#">
                                    <div class="search__input">
                                        <input class="search-input-field" type="text"
                                               placeholder="Type here to search...">
                                        <span class="search-focus-border"></span>
                                        <button type="submit">
                                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                            <path
                                                d="M9.55 18.1C14.272 18.1 18.1 14.272 18.1 9.55C18.1 4.82797 14.272 1 9.55 1C4.82797 1 1 4.82797 1 9.55C1 14.272 4.82797 18.1 9.55 18.1Z"
                                                stroke="currentColor" stroke-width="1.5"
                                                stroke-linecap="round" stroke-linejoin="round" />
                                            <path d="M19.0002 19.0002L17.2002 17.2002" stroke="currentColor"
                                                  stroke-width="1.5" stroke-linecap="round"
                                                  stroke-linejoin="round" />
                                            </svg>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- search popup end -->

        <!-- Offcanvas area start -->
        <div class="fix">
            <div class="offcanvas__area">
                <div class="offcanvas__wrapper">
                    <div class="offcanvas__content">
                        <div class="offcanvas__top d-flex justify-content-between align-items-center">
                            <div class="offcanvas__logo">
                                <a href="index.html">
                                    <img src="${pageContext.request.contextPath}/assets/imgs/logo/logo-white.svg"
                                         alt="logo not found">
                                </a>
                            </div>
                            <div class="offcanvas__close">
                                <button class="offcanvas-close-icon animation--flip">
                                    <span class="offcanvas-m-lines">
                                        <span class="offcanvas-m-line line--1"></span><span
                                            class="offcanvas-m-line line--2"></span><span
                                            class="offcanvas-m-line line--3"></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                        <div class="mobile-menu fix"></div>
                        <div class="offcanvas__social">
                            <h4 class="offcanvas__title mb-20">Subscribe & Follow</h4>
                            <p class="mb-30">The scallops were perfectly cooked, tender, and flavorful, paired
                                beautifully with a creamy risotto and seasonal vegetables. The presentation was
                                artful, showcasing the chef's attention to detail.</p>
                            <ul class="header-top-socail-menu d-flex">
                                <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                                </li>
                                <li><a href="https://www.linkedin.com/"><i
                                            class="fa-brands fa-linkedin-in"></i></a>
                                </li>
                                <li><a href="https://www.pinterest.com/"><i
                                            class="fa-brands fa-pinterest-p"></i></a></li>
                                <li><a href="https://vimeo.com/"><i class="fa-brands fa-vimeo-v"></i></a></li>
                            </ul>
                        </div>
                        <div class="offcanvas__btn">
                            <div class="header__btn-wrap">
                                <a href="contact.html" class="rr-btn__header d-sm-none mb-10 w-100">
                                    <span class="btn-wrap">
                                        <span class="text-one">Get Started</span>
                                        <span class="text-two">Get Started</span>
                                    </span>
                                </a>
                                <a href="https://themeforest.net/user/rrdevs/portfolio"
                                   class="rr-btn__header w-100">
                                    <span class="btn-wrap">
                                        <span class="text-one">Purchase Now</span>
                                        <span class="text-two">Purchase Now</span>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="offcanvas__overlay"></div>
        <div class="offcanvas__overlay-white"></div>
        <!-- Offcanvas area start -->

        <!-- Header area start -->
        <%@include file="../homePageNavbar.jsp" %>


        <main>

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
                                        data-width="40px" class="left-separetor"></span>Projects</span>
                                <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                    data-cursor="-opaque">Manage Your Project
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div class="container-fluid  mt-5">
                <div class="container">

                    <!-- Customer Info Section -->
                    <div class="view-account">
                        <section class="module">
                            <div class="module-inner">
                                <%--User navbar--%>
                                <%@include file="../navbarUser.jsp"%>


                                <div class="content-panel">
                                    <div class="container">
                                        <!-- Projects Section -->
                                        <div class="col-md-9 projects-section" style="z-index:100;">
                                            <!-- Current Project Section -->
                                            <div class="current-project-section mb-5" style="margin-right: 10px">
                                                <h2 class="section-title text-dark">Current Project</h2>
                                                <c:forEach var="project" items="${currentProjects}">
                                                    <div class="card current-project-details p-4 shadow-sm mb-4"
                                                         onclick="window.location.href = '${pageContext.request.contextPath}/customer/projects/detail/${project.projectId}'"
                                                         style="cursor: pointer;">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <c:choose>
                                                                    <c:when test="${project.imgURL != null}">
                                                                        <img src="${project.getShowingImg(project.imgURL)}" alt="Project Image" class="img-fluid rounded">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="${pageContext.request.contextPath}/assets/imgs/mylogo/koi-background.jpg" alt="Default Project Image" class="img-fluid rounded">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <h4 class="project-title text-black">${project.projectName}</h4>
                                                                <p class="project-subtitle text-muted">Project Code: ${project.projectId}</p>
                                                                <p class="project-status text-muted">Status: 
                                                                    <c:choose>
                                                                        <c:when test="${project.status == 1}">
                                                                            <span class="badge badge-secondary badge-status">Pending</span>
                                                                        </c:when>
                                                                        <c:when test="${project.status == 2}">
                                                                            <span class="badge badge-primary badge-status">Processing</span>
                                                                        </c:when>
                                                                        <c:when test="${project.status == 3}">
                                                                            <span class="badge badge-success badge-status">Completed</span>
                                                                        </c:when>
                                                                        <c:when test="${project.status == 4}">
                                                                            <span class="badge badge-danger badge-status">Canceled</span>
                                                                        </c:when>
                                                                        <c:when test="${project.status == 5}">
                                                                            <span class="badge badge-warning badge-status">Request Cancel</span>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    </td>
                                                                </p>
                                                            </div>
                                                        </div>

                                                        <!-- Stage Section -->
                                                        <div class="project-stages-container mt-4">
                                                            <div class="row justify-content-between">
                                                                <c:set var="currentStage"
                                                                       value="${project.stage}" />

                                                                <!-- Stage 1: Planning -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage > 1) ? 'btn-success' : (currentStage == 1) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <button type="button"
                                                                            class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                        Planning
                                                                    </button>
                                                                </div>

                                                                <!-- Stage 2: Design -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage > 2) ? 'btn-success' : (currentStage == 2) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <c:choose>
                                                                        <c:when test="${currentStage >= 2}">
                                                                            <a href="${pageContext.request.contextPath}/customer/design/detail/${project.design.designId}"
                                                                               class="btn stage-button btn-md btn-block px-3 ${buttonClass} stage-with-details">
                                                                                Design <i
                                                                                    class="fas fa-info-circle"></i>
                                                                            </a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <button type="button"
                                                                                    class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                                Design
                                                                            </button>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>

                                                                <!-- Stage 3: Construction -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage > 3) ? 'btn-success' : (currentStage == 3) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <c:choose>
                                                                        <c:when test="${currentStage >= 3}">
                                                                            <a href="${pageContext.request.contextPath}/customer/construction/detail/${project.construction.constructionId}"
                                                                               class="btn stage-button btn-md btn-block px-3 ${buttonClass} stage-with-details">
                                                                                Construction <i
                                                                                    class="fas fa-info-circle"></i>
                                                                            </a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <button type="button"
                                                                                    class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                                Construction
                                                                            </button>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>

                                                                <!-- Stage 4: Maintenance -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage > 4) ? 'btn-success' : (currentStage == 4) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <button type="button"
                                                                            class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                        Maintenance
                                                                    </button>
                                                                </div>

                                                                <!-- Stage 5: Complete -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage == 5) ? 'btn-success' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <button type="button"
                                                                            class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                        Complete
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>

                                            <!-- Done Projects Section -->
                                            <div class="done-projects-section" style="margin-right: 10px">
                                                <h2 class="section-title text-dark">Done Projects</h2>
                                                <c:forEach var="project" items="${doneProjects}">
                                                    <div class="card done-project p-4 shadow-sm mb-4"
                                                         onclick="window.location.href = '${pageContext.request.contextPath}/customer/projects/detail/${project.projectId}'"
                                                         style="cursor: pointer;">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <c:choose>
                                                                    <c:when test="${project.imgURL != null}">
                                                                        <img src="${project.getShowingImg(project.imgURL)}" alt="Done Project Image" class="done-project-img img-fluid rounded border border-secondary">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="${pageContext.request.contextPath}/assets/imgs/mylogo/koi-background.jpg" alt="Default Done Project Image" class="done-project-img img-fluid rounded border border-secondary">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <h4 class="done-project-title text-secondary">${project.projectName}</h4>
                                                                <p class="done-project-subtitle text-muted">Project Code: ${project.projectId}</p>
                                                                <p class="project-status text-muted">Completed on: <fmt:formatDate value="${project.dateEnd}" pattern="MMM dd yyyy"/></p>
                                                                <p>
                                                                    <span class="badge ${project.status == 4 ? 'bg-danger' : project.status == 3 ? 'bg-success' : ''}">
                                                                        ${project.status == 4 ? 'Cancelled' : project.status == 3 ? 'Completed' : ''}
                                                                    </span>
                                                                </p>
                                                            </div>
                                                        </div>

                                                        <!-- Stage Section -->
                                                        <div class="project-stages-container mt-4">
                                                            <div class="row justify-content-between">
                                                                <c:set var="currentStage"
                                                                       value="${project.stage}" />

                                                                <!-- Stage 1: Planning -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage > 1) ? 'btn-success' : (currentStage == 1) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <button type="button"
                                                                            class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                        Planning
                                                                    </button>
                                                                </div>

                                                                <!-- Stage 2: Design -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage > 2) ? 'btn-success' : (currentStage == 2) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center">
                                                                    <c:choose>
                                                                        <c:when test="${currentStage >= 2}">
                                                                            <a href="${pageContext.request.contextPath}/customer/design/detail/${project.design.designId}"
                                                                               class="btn stage-button btn-md btn-block px-3 ${buttonClass} stage-with-details">
                                                                                Design <i
                                                                                    class="fas fa-info-circle"></i>
                                                                            </a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <button type="button"
                                                                                    class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                                Design
                                                                            </button>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>

                                                                <!-- Stage 3: Construction -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage > 3) ? 'btn-success' : (currentStage == 3) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <c:choose>
                                                                        <c:when test="${currentStage >= 3}">
                                                                            <a href="${pageContext.request.contextPath}/customer/construction/detail/${project.construction.constructionId}"
                                                                               class="btn stage-button btn-md btn-block px-3 ${buttonClass} stage-with-details">
                                                                                Construction <i
                                                                                    class="fas fa-info-circle"></i>
                                                                            </a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <button type="button"
                                                                                    class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                                Construction
                                                                            </button>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>

                                                                <!-- Stage 4: Maintenance -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage > 4) ? 'btn-success' : (currentStage == 4) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <button type="button"
                                                                            class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                        Maintenance
                                                                    </button>
                                                                </div>

                                                                <!-- Stage 5: Complete -->
                                                                <c:set var="buttonClass"
                                                                       value="${(currentStage == 5) ? 'btn-success' : 'btn-outline-secondary'}" />
                                                                <div class="col text-center ">
                                                                    <button type="button"
                                                                            class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                        Complete
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

                <!-- YOU ENDED FETCH THE STRUCTURE INSIDE HERE -->


                <!-- YOU ENDED FETCH THE STRUCTURE INSIDE HERE -->



                <!-- YOU STARTED FETCH THE STRUCTURE INSIDE HERE  -->
            </div>
        </main>
        <!-- Footer area start -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <!-- Load a compatible jQuery version -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <%@include file="../spacing.jsp" %>
            <%@include file="../footer.jsp" %>
                <%@include file="../scriptTemplate.jsp" %>

        <!-- Footer area end -->
        <script>

        </script>

        <!-- JS here -->


    </body>

</html>


            </html>
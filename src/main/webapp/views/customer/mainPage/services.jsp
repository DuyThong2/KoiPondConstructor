<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>HappiKoi</title>
    <meta name="description" content="Ribuild - Construction Company HTML5 Template">
    <meta name="author" content="ahmmedsabbirbd">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->

    <link rel="shortcut icon" type="image/x-icon" href="assets/imgs/favicon.svg">
    <!-- CSS here -->
    <%@include file="../cssTemplate.jsp"%>
    <%@include file="../cssCustom.jsp"%>

    <style>
        .d-flex{
            margin-top: 0;
        }
        .section-title {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .section-title h2 {
            margin-top: 20px;
            border-bottom: 2px solid #ff5733;
            font-size: 2.8em;
            font-weight: bold;
            margin-bottom: 10px;
            color: #ff5733; /* Accent color */
        }
        .section-title p {
            font-size: 1.6em;
            color: #666;
        }
        /* Section spacing */
        section {
            padding: 50px 0;
        }

        .service-card h3 {
            color: #ff5733;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .process-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 30px; /* Increase gap for better spacing */
            justify-content: center;
            text-align: center;
            margin-bottom: 50px;
        }

        /* Individual process item styling */
        .process-item {
            background-color: #ffffff; /* Pure white for cleaner look */
            border: 1px solid #ececec; /* Lighter border color */
            padding: 30px; /* More padding for spaciousness */
            border-radius: 15px; /* Increased border-radius for softer edges */
            flex: 0 1 calc(33.333% - 30px); /* Adjust width */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08); /* Softer shadow for more elegance */
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Add hover effect */
            position: relative;
        }

        .process-item:hover {
            transform: translateY(-10px); /* Subtle hover effect */
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1); /* Increase shadow on hover */
        }

        /* Number styling for each process */
        .process-number {
            font-size: 3.5em; /* Slightly larger font */
            color: #ffac33;
            font-weight: bold;
            margin-bottom: 20px; /* More space below the number */
        }

        /* Process title and paragraph styling */
        .process-item h4 {
            font-size: 1.6em;
            color: #333;
            margin-bottom: 15px;
        }

        .process-item p {
            font-size: 1.2em; /* Slightly larger paragraph text */
            color: #666;
            margin-bottom: 20px; /* More spacing below paragraphs */
        }

        @media (max-width: 480px) {
            .process-item {
                flex: 0 1 100%;
            }
        }


        @media (max-width: 768px) {
            .isotope-item {
                width: 100%;
                margin-bottom: 20px;
            }

            .blog-thumb img {
                width: 100%;
                height: auto;
            }

            .section-title h2 {
                font-size: 2.2em;
            }

            .process-item {
                flex: 0 1 calc(50% - 30px);
            }
        }
        @media (max-width: 480px) {
            .process-item {
                flex: 0 1 100%; /* One item per row for mobile */
                padding: 20px; /* Reduce padding for smaller screens */
            }

            .process-number {
                font-size: 3em; /* Smaller number font for mobile */
            }

            .process-item h4 {
                font-size: 1.4em;
            }

            .process-item p {
                font-size: 1.1em;
            }
        }
    </style>
</head>

<body class="body-1">

<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- preloader start -->
<!-- style 1 -->
<div id="preloader" data-preloader="active" data-loaded="doted">
    <div class="preloader-close">x</div>
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>

<!-- style 2 -->
<div class="preloader" data-preloader="deactive" data-loaded="progress">
    <div class="preloader-close">x</div>
    <div class="wrapper w-100 text-center">
        <div id="progress-bar" class="preloader-text" data-text="RIBUILD"></div>
        <div class="progress-bar">
            <div class="progress"></div>
        </div>
    </div>
</div>
<!-- preloader end -->

<!-- preloader start -->
<div class="loading-form">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<!-- preloader end -->

<!-- Backtotop start -->
<!-- <div id="scroll-percentage">
    <span id="scroll-percentage-value"></span>
</div> -->
<!-- Backtotop end -->

<!-- cursorAnimation start -->
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
                                <img src="${pageContext.request.contextPath}/assets/imgs/logo/logo-white.svg" alt="img">
                            </a>
                        </div>
                        <div class="search__close">
                            <button type="button" class="search__close-btn search-close-btn">
                                <svg width="18" height="18" viewBox="0 0 18 18" fill="none">
                                    <path d="M17 1L1 17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                          stroke-linejoin="round" />
                                    <path d="M1 1L17 17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                          stroke-linejoin="round" />
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="search__form">
                        <form action="#">
                            <div class="search__input">
                                <input class="search-input-field" type="text" placeholder="Type here to search...">
                                <span class="search-focus-border"></span>
                                <button type="submit">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                        <path
                                                d="M9.55 18.1C14.272 18.1 18.1 14.272 18.1 9.55C18.1 4.82797 14.272 1 9.55 1C4.82797 1 1 4.82797 1 9.55C1 14.272 4.82797 18.1 9.55 18.1Z"
                                                stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                        <path d="M19.0002 19.0002L17.2002 17.2002" stroke="currentColor" stroke-width="1.5"
                                              stroke-linecap="round" stroke-linejoin="round" />
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
                            <img src="${pageContext.request.contextPath}/assets/imgs/logo/logo-white.svg" alt="logo not found">
                        </a>
                    </div>
                    <div class="offcanvas__close">
                        <button class="offcanvas-close-icon animation--flip">
                                    <span class="offcanvas-m-lines">
                                        <span class="offcanvas-m-line line--1"></span><span class="offcanvas-m-line line--2"></span><span class="offcanvas-m-line line--3"></span>
                                    </span>
                        </button>
                    </div>
                </div>
                <div class="mobile-menu fix"></div>
                <div class="offcanvas__social">
                    <h4 class="offcanvas__title mb-20">Subscribe & Follow</h4>
                    <p class="mb-30">The scallops were perfectly cooked, tender, and flavorful, paired beautifully with a creamy risotto and seasonal vegetables. The presentation was artful, showcasing the chef's attention to detail.</p>
                    <ul class="header-top-socail-menu d-flex">
                        <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://www.linkedin.com/"><i class="fa-brands fa-linkedin-in"></i></a></li>
                        <li><a href="https://www.pinterest.com/"><i class="fa-brands fa-pinterest-p"></i></a></li>
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
                        <a href="https://themeforest.net/user/rrdevs/portfolio" class="rr-btn__header w-100">
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
<!-- Header area end -->

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

                            </span> <a href="${pageContext.request.contextPath}/" class="theme-color">Home</a></span>
                    <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                        data-cursor="-opaque">Services
                    </h2>
                </div>
            </div>
        </div>
    </div>
</section>
<main>
    <div class="container">
        <!-- Row -->
        <div class="row">
            <div class="offset-md-2 col-md-8">
                <div class="title-wrap text-center">
                    <div class="section-title">
                        <h2 class="title mb-0">Unique Solutions For <span class="theme-color">Your Business</span></h2>
                    </div>
                    <div class="section-description">
                        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa officia deserunt mollit anim est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit vestibulum nec.</p>
                    </div>
                </div>
            </div>
            <!-- Services Grid -->
            <div class="col-md-12">
                <div class="row">
                    <c:forEach var="service" items="${services}">
                        <div class="col-md-4">
                            <div class="service-box-wrap service-box-style-1 text-center">
                                <!-- Service Icon or Image -->
                                <div class="service-icon mb-3">
                                    <img src="${pageContext.request.contextPath}/assets/imgs/logo/zoomed_logo_image.png" alt="${service.serviceName}" class="img-fluid" style="width: 150px ; height: 150px">
                                </div>
                                <!-- Service Content -->
                                <h3 class="service-title">${service.serviceName}</h3>
                                <p class="service-description">${service.serviceDescription}</p>
                                <a href="${pageContext.request.contextPath}/home/services/${service.serviceId}" class="btn btn-default link">Detail</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center mt-4">
        <!-- Previous Button -->
        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}" class="btn btn-custom">&lt;</a>
        </c:if>
        <c:if test="${currentPage == 1}">
            <button class="btn btn-custom" disabled>&lt;</button>
        </c:if>

        <!-- Page Indicator -->
        <span class="page-indicator"><strong>${currentPage}</strong> / <strong>${totalPages}</strong></span>

        <!-- Next Button -->
        <c:if test="${hasMoreServices}">
            <a href="?page=${currentPage + 1}" class="btn btn-custom">&gt;</a>
        </c:if>
        <c:if test="${!hasMoreServices}">
            <button class="btn btn-custom" disabled>&gt;</button>
        </c:if>
    </div>


    <section class="bg-light">
        <div class="container">
            <div class="section-title">
                <h2>Service Implementation Process at Happikoi</h2>
            </div>

            <div class="process-grid">
                <div class="process-item">
                    <div class="process-number">1</div>
                    <h4>Receive Customer Request</h4>
                    <p>We receive and record information about your garden landscape design and koi pond construction needs.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">2</div>
                    <h4>On-Site Survey</h4>
                    <p>Our team conducts an on-site survey to assess the area and ensure accuracy in the design and construction phases.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">3</div>
                    <h4>Design Proposal</h4>
                    <p>We propose a preliminary design that reflects natural elements, aesthetics, and your personal preferences.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">4</div>
                    <h4>Quote Submission</h4>
                    <p>We provide a detailed quotation based on the project scope, including all design and construction costs.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">5</div>
                    <h4>Design Finalization</h4>
                    <p>Once the quote is approved, the design is finalized in 3D, giving you a full visualization of the project.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">6</div>
                    <h4>Construction and Supervision</h4>
                    <p>We begin construction and supervise the project to ensure it meets design specifications and quality standards.</p>
                </div>
            </div>
        </div>
    </section>





</main>

<%@include file="../footer.jsp" %>
<%@include file="../scriptTemplate.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>
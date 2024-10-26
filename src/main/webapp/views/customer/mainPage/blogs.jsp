<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
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

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/imgs/favicon.svg">

    <!-- CSS here -->
    <%@include file="../cssTemplate.jsp"%>
    <%@include file="../cssCustom.jsp"%>

    <style>
        /* Container for blog items */
        .isotope-grid {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 25px; /* Add more space between items */
        }

        .isotope-item {
            width: 360px; /* Make the items bigger */
            margin-bottom: 30px;
            position: relative;
            border-radius: 10px; /* Add border radius */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add subtle shadow */
            transition: box-shadow 0.3s ease; /* Smooth transition for hover effect */
            background-color: #fff; /* Ensure the items have a white background */
        }

        .isotope-item:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Enhance shadow on hover */
        }

        .blog-thumb {
            position: relative;
            overflow: hidden;
            border-radius: 10px 10px 0 0; /* Make the top corners rounded */
        }

        .blog-thumb img {
            width: 360px; /* Adjust the size for bigger items */
            height: 260px;
            object-fit: cover; /* Ensure the image fits well */
            border-radius: 10px 10px 0 0; /* Match the corner rounding */
        }

        .post-date {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #FFC107;
            padding: 8px;
            border-radius: 4px;
            font-size: 12px;
            color: #fff;
            font-weight: bold;
            writing-mode: vertical-rl; /* To display text vertically */
            text-align: center;
            width: 35px; /* Ensure the label width is fixed */
        }

        .blog-details {
            padding: 20px; /* Add padding inside the content */
            background-color: #fff; /* Ensure a white background for content */
            border-radius: 0 0 10px 10px; /* Rounded corners for bottom */
        }

        .blog-title h4 {
            font-size: 20px; /* Larger font for the title */
            color: #333;
            margin-bottom: 5px;
        }

        /* Small description text below the title */
        .blog-description {
            font-size: 14px; /* Smaller font size for the description */
            color: #666;
            margin-bottom: 10px;
        }

        .post-desc a {
            color: #FFC107;
            font-size: 16px; /* Slightly larger font for 'Read More' */
            font-weight: 500;
            text-decoration: none;
        }


        .section-title {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .section-title h2 {
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
        .d-flex{
            margin-top: 0;
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
            .process-item {
                flex: 0 1 100%;
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
                                <s   vg width="18" height="18" viewBox="0 0 18 18" fill="none">
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
<div class="page-title-wrap typo-white">
    <div class="page-title-wrap-inner section-bg-img" data-bg="images/bg/page-title-bg.jpg">
        <span class="black-overlay"></span>
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12">
                    <div class="page-title-inner">
                        <div id="breadcrumb" class="breadcrumb mb-1 mb-lg-2">
                            <a href="${pageContext.request.contextPath}/" class="theme-color">Home</a>
                            <span class="current">Project</span>
                        </div>
                        <h1 class="page-title mb-0">Project</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="height:100px">

</div>
<main>
    <section id="blog-section" class="blog-section pad-bottom-70">
        <div class="container">
            <!-- Blog Main Wrap -->
            <div class="blog-main-wrap blog-grid masonry-grid-default">
                <!-- Row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="isotope-grid" data-gutter="30" data-cols="3">
                            <!-- isotope-item-->
                            <c:forEach var="blog" items="${blogs}">
                                <div class="isotope-item">
                                    <div class="blog-style-1 post-type post-grid">
                                        <div class="blog-inner mb-4">
                                            <div class="blog-thumb relative">
                                                <img src="${pageContext.request.contextPath}/assets/imgs/mylogo/koi-background.jpg" class="img-fluid" alt="blog-img" />
                                                <div class="post-date">
                                                    <p> <i class="ti-calendar"></i>
                                                        <fmt:formatDate value="${blog.datePost}" pattern="dd-MM-yyyy"/></p>


                                                </div>
                                            </div>
                                            <div class="blog-details">
                                                <div class="blog-title">
                                                    <h4 class="margin-bottom-10"><a href="${pageContext.request.contextPath}/home/blogs/${blog.id}" class="blog-name">${blog.name}</a></h4>
                                                </div>
                                                <!-- Small description below the title -->
                                                <div class="blog-description">
                                                        ${blog.description}
                                                </div>
                                                <div class="post-desc mt-2">
                                                    <div class="blog-link">
                                                        <a target="_blank" href="${pageContext.request.contextPath}/home/blogs/${blog.id}" class="link font-w-500">Read More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!-- isotope-item end -->
                        </div>
                    </div>
                    <!-- Col -->
                    <div class="col-lg-12">
                        <div class="post-pagination-wrap mt-4 mt-xl-0">
                            <ul class="nav pagination post-pagination justify-content-center test-pagination">
                                <li class="nav-item"><a href="#" class="prev-page" title="prev"><i class="ti-angle-left"></i></a></li>
                                <li class="nav-item active"><span class="active">01</span></li>
                                <li class="nav-item"><a href="#">02</a></li>
                                <li class="nav-item"><a href="#" class="next-page" title="next"><i class="ti-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Col -->
                </div>
                <!-- row -->
            </div>
            <!-- Blog Main Wrap -->
            <div class="d-flex align-items-center mt-4">
                <!-- Previous Button -->
                <c:if test="${currentPage > 1}">
                    <a href="?page=${currentPage - 1}" class="btn btn-custom">&lt;</a>
                </c:if>
                <c:if test="${currentPage == 1}">
                    <button class="btn btn-custom" disabled>&lt;</button>
                </c:if>

                <!-- Page Indicator -->
                <span class="page-indicator">Page <strong>${currentPage}</strong> / <strong>${totalPages}</strong></span>

                <!-- Next Button -->
                <c:if test="${hasMoreServices}">
                    <a href="?page=${currentPage + 1}" class="btn btn-custom">&gt;</a>
                </c:if>
                <c:if test="${!hasMoreServices}">
                    <button class="btn btn-custom" disabled>&gt;</button>
                </c:if>
            </div>
        </div>
        <!-- Container -->
    </section>



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


<!-- Footer area start -->

<%@include file="../footer.jsp" %>
<!-- Footer area end -->

<!-- JS here -->
<%@include file="../scriptTemplate.jsp"%>

</body>

</html>
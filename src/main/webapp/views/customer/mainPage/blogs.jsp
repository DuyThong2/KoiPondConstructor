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
        .rr-btn{
                            padding:15px;
                          
                            background-color: black;
                        }
                        .page-indicator{
                            font-size:20px;
                            color: #232323 !important;
                        }
                        .blog__item {
                            transition: transform 0.3s ease-in-out;
                            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
                        }
                        .blog__item:hover {
                            transform: translateY(-5px);
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
                            <a href="#">
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
                        <a href="#">
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
                        <a href="#" class="rr-btn__header d-sm-none mb-10 w-100">
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
                        data-cursor="-opaque">Blog
                    </h2>
                </div>
            </div>
        </div>
    </div>
</section>

<main>
    <section class="blog section-space section-bg-3">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section__title-wrapper text-center mb-60 mb-sm-40 mb-xs-35">
                        <span class="section__subtitle justify-content-center mb-13 ml-0"><span data-width="40px" class="left-separator"></span>Trending Topics<span data-width="40px" class="right-separator"></span></span>
                        <h2 class="section__title title-animation text-capitalize rr-br-hidden-md" data-cursor="-opaque">Latest Articles & Blog Posts</h2>
                    </div>

                </div>
            </div>

            <div class="row mb-minus-30">
                <c:forEach var="blog" items="${blogs}">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="blog__item has-box-shadow mb-30" style="border-radius: 8px; overflow: hidden; transition: transform 0.3s;">
                            <a href="#" data-cursor-text="View" class="blog__item-media d-block" style="overflow: hidden;">
                                <img src="${blog.getShowingImg(blog.imgUrl)}" alt="image not found" class="img-fluid" style="width: 100%; height: auto; transition: transform 0.3s;">
                            </a>
                            <div class="blog__item-text p-4" style="background-color: #ffffff;">
                                <div class="blog__item-meta mb-10 text-muted d-flex justify-content-between">
                                    <a href="#" class="text-secondary">
                                        <i class="fas fa-user"></i> ${blog.staff.name}
                                    </a>
                                    <a href="#" class="text-secondary">
                                        <i class="fas fa-calendar"></i> <fmt:formatDate value="${blog.datePost}" pattern="MMM dd yyyy"/>
                                    </a>
                                </div>
                               <div class="d-flex flex-column justify-content-around" style="min-height:200px;">
                                <h4 class="blog__item-title mb-3 text-dark font-weight-bold"><a href="${pageContext.request.contextPath}/home/blogs/${blog.id}">${blog.name}</a></h4>
                                <p class="text-muted mb-4">${blog.description}</p>
                                <a class="blog__item-readmore" href="${pageContext.request.contextPath}/home/blogs/${blog.id}">
                                    <svg width="20" height="11" viewBox="0 0 20 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M1 5.5L19 5.5" stroke="#6A6A6A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M13.75 1L19 5.5L13.75 10" stroke="#6A6A6A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>Read More</a>
                               </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="d-flex align-items-center mt-4">
                    <!-- Previous Button -->
                    <c:if test="${currentPage > 1}">
                        <a href="?page=${currentPage - 1}" class="rr-btn">&lt;</a>
                    </c:if>
                    <c:if test="${currentPage == 1}">
                        <button class="rr-btn" disabled>&lt;</button>
                    </c:if>
    
                    <!-- Page Indicator -->
                    <span class="page-indicator"> <strong>${currentPage}</strong> /
                        <strong>${totalPages}</strong></span>
    
                    <!-- Next Button -->
                    <c:if test="${hasMoreServices}">
                        <a href="?page=${currentPage + 1}" class="rr-btn">&gt;</a>
                    </c:if>
                    <c:if test="${!hasMoreServices}">
                        <button class="rr-btn" disabled>&gt;</button>
                    </c:if>

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
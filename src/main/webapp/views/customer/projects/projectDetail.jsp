<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!doctype html>
        <html class="no-js" lang="zxx">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="x-ua-compatible" content="ie=edge">
            <title>Ribuild - Construction Company HTML5 Template</title>
            <meta name="description" content="Ribuild - Construction Company HTML5 Template">
            <meta name="author" content="ahmmedsabbirbd">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <!-- Place favicon.ico in the root directory -->
            <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/imgs/favicon.svg' />">
            <!-- CSS here -->
            <link rel="stylesheet" href="<c:url value='/assets/css/vendor/bootstrap.min.css' />">
            <link rel="stylesheet" href="<c:url value='/assets/css/vendor/animate.min.css' />">
            <link rel="stylesheet" href="<c:url value='/assets/css/plugins/swiper.min.css' />">
            <link rel="stylesheet" href="<c:url value='/assets/css/vendor/magnific-popup.css' />">
            <link rel="stylesheet" href="<c:url value='/assets/css/vendor/fontawesome-pro.css' />">
            <link rel="stylesheet" href="<c:url value='/assets/css/vendor/spacing.css' />">
            <link rel="stylesheet" href="<c:url value='/assets/css/plugins/odometer-theme-default.css' />">
            <link rel="stylesheet" href="<c:url value='/assets/css/plugins/carouselTicker.css' />">
            <link rel="stylesheet" href="<c:url value='/assets/css/main.css' />">
            <style>
                .card-active {
                    background-color: #28a745;
                    /* Green for active stage */
                    color: #FFFFFF !important;
                    /* Force text to be white for readability */
                }

                .card-active p,
                .card-active span,
                .card-active i {
                    color: #FFFFFF !important;
                    /* Ensure all child elements also have white text */
                }

                /* Success stage: border green, text remains default */
                .card-success {
                    background-color: #FFFFFF;
                    /* White background */
                    border: 2px solid #28a745;
                    /* Green border */
                    color: #28a745;
                    /* Text color should match the success theme */
                }

                .card-success p,
                .card-success span,
                .card-success i {
                    color: #28a745 !important;
                    /* Ensure all child elements match the success color */
                }

                /* White stage: default styles */
                .card-white {
                    background-color: #FFFFFF;
                    /* White background */
                    border: 2px solid #df2453;
                    /* Default border color (use your theme color here) */
                    color: #000000;
                    /* Black text */
                }

                .card-white p,
                .card-white span,
                .card-white i {
                    color: #000000;
                    /* Ensure all child elements have black text */
                }

                .customer-button-large {
                    padding: 15px 30px;
                    /* Example padding to make buttons larger */
                    font-size: 1.2rem;
                    /* Example font size */
                    font-weight: bold;
                    /* Make text bold for better readability */
                }
            </style>
        </head>

        <body class="body-1">

            <!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

            <!-- preloader start -->
            <!-- style 1 -->
            <!-- <div id="preloader" data-preloader="active" data-loaded="doted">
    <div class="preloader-close">x</div>
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div> -->

            <!-- style 2 -->
            <!-- <div class="preloader" data-preloader="deactive" data-loaded="progress">
    <div class="preloader-close">x</div>
    <div class="wrapper w-100 text-center">
        <div id="progress-bar" class="preloader-text" data-text="RIBUILD"></div>
        <div class="progress-bar">
            <div class="progress"></div>
        </div>
    </div>
</div> -->
            <!-- preloader end -->

            <!-- preloader start -->
            <!-- <div class="loading-form">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div> -->
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
                                            <img src="assets/imgs/logo/logo-white.svg" alt="img">
                                        </a>
                                    </div>
                                    <div class="search__close">
                                        <button type="button" class="search__close-btn search-close-btn">
                                            <s vg width="18" height="18" viewBox="0 0 18 18" fill="none">
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
                                                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                                        stroke-linejoin="round" />
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
                                        <img src="assets/imgs/logo/logo-white.svg" alt="logo not found">
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
                                    <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="https://www.linkedin.com/"><i class="fa-brands fa-linkedin-in"></i></a>
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
            <header>
                <div id="header-sticky" class="header__area header-3">
                    <div class="header__top d-none d-xl-block color-pink"
                        style="background-color:rgba(rgba(255, 27, 80, 0.847), green, blue, alpha)">
                        <div class="container">
                            <div class="row g-24">
                                <div class="col-xl-5">
                                    <ul class="header__top-menu d-flex ">
                                        <li>
                                            <a href="https://maps.app.goo.gl/V5BeTXNv6WAniBN58">
                                                <span>
                                                    <svg width="16" height="18" viewBox="0 0 16 18" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M14.7143 7.54545C14.7143 12.6364 7.85714 17 7.85714 17C7.85714 17 1 12.6364 1 7.54545C1 5.80949 1.72245 4.14463 3.00841 2.91712C4.29437 1.68961 6.03852 1 7.85714 1C9.67577 1 11.4199 1.68961 12.7059 2.91712C13.9918 4.14463 14.7143 5.80949 14.7143 7.54545Z"
                                                            stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                            stroke-linejoin="round" />
                                                        <path
                                                            d="M7.857 9.72741C9.11937 9.72741 10.1427 8.75057 10.1427 7.54559C10.1427 6.3406 9.11937 5.36377 7.857 5.36377C6.59464 5.36377 5.57129 6.3406 5.57129 7.54559C5.57129 8.75057 6.59464 9.72741 7.857 9.72741Z"
                                                            stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                            stroke-linejoin="round" />
                                                    </svg>
                                                </span>
                                                Lô E2a-7, D1 Street, Đ. D1 - FPT UNIVERSITY
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-xl-7">
                                    <div class="header__top-wrapper d-flex justify-content-end">

                                        <div class="header__top-email">
                                            <a href="mailto:Info@ribuild.com">
                                                <svg width="19" height="16" viewBox="0 0 19 16" fill="none"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M2.7 1H16.3C17.235 1 18 1.7875 18 2.75V13.25C18 14.2125 17.235 15 16.3 15H2.7C1.765 15 1 14.2125 1 13.25V2.75C1 1.7875 1.765 1 2.7 1Z"
                                                        stroke="#F44E19" stroke-width="1.5" stroke-linecap="round"
                                                        stroke-linejoin="round" />
                                                    <path d="M18 2.75L9.5 8.875L1 2.75" stroke="#F44E19"
                                                        stroke-width="1.5" stroke-linecap="round"
                                                        stroke-linejoin="round" />
                                                </svg>

                                                happikoi@contructioninc.com
                                            </a>
                                        </div>
                                        <ul class="header__top-socail d-flex ">
                                            <li class="title">Visit Us:</li>
                                            <li><a href="https://www.facebook.com/"><i
                                                        class="fab fa-facebook-f"></i></a></li>
                                            <li><a href="https://twitter.com/"><i class="fab fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                            <li><a href="#"><i class="fa-brands fa-linkedin"></i></a></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="mega__menu-wrapper p-relative">
                            <div class="header__main">
                                <div class="header__logo">
                                    <a href="index.html">
                                        <div class="logo">
                                            <img class="img-fluid"
                                                src="/assets/imgs/logo/final_resized_colored_logo_image.png"
                                                alt="logo not found">
                                        </div>
                                    </a>
                                </div>

                                <div class="mean__menu-wrapper d-none d-lg-block">
                                    <div class="main-menu main-menu-3 onepagenav">
                                        <nav id="mobile-menu">
                                            <ul>
                                                <li><a href="#banner">Home</a></li>
                                                <li><a href="#mision =">Best Design</a></li>
                                                <li><a href="#services">Services</a></li>
                                                <li><a href="#portfolio">Blog</a></li>
                                                <li><a href="#pricing">Pricing</a></li>
                                                <li><a href="#blog">Your Project</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>

                                <div class="header__right">
                                    <div class="header__action d-flex align-items-center">
                                        <div class="header__btn-wrap align-items-center d-inline-flex">
                                            <div class="rr-header-icon-search d-none d-sm-flex">
                                                <button class="search-open-btn">
                                                    <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M9.88966 18.7793C14.7993 18.7793 18.7793 14.7993 18.7793 9.88966C18.7793 4.98004 14.7993 1 9.88966 1C4.98004 1 1 4.98004 1 9.88966C1 14.7993 4.98004 18.7793 9.88966 18.7793Z"
                                                            stroke="#767676" stroke-width="1.5" stroke-linecap="round"
                                                            stroke-linejoin="round" />
                                                        <path d="M21.0017 20.9978L16.168 16.1641" stroke="#767676"
                                                            stroke-width="1.5" stroke-linecap="round"
                                                            stroke-linejoin="round" />
                                                    </svg>
                                                </button>
                                            </div>

                                            <div
                                                class="rr-header-contact-btn d-flex align-items-space-between d-none d-md-flex">

                                                <a href="index.html" class="rr-btn__header">
                                                    <span class="btn-wrap">
                                                        <span class="text-one turn-off-animation-button ">Login </span>
                                                    </span>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="header__hamburger ml-30 d-xl-none">
                                            <div class="sidebar__toggle">
                                                <a class="bar-icon" href="javascript:void(0)">
                                                    <span></span>
                                                    <span></span>
                                                    <span></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <main>
                <!-- FOLLOW THIS SECTION STRUCTURE TO LAYOUT MY WEBSITE -->
                <!-- <section class="our-professional section-space">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section__title-wrapper text-center mb-60 mb-sm-40 mb-xs-35">
                        <span class="section__subtitle justify-content-center mb-13 ml-0"><span data-width="40px" class="left-separetor"></span>Our Professionals<span data-width="40px" class="right-separetor"></span></span>
                        <h2 class="section__title title-animation text-capitalize rr-br-hidden-md" data-cursor="-opaque">Experienced & Professional Team</h2>
                    </div>
                </div>
            </div>

            <div class="row mb-minus-30">
                <c:forEach var="staff" items="${staffList}">
                    <div class="col-xl-3 col-md-6">
                        <div class="our-professional__item mb-30">
                            <a href="team-details.html" class="our-professional__item-media d-block" data-cursor-text="View">
                                <img src="assets/imgs/our-professional/anhthien.jpg" alt="image not found" class="img-fluid">
                            </a>
                            <div class="our-professional__item__content d-flex align-items-center justify-content-center text-center">
                                <div class="our-professional__item-text">
                                    <h4 class="our-professional__item-title text-center rr-fw-bold  mb-0"><a href="team-details.html">${staff.name}</a></h4>
                                    <span class="our-professional__item-subtitle text-center">${staff.department}</span>
                                </div>
                            </div>
                            <div class="our-professional__item-to-plus">
                                <button></button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section> -->
                <!-- YOU STARTED FETCH THE STRUCTURE INSIDE HERE  -->

                <!-- YOU STARTED FETCH THE STRUCTURE INSIDE HERE -->

                <!-- YOU STARTED FETCH THE STRUCTURE INSIDE HERE -->
                <section id="services"
                    class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
                    <div class="container rr-shape-p-c_1">
                        <div class="service__shape-1 rr-shape-p-s_1 leftRight">
                            <div></div>
                        </div>
                        <div class="service__shape-2 rr-shape-p-s_1 rr-upDown">
                            <div></div>
                        </div>
                        <div class="row mb-30 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                            <div class="col-md-6">
                                <div class="section__title-wrapper text-center text-xl-start">
                                    <span class="section__subtitle justify-content-start mb-13"><span data-width="40px"
                                            class="left-separetor"></span>Projects</span>
                                    <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                        data-cursor="-opaque">Manage Your Project
                                    </h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="container-fluid project-details-container mt-5">
                    <div class="row">
                        <!-- Customer Info Section -->
                        <div class="col-md-3 customer-info-section">
                            <div class="customer-profile card p-4 shadow-sm mb-4">
                                <div class="d-flex align-items-center mb-4">
                                    <!-- Replace img with user icon -->
                                    <i class="fas fa-user profile-icon rounded-circle me-3"
                                        style="font-size: 3rem; color: var(--rr-theme-white);"></i>
                                    <div>
                                        <h5 class="customer-name mb-0 text-black">${Customer.name}</h5>
                                    </div>
                                </div>
                                <div class="contact-info text-secondary">
                                    <p><strong>Email:</strong> ${Customer.email}</p>
                                    <p><strong>Phone:</strong> ${Customer.phone}</p>
                                </div>
                                <a href="index.html" class="rr-btn">
                                    <span class="btn-wrap">
                                        <span class="text-one turn-off-animation-button">Edit Info</span>
                                    </span>
                                </a>
                            </div>
                        </div>

                        <!-- Projects Section -->
                        <div class="col-md-9 projects-section" style="z-index:1000;">
                            <!-- Current Project Section -->
                            <div class="current-project-section mb-5">
                                <h2 class="section-title text-dark">Current Project</h2>

                                <c:forEach var="project" items="${currentProjects}">
                                    <div class="card current-project-details p-4 shadow-sm mb-4">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <img src="assets/imgs/mylogo/koi-background.jpg" alt="Project Image"
                                                    class="project-img img-fluid rounded border border-primary">
                                            </div>
                                            <div class="col-md-8">
                                                <h4 class="project-title text-black">${project.projectName}</h4>
                                                <p class="project-subtitle text-secondary">Project Code:
                                                    ${project.projectId}</p>
                                                <p class="text-secondary">Project Status: ${project.status}</p>
                                               
                                            </div>
                                        </div>

                                        <!-- Stage Section -->


                                        <div class="project-stages-container">
                                            <div class="row justify-content-between">
                                                <c:set var="currentStage" value="${project.stage}" />
                                        
                                                <!-- Stage 1: Planning -->
                                                <c:set var="buttonClass" value="${(currentStage > 1) ? 'btn-success' : (currentStage == 1) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <button type="button" class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                        Planning
                                                    </button>
                                                </div>
                                        
                                                <!-- Stage 2: Design -->
                                                <c:set var="buttonClass" value="${(currentStage > 2) ? 'btn-success' : (currentStage == 2) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <c:choose>
                                                        <c:when test="${buttonClass == 'btn-success' || buttonClass == 'btn-primary'}">
                                                            <a href="/customer/project/design/${project.design.designId}" class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                               Design
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button" class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                Design
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                        
                                                <!-- Stage 3: Construction -->
                                                <c:set var="buttonClass" value="${(currentStage > 3) ? 'btn-success' : (currentStage == 3) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <c:choose>
                                                        <c:when test="${buttonClass == 'btn-success' || buttonClass1 == 'btn-primary'}">
                                                            <a  href="/customer/project/construction/${project.construction.constructionId}" class="btn stage-button btn-md btn-block px-3 ${buttonClass}" >
                                                               Construction
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button" class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                Construction
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                        
                                                <!-- Stage 4: Maintenance -->
                                                <c:set var="buttonClass" value="${(currentStage > 4) ? 'btn-success' : (currentStage == 4) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <button type="button" class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                        Maintenance
                                                    </button>
                                                </div>
                                        
                                                <!-- Stage 5: Complete -->
                                                <c:set var="buttonClass" value="${(currentStage == 5) ? 'btn-success' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <button type="button" class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                        Complete
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        

                                    </div>

                                </c:forEach>
                            </div>

                            <!-- Done Projects Section -->
                            <div class="done-projects-section">
                                <h2 class="section-title text-dark">Done Projects</h2>
                                <c:forEach var="project" items="${doneProjects}">
                                    <div class="card done-project p-4 shadow-sm mb-4">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <img src="assets/imgs/mylogo/koi-background.jpg"
                                                    alt="Done Project Image"
                                                    class="done-project-img img-fluid rounded border border-secondary">
                                            </div>
                                            <div class="col-md-8">
                                                <h4 class="done-project-title text-secondary">${project.projectName}
                                                </h4>
                                                <p class="done-project-subtitle text-muted">Project Code:
                                                    ${project.projectId}</p>
                                                <p class="project-status text-muted">Completed on: ${project.dateEnd}
                                                </p>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- YOU ENDED FETCH THE STRUCTURE INSIDE HERE -->


                <!-- YOU ENDED FETCH THE STRUCTURE INSIDE HERE -->



                <!-- YOU STARTED FETCH THE STRUCTURE INSIDE HERE  -->

            </main>
            <!-- Footer area start -->
            <footer>
            <section class="footer-2__area-common footer-bg-1 overflow-hidden">
                <div class="container rr-shape-p-c_1">
                    <div class="footer-2__shape-1 rr-shape-p-s_1 leftRight"><img src="assets/imgs/footer-2/shape-1.png"
                            alt="image not found"></div>
                    <div class="footer-2__shape-2 rr-shape-p-s_1 upDown"><img src="assets/imgs/footer-2/shape-2.png"
                            alt="image not found"></div>
                    <div class="footer-2__main-wrapper">
                        <div class="row mb-minus-50">
                            <div class="col-lg-4 col-6">
                                <div class="footer-2__widget footer-2__widget-item-1">
                                    <div class="footer-2__logo mb-35">
                                        <a href="index.html">
                                            <img class="img-fluid" src="assets/imgs/logo/logo-white.svg"
                                                alt="logo not found">
                                        </a>
                                    </div>

                                    <div class="footer-2__content mb-25 mb-xs-20">
                                        <p class="mb-0">Officia deserunt mollitia animi, id est laborum fuga. Et harum
                                            quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum
                                            soluta nobis est</p>
                                    </div>

                                    <div class="footer-2__working">
                                        <div class="footer-2__widget-title mb-14">
                                            <h4>Working Hours</h4>
                                        </div>
                                        <ul class="footer-2__working-list">
                                            <li>Saturday: 09.00AM – 05.00PM</li>
                                            <li>Thursday: 09.00AM – 05.00PM</li>
                                            <li>Friday: Close</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-2 col-6">
                                <div class="footer-2__widget footer-2__widget-item-2">
                                    <div class="footer-2__widget-title">
                                        <h4>Quick Links</h4>
                                    </div>
                                    <div class="footer-2__link">
                                        <ul>
                                            <li><a href="about-us.html">About Us</a></li>
                                            <li><a href="team.html">Our Team</a></li>
                                            <li><a href="team-details.html">Testimonials</a></li>
                                            <li><a href="blog.html">Blog Grid</a></li>
                                            <li><a href="project.html">Projects</a></li>
                                            <li><a href="contact.html">Contact Us</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-6">
                                <div class="footer-2__widget footer-2__widget-item-3">
                                    <div class="footer-2__widget-title">
                                        <h4>Our Service</h4>
                                    </div>

                                    <div class="footer-2__link">
                                        <ul>
                                            <li><a href="service-details.html">General Construction</a></li>
                                            <li><a href="service-details.html">Property Maintenance</a></li>
                                            <li><a href="service-details.html">Project Managment</a></li>
                                            <li><a href="service-details.html">Virtual Design & Build</a></li>
                                            <li><a href="service-details.html">Preconstruction</a></li>
                                            <li><a href="service-details.html">Terms of use</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-6">
                                <div class="footer-2__widget footer-2__widget-item-4">
                                    <div class="footer-2__widget-title">
                                        <h4>Our Gallery</h4>
                                    </div>

                                    <div class="footer-2__widget-gallery">
                                        <div class="row g-10">
                                            <div class="col-4">
                                                <a href="assets/imgs/gallery__item/gallery__item-popup-1.jpg"
                                                    class="footer-2__widget-gallery__item popup-image">
                                                    <img src="assets/imgs/gallery__item/gallery__item-1.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="col-4">
                                                <a href="assets/imgs/gallery__item/gallery__item-popup-2.jpg"
                                                    class="footer-2__widget-gallery__item popup-image">
                                                    <img src="assets/imgs/gallery__item/gallery__item-2.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="col-4">
                                                <a href="assets/imgs/gallery__item/gallery__item-popup-3.jpg"
                                                    class="footer-2__widget-gallery__item popup-image">
                                                    <img src="assets/imgs/gallery__item/gallery__item-3.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="col-4">
                                                <a href="assets/imgs/gallery__item/gallery__item-popup-4.jpg"
                                                    class="footer-2__widget-gallery__item popup-image">
                                                    <img src="assets/imgs/gallery__item/gallery__item-4.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="col-4">
                                                <a href="assets/imgs/gallery__item/gallery__item-popup-5.jpg"
                                                    class="footer-2__widget-gallery__item popup-image">
                                                    <img src="assets/imgs/gallery__item/gallery__item-5.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="col-4">
                                                <a href="assets/imgs/gallery__item/gallery__item-popup-6.jpg"
                                                    class="footer-2__widget-gallery__item popup-image">
                                                    <img src="assets/imgs/gallery__item/gallery__item-6.jpg" alt="">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="footer-2__border"></div>
                </div>

                <div class="footer-2__bottom-wrapper">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-4">
                                <div class="footer-2__copyright text-xl-start text-center">
                                    <p class="mb-0">© Copyright <a href="index.html">Ribuild</a> 2024 . All right
                                        reserved.</p>
                                </div>
                            </div>

                            <div class="col-xl-4">
                                <div class="footer-2__social justify-content-center">
                                    <a href="https://www.facebook.com/">
                                        <svg width="10" height="18" viewBox="0 0 10 18" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M9 1H6.81818C5.85376 1 4.92884 1.42143 4.24688 2.17157C3.56493 2.92172 3.18182 3.93913 3.18182 5V7.4H1V10.6H3.18182V17H6.09091V10.6H8.27273L9 7.4H6.09091V5C6.09091 4.78783 6.16753 4.58434 6.30392 4.43431C6.44031 4.28429 6.6253 4.2 6.81818 4.2H9V1Z"
                                                stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                        </svg>
                                    </a>
                                    <a href="https://x.com/">
                                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M9.11264 7.06225L15.0379 15.5H15.0341L14.4746 14.7169L9.1919 7.32307L9.19189 7.32306L8.55899 6.43729L8.55898 6.43727L4.49503 0.749074L4.34547 0.539738H4.0882H1.92015H0.989979L0.962074 0.5H4.50452L8.48597 6.1699L8.85112 6.6899L8.85114 6.68987L9.11264 7.06225ZM11.4929 15.2982L11.637 15.5H11.4955L7.2824 9.50047L6.91725 8.98049L6.49771 9.45768L1.18538 15.5H1.1054L6.62206 9.22562L6.88187 8.93013L6.65575 8.60813L3.37261 3.93275L6.54913 8.37872L6.54914 8.37873L7.08887 9.13411V9.13445L7.18204 9.26486L11.4929 15.2982ZM14.3732 0.5L9.296 6.27491H9.21598L9.27067 6.2127L14.2932 0.5H14.3732Z"
                                                stroke="white" />
                                        </svg>
                                    </a>
                                    <a href="https://www.linkedin.com/">
                                        <svg width="18" height="18" viewBox="0 0 18 18" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M13 1H5C2.79086 1 1 2.79086 1 5V13C1 15.2091 2.79086 17 5 17H13C15.2091 17 17 15.2091 17 13V5C17 2.79086 15.2091 1 13 1Z"
                                                stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                            <path
                                                d="M12.1999 8.49575C12.2986 9.16155 12.1849 9.84153 11.8749 10.439C11.5649 11.0364 11.0744 11.5209 10.4732 11.8235C9.87195 12.1261 9.19062 12.2314 8.52609 12.1245C7.86156 12.0176 7.24767 11.7038 6.77173 11.2279C6.2958 10.7519 5.98205 10.1381 5.87512 9.47352C5.76819 8.80899 5.87352 8.12767 6.17612 7.52645C6.47873 6.92524 6.96321 6.43475 7.56065 6.12475C8.15809 5.81475 8.83807 5.70102 9.50386 5.79975C10.183 5.90046 10.8117 6.21692 11.2972 6.7024C11.7827 7.18787 12.0992 7.81661 12.1999 8.49575Z"
                                                stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                            <path d="M13.3999 4.6001H13.4079" stroke="white" stroke-width="1.5"
                                                stroke-linecap="round" stroke-linejoin="round" />
                                        </svg>
                                    </a>
                                    <a href="https://www.instagram.com/">
                                        <svg width="18" height="18" viewBox="0 0 18 18" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12.1999 6.05273C13.4729 6.05273 14.6938 6.58506 15.594 7.53262C16.4942 8.48017 16.9999 9.76532 16.9999 11.1054V17.0001H13.7999V11.1054C13.7999 10.6587 13.6313 10.2303 13.3313 9.91445C13.0312 9.5986 12.6242 9.42116 12.1999 9.42116C11.7756 9.42116 11.3686 9.5986 11.0685 9.91445C10.7685 10.2303 10.5999 10.6587 10.5999 11.1054V17.0001H7.3999V11.1054C7.3999 9.76532 7.90562 8.48017 8.80579 7.53262C9.70596 6.58506 10.9269 6.05273 12.1999 6.05273Z"
                                                stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                            <path d="M4.2 6.89502H1V17.0003H4.2V6.89502Z" stroke="white"
                                                stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                            <path
                                                d="M2.6 4.36842C3.48366 4.36842 4.2 3.61437 4.2 2.68421C4.2 1.75405 3.48366 1 2.6 1C1.71634 1 1 1.75405 1 2.68421C1 3.61437 1.71634 4.36842 2.6 4.36842Z"
                                                stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                stroke-linejoin="round" />
                                        </svg>
                                    </a>
                                </div>
                            </div>

                            <div class="col-xl-4">
                                <div class="footer-2__copyright-menu">
                                    <ul>
                                        <li><a href="about-us.html">Privacy Policy</a></li>
                                        <li><a href="contact.html">Terms & Conditions</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </footer>
            <!-- Footer area end -->
            <script>
              
            </script>

            <!-- JS here -->
            <script src="assets/js/vendor/jquery-3.7.1.min.js"></script>
            <script src="assets/js/plugins/waypoints.min.js"></script>
            <script src="assets/js/vendor/bootstrap.bundle.min.js"></script>
            <script src="assets/js/plugins/meanmenu.min.js"></script>
            <script src="assets/js/plugins/odometer.min.js"></script>
            <script src="assets/js/plugins/swiper.min.js"></script>
            <script src="assets/js/plugins/wow.js"></script>
            <script src="assets/js/vendor/magnific-popup.min.js"></script>
            <script src="assets/js/vendor/type.js"></script>
            <script src="assets/js/plugins/nice-select.min.js"></script>
            <script src="assets/js/vendor/jquery-ui.min.js"></script>
            <script src="assets/js/vendor/jquery.appear.js"></script>
            <script src="assets/js/plugins/parallax.min.js"></script>
            <script src="assets/js/plugins/parallax-scroll.js"></script>
            <script src="assets/js/plugins/isotope.pkgd.min.js"></script>
            <script src="assets/js/plugins/imagesloaded.pkgd.min.js"></script>
            <script src="assets/js/plugins/gsap.min.js"></script>
            <script src="assets/js/plugins/ScrollTrigger.min.js"></script>
            <script src="assets/js/plugins/SplitText.js"></script>
            <script src="assets/js/plugins/tween-max.min.js"></script>
            <script src="assets/js/plugins/draggable.min.js"></script>
            <script src="assets/js/plugins/jquery.carouselTicker.js"></script>
            <script src="assets/js/vendor/ajax-form.js"></script>
            <script src="assets/js/plugins/TextPlugin.min.js"></script>
            <script src="assets/js/main.js"></script>
            <script src="assets/js/plugins/magiccursor.js"></script>
            <script src="assets/js/image-reveal-hover.js"></script>

        </body>

        </html>
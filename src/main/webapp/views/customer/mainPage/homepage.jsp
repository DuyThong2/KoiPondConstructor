<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>HappiKoi</title>
    <meta name="description" content="Ribuild - Construction Company HTML5 Template">
    <meta name="author" content="ahmmedsabbirbd">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/imgs/favicon.svg">

    <!-- CSS here -->
    <%@include file="../cssTemplate.jsp"%>
    <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
    <style>
        .our-professional__item__content {
            padding: 5px 20px;
        }
        .team__item-media img {
            width: 500px;
            height: 300px;
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
                        <a href="${pageContext.request.contextPath}/home/services">
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

<main>
    <!-- Banner area start -->
    <section id="banner" class="banner-3 banner-bg-3 overflow-hidden section-space">
        <div class="container">



            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="banner-3__content blur-backgroud">
                        <h6 class="banner-3__content-subtitle">Introducing Ribuild</h6>
                        <h1 class="banner-3__content-title">Building Excellence with Precision and Passion.</h1>
                        <a href="#" class="rr-btn">
                            <span class="btn-wrap">
                                <span class="text-one turn-off-animation-button">Explore Service</span>
                            </span>
                        </a>
                    </div>
                </div>

                <div class="col-lg-6">
                    <form class="banner-3__from" action="${pageContext.request.contextPath}/save" method="POST">
                        <h4>Need Construction Help?</h4>
                        <p>We are always here to help you at any time, </p>
                        <div class="row">
                            <div class="col-12">
                                <div class="banner-3__form-input">
                                    <input name="name" id="lname" type="text" placeholder="Full Name">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="banner-3__form-input">
                                    <input name="email" id="email" type="email" placeholder="Email Address">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="banner-3__form-input">
                                    <input name="phone" id="phone" type="text" placeholder="Phone number">
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="banner-3__form-input-select d-flex flex-column">
                                    <select name="type" id="subject" style="display: none;">
                                        <option value="Construction">Type 1- Construction</option>
                                        <option value="Service">Type 2 - Service</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="banner-3__form-input">
                                    <div class="validation__wrapper-up position-relative">
                                        <textarea name="content" id="textarea" placeholder="Message"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <button type="submit" class="rr-btn">
                                        <span class="btn-wrap">
                                            <span class="text-one turn-off-animation-button">Send Message</span>
                                        </span>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Popup cho success -->
    <%@include file="../../popup.jsp"%>
    <!-- Banner area end -->

    <!-- planning-execute area start -->

    <!-- planning-execute area end -->

    <!-- mission area start -->
    <section class="team section-space">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section__title-wrapper text-center mb-60 mb-sm-40 mb-xs-35">
                        <span class="section__subtitle justify-content-center mb-13 ml-0"><span data-width="40px" class="left-separetor"></span>Template Projects<span data-width="40px" class="right-separetor"></span></span>
                        <h2 class="section__title title-animation text-capitalize rr-br-hidden-md" data-cursor="-opaque">Our Awesome Creative Best
                            <br> Projects</h2>
                    </div>
                </div>
            </div>

            <div class="row mb-minus-30">

                <c:forEach var="project" items="${projectList}">
                    <div class="col-xl-4 col-md-6">
                        <div class="team__item mb-30" style="min-height: 300px;">
                            <a href="${pageContext.request.contextPath}/home/projects/${project.projectId}" class="team__item-media d-block" data-cursor-text="View">
                                <img src="${project.getShowingImg(project.imgURL)}" alt="image not found" class="img-fluid">
                            </a>

                            <div class="team__item-text d-flex align-items-center justify-content-between">


                                <div class="team__item-text__left" style="min-height:100px;">
                                    <h4 class="team__item-title rr-fw-bold color-white mb-0"><a href="${pageContext.request.contextPath}/home/projects/${project.projectId}">${project.projectName}</a></h4>
                                    <span class="team__item-subtitle color-white">${project.description}</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>


            </div>
        </div>
    </section>
    <!-- mission area end -->
    <div class="overflow-hidden">
        <!-- service area start -->
        <section id="services" class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
            <div class="container rr-shape-p-c_1">
                <div class="service__shape-1 rr-shape-p-s_1 leftRight"><div></div></div>
                <div class="service__shape-2 rr-shape-p-s_1 rr-upDown"><div></div></div>
                <div class="row mb-60 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                    <div class="col-xl-6">
                        <div class="section__title-wrapper text-center text-xl-start">
                        <span class="section__subtitle justify-content-start mb-13">
                            <span data-width="40px" class="left-separetor"></span>Services</span>
                            <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                data-cursor="-opaque">Koi Pond Construction & Maintenance</h2>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="d-flex flex-column justify-content-xl-end mt-xs-20 mt-sm-20 mt-md-20 mt-lg-20 pl-45 rr-mb-13-hide-xl rr-pl-none-lg justify-content-center text-center text-xl-start">
                            <p class="m-0 service__content-des rr-br-hidden-xl" style="font-size: 19px;">At our company, we specialize in building and maintaining beautiful Koi ponds. Whether it's following one of our unique designs or creating a custom pond based on your vision, we turn your dreams into reality.</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="service__list mb-minus-50" data-fx="8">
                            <a class="service__list-item d-flex align-items-center mb-50 block__title">
                                <div class="number">01</div>
                                <div class="text d-flex flex-column">
                                    <span class="sub-t turn-off-animation-button">Consultation & Design</span>
                                    <h4 class="color-white mb-0 title turn-off-animation-button">Discuss Design & Style</h4>
                                </div>
                            </a>
                            <a class="service__list-item d-flex align-items-center mb-50 block__title">
                                <div class="number">02</div>
                                <div class="text d-flex flex-column">
                                    <span class="sub-t turn-off-animation-button">Project Execution</span>
                                    <h4 class="color-white mb-0 title turn-off-animation-button">From Planning to Delivery</h4>
                                </div>
                            </a>
                            <a class="service__list-item d-flex align-items-center mb-50 block__title">
                                <div class="number">03</div>
                                <div class="text d-flex flex-column">
                                    <span class="sub-t">Maintenance Services</span>
                                    <h4 class="color-white mb-0 title">Regular & Custom Care</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>



    <!-- service area end -->

        <section class="service__what-we-do-3__text theme-bg-heading-primary">
            <h2>Design and Construction</h2>
        </section>

        <!-- what-we-do-3 area start -->
        <section class="what-we-do-3 section-space__bottom section-space__top-80 theme-bg-heading-primary">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="what-we-do-3__media pr-15 rr-pr-none-xl rr-mb-60-md" >
                            <img src="${pageContext.request.contextPath}/assets/imgs/koipond.webp" alt="" class="img-fluid" >
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="pl-40 rr-pl-none-xl">
                            <div class="section__title-wrapper text-center text-lg-start mb-50 mb-sm-40 mb-xs-35">
                                <span class="section__subtitle justify-content-start mb-13"><span data-width="40px" class="left-separetor"></span>What We Do</span>
                                <h2 class="section__title title-animation color-white text-capitalize mb-15 rr-br-hidden-xl" data-cursor="-opaque">Koi Ponds
                                    <br>
                                    Performance</h2>
                                <p class="rr-br-hidden-xl what-we-do-3__content-p mb-0" style="font-size: 20px;">We specialize in designing and constructing Koi ponds
                                    <br>with unique and aesthetically pleasing styles, ranging from traditional garden ponds to luxurious Japanese-style ponds.
                                    <br> We ensure to create a vibrant and natural living space for your family.</p>
                            </div>

                            <div class="what-we-do-3__list pr-40 rr-pr-none-xl">
                                <a href="${pageContext.request.contextPath}/home/projects">Successful Projects
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                    </svg>
                                </a>
                                <a href="${pageContext.request.contextPath}/home/packages">Get A Quote
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                    </svg>
                                </a>
                                <a href="${pageContext.request.contextPath}/home/projects">Design Template
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                    </svg>
                                </a>
                                <a href="${pageContext.request.contextPath}/home/projects">Contact Us
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                    </svg>
                                </a>
                                <a href="${pageContext.request.contextPath}/home/blogs">Blogs
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                    </svg>
                                </a>
                                <a href="${pageContext.request.contextPath}/home/services">Book Service Now!
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- what-we-do-3 area end -->
    </div>

    <!-- our-professional -->
    <section class="our-professional section-space">
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
                            <a href="#" class="our-professional__item-media d-block" data-cursor-text="View">
                                <img src="${staff.imgURL != null ? staff.getShowingImg(staff.imgURL) : "/SWPKoiContructor/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt="image not found" class="img-fluid">
                            </a>
                            <div class="our-professional__item__content d-flex align-items-center justify-content-center text-center">
                                <div class="our-professional__item-text">
                                    <h4 class="our-professional__item-title text-center rr-fw-bold  mb-0">${staff.name}</h4>
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
    </section>
    <!-- our-professional -->

    <!-- support area start -->
    <!-- support area start -->
    <section class="support section-space section-bg-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section__title-wrapper text-center text-lg-start">
                        <span class="section__subtitle justify-content-start mb-13"><span data-width="40px" class="left-separetor"></span>Support</span>
                        <h2 class="section__title title-animation text-capitalize mb-40 rr-br-hidden-xl" data-cursor="-opaque">Comprehensive Koi Pond Construction & Maintenance Support</h2>

                        <div class="support__list mb-minus-30">
                            <div class="support__list-item d-flex mb-30">
                                <div class="icon"><img src="${pageContext.request.contextPath}/assets/imgs/support/angle-right.svg" alt=""></div>
                                <div class="text">
                                    <p class="mb-0 rr-br-hidden-xl text-start">Support for Koi pond design and construction from concept to completion, ensuring the highest quality and aesthetics.</p>
                                </div>
                            </div>
                            <div class="support__list-item d-flex mb-30">
                                <div class="icon"><img src="${pageContext.request.contextPath}/assets/imgs/support/angle-right.svg" alt=""></div>
                                <div class="text">
                                    <p class="mb-0 rr-br-hidden-xl text-start">Professional regular maintenance and care services for Koi ponds to ensure lasting beauty and pond health.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="pl-30 rr-pl-none-xl rr-mt-60-md">
                        <div class="rr__faq">
                            <div class="accordion" id="accordionExample">
                                <div class="accordion-item">
                                    <h5 class="accordion-header" id="headingOne">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            What steps are included in the Koi pond construction process?
                                        </button>
                                    </h5>
                                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>The construction process includes: receiving the request, design consultation, quotation preparation, design documentation, construction, and periodic maintenance.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h5 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                            Can customers request custom designs?
                                        </button>
                                    </h5>
                                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>We offer custom designs based on customer requests or our available designs.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h5 class="accordion-header" id="headingThree">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                                            How can customers contact our support team?
                                        </button>
                                    </h5>
                                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>Customers can reach us via hotline, email, or fill out the contact form on the website for prompt assistance.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h5 class="accordion-header" id="headingFour">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                                            What does the Koi pond maintenance service include?
                                        </button>
                                    </h5>
                                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>We provide cleaning, care, and periodic or on-demand maintenance services to keep ponds healthy and aesthetically pleasing.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>






    <!-- blog-2 area start -->

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
                <c:forEach var="blog" items="${blogList}">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="blog__item has-box-shadow mb-30" style="border-radius: 8px; overflow: hidden; transition: transform 0.3s;">
                            <a href="${pageContext.request.contextPath}/home/blogs/${blog.id}" data-cursor-text="View" class="blog__item-media d-block" style="overflow: hidden;">
                                <img src="${blog.getShowingImg(blog.imgUrl)}" alt="image not found" class="img-fluid" style="width: 100%; height: auto; transition: transform 0.3s;">
                            </a>
                            <div class="blog__item-text p-4" style="background-color: #ffffff;">
                                <div class="blog__item-meta mb-10 text-muted d-flex justify-content-between">
                                    <a href="${pageContext.request.contextPath}/home/blogs/${blog.id}" class="text-secondary">
                                        <i class="fas fa-user"></i> ${blog.staff.name}
                                    </a>
                                    <a href="${pageContext.request.contextPath}/home/blogs/${blog.id}" class="text-secondary">
                                        <i class="fas fa-calendar"></i> <fmt:formatDate value="${blog.datePost}" pattern="dd-MM-yyyy"/>
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
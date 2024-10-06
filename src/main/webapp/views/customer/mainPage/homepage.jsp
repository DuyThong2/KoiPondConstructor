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
                                <img src="/assets/imgs/logo/logo-white.svg" alt="img">
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
                            <img src="/assets/imgs/logo/logo-white.svg" alt="logo not found">
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
                        <a href="index.html" class="rr-btn">
                            <span class="btn-wrap">
                                <span class="text-one turn-off-animation-button">Explore Service</span>
                            </span>
                        </a>
                    </div>
                </div>

                <div class="col-lg-6">
                    <form class="banner-3__from" action="save" method="POST">
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
                                        <option value="">Type 1- Construction</option>
                                        <option value="order">Type 2 - Maintenance</option>
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
                        <div class="team__item mb-30">
                            <a href="team-details.html" class="team__item-media d-block" data-cursor-text="View">
                                <img src="/assets/imgs/mylogo/koi-background.jpg" alt="image not found" class="img-fluid">
                            </a>
    
                            <div class="team__item-text d-flex align-items-center justify-content-between">
                               
    
                                <div class="team__item-text__left">
                                    <h4 class="team__item-title rr-fw-bold color-white mb-0"><a href="team-details.html">${project.projectName}</a></h4>
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

    <div class="overflow-hidden"> <!--for shape animation-->
    <!-- service area start -->
    <section id="services" class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
        <div class="container rr-shape-p-c_1">
            <div class="service__shape-1 rr-shape-p-s_1 leftRight"><div></div></div>
            <div class="service__shape-2 rr-shape-p-s_1 rr-upDown"><div></div></div>
            <div class="row mb-60 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                <div class="col-xl-6">
                    <div class="section__title-wrapper text-center text-xl-start">
                        <span class="section__subtitle justify-content-start mb-13"><span data-width="40px" class="left-separetor"></span>Services</span>
                        <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl" data-cursor="-opaque">The Essence Of Building
                            <br> Construction Design</h2>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="d-flex flex-column justify-content-xl-end mt-xs-20 mt-sm-20 mt-md-20 mt-lg-20 pl-45 rr-mb-13-hide-xl rr-pl-none-lg justify-content-center text-center text-xl-start">
                        <p class="m-0 service__content-des rr-br-hidden-xl">At Ribuild, we are more than just a construction company. We are your
                            <br> partners in turning visions into reality, dedicated to delivering superior quality <br> and exceptional service every step of the way.</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 ">
                    <div class="service__list mb-minus-50" data-fx="8">
                        <a class="service__list-item d-flex align-items-center mb-50 block__title" >
                            <div class="number">01</div>
                            <div class="text d-flex flex-column">
                                <span class="sub-t turn-off-animation-button">Project Planning</span>
                                <h4 class="color-white mb-0 title turn-off-animation-button">Project Planning</h4>
                            </div>
                        </a>
                        <a class="service__list-item d-flex align-items-center mb-50 block__title" >
                            <div class="number">02</div>
                            <div class="text d-flex flex-column">
                                <span class="sub-t turn-off-animation-button">Highest Standards</span>
                                <h4 class="color-white mb-0 title turn-off-animation-button">Industrial Structure</h4>
                            </div>
                        </a>
                        <a class="service__list-item d-flex align-items-center mb-50 block__title">
                            <div class="number">03</div>
                            <div class="text d-flex flex-column">
                                <span class="sub-t">Project Design</span>
                                <h4 class="color-white mb-0 title">Interior Design</h4>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- service area end -->

    <section class="service__what-we-do-3__text theme-bg-heading-primary">
        <h2>CONSTRUCTION</h2>
    </section>

    <!-- what-we-do-3 area start -->
    <section class="what-we-do-3 section-space__bottom section-space__top-80 theme-bg-heading-primary">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="what-we-do-3__media pr-15 rr-pr-none-xl rr-mb-60-md">
                        <img src="/assets/imgs/what-we-do-3/what-we-do.jpg" alt="" class="img-fluid">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="pl-40 rr-pl-none-xl">
                        <div class="section__title-wrapper text-center text-lg-start mb-50 mb-sm-40 mb-xs-35">
                            <span class="section__subtitle justify-content-start mb-13"><span data-width="40px" class="left-separetor"></span>What We Do</span>
                            <h2 class="section__title title-animation color-white text-capitalize mb-15 rr-br-hidden-xl" data-cursor="-opaque">Upgrading Your Factory
                                <br>
                                Performance</h2>
                            <p class="rr-br-hidden-xl what-we-do-3__content-p mb-0">Nulla et ipsum non justo congue consequat. Pellentesque accumsan ante
                                <br> non ullamcorper imperdiet. Pellentque habitant morbi tristique senectus <br> netus malesuada fames turpis egestas.</p>
                        </div>

                        <div class="what-we-do-3__list pr-40 rr-pr-none-xl">
                            <a href="project-details.html">Metal Engineering
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                </svg>
                            </a>
                            <a href="project-details.html">Project Planning
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                </svg>
                            </a>
                            <a href="project-details.html">Corporate Building
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                </svg>
                            </a>
                            <a href="project-details.html">Budget Planning
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                </svg>
                            </a>
                            <a href="project-details.html">Industrial Building
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                </svg>
                            </a>
                            <a href="project-details.html">Interior Design
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                </svg>
                            </a>
                            <a href="project-details.html">Metal Works
                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M11.2287 0L2.15853 0C1.73187 0 1.38491 0.346892 1.38491 0.773475C1.38491 1.20006 1.73187 1.54695 2.15853 1.54695L9.35794 1.54695L0.226813 10.6786C-0.0756043 10.981 -0.0756043 11.4709 0.226813 11.7732C0.52923 12.0756 1.01919 12.0756 1.32161 11.7732L10.4527 2.64154V9.83954C10.4527 10.2661 10.7997 10.613 11.2264 10.613C11.653 10.613 12 10.2661 12 9.83954V0.773475C12.0023 0.346892 11.6554 0 11.2287 0Z" fill="#F44E19"/>
                                </svg>
                            </a>
                            <a href="project-details.html">Successful Project
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
                            <a href="team-details.html" class="our-professional__item-media d-block" data-cursor-text="View">
                                <img src="/assets/imgs/our-professional/anhthien.jpg" alt="image not found" class="img-fluid">
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
    </section>
    <!-- our-professional -->

    <!-- support area start -->
    <section class="support section-space section-bg-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section__title-wrapper text-center text-lg-start">
                        <span class="section__subtitle justify-content-start mb-13"><span data-width="40px" class="left-separetor"></span>Support</span>
                        <h2 class="section__title title-animation text-capitalize mb-40 rr-br-hidden-xl" data-cursor="-opaque">Integrated Building Design <br>
                            For Enhanced Efficiency</h2>

                        <div class="support__list mb-minus-30">
                            <div class="support__list-item d-flex mb-30">
                                <div class="icon"><img src="/assets/imgs/support/angle-right.svg" alt=""></div>
                                <div class="text">
                                    <p class="mb-0 rr-br-hidden-xl text-start">Vivamus eget tristique purus. Mauris rhoncus sem non lorem aliquet varius.
                                        <br> Aliquam non odio et arcu ullamcorper efficitur.</p>
                                </div>
                            </div>
                            <div class="support__list-item d-flex mb-30">
                                <div class="icon"><img src="/assets/imgs/support/angle-right.svg" alt=""></div>
                                <div class="text">
                                    <p class="mb-0 rr-br-hidden-xl text-start">Suspendisse facilisis dolor id turpis varius malesuada. Morbi egestas libero
                                        <br> ac consectetur interdum uisque.</p>
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
                                            What Are The Charges of Renovation?
                                        </button>
                                    </h5>
                                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>Our services are designed to help businesses leverage technology to streamline operation’s, improve efficiency.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h5 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                            What is Project Timing in Construction?
                                        </button>
                                    </h5>
                                    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>Our services are designed to help businesses leverage technology to streamline operation’s, improve efficiency.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h5 class="accordion-header" id="headingThere">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThere" aria-expanded="true" aria-controls="collapseThere">
                                            How to contact our Support Team?
                                        </button>
                                    </h5>
                                    <div id="collapseThere" class="accordion-collapse collapse" aria-labelledby="headingThere" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>Our services are designed to help businesses leverage technology to streamline operation’s, improve efficiency.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="accordion-item">
                                    <h5 class="accordion-header" id="headingFour">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                                            How Are Construction Permits Obtained?
                                        </button>
                                    </h5>
                                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <p>Our services are designed to help businesses leverage technology to streamline operation’s, improve efficiency.</p>
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
    <!-- support area end -->

    <!-- recent-works area start -->
   
    <!-- recent-works area end -->

    <!-- text-slider area start -->
    <!-- <section class="text-slider text-slider__section-space position-relative theme-bg-primary overflow-hidden">
        <div class="text-slider__slider carouselTicker carouselTicker-nav">
            <ul class="carouselTicker__list">
                <li><h3 data-cursor="-opaque" class="title">GREEN BUILDING</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">REMODELING</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">SERVICES</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">CONSTRUCTION</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">ARCHITECTURE</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">BLUEPRINT</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">INFRASTRUCTURE</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">GREEN BUILDING</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">REMODELING</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">SERVICES</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">CONSTRUCTION</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">ARCHITECTURE</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">BLUEPRINT</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">INFRASTRUCTURE</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">GREEN BUILDING</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">REMODELING</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">SERVICES</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">CONSTRUCTION</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">ARCHITECTURE</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">BLUEPRINT</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">INFRASTRUCTURE</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">GREEN BUILDING</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">REMODELING</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">SERVICES</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">CONSTRUCTION</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">ARCHITECTURE</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">BLUEPRINT</h3></li>
                <li><h4 class="title bar">//</h4></li>
                <li><h3 data-cursor="-opaque" class="title">INFRASTRUCTURE</h3></li>
                <li><h4 class="title bar">//</h4></li>
            </ul>
        </div>
    </section> -->
    <!-- text-slider area end -->

 

    <!-- pricing area start -->
    <section id="pricing" class="pricing section-space section-bg-1 overflow-hidden">
        <div class="container rr-shape-p-c_1">
            <div class="why-choose-us__shape d-none d-lg-block">
                <div class="pricing__shape-1 rr-shape-p-s_1 rr-upDown"><img src="/assets/imgs/pricing/shape-1.png" alt="image not found"></div>
                <div class="pricing__shape-2 rr-shape-p-s_1 rr-downUp"><img src="/assets/imgs/pricing/shape-2.png" alt="image not found"></div>
                <div class="pricing__shape-3 rr-shape-p-s_1 rr-upDown"><img src="/assets/imgs/pricing/shape-3.png" alt="image not found"></div>
                <div class="pricing__shape-4 rr-shape-p-s_1 rr-upDown"><img src="/assets/imgs/pricing/shape-4.png" alt="image not found"></div>
                <div class="pricing__shape-5 rr-shape-p-s_1 rr-downUp"><img src="/assets/imgs/pricing/shape-5.png" alt="image not found"></div>
            </div>
            <div class="row mb-60 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                <div class="col-xl-6">
                    <div class="section__title-wrapper text-center text-xl-start">
                        <span class="section__subtitle justify-content-start mb-13"><span data-width="40px" class="left-separetor"></span>Pricing Plan</span>
                        <h2 class="section__title title-animation text-capitalize mb-0 rr-br-hidden-md" data-cursor="-opaque">Choose Right Pricing
                            <br> Plan For You</h2>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="d-flex justify-content-xl-end mt-xs-25 mt-sm-25 mt-md-25 mt-lg-25 justify-content-center">
                        <div class="pricing__toggler_button mb-40 d-flex justify-content-center wow fadeIn animated" data-wow-delay=".5s">
                            <div class="pricing__shape-arrow-down rr-shape-p-s_1 rr-downUp"><img src="/assets/imgs/pricing/arrow-down.png" alt="image not found"></div>
                            <button class="toggler active" id="monthly-btn">Monthly</button>
                            <div class="toggle">
                                <input type="checkbox" id="switcher" class="check">
                                <b class="b switch"></b>
                            </div>
                            <button class="toggler" id="yearly-btn">Yearly</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-minus-30">
                <div class="col-xl-4 col-md-6">
                    <div class="pricing__card overflow-hidden mb-30 wow clip-t-b" data-background="/assets/imgs/pricing/bottom-shape.png">
                        <div class="pricing__card-image mb-40"><img src="/assets/imgs/pricing/home.png" alt=""></div>
                        <h4 class="pricing__card-title rr-fw-sbold"><span>Basic</span></h4>
                        <div class="pricing__card-price mb-30 pb-30">
                            <h2 data-yearly='<span class="price">$199.<span>00</span></span>
                                <span class="month-year">PER YEARLY</span>' data-monthly='<span class="price">$99.<span>00</span></span>
                                <span class="month-year">PER MONTH</span>' class="d-flex flex-column">
                                <span class="price">$99.<span>00</span></span>
                                <span class="month-year">PER MONTH</span>
                            </h2>
                        </div>

                        <div class="pricing__card-body mb-40">
                            <ul>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Construction Hourly Rate
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Remodel Or Home Addition
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Limitless Concepts
                                </li>
                                <li class="not_included">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Architectural Plans
                                </li>
                                <li class="not_included">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Economic Market Survey
                                </li>
                            </ul>
                        </div>

                        <a href="index.html" class="rr-btn rr-btn__transparent">
                            <span class="btn-wrap">
                                <span class="text-one turn-off-animation-button">Purchase Now</span>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6">
                    <div class="pricing__card pricing__card-standard overflow-hidden mb-30 wow clip-t-b" data-background="/assets/imgs/pricing/bottom-shape__white.png">
                        <div class="pricing__card-image mb-40"><img src="/assets/imgs/pricing/home.png" alt=""></div>
                        <h4 class="pricing__card-title rr-fw-sbold"><span>Premium</span></h4>
                        <div class="pricing__card-price mb-30 pb-30">
                            <h2 data-yearly='<span class="price">$215.<span>00</span></span>
                                <span class="month-year">PER YEARLY</span>' data-monthly='<span class="price">$115.<span>00</span></span>
                                <span class="month-year">PER MONTH</span>' class="d-flex flex-column">
                                <span class="price">$115.<span>00</span></span>
                                <span class="month-year">PER MONTH</span>
                            </h2>
                        </div>
                        <div class="pricing__card-body mb-40">
                            <ul>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Construction Hourly Rate
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Remodel Or Home Addition
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Limitless Concepts
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Architectural Plans
                                </li>
                                <li class="not_included">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Economic Market Survey
                                </li>
                            </ul>
                        </div>

                        <a href="index.html" class="rr-btn">
                            <span class="btn-wrap">
                                <span class="text-one turn-off-animation-button">Purchase Now</span>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6">
                    <div class="pricing__card overflow-hidden mb-30 wow clip-t-b" data-background="/assets/imgs/pricing/bottom-shape.png">
                        <div class="pricing__card-image mb-40"><img src="/assets/imgs/pricing/home.png" alt=""></div>
                        <h4 class="pricing__card-title rr-fw-sbold"><span>Premium</span></h4>
                        <div class="pricing__card-price mb-30 pb-30">
                            <h2 data-yearly='<span class="price">$299.<span>00</span></span>
                                <span class="month-year">PER YEARLY</span>' data-monthly='<span class="price">$199.<span>00</span></span>
                                <span class="month-year">PER MONTH</span>' class="d-flex flex-column">
                                <span class="price">$199.<span>00</span></span>
                                <span class="month-year">PER MONTH</span>
                            </h2>
                        </div>

                        <div class="pricing__card-body mb-40">
                            <ul>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Construction Hourly Rate
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Remodel Or Home Addition
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Limitless Concepts
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Architectural Plans
                                </li>
                                <li>
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="10" cy="10" r="10" fill="#F44E19"/>
                                        <path d="M15 7L8.125 13L5 10.2727" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    Economic Market Survey
                                </li>
                            </ul>
                        </div>

                        <a href="index.html" class="rr-btn rr-btn__transparent">
                            <span class="btn-wrap">
                                <span class="text-one turn-off-animation-button">Purchase Now</span>
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- pricing area end -->

    <!-- blog-2 area start -->
    <section class="blog section-space section-bg-3">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section__title-wrapper text-center mb-60 mb-sm-40 mb-xs-35">
                        <span class="section__subtitle justify-content-center mb-13 ml-0"><span data-width="40px" class="left-separetor"></span>Trending Topics<span data-width="40px" class="right-separetor"></span></span>
                        <h2 class="section__title title-animation text-capitalize rr-br-hidden-md" data-cursor="-opaque">Latest Articles & Blog Posts</h2>
                    </div>
                </div>
            </div>

            <div class="row mb-minus-30">
                <c:forEach var="blog" items="${blogList}">

                <div class="col-xl-4 col-lg-6"></div>
                    <div class="blog__item has-box-shadow mb-30">
                        <a href="blog-details.html" data-cursor-text="View" class="blog__item-media d-block">
                            <img src="/assets/imgs/blog/blog-1.jpg" alt="image not found" class="img-fluid">
                        </a>
                        <div class="blog__item-text">
                            <div class="blog__item-meta mb-10">
                                <a href="blog-details.html">
                                    <svg width="15" height="16" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M14 14.9999V13.4444C14 12.6192 13.6576 11.8279 13.0481 11.2445C12.4386 10.661 11.612 10.3333 10.75 10.3333H4.25C3.38805 10.3333 2.5614 10.661 1.9519 11.2445C1.34241 11.8279 1 12.6192 1 13.4444V14.9999" stroke="#F44E19" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M7.5 7.22222C9.29493 7.22222 10.75 5.82933 10.75 4.11111C10.75 2.39289 9.29493 1 7.5 1C5.70507 1 4.25 2.39289 4.25 4.11111C4.25 5.82933 5.70507 7.22222 7.5 7.22222Z" stroke="#F44E19" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    By Admin</a>
                                <a href="blog-details.html">
                                    <svg width="15" height="16" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M12.5556 2.3999H2.44444C1.6467 2.3999 1 3.0267 1 3.7999V13.5999C1 14.3731 1.6467 14.9999 2.44444 14.9999H12.5556C13.3533 14.9999 14 14.3731 14 13.5999V3.7999C14 3.0267 13.3533 2.3999 12.5556 2.3999Z" stroke="#F44E19" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M10.3887 1V3.8" stroke="#F44E19" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M4.61133 1V3.8" stroke="#F44E19" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M1 6.6001H14" stroke="#F44E19" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                    ${blog.datePost}</a>
                            </div>

                            <h4 class="blog__item-title mb-25 mb-xs-15 rr-fw-bold text-capitalize"><a href="blog-details.html">${blog.name}</a></h4>

                            <a class="blog__item-readmore" href="blog-details.html">Read More
                                <svg width="20" height="11" viewBox="0 0 20 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M1 5.5L19 5.5" stroke="#6A6A6A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    <path d="M13.75 1L19 5.5L13.75 10" stroke="#6A6A6A" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
                </c:forEach>
               
            </div>
        </div>
    </section>
    <!-- blog-2 area end -->

    <!-- cta-3 area start -->


</main>
<!-- Footer area start -->

<%@include file="../footer.jsp" %>
<!-- Footer area end -->

<!-- JS here -->
    <%@include file="../scriptTemplate.jsp"%>

</body>

</html>
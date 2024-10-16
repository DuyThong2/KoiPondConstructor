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
/*             Form input styles 
            .banner-3__form-input {
                margin-bottom: 15px;
            }

            .banner-3__form-input input,
            .banner-3__form-input textarea,
            .banner-3__form-input select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;  Ensures padding is included in width calculation 
                background-color: #f9f9f9;
            }

             Fixing dropdown styling 
            .banner-3__form-input-select select {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                background-color: #f9f9f9;
                border-radius: 4px;
                padding: 10px;
                font-size: 16px;
            }

             Adjust button styling 
            .rr-btn {
                padding: 10px 20px;
                background-color: #d42a57;
                color: white;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            .rr-btn:hover {
                background-color: #b22242;
            }*/



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
        <div class="page-title-wrap typo-white">
            <div class="page-title-wrap-inner section-bg-img" data-bg="images/bg/page-title-bg.jpg">
                <span class="black-overlay"></span>
                <div class="container">
                    <div class="row text-center">
                        <div class="col-md-12">
                            <div class="page-title-inner">
                                <div id="breadcrumb" class="breadcrumb mb-1 mb-lg-2">
                                    <a href="index.html" class="theme-color">Home</a>
                                    <span class="current">Services</span>
                                </div>
                                <h1 class="page-title mb-0">${service.serviceName}</h1>                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height:100px">

        </div>
        <main>
            <div class="content-wrapper pad-none">
                <div class="content-inner">					
                    <!-- Services Single Section -->
                    <section id="single-service" class="single-service">
                        <div class="container">
                            <div class="single-service-wrap">
                                <!-- Row -->                                
                                <div class="row">                                    
                                    <!-- Sidebar -->
                                    <!-- Col -->
                                    <div class="col-lg-4 px-3 pe-lg-4">
                                        <div class="service-sidebar-wrap">

                                            <div class="contact-info pad-bottom-30" style="margin-left: 30px">
                                                <h4 class="sidebar-title mb-3">Contact Info</h4>										
                                                <p class="contact-address mb-1"><span class="event-subtitle"><strong>Address : </strong></span>
                                                    12, Victoria Street, Australia <a class="zegen-popup-gmaps theme-color" href="https://maps.google.com/maps?q=12%2C+Victoria+Street%2C+Australia&amp;t=&amp;z=13&amp;ie=UTF8&amp;iwloc=&amp;output=embed"><span class="ti-location-pin"></span></a>
                                                </p>
                                                <p class="contact-email mb-1"><span class="event-subtitle"><strong>E-mail : </strong></span>
                                                    <a href="mailto:info@zozothemes.com">info@zozothemes.com</a>
                                                </p>
                                                <p class="contact-phone mb-0"><span class="event-subtitle"><strong>Phone : </strong></span>
                                                    <a href="tel:+(123) 456-7890">+(123) 456-7890</a>
                                                </p>												
                                            </div>

                                            <div class="contact-wrap">

                                                <!-- Form -->
                                                <form class="banner-3__from" action="/save" method="POST">
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
                                                                <textarea name="content" id="textarea" placeholder="Message"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <button type="submit" class="rr-btn">
                                                                <span class="btn-wrap">
                                                                    <span class="text-one">Send Message</span>
                                                                </span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <!-- Form End-->
                                            </div>
                                            <!-- contact-form-7 -->		
                                        </div>
                                    </div>
                                    <!-- Sidebar -->
                                    <!-- Col -->
                                    <div class="col-lg-8 px-3">
                                        <!-- Service img -->
                                        <div class="zoom-gallery mb-4">
                                            <div class="events-thumb relative">
                                                <a class="popup-img" href="#" title="Single Portfolio">
                                                    <img src="${pageContext.request.contextPath}/images/services/single/service-single4.jpg" class="img-fluid single-event-img b-radius-10" alt="service-img" />
                                                </a>
                                            </div>
                                        </div>
                                        <!-- COntent-->

                                        ${service.content.content}







                                        <!-- Get a Quote Section End -->
                                    </div>
                                    <!-- Col -->
                                </div>
                                <!-- Row 2 -->								
                            </div>
                            <!-- Portfolio Single Wrap -->
                        </div>
                    </section>
                    <!-- Portfolios Section End -->
                    <!-- Get a Quote Section -->

                    <!-- Get a Quote Section End -->
                </div>
            </div>


        </main>
        <!-- Footer area start -->

        <%@include file="../footer.jsp" %>
        <!-- Footer area end -->

        <!-- JS here -->
        <%@include file="../scriptTemplate.jsp"%>

    </body>

</html>
<%-- 
    Document   : preDesignDetail
    Created on : Oct 10, 2024, 11:21:30 PM
    Author     : HP
--%>

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
            .sidebar {
                width: 300px;
                background-color: #FFC107;
                padding: 20px;
                border-radius: 10px;
            }

            .sidebar table {
                width: 100%;
            }

            .sidebar table td {
                padding: 8px;
                vertical-align: top;
            }

            .sidebar h5 {
                font-size: 16px;
                font-weight: bold;
                margin: 0;
                white-space: nowrap; /* Ensure the label doesn't break into a new line */
            }

            .sidebar .entry-date, 
            .sidebar .entry-client, 
            .sidebar .entry-duration, 
            .sidebar .entry-category, 
            .sidebar .entry-tags {
                font-size: 1.1em;
                color: #000;
            }

            .sidebar .portfolio-meta-icon {
                font-size: 1.5em;
                margin-right: 10px;
                color: #000;
            }

            .sidebar .social-icons a {
                margin-right: 5px;
                color: #fff;
                font-size: 1.5em;
                display: inline-block;
            }

            .single-portfolio-wrap {
                display: flex;
                justify-content: center; /* Centers content horizontally */
            }

            .content {
                width: 65%; /* Adjust to control the width of the content section */
                margin: 0 auto; /* This ensures content is centered horizontally */
            }

            .sidebar {
                width: 30%; /* Adjust to control the width of the sidebar */
                background-color: #FFC107;
                padding: 20px;
                border-radius: 10px;
            }
            @media screen and (max-width: 768px) {
                .single-portfolio-wrap {
                    flex-direction: column; /* Stack the content and sidebar vertically */
                }

                .sidebar {
                    width: 100%;
                    margin-top: 20px;
                    margin-right: 0;
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
        <div class="page-title-wrap typo-white">
            <div class="page-title-wrap-inner section-bg-img" data-bg="images/bg/page-title-bg.jpg">
                <span class="black-overlay"></span>
                <div class="container">
                    <div class="row text-center">
                        <div class="col-md-12">
                            <div class="page-title-inner">
                                <div id="breadcrumb" class="breadcrumb mb-1 mb-lg-2">
                                    <a href="index.html" class="theme-color">Home</a>
                                    <span class="current">Pre Design</span>
                                </div>
                                <h1 class="page-title mb-0">${preDesign.preDesignName}</h1>                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height:100px">

        </div>
        <main style="margin-bottom: 100px">
            <section id="single-portfolio" class="single-portfolio">
                <div class="container">
                    <div class="single-portfolio-wrap">
                        <!-- Main Content Section -->
                        <div class="content">
                            <!-- Image -->
                            <div class="zoom-gallery mb-5">
                                <div class="portfolio-thumb">
                                    <img src="/uploads/${preDesign.preDesignImgUrl}" alt="Project Image">
                                </div>
                            </div>

                            <!-- Text Content -->

                            ${preDesign.content.content}






                            <!-- Text Content -->

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
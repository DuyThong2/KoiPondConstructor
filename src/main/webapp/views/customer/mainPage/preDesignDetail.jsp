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


        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/imgs/favicon.svg">
        <!-- CSS here -->
        <%@include file="../cssTemplate.jsp"%>
        <%@include file="../cssCustom.jsp"%>

        <style>
            .d-flex{
                margin-top: 0;
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
                white-space: nowrap;
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

            .single-portfolio-wrap {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
            }

            .content {
                width: 65%;
                margin-right: 30px;
                flex-grow: 1;
            }

            .sidebar {
                width: 30%;
                background-color: #ddd;
                padding: 10px 20px;
                border-radius: 10px;
                border: 1px solid #e0e0e0;
            }

            select {
                background-color: #f5f5f5;
                width: 100%;
                padding: 15px 20px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 16px;
            }

            @media screen and (max-width: 768px) {
                .single-portfolio-wrap {
                    flex-direction: column;
                }

                .sidebar {
                    width: 100%;
                    margin-top: 20px;
                    margin-right: 0;
                }
            }

            .form-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                margin-top: 20px;
                box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>

    <body class="body-1">
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

                            </span> <a href="${pageContext.request.contextPath}/home/preDesign" class="theme-color">Home - Design Template</a></span>
                            <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                data-cursor="-opaque">${preDesign.preDesignName}
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div style="height:100px">

        </div>
        <main style="margin-bottom: 100px">
            <main style="margin-bottom: 100px">
                <section id="single-portfolio" class="single-portfolio">
                    <div class="container">
                        <div class="single-portfolio-wrap">
                            <!-- Main Content Section -->
                            <div class="content">
                                <!-- Image -->
                                <div class="zoom-gallery mb-5">
                                    <div class="portfolio-thumb">
                                        <img src="${preDesign.getShowingImg(preDesign.preDesignImgUrl)}" alternative="${preDesign.preDesignName}"
                                             style="height:auto; width:850px; object-fit:contain; border-radius: 10px" alt="">

                                    </div>
                                </div>

                                <!-- Text Content -->
                                ${preDesign.content.content}
                            </div>

                            <!-- Sidebar Section -->
                            <div class="sidebar col-md-4">
                                <table  style="border-bottom: 2px solid #15181b">
                                    <tr>
                                        <td><span class="portfolio-meta-icon"><i class="ti-calendar"></i></span></td>
                                        <td><h5>Estimate Time</h5></td>
                                        <td class="entry-date">${preDesign.preDesignTime}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="portfolio-meta-icon"><i class="ti-user"></i></span></td>
                                        <td><h5>Package</h5></td>
                                        <td class="entry-client">${preDesign.parcel.packageName}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="portfolio-meta-icon"><i class="ti-alarm-clock"></i></span></td>
                                        <td><h5>Design Price</h5></td>
                                        <td class="entry-duration">${preDesign.parcel.designOnSquareRoot}/m2</td>
                                    </tr>
                                    <tr>
                                        <td><span class="portfolio-meta-icon"><i class="ti-folder"></i></span></td>
                                        <td><h5>Construction Price</h5></td>
                                        <td class="entry-category">${preDesign.parcel.constructionPriceOnSquareRoot}/m2</td>
                                    </tr>
                                    <tr>
                                        <td><span class="portfolio-meta-icon"><i class="ti-tag"></i></span></td>
                                        <td><h5>Description</h5></td>
                                        <td class="entry-tags">${preDesign.preDesignDescription}</td>
                                    </tr>
                                </table>

                                <!-- Form Section with White Background -->
                                <div class="form-container">
                                    <form class="banner-3__form" action="${pageContext.request.contextPath}/save" method="POST">
                                        <input name="preDesignId" id="preDesignId" value="${preDesign.preDesignId}" type="hidden">
                                        <h4>Need Construction Help?</h4>
                                        <p>We are always here to help you at any time,</p>
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
                                                <select id="services" name="type" required>
                                                    <option value="" disabled selected>Select Service Type</option>
                                                    <option value="Construction">Construction</option>
                                                    <option value="Service">Service</option>
                                                </select>
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
                                </div>
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
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

</html>
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


                <link rel="shortcut icon" type="image/x-icon"
                    href="${pageContext.request.contextPath}/assets/imgs/favicon.svg">
                <!-- CSS here -->
                <%@include file="../cssTemplate.jsp" %>
                    <%@include file="../cssCustom.jsp" %>

                        <style>
                            .d-flex {
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
                                /* Ensure the label doesn't break into a new line */
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
                                justify-content: space-between;
                            }

                            .content {
                                width: 65%;
                                /* Adjust to control the width of the content section */
                                margin-right: 30px;
                                /* Space between content and sidebar */
                            }

                            .sidebar {
                                width: 30%;
                                background-color: #ddd;
                                padding: 10px 20px;
                                border-radius: 10px;
                                border: 1px solid #e0e0e0;
                            }

                            @media screen and (max-width: 768px) {
                                .single-portfolio-wrap {
                                    flex-direction: column;
                                    /* Stack the content and sidebar vertically */
                                }

                                .sidebar {
                                    width: 100%;
                                    margin-top: 20px;
                                    margin-right: 0;
                                }
                            }

                            .project-details__author {
                                border-radius: 10px;
                                transition: all 0.3s ease;
                                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);

                            }

                            .project-details__author:hover {
                                transform: translateY(-5px);
                                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
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
                                                <img src="${pageContext.request.contextPath}/assets/imgs/logo/logo-white.svg"
                                                    alt="img">
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
                                                    class="fa-brands fa-linkedin-in"></i></a></li>
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
                                        <span class="section__subtitle justify-content-start mb-13"><span
                                                data-width="40px" class="left-separetor">

                                            </span> <a href="${pageContext.request.contextPath}/home/projects"
                                                class="theme-color">Home - Project</a></span>
                                        <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                            data-cursor="-opaque">${project.projectName}
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div style="height:100px">

                    </div>
                    <main>
                        <section id="single-portfolio" class="single-portfolio">
                            <div class="container">
                                <div class="single-portfolio-wrap">
                                    <!-- Main Content Section -->
                                    <div class="content">
                                        <!-- Image -->
                                        <div class="zoom-gallery mb-5">
                                            <div class="portfolio-thumb">
                                                <img src="${project.getShowingImg(project.imgURL)}"
                                                    alternative="${project.projectName}"
                                                    style="height:auto; width:850px; object-fit:contain; border-radius: 10px"
                                                    alt="">
                                            </div>
                                        </div>

                                        <!-- Text Content -->

                                        ${project.content.content}


                                        <!-- Text Content -->

                                    </div>

                                    <!-- Sidebar Section -->
                                    <div class="col-lg-4">
                                        <div
                                            class="project-details__author project-details__author__up position-relative z-3">
                                            <h4 class="heading-title">${project.projectName}</h4>

                                            <div class="project-details__author-body">
                                                <div class="project-details__author-item__wrapper">
                                                    <div class="project-details__author-item d-flex flex-column">
                                                        <span class="sub-t">Client Name:</span>
                                                        <span class="title">${project.contract.customer.name}</span>
                                                    </div>
                                                    <div class="project-details__author-item d-flex flex-column">
                                                        <span class="sub-t">Category:</span>
                                                        <span class="title">${project.style}</span>
                                                    </div>
                                                    <div class="project-details__author-item d-flex flex-column">
                                                        <span class="sub-t">Total Area:</span>
                                                        <span class="title">${project.contract.quote.quotesArea}
                                                            (m²)</span>
                                                    </div>
                                                    <div class="project-details__author-item d-flex flex-column">
                                                        <span class="sub-t">Start Date:</span>
                                                        <span class="title">
                                                            <fmt:formatDate value="${project.dateStart}"
                                                                pattern="MMM dd yyyy" />
                                                        </span>
                                                    </div>
                                                    <div class="project-details__author-item d-flex flex-column">
                                                        <span class="sub-t">End Date:</span>
                                                        <span class="title">
                                                            <fmt:formatDate value="${project.dateEnd}"
                                                                pattern="MMM dd yyyy" />
                                                        </span>
                                                    </div>
                                                    <div class="project-details__author-item d-flex flex-column">
                                                        <span class="sub-t">Description:</span>
                                                        <span class="title">${project.description}</span>
                                                    </div>
                                                </div>

                                                <div class="project-share">


                                                    <div class="project-share__list mt-10">
                                                        <a href="#">
                                                            <svg width="8" height="14" viewBox="0 0 8 14" fill="none"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M5.11197 14V7.61441H7.43286L7.78106 5.12509H5.11197V3.53603C5.11197 2.81554 5.32781 2.32453 6.44827 2.32453L7.875 2.32399V0.097461C7.62827 0.0678617 6.78132 0 5.79557 0C3.73715 0 2.32792 1.15988 2.32792 3.28949V5.12509H0V7.61441H2.32792V14H5.11197Z"
                                                                    fill="#6A6A6A" />
                                                            </svg>
                                                        </a>
                                                        <a href="#">
                                                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" clip-rule="evenodd"
                                                                    d="M8.45942 6.11007L14 14H9.83117L6.01406 8.56434L1.2351 14H0L5.46574 7.78354L5.34277 7.60842L0 0H4.16883L7.78327 5.14724L12.3087 0H13.5437L8.33239 5.92749L8.45942 6.11007ZM12.3093 13.1316H10.4122L6.64026 7.85241L1.68013 0.909771H3.57717L12.3093 13.1316Z"
                                                                    fill="#6A6A6A" />
                                                            </svg>
                                                        </a>
                                                        <a href="#">
                                                            <svg width="14" height="14" viewBox="0 0 14 14" fill="none"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M13.9958 14.0001L13.9993 13.9995V8.86497C13.9993 6.35313 13.4585 4.41821 10.522 4.41821C9.11034 4.41821 8.16301 5.19288 7.77626 5.9273H7.73543V4.65271H4.95117V13.9995H7.85034V9.3713C7.85034 8.15272 8.08134 6.97438 9.59043 6.97438C11.0773 6.97438 11.0995 8.36505 11.0995 9.44947V14.0001H13.9958Z"
                                                                    fill="#6A6A6A" />
                                                                <path
                                                                    d="M0.230469 4.65308H3.13314V13.9998H0.230469V4.65308Z"
                                                                    fill="#6A6A6A" />
                                                                <path
                                                                    d="M1.68117 0C0.753084 0 0 0.753084 0 1.68117C0 2.60925 0.753084 3.37809 1.68117 3.37809C2.60925 3.37809 3.36234 2.60925 3.36234 1.68117C3.36175 0.753084 2.60867 0 1.68117 0Z"
                                                                    fill="#6A6A6A" />
                                                            </svg>
                                                        </a>
                                                        <a href="#">
                                                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path
                                                                    d="M11.5 1H4.5C2.567 1 1 2.567 1 4.5V11.5C1 13.433 2.567 15 4.5 15H11.5C13.433 15 15 13.433 15 11.5V4.5C15 2.567 13.433 1 11.5 1Z"
                                                                    stroke="#6A6A6A" stroke-width="1.5"
                                                                    stroke-linecap="round" stroke-linejoin="round" />
                                                                <path
                                                                    d="M10.8002 7.55848C10.8866 8.14105 10.7871 8.73603 10.5158 9.25879C10.2446 9.78155 9.81539 10.2055 9.28932 10.4702C8.76326 10.735 8.1671 10.8272 7.58564 10.7336C7.00417 10.6401 6.46702 10.3655 6.05057 9.94909C5.63413 9.53265 5.3596 8.99549 5.26603 8.41403C5.17247 7.83257 5.26463 7.2364 5.52941 6.71034C5.7942 6.18428 6.21812 5.7551 6.74087 5.48385C7.26363 5.2126 7.85861 5.11309 8.44119 5.19948C9.03543 5.2876 9.58558 5.5645 10.0104 5.98929C10.4352 6.41408 10.7121 6.96423 10.8002 7.55848Z"
                                                                    stroke="#6A6A6A" stroke-width="1.5"
                                                                    stroke-linecap="round" stroke-linejoin="round" />
                                                                <path d="M11.8496 4.14966H11.8566" stroke="#6A6A6A"
                                                                    stroke-width="1.5" stroke-linecap="round"
                                                                    stroke-linejoin="round" />
                                                            </svg>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="project-details__author project-details__author__up position-relative
                                        z-3" style="margin-top:30px;">
                                            <form class="banner-3__from"
                                                action="${pageContext.request.contextPath}/save" method="POST"
                                                style="border-radius:10px; border:1px solid rgb(198, 198, 198)">


                                                <h4 class="">Need Construction Help?</h4>
                                                <p>We are always here to help you at any time, </p>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="banner-3__form-input">
                                                            <input name="name" id="lname" type="text"
                                                                placeholder="Full Name">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="banner-3__form-input">
                                                            <input name="email" id="email" type="email"
                                                                placeholder="Email Address">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="banner-3__form-input">
                                                            <input name="phone" id="phone" type="text"
                                                                placeholder="Phone number">
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="d-flex flex-column">
                                                            <select name="type" id="subject"
                                                                style="display: block; width: 100%; padding: 15px; border: 1px solid #e0e0e0; border-radius: 5px; background-color: #f9f9f9; color: #6c757d; font-size: 16px; transition: all 0.3s ease;">
                                                                <option value="Construction">Type 1 - Construction
                                                                </option>
                                                                <option value="Service">Type 2 - Service</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <div class="banner-3__form-input">
                                                            <div class="validation__wrapper-up position-relative">
                                                                <textarea name="content" id="textarea"
                                                                    placeholder="Message"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12">
                                                        <button type="submit" class="rr-btn">
                                                            <span class="btn-wrap">
                                                                <span class="text-one turn-off-animation-button">Send
                                                                    Message</span>
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
                        <section style="padding-bottom:100px; padding-top:50px; background-color: rgb(245, 245, 245);">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="section__title-wrapper text-center mb-60 mb-sm-40 mb-xs-35">
                                            <span class="section__subtitle justify-content-center mb-13 ml-0"><span
                                                    data-width="40px" class="left-separetor"></span>Template
                                                Projects<span data-width="40px" class="right-separetor"></span></span>
                                            <h2 class="section__title title-animation text-capitalize rr-br-hidden-md"
                                                data-cursor="-opaque">More Outstanding Projects
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-minus-30 justify-content-center">
                                    <c:forEach var="project" items="${projectList}">
                                        <div class="col-xl-4 col-md-6">
                                            <div class="team__item mb-30">
                                                <a href="${pageContext.request.contextPath}/home/projects/${project.projectId}"
                                                    class="team__item-media d-block" data-cursor-text="View">
                                                    <img src="${project.getShowingImg(project.imgURL)}"
                                                        alt="image not found" class="img-fluid">
                                                </a>

                                                <div
                                                    class="team__item-text d-flex align-items-center justify-content-between">


                                                    <div class="team__item-text__left">
                                                        <h4 class="team__item-title rr-fw-bold color-white mb-0"><a
                                                                href="${pageContext.request.contextPath}/home/projects/${project.projectId}">${project.projectName}</a>
                                                        </h4>
                                                        <span
                                                            class="team__item-subtitle color-white">${project.description}</span>
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
                        <%@include file="../scriptTemplate.jsp" %>
                            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                            <!-- Load a compatible jQuery version -->
                            <script
                                src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            </body>

            </html>
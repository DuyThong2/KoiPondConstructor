<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>HappiKoi</title>
        <meta name="author" content="ahmmedsabbirbd">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Place favicon.ico in the root directory -->


        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/imgs/favicon.svg">
        <!-- CSS here -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <%@include file="../cssTemplate.jsp"%>
        <style>
            .content-box {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }


            .content-box h3 {
                font-size: 1.8em;
                color: #333;
                margin-bottom: 10px;
            }

            .content-box p {
                font-size: 1.3em;
                line-height: 1.6;
                color: #555;
                margin: 0 0 35px 15px;
            }


            .content-box ul {
                margin: 0 0 35px 15px;
                padding-left: 20px;

            }


            .content-box ul li {
                margin-bottom: 10px;
                position: relative;
                font-size: 1.3em;
            }

            .content-box ul li::before {
                content: '•';
                color: #007BFF;
                font-weight: bold;
                position: absolute;
                left: -20px;
                top: 0;
            }
        </style>
    </head>

    <body class="body-1">
        <div id="preloader" data-preloader="active" data-loaded="doted">
            <div class="preloader-close">x</div>
            <div class="sk-three-bounce">
                <div class="sk-child sk-bounce1"></div>
                <div class="sk-child sk-bounce2"></div>
                <div class="sk-child sk-bounce3"></div>
            </div>
        </div>

        <div class="preloader" data-preloader="deactive" data-loaded="progress">
            <div class="preloader-close">x</div>
            <div class="wrapper w-100 text-center">
                <div id="progress-bar" class="preloader-text" data-text="RIBUILD"></div>
                <div class="progress-bar">
                    <div class="progress"></div>
                </div>
            </div>
        </div>

        <div class="loading-form">
            <div class="sk-three-bounce">
                <div class="sk-child sk-bounce1"></div>
                <div class="sk-child sk-bounce2"></div>
                <div class="sk-child sk-bounce3"></div>
            </div>
        </div>

        <div class="cursor-wrapper relative">
            <div class="cursor"></div>
            <div class="cursor-follower"></div>
        </div>

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
        <!-- Offcanvas area start -->

        <!-- Header area start -->
        <%@include file="../homePageNavbar.jsp" %>

        <main>
            <section id="services"
                     class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
                <div class="container rr-shape-p-c_1">
                    <div class="service__shape-1 rr-shape-p-s_1 leftRight">
                        <div></div>
                    </div>

                    <div class="row mb-30 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                        <div class="col-md-6">
                            <div class="section__title-wrapper text-center text-xl-start">
                                <span class="section__subtitle justify-content-start mb-13"><span data-width="40px" class="left-separetor">
                                    </span>Policy</span>
                                <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                    data-cursor="-opaque">Terms & Services
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="content-box">
                <div class="container">

                    <h3>1. Acceptance of Terms</h3>
                    <ul>
                        <li>By using our Koi pond construction management system, you agree to comply with all terms and conditions outlined in this document.</li>
                        <li>We reserve the right to update or modify these terms without prior notice. It is your responsibility to review these terms periodically.</li>
                    </ul>


                    <h3>2. Service Requests and Payment</h3>
                    <ul>
                        <li>Customers may request Koi pond construction services based on our available designs or their own custom requirements. Requests will be confirmed via email or phone.</li>
                        <li>Full payment must be made as specified. If payment fails, we reserve the right to cancel the order.</li>
                    </ul>


                    <h3>3. Order Cancellation and Refunds</h3>
                    <ul>
                        <li>You can cancel your service request within 24 hours. If cancellation occurs after design or construction work has begun, we may refuse or only partially refund the payment.</li>
                        <li>Refund details will be provided during the service request process.</li>
                    </ul>

                    <h3>4. Maintenance and Cleaning Services</h3>
                    <ul>
                        <li>Scheduled or on-demand maintenance and cleaning services for Koi ponds will be assigned to our staff, and the results will be recorded.</li>
                        <li>Customers can rate the quality of service after completion.</li>
                    </ul>
                    <h3>5. Warranty and Maintenance</h3>
                    <ul>
                        <li>After completing Koi pond construction, we provide periodic maintenance services for a specified time. Warranty details will be outlined in the service contract.</li>
                        <li>We are not responsible for damage caused by natural events or improper use.
                        </li>
                    </ul>

                    <h3>6. Intellectual Property Rights</h3>
                    <p>All content, images, designs, and materials on this system are the property of our company. Unauthorized copying, distribution, or use is prohibited and may result in legal action.</p>

                    <h3>7. Limitation of Liability</h3>
                    <ul>
                        <li>We are not liable for any direct, indirect, or incidental damages arising from the use or inability to use our services.</li>
                        <li>Our total liability will not exceed the amount you have paid for the service.</li>
                    </ul>
                    <h3>8. Contact Information</h3>
                    <p>If you have questions or concerns regarding the terms and services, please contact us at happikoi@contructioninc.com or via the phone number on our website.</p>

                </div>
            </div>

        </main>


        <%@include file="../footer.jsp" %>
        <%@include file="../scriptTemplate.jsp"%>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

</html>


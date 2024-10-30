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
        margin-bottom: 55px;
    }


    .content-box ul {
        margin: 0;
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
                            data-cursor="-opaque">Private Policy
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="content-box">
    <div class="container">

                <h3>1. Information Collection</h3>
                <p style="margin: 10px">We collect personal information in various ways:
                <ul>
                    <li><strong>Account Information</strong>: When you register for an account, we collect personal information such as your name, email address, phone number, and other necessary details.</li>
                    <li><strong>Transaction Information</strong>: If you make a purchase, we collect data regarding the transaction, including billing information.</li>
                    <li><strong>Cookies and Tracking</strong>: We use cookies to enhance the user experience. You can disable cookies through your browser, but this may affect your ability to use certain features of our site.</li>
                </ul>
                </p>

                <h3>2. Use of Information</h3>
                <p style="margin: 10px">Your personal information is used for the following purposes:
                <ul>
                    <li>To provide and maintain services, including processing orders and providing customer support.</li>
                    <li>To improve the functionality, content, and user experience of our site.</li>
                    <li>With your consent, to send marketing promotions and updates.</li>
                </ul>
                </p>

                <h3>3. Data Security</h3>
                <p>We employ security measures to protect your personal data from unauthorized access and disclosure. Only authorized personnel have access to this data.</p>

                <h3>4. Third-Party Disclosure</h3>
                <p>We do not sell or trade your personal information. However, we may share data with trusted third parties who assist in operating our website.</p>

                <h3>5. Your Rights</h3>
                <p>You have the right to access, modify, or delete your personal information at any time. Please contact us at happikoi@contructioninc.com to exercise these rights.</p>

                <h3>6. Changes to this Policy</h3>
                <p>We may update this Privacy Policy periodically. Any changes will be posted on this page, and significant changes may be communicated via email.</p>

                <h3>7. Collection and Storage of Information</h3>
                <p>We may collect additional information such as your IP address, browser type, and usage patterns while you navigate through our site. This data is gathered for analytic purposes, enabling us to improve our services and optimize user experience.</p>

                <h3>8. Use of Cookies and Web Beacons</h3>
                <p>We use cookies and web beacons for tracking user preferences, improving user navigation, and customizing advertising content. You can choose to disable cookies through your browser settings, but doing so may limit some features on our site.</p>

                <h3>9. Third-Party Analytics Tools</h3>
                <p>We partner with third-party analytics providers such as Google Analytics to help monitor our website traffic. These services may collect data such as your IP address, browser type, and pages visited to assist us in understanding how users engage with our site.</p>

                <h3>10. Consent to Transfer</h3>
                <p>Your information, including personal data, may be transferred to — and maintained on — servers located outside of your city, state, or country. By using our services, you consent to this transfer of data.</p>

                <h3>11. Child Privacy Protection</h3>
                <p>We do not knowingly collect or solicit personal information from anyone under the age of 13. If we learn that we have inadvertently collected information from a child under 13 without parental consent, we will delete that information as quickly as possible.</p>

                <h3>12. Advertising and Marketing</h3>
                <p>With your consent, we may send promotional emails or notifications about new products, services, or offers. You can opt-out of receiving marketing communications at any time by contacting us or following the unsubscribe instructions provided in the communication.</p>

                <h3>13. External Links</h3>
                <p>Our website may contain links to external sites not operated by us. We are not responsible for the content or privacy practices of these external sites, and encourage you to review their privacy policies before engaging with their services.</p>
                <h3>14. Payment Policy</h3>
                <p>We accept various forms of payment, including credit cards, debit cards, and online payment methods. Full payment must be made at the time of purchase. In the event of a payment failure, we reserve the right to cancel your order.</p>

                <h3>15. Cancellation Policy</h3>
                <p>You may cancel your order within 24 hours of placing it by contacting our customer service team. If your order has already been processed or shipped, cancellation may not be possible. Refunds for cancellations will be processed according to our refund policy, which may vary depending on the payment method used.</p>

            </div>
        </div>

</main>


<%@include file="../footer.jsp" %>
<%@include file="../scriptTemplate.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>



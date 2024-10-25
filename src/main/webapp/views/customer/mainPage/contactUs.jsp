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
    <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

        .contact-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .contact-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
            padding-right: 50px;
        }

        .contact-info h1 {
            font-size: 48px;
            color: #ff5733;
        }

        .contact-info p {
            font-size: 18px;
            color: #555;
            margin-top: 20px;
        }

        .contact-info hr {
            width: 80px;
            border: 2px solid #ff5733;
            margin: 20px auto;
        }

        .contact-form {
            flex: 1;
            padding-left: 50px;
            position: relative;
        }

        .contact-form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        .contact-form input,
        .contact-form select,
        .contact-form textarea {
            width: 100%;
            padding: 15px 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            position: relative;
        }

        .contact-form textarea {
            height: 120px;
        }

        .contact-form button {
            width: 100%;
            padding: 15px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background-color: #555;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #555;
        }

        .input-container {
            position: relative;
            margin-bottom: 20px;
        }

        .about-map-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            width: 100%;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .about-content {
            flex: 1;
            padding-right: 40px;
        }

        .about-content h3 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .about-item {
            font-size: 18px;
            margin-bottom: 15px;
            color: #555;
            display: flex;
            align-items: center;
        }

        .about-item i {
            font-size: 20px;
            color: #df2453;
            margin-right: 15px;
        }

        .map-frame {
            flex: 1;
            height: 400px;
            border-radius: 10px;
            overflow: hidden;
        }

        .map-frame iframe {
            width: 100%;
            height: 100%;
            border: none;
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
            color: #ff5733;
            border-bottom: 3px solid #ff5733;
        }
        .process-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
            text-align: center;
            margin-bottom: 50px;
        }


        .process-item {
            background-color: #ffffff;
            border: 1px solid #ececec;
            padding: 30px;
            border-radius: 15px;
            flex: 0 1 calc(33.333% - 30px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .process-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
        }


        .process-number {
            font-size: 3.5em;
            color: #ffac33;
            font-weight: bold;
            margin-bottom: 20px;
        }


        .process-item h4 {
            font-size: 1.6em;
            color: #333;
            margin-bottom: 15px;
        }

        .process-item p {
            font-size: 1.2em;
            color: #666;
            margin-bottom: 20px;
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
                                </span>Contact Us</span>
                        <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                            data-cursor="-opaque">Contact Us & About Us
                        </h2>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section with bg-light -->
    <section class="bg-light section-space__top section-space__bottom-80">
        <div class="container">
            <div class="contact-container">
                <!-- Left Content (Contact Info) -->
                <div class="contact-info">
                    <h1>Contact <span>Us</span></h1>
                    <p>We're here to help and answer any question you might have. We look forward to hearing from you.</p>
                    <hr>
                    <p>Feel free to reach out at any time!</p>
                </div>

                <!-- Right Contact Form -->
                <div class="contact-form">
                    <form action="${pageContext.request.contextPath}/save" method="POST">

                        <!-- Name Input with Icon -->
                        <div class="input-container">
                            <label for="name">Your Name</label>
                            <span class="input-icon">&#xf007;</span> <!-- Font Awesome icon for user -->
                            <input id="name" name="name" type="text" placeholder="Full Name" required>
                        </div>

                        <!-- Email Input with Icon -->
                        <div class="input-container">
                            <label for="email">Your Email</label>
                            <span class="input-icon">&#xf0e0;</span> <!-- Font Awesome icon for email -->
                            <input id="email" name="email" type="email" placeholder="Email Address" required>
                        </div>

                        <!-- Phone Input with Icon -->
                        <div class="input-container">
                            <label for="phone">Your Phone Number</label>
                            <span class="input-icon">&#xf095;</span> <!-- Font Awesome icon for phone -->
                            <input id="phone" name="phone" type="text" placeholder="Phone Number" required>
                        </div>

                        <!-- Service Type Select with Icon -->
                        <div class="input-container">
                            <label for="services">Your Service Type</label>
                            <span class="input-icon">&#xf013;</span> <!-- Font Awesome icon for services -->
                            <select id="services" name="type" required>
                                <option value="" disabled selected>Select Service Type</option>
                                <option value="Construction">Construction</option>
                                <option value="Service">Service</option>
                            </select>
                        </div>

                        <!-- Message Textarea -->
                        <div class="input-container">
                            <label for="content">Your Message</label>
                            <span class="input-icon">&#xf086;</span> <!-- Font Awesome icon for message -->
                            <textarea id="content" name="content" placeholder="Your Message" required></textarea>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Section with bg-white -->
    <section class="bg-white section-space__top section-space__bottom-80">
        <div class="container">
            <div class="section-title">
                <h2>About Us</h2>
            </div>

            <div class="about-map-container">
                <!-- About Us Section -->
                <div class="about-content">
                    <h3>About Us - Happikoi VIETNAM</h3>

                    <div class="about-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span><strong>Office:</strong> E2a-7, D1 Street, District 9 - FPT UNIVERSITY</span>
                    </div>

                    <div class="about-item">
                        <i class="fas fa-phone"></i>
                        <span><strong>Hotline:</strong> 0903 957 033</span>
                    </div>

                    <div class="about-item">
                        <i class="fas fa-envelope"></i>
                        <span><strong>Email:</strong> <a href="mailto:happikoi@contructioninc.com">happikoi@contructioninc.com</a></span>
                    </div>

                    <div class="about-item">
                        <i class="fas fa-globe"></i>
                        <span><strong>Website:</strong> <a href="https://happikoi.vn" target="_blank">happikoi.vn</a></span>
                    </div>

                    <div class="about-item">
                        <i class="fas fa-clock"></i>
                        <span><strong>Working Hours:</strong> Mon - Sat: 8AM - 6PM</span>
                    </div>

                    <div class="about-item">
                        <i class="fas fa-users"></i>
                        <span><strong>Team Members:</strong> 100+ professionals in various fields</span>
                    </div>
                </div>

                <!-- Google Maps Section -->
                <div class="map-frame">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15679.486464949808!2d106.8078277!3d10.8406272!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1690445842055!5m2!1sen!2s" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </section>
    <section class="bg-light">
        <div class="container">
            <div class="section-title">
                <h2>Service Implementation Process at Happikoi</h2>
            </div>

            <div class="process-grid">
                <div class="process-item">
                    <div class="process-number">1</div>
                    <h4>Receive Customer Request</h4>
                    <p>We receive and record information about your garden landscape design and koi pond construction needs.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">2</div>
                    <h4>On-Site Survey</h4>
                    <p>Our team conducts an on-site survey to assess the area and ensure accuracy in the design and construction phases.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">3</div>
                    <h4>Design Proposal</h4>
                    <p>We propose a preliminary design that reflects natural elements, aesthetics, and your personal preferences.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">4</div>
                    <h4>Quote Submission</h4>
                    <p>We provide a detailed quotation based on the project scope, including all design and construction costs.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">5</div>
                    <h4>Design Finalization</h4>
                    <p>Once the quote is approved, the design is finalized in 3D, giving you a full visualization of the project.</p>
                </div>

                <div class="process-item">
                    <div class="process-number">6</div>
                    <h4>Construction and Supervision</h4>
                    <p>We begin construction and supervise the project to ensure it meets design specifications and quality standards.</p>
                </div>
            </div>
        </div>
    </section>
    <%@include file="../../popup.jsp"%>
</main>


<%@include file="../footer.jsp" %>
<!-- Footer area end -->

<!-- JS here -->
<%@include file="../scriptTemplate.jsp"%>

</body>

</html>



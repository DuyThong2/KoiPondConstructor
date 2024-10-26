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
            padding-top: 25px;
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
        /* Section Styling */
        .intro {
            padding: 50px 20px;
            border-radius: 10px;
            margin-bottom: 40px;
        }

        /* Headings */
        .intro h2 {
            font-size: 2.8em;
            color: #ff5733;
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
            border-bottom: 3px solid #ff5733;
            display: inline-block;
            padding-bottom: 10px;
        }

        .intro h4 {
            font-size: 1.8em;
            color: #333;
            margin-top: 30px;
            font-weight: bold;
        }


        .intro p {
            font-size: 1.2em;
            line-height: 1.7;
            color: #555;
            margin-bottom: 20px;
        }


        .intro img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin: 20px 0;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }


        .intro ul {
            list-style: none;
            padding-left: 0;
            margin-top: 20px;
        }

        .intro ul li {
            font-size: 1.2em;
            color: #333;
            margin-bottom: 10px;
            padding-left: 25px;
            position: relative;
        }

        .intro ul li::before {
            content: "\f0da";
            font-family: 'FontAwesome';
            position: absolute;
            left: 0;
            color: #ff5733;
            font-size: 1.4em;
        }

        .intro strong {
            color: #ff5733;
            font-weight: bold;
        }

        .intro img {
            margin: 30px 0;
        }

        @media (max-width: 768px) {
            .intro {
                padding: 30px 10px;
            }

            .intro h2 {
                font-size: 2.4em;
            }

            .intro h4 {
                font-size: 1.6em;
            }

            .intro p {
                font-size: 1.1em;
            }
        }
        ul.links-list {
            list-style: none;
            padding: 0;
            margin: 20px 0;
            text-align: center;
        }

        ul.links-list li {
            margin-bottom: 15px;
        }

        ul.links-list a {
            display: inline-block;
            background-color: #ff5733;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        ul.links-list a:hover {
            background-color: #333;
        }
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .contact-form input, .contact-form textarea, .contact-form button {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .contact-form button {
            background-color: #ff5733;
            color: white;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .contact-form button:hover {
            background-color: #ff471a;
            transform: scale(1.05);
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

    <%--Intro Design & Construction Of Koi Ponds.--%>
    <section class="bg-light section-space__top section-space__bottom-80">
        <div class="container">
            <div class="section-title">
                <h2>Design & Construction Of Koi Ponds.</h2>
                <p>Professional Koi Pond Services for Homes and Businesses</p>
            </div>

              <section class="intro">
                <p>
                    With the elegance, longevity, and stunning colors of Koi fish, it's easy to see why Japanese-style gardens are incomplete without a Koi pond.
                    Designing a beautiful Koi pond  in the garden not only brings a sense of tranquility, luck, and prosperity but also adds unique aesthetic charm to the homeowner's living space.
                </p>
                  <div class="what-we-do-3__media pr-15 rr-pr-none-xl rr-mb-60-md" style="margin:0 0 10px 20px" >
                      <img src="${pageContext.request.contextPath}/assets/imgs/contactUsPage1.webp" alt="" class="img-fluid" >
                  </div>
                  <p style="margin: 0 5px 30px 15px">When building a Koi pond, the space and area of the garden determine unique specifications to enhance the landscape for the homeowner.
                      Let our company, with a team of engineers experienced in designing and constructing Koi ponds for various large and small projects, bring you a high-quality, unique product.
                  </p>

                <div class="container" style="margin-bottom: 100px">
                    <%--===============================================--%>
                    <h2>Standard Koi Pond Design Guidelines</h2>
                    <h4>1. Pond Shape</h4>
                    <p>
                        The shape of the pond will depend on your personal preference and the overall area of the garden.
                        If needed, contact a professional service to help you design the Koi pond according to your desires and preferences.
                    </p>
                    <div class="what-we-do-3__media pr-15 rr-pr-none-xl rr-mb-60-md" style="margin:0 0 10px 20px" >
                        <img src="${pageContext.request.contextPath}/assets/imgs/contactUsPage2.webp" alt="" class="img-fluid" >
                    </div>
                        <%--===============================================--%>
                    <h4>2. Pond Location</h4>
                    <p>
                        The Koi pond can be placed in various locations, such as outdoors, indoors, on a balcony, or on a rooftop.
                        Depending on where you want to place the pond, there will be different requirements and construction techniques. It is essential to ensure that the pond meets functional requirements, harmonizes with the landscape, and aligns with Feng Shui principles.
                    </p>
                        <%--===============================================--%>
                    <h4>3. Pond Size</h4>
                    <p>The size of the Koi pond must meet specific standards: </p>
                        <ul>
                        <li>
                            <strong>Minimum Pond Length: </strong><br>
                            The Koi pond should be at least 2 meters long to accommodate the necessary systems for the pond.
                        </li>
                        <li>
                            <strong>Minimum Pond Width: </strong><br> The pond width should be between 0.8 and 1 meter,
                            depending on the pond's length, to ensure a suitable ratio.
                        </li>
                        <li>
                            <strong>Pond Depth: </strong><br> The pond depth depends on
                            the type of Koi fish being raised, allowing for optimal living conditions.
                        </li>
                        </ul>

                    <div class="what-we-do-3__media pr-15 rr-pr-none-xl rr-mb-60-md" style="margin:0 0 10px 20px" >
                        <img src="${pageContext.request.contextPath}/assets/imgs/contactUsPage3.webp" alt="" class="img-fluid" >
                    </div>
                    <p>For more affordable Koi varieties, a pond depth of just 0.6 meters is sufficient. However, for premium Koi varieties,
                        the depth should range from 0.8 to 1.6 meters to meet their specific requirements.</p>
                        <%--===============================================--%>

                    <h4>4. Water Level in the Pond</h4>
                    <p>Each pond location requires a different water level:  </p>
                        <ul>
                            <li>
                                <strong>Indoor Koi Pond:  </strong>Minimum water level of 40 cm
                            </li>
                            <li>
                                <strong>Outdoor Koi Pond  </strong>Minimum water level of 60 cm
                            </li>
                        </ul>
                        <%--===============================================--%>
                        <h4>5. Water Filtration System and Water Quality</h4>
                        <p>
                            In addition to water level, water quality in the pond is crucial.
                            A standard Koi pond should be equipped with high-quality accessories, such as a 304 stainless steel drum filter,
                            to ensure clear, algae-free water with no pathogens. The pH should be maintained between 7 and 7.5.
                            It’s also essential to have a continuous water circulation system to help the Koi stay active and grow well.   </p>
                        <%--===============================================--%>
                        <h4>6. Koi Fish</h4>
                        <p>
                            Naturally, a Koi pond must contain Koi fish. Depending on your budget, you can choose Japanese or Vietnamese Koi.
                            However, quality Koi should have distinct and vibrant color patterns, a slender body shape, and, importantly, be free from any pathogens.
                        </p>
                </div>

                  <ul class="links-list">
                      <li >
                          <a href="${pageContext.request.contextPath}/home/projects" style="padding: 10px 138px;">
                              <i class="fas fa-check-circle"></i> Completed Projects
                          </a>
                      </li>
                      <li>
                          <a href="${pageContext.request.contextPath}/home/packages" style="padding: 10px 69px;">
                              <i class="fas fa-file-invoice-dollar"></i> Detailed Quotations (CLICK HERE)
                          </a>
                      </li>
                      <li>
                          <a href="${pageContext.request.contextPath}/home/preDesign" style="padding: 10px 20px;">
                              <i class="fas fa-image"></i> Impressive Koi Pond Design Sample Images
                          </a>
                      </li>
                  </ul>


              </section>






        </div>
    </section>

    <!-- Section with bg-white -->
    <section class="bg-white section-space__top section-space__bottom-80">
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
    <section class="bg-light section-space__top section-space__bottom-80">
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
    <section class="bg-white">
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

<%@include file="../scriptTemplate.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>



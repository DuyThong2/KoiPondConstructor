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
            color:#df2453;
        }

        .contact-info p {
            font-size: 18px;
            color: #555;
            margin-top: 20px;
        }

        .contact-info hr {
            width: 80px;
            border: 2px solid #df2453;
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
            color: #df2453;
            border-bottom: 3px solid#df2453;
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
            border-bottom: 3px solid #df2453;
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
            color: #df2453;
            font-size: 1.4em;
        }

        .intro strong {
            color: #df2453;
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
            background-color: #df2453;
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
            background-color: #df2453;
            color: white;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .contact-form button:hover {
            background-color: #df2453;
            transform: scale(1.05);
        }

</style>
<section class="bg-white section-space__top section-space__bottom-80">
     <div class="container">
         <div class="contact-container">
             <!-- Left Content (Contact Info) -->
             <div class="contact-info">
                 <h1>Contact <span>Us</span></h1>
                 <p>We're here to help and answer any question you might have. We look forward to hearing
                     from you.</p>
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
                         <input id="email" name="email" type="email" placeholder="Email Address"
                             required>
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
                         <textarea id="content" name="content" placeholder="Your Message"
                             required></textarea>
                     </div>

                     <!-- Submit Button -->
                     <button type="submit">Send Message</button>
                 </form>
             </div>
         </div>
     </div>
 </section>
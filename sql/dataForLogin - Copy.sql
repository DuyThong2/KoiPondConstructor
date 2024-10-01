INSERT INTO Users (email, img_url, name, phone, password, enabled) VALUES
('thongduy06@gmail.com', 'user/user1.jpg', 'Customer 1', '123-456-7801', '12345', 1),
('consultant1@example.com', 'user/user2.jpg', 'Consultant 1', '123-456-7802', '12345', 1),
('designer1@example.com', 'user/user3.jpg', 'Designer 1', '123-456-7803', '12345', 1),
('constructor1@example.com', 'user/user4.jpg', 'Constructor 1', '123-456-7804', '12345', 1),
('manager1@example.com', 'user/user5.jpg', 'Manager 1', '123-456-7805', '12345', 1),
('customer2@example.com', 'user/user6.jpg', 'Customer 2', '123-456-7806', '12345', 1),
('consultant2@example.com', 'user/user7.jpg', 'Consultant 2', '123-456-7807', '12345', 1),
('designer2@example.com', 'user/user8.jpg', 'Designer 2', '123-456-7808', '12345', 1),
('constructor2@example.com', 'user/user9.jpg', 'Constructor 2', '123-456-7809', '12345', 1),
('manager2@example.com', 'user/user10.jpg', 'Manager 2', '123-456-7810', '12345', 1),
('customer3@example.com', 'user/user11.jpg', 'Customer 3', '123-456-7811', '12345', 1),
('consultant3@example.com', 'user/user12.jpg', 'Consultant 3', '123-456-7812', '12345', 1),
('designer3@example.com', 'user/user13.jpg', 'Designer 3', '123-456-7813', '12345', 1),
('constructor3@example.com', 'user/user14.jpg', 'Constructor 3', '123-456-7814', '12345', 1),
('manager3@example.com', 'user/user15.jpg', 'Manager 3', '123-456-7815', '12345', 1),
('customer4@example.com', 'user/user16.jpg', 'Customer 4', '123-456-7816', '12345', 1),
('consultant4@example.com', 'user/user17.jpg', 'Consultant 4', '123-456-7817', '12345', 1),
('designer4@example.com', 'user/user18.jpg', 'Designer 4', '123-456-7818', '12345', 1),
('constructor4@example.com', 'user/user19.jpg', 'Constructor 4', '123-456-7819', '12345', 1),
('manager4@example.com', 'user/user20.jpg', 'Manager 4', '123-456-7820', '12345', 1),
('customer5@example.com', 'user/user21.jpg', 'Customer 5', '123-456-7821', '12345', 1),
('consultant5@example.com', 'user/user22.jpg', 'Consultant 5', '123-456-7822', '12345', 1),
('designer5@example.com', 'user/user23.jpg', 'Designer 5', '123-456-7823', '12345', 1),
('constructor5@example.com', 'user/user24.jpg', 'Constructor 5', '123-456-7824', '12345', 1),
('manager5@example.com', 'user/user25.jpg', 'Manager 5', '123-456-7825', '12345', 1),
('customer6@example.com', 'user/user26.jpg', 'Customer 6', '123-456-7826', '12345', 1),
('consultant6@example.com', 'user/user27.jpg', 'Consultant 6', '123-456-7827', '12345', 1),
('designer6@example.com', 'user/user28.jpg', 'Designer 6', '123-456-7828', '12345', 1),
('constructor6@example.com', 'user/user29.jpg', 'Constructor 6', '123-456-7829', '12345', 1),
('manager6@example.com', 'user/user30.jpg', 'Manager 6', '123-456-7830', '12345', 1),
('customer7@example.com', 'user/user31.jpg', 'Customer 7', '123-456-7831', '12345', 1),
('consultant7@example.com', 'user/user32.jpg', 'Consultant 7', '123-456-7832', '12345', 1),
('designer7@example.com', 'user/user33.jpg', 'Designer 7', '123-456-7833', '12345', 1),
('constructor7@example.com', 'user/user34.jpg', 'Constructor 7', '123-456-7834', '12345', 1),
('manager7@example.com', 'user/user35.jpg', 'Manager 7', '123-456-7835', '12345', 1);


INSERT INTO authorities (user_id, authority) VALUES
(1, 'ROLE_CUSTOMER'),
(2, 'ROLE_CONSULTANT'),
(3, 'ROLE_DESIGNER'),
(4, 'ROLE_CONSTRUCTOR'),
(5, 'ROLE_MANAGER'),
(6, 'ROLE_CUSTOMER'),
(7, 'ROLE_CONSULTANT'),
(8, 'ROLE_DESIGNER'),
(9, 'ROLE_CONSTRUCTOR'),
(10, 'ROLE_MANAGER'),
(11, 'ROLE_CUSTOMER'),
(12, 'ROLE_CONSULTANT'),
(13, 'ROLE_DESIGNER'),
(14, 'ROLE_CONSTRUCTOR'),
(15, 'ROLE_MANAGER'),
(16, 'ROLE_CUSTOMER'),
(17, 'ROLE_CONSULTANT'),
(18, 'ROLE_DESIGNER'),
(19, 'ROLE_CONSTRUCTOR'),
(20, 'ROLE_MANAGER'),
(21, 'ROLE_CUSTOMER'),
(22, 'ROLE_CONSULTANT'),
(23, 'ROLE_DESIGNER'),
(24, 'ROLE_CONSTRUCTOR'),
(25, 'ROLE_MANAGER'),
(26, 'ROLE_CUSTOMER'),
(27, 'ROLE_CONSULTANT'),
(28, 'ROLE_DESIGNER'),
(29, 'ROLE_CONSTRUCTOR'),
(30, 'ROLE_MANAGER'),
(31, 'ROLE_CUSTOMER'),
(32, 'ROLE_CONSULTANT'),
(33, 'ROLE_DESIGNER'),
(34, 'ROLE_CONSTRUCTOR'),
(35, 'ROLE_MANAGER');

-- Adjusted Insert for Service table (without service_content)
INSERT INTO Service (service_name, service_description, service_status) 
VALUES 
('Flash Cleaning', 'Immediate cleaning of the koi pond without further services.', 1), 
('Routine Cleaning Package', 'Regular cleaning every 2-3 months.', 1), 
('Deep Cleaning Service', 'Thorough cleaning of the pond including algae removal and filter cleaning.', 1), 
('Algae Control Cleaning', 'Specialized cleaning for ponds with algae issues.', 1), 
('Basic Koi Care', 'Basic daily care including feeding and water testing.', 1), 
('Koi Care Plus', 'Extended care service with water treatments and parasite checks.', 1), 
('Full Care Package', 'Complete koi pond care including fish health exams and equipment cleaning.', 1), 
('Vacation Care Service', 'Temporary care of koi pond while the customer is away.', 1), 
('Essential Maintenance', 'Regular water changes and equipment checks.', 1), 
('Preventive Maintenance Package', 'Quarterly maintenance to prevent major problems.', 1), 
('Complete Maintenance Plan', 'All-inclusive maintenance package for koi pond longevity.', 1), 
('Seasonal Maintenance Service', 'Tailored maintenance to prepare the pond for seasonal changes.', 1)



-- Insert prices for each service into Service_Price table
INSERT INTO Service_Price (value, date_apply, service_price_status, service_id)
VALUES
(50.00, '2024-09-01', 1, 1),  -- Flash Cleaning
(150.00, '2024-09-01', 1, 2), -- Routine Cleaning Package
(300.00, '2024-09-01', 1, 3), -- Deep Cleaning Service
(200.00, '2024-09-01', 1, 4), -- Algae Control Cleaning
(100.00, '2024-09-01', 1, 5), -- Basic Koi Care
(250.00, '2024-09-01', 1, 6), -- Koi Care Plus
(500.00, '2024-09-01', 1, 7), -- Full Care Package
(100.00, '2024-09-01', 1, 8), -- Vacation Care Service
(120.00, '2024-09-01', 1, 9), -- Essential Maintenance
(220.00, '2024-09-01', 1, 10), -- Preventive Maintenance Package
(600.00, '2024-09-01', 1, 11), -- Complete Maintenance Plan
(300.00, '2024-09-01', 1, 12); -- Seasonal Maintenance Service


-- Insert data into Customers table based on the Users table (customers only)
INSERT INTO Customers (id)
VALUES
(1),  -- User 1 is a customer
(6),  -- User 6 is a customer
(11), -- User 11 is a customer
(16), -- User 16 is a customer
(21), -- User 21 is a customer
(26), -- User 26 is a customer
(31); -- User 31 is a customer


-- Insert more data into Loyalty_Point table
INSERT INTO Loyalty_Point (amount, date_apply, customer_id)
VALUES
(100, '2024-09-01', 1),  -- Customer 1
(150, '2024-10-01', 1),  -- Additional points for Customer 1
(200, '2024-09-05', 6),  -- Customer 6
(250, '2024-10-05', 6),  -- Additional points for Customer 6
(150, '2024-09-10', 11), -- Customer 11
(100, '2024-10-10', 11), -- Additional points for Customer 11
(300, '2024-09-15', 16), -- Customer 16
(350, '2024-10-15', 16), -- Additional points for Customer 16
(120, '2024-09-20', 21), -- Customer 21
(170, '2024-10-20', 21), -- Additional points for Customer 21
(250, '2024-09-25', 26), -- Customer 26
(300, '2024-10-25', 26), -- Additional points for Customer 26
(180, '2024-09-30', 31), -- Customer 31
(230, '2024-10-30', 31); -- Additional points for Customer 31


-- Insert relevant staff members into Staffs table
INSERT INTO Staffs (id, department)
VALUES
(2, 'Consulting'),     -- User 2 is a consultant
(3, 'Design'),         -- User 3 is a designer
(4, 'Construction'),   -- User 4 is a constructor
(5, 'Management'),     -- User 5 is a manager
(7, 'Consulting'),     -- User 7 is a consultant
(8, 'Design'),         -- User 8 is a designer
(9, 'Construction'),   -- User 9 is a constructor
(10, 'Management'),    -- User 10 is a manager
(12, 'Consulting'),    -- User 12 is a consultant
(13, 'Design'),        -- User 13 is a designer
(14, 'Construction'),  -- User 14 is a constructor
(15, 'Management'),    -- User 15 is a manager
(17, 'Consulting'),    -- User 17 is a consultant
(18, 'Design'),        -- User 18 is a designer
(19, 'Construction'),  -- User 19 is a constructor
(20, 'Management'),    -- User 20 is a manager
(22, 'Consulting'),    -- User 22 is a consultant
(23, 'Design'),        -- User 23 is a designer
(24, 'Construction'),  -- User 24 is a constructor
(25, 'Management'),    -- User 25 is a manager
(27, 'Consulting'),    -- User 27 is a consultant
(28, 'Design'),        -- User 28 is a designer
(29, 'Construction'),  -- User 29 is a constructor
(30, 'Management'),    -- User 30 is a manager
(32, 'Consulting'),    -- User 32 is a consultant
(33, 'Design'),        -- User 33 is a designer
(34, 'Construction'),  -- User 34 is a constructor
(35, 'Management');    -- User 35 is a manager


-- Insert sample data into Blog table (without blog_content)
INSERT INTO Blog (blog_name, blog_date_post, blog_description, blog_img_url, staff_id) 
VALUES 
('Designing the Perfect Koi Pond', '2024-09-01', 'A guide to designing beautiful and functional Koi ponds.', 'images/blog/design_koi_pond.jpg', 3), -- Blog by designer 
('Maintaining a Healthy Pond', '2024-09-10', 'Tips and tricks for keeping your Koi pond healthy and clean.', 'images/blog/healthy_pond.jpg', 4), -- Blog by constructor 
('Consultation Tips for New Pond Owners', '2024-09-15', 'Advice for first-time pond owners during the consultation process.', 'images/blog/consultation_tips.jpg', 2), -- Blog by consultant 
('Choosing the Right Filtration System', '2024-09-20', 'An in-depth look at different filtration systems and their benefits.', 'images/blog/filtration_system.jpg', 9), -- Blog by constructor 
('The Art of Pond Landscaping', '2024-09-25', 'Learn how to create a harmonious landscape around your pond.', 'images/blog/pond_landscaping.jpg', 8); -- Blog by designer


 update Blog set blog_status = 1

 -- Insert data into Term table, ensuring the total percentage is 100% unless follow_contract is 1
INSERT INTO Term (percent_on_design1, percent_on_design2, percent_on_design3, percent_on_construct1, percent_on_construct2, 
                  pay_on_start_of_design, pay_on_start_of_construction, description, is_template, follow_contract)
VALUES

(20.00, 20.00, 20.00, 20.00, 20.00, 1, 1, 'Standard payment terms, equal distribution for design and construction', 1, 0),  -- Total 100%
(30.00, 30.00, 20.00, 10.00, 10.00, 1, 0, 'Heavier focus on design phases, lighter on construction', 1, 0),  -- Total 100%
(40.00, 30.00, 10.00, 10.00, 10.00, 0, 1, 'Design-heavy project with minor construction elements', 1, 0),  -- Total 100%
(25.00, 25.00, 25.00, 15.00, 10.00, 1, 1, 'Balanced terms with slightly more focus on design', 1, 0),  -- Total 100%
(0.00, 0.00, 0.00, 60.00, 40.00, 1, 1, 'Follow the contract money for each stage', 0, 1),  -- Follow contract, total can vary
(50.00, 0.00, 0.00, 30.00, 20.00, 1, 1, 'Custom contract-based terms, design upfront', 0, 1);  -- Follow contract, total can vary

update Term set term_status = 1;
-- Insert data into Pre_Design table
INSERT INTO Pre_Design (pre_design_name, pre_design_img_url, pre_design_description)
VALUES
('Modern Koi Pond', 'preDesign/modern_koi_pond.jpg', 'A modern and sleek koi pond design with clean lines and minimalist features.'),
('Traditional Koi Pond', 'preDesign/traditional_koi_pond.jpg', 'A traditional koi pond design with natural stone elements and a classic feel.'),
('Zen Garden Pond', 'preDesign/zen_garden_pond.jpg', 'A calming zen-style garden pond featuring natural rocks and a peaceful layout.'),
('Waterfall Koi Pond', 'preDesign/waterfall_koi_pond.jpg', 'A stunning koi pond design with a cascading waterfall and lush greenery.'),
('Raised Koi Pond', 'preDesign/raised_koi_pond.jpg', 'An elevated koi pond design perfect for smaller spaces or urban environments.'),
('Tropical Koi Pond', 'preDesign/tropical_koi_pond.jpg', 'A vibrant and tropical-themed koi pond with colorful plants and dynamic water features.');


-- Insert more sample data with completed consultations into Consultant table
-- Insert more sample data into Consultant table
-- Adjusted Consultant data ensuring each consultant only has one quote
-- Insert 26 Consultants
INSERT INTO Consultant (consultant_customer_name, consultant_date_time, consultant_phone, consultant_content, 
                        consultant_type, consultant_status, consultant_email, customer_id, staff_id, pre_design_id)
VALUES
('John Doe', '2024-09-20 10:00:00', '123-456-7890', 'Modern Koi Pond consultation.', 
 'Koi Pond Consultation', 4, 'john.doe@example.com', 1, 2, 1),  -- Completed, Quote Approved
('Jane Smith', '2024-09-22 14:30:00', '987-654-3210', 'Zen Garden Pond consultation.', 
 'Zen Garden Pond Consultation', 4, 'jane.smith@example.com', 6, 7, 3),  -- Completed, Quote Approved
('Robert Johnson', '2024-09-25 09:00:00', '555-123-4567', 'Raised Koi Pond consultation.', 
 'Raised Pond Consultation', 4, 'robert.johnson@example.com', 11, 12, 5),  -- Completed, Quote Approved
('Emily Davis', '2024-09-28 16:00:00', '444-987-6543', 'Tropical Koi Pond consultation.', 
 'Tropical Pond Consultation', 4, 'emily.davis@example.com', 16, 12, 6),  -- Completed, Quote Approved
('Michael Brown', '2024-10-01 11:00:00', '222-333-4444', 'Compact Koi Pond consultation.', 
 'Koi Pond Design Consultation', 4, 'michael.brown@example.com', 21, 17, 1),  -- Completed, Quote Approved
('Linda Green', '2024-10-05 09:30:00', '666-777-8888', 'Luxury Modern Koi Pond consultation.', 
 'Pond Maintenance Consultation', 4, 'linda.green@example.com', 26, 22, 2),  -- Completed, Quote Approved
('Steve White', '2024-10-07 14:00:00', '111-222-3333', 'Advanced Koi Pond consultation.', 
 'Pond Filtration Consultation', 4, 'steve.white@example.com', 31, 22, 3),  -- Completed, Quote Approved
('David Clark', '2024-10-09 12:00:00', '999-888-7777', 'Tropical Koi Pond Installation consultation.', 
 'Pond Lighting Consultation', 4, 'david.clark@example.com', 1, 27, 6),  -- Completed, Quote Approved
('Sophia Lewis', '2024-10-11 08:00:00', '321-654-9876', 'Urban Koi Pond consultation.', 
 'Modern Pond Upgrade', 4, 'sophia.lewis@example.com', 6, 32, 1),  -- Completed, Quote Approved

-- Additional Consultants Not Linked to Projects
('Chris Evans', '2024-10-12 14:30:00', '123-321-1111', 'Zen Pond Design.', 
 'Zen Garden Pond Consultation', 4, 'chris.evans@example.com', 26, 2, 4),  -- Completed
('Jennifer Walker', '2024-10-13 10:30:00', '555-999-4444', 'Minimalist Koi Pond Design.', 
 'Zen Pond Design Consultation', 4, 'jennifer.walker@example.com', 16, 7, 6),  -- Completed
('Richard Hall', '2024-10-15 12:30:00', '444-555-6666', 'Tropical Koi Pond Installation.', 
 'Tropical Pond Design Consultation', 4, 'richard.hall@example.com', 31, 12, 3),  -- Completed
('Megan Brown', '2024-10-16 08:00:00', '111-555-1234', 'Raised Koi Pond Design.', 
 'Pond Filtration Consultation', 4, 'megan.brown@example.com', 21, 17, 5),  -- Completed
('Bruce Wayne', '2024-10-17 15:00:00', '999-888-7777', 'Advanced Koi Pond Design.', 
 'Luxury Pond Consultation', 4, 'bruce.wayne@example.com', 31, 22, 6),  -- Completed
('Clark Kent', '2024-10-18 16:00:00', '333-111-4444', 'Luxury Modern Koi Pond.', 
 'Compact Pond Consultation', 4, 'clark.kent@example.com', 21, 27, 5),  -- Completed
('Peter Parker', '2024-10-19 11:00:00', '111-999-8888', 'Modern Koi Pond.', 
 'Modern Koi Pond Design Consultation', 4, 'peter.parker@example.com', 26, 32, 1),  -- Completed
('Tony Stark', '2024-10-20 15:30:00', '333-444-5555', 'Advanced Koi Pond.', 
 'Advanced Koi Pond Design', 4, 'tony.stark@example.com', 11, 22, 2),  -- Completed
('Diana Prince', '2024-10-22 09:00:00', '555-777-9999', 'Luxury Pond Design.', 
 'Luxury Koi Pond Design Consultation', 4, 'diana.prince@example.com', 6, 7, 3),  -- Completed
('Natasha Romanoff', '2024-10-23 14:00:00', '444-222-6666', 'Tropical Koi Pond Consultation.', 
 'Tropical Koi Pond Design Consultation', 4, 'natasha.romanoff@example.com', 16, 12, 3),  -- Completed
('Clark Kent', '2024-10-25 12:00:00', '333-111-4444', 'Luxury Modern Koi Pond.', 
 'Compact Pond Consultation', 4, 'clark.kent@example.com', 31, 12, 5),  -- Completed
('Bruce Banner', '2024-10-27 08:30:00', '777-888-5555', 'Advanced Zen Pond Consultation.', 
 'Advanced Pond Design Consultation', 4, 'bruce.banner@example.com', 11, 7, 4),  -- Completed
('Steve Rogers', '2024-10-29 16:00:00', '222-444-6666', 'Minimalist Zen Pond Design.', 
 'Minimalist Pond Design Consultation', 4, 'steve.rogers@example.com', 16, 32, 2); -- Completed



 -- Insert sample data into Package table
INSERT INTO Package (package_name, construction_price_on_square_root, design_on_square_root, package_description, package_status)
VALUES
('Basic Package', 100.00, 50.00, 'Basic construction and design package with minimal features.', 1),  -- Active
('Standard Package', 150.00, 75.00, 'Standard package offering a balanced approach for construction and design.', 1),  -- Active
('Premium Package', 200.00, 100.00, 'Premium package with advanced construction features and premium design.', 1),  -- Active
('Luxury Package', 300.00, 150.00, 'Luxury package for high-end construction and bespoke designs.', 1),  -- Active
('Economy Package', 80.00, 40.00, 'Affordable construction and design package for budget-conscious clients.', 1),  -- Active
('Maintenance Package', 50.00, 25.00, 'Package focused on pond maintenance rather than new construction or design.', 0);  -- Disabled


-- Insert additional data into Quotes table, emphasizing quotes accepted by customers
-- Adjusted Quotes data
INSERT INTO Quotes (quotes_name, quotes_content, quotes_total_price, quotes_area, quotes_date, 
                    quotes_status, quotes_design_cost, quotes_construction_cost, customer_id, consultant_id, staff_id, package_id)
VALUES
('Modern Koi Pond Quote', 'Design and construction of Modern Koi Pond.', 
 12000.00, 30.00, '2024-09-30', 4, 3000.00, 9000.00, 1, 1, 2, 1),  -- Quote 1
('Raised Koi Pond Quote', 'Design of a raised koi pond for small spaces.', 
 8500.00, 25.00, '2024-10-02', 4, 2500.00, 6000.00, 6, 3, 7, 2),  -- Quote 2
('Tropical Koi Pond Quote', 'Tropical Koi Pond Design with vibrant plants.', 
 14000.00, 40.00, '2024-10-05', 4, 4500.00, 9500.00, 11, 4, 12, 3),  -- Quote 3
('Zen Garden Pond Quote', 'Design of a peaceful zen garden koi pond.', 
 10200.00, 35.00, '2024-10-08', 4, 3500.00, 6700.00, 16, 5, 12, 4),  -- Quote 4
('Compact Koi Pond Quote', 'Compact Koi Pond with integrated lighting.', 
 6000.00, 20.00, '2024-10-11', 4, 2000.00, 4000.00, 21, 6, 17, 2),  -- Quote 5
('Luxury Modern Koi Pond Quote', 'Luxury Modern Koi Pond with advanced features.', 
 18000.00, 50.00, '2024-10-14', 4, 5000.00, 13000.00, 26, 7, 22, 4),  -- Quote 6
 ('Advanced Koi Pond Quote', 'Advanced Koi Pond with high-tech filtration system.', 
 20000.00, 70.00, '2024-10-17', 4, 6000.00, 14000.00, 31, 8, 22, 4),  -- Quote 7
('Tropical Koi Pond Installation Quote', 'Installation of a tropical-themed koi pond with lush landscaping.', 
 15000.00, 60.00, '2024-10-20', 4, 5000.00, 10000.00, 1, 9, 27, 3),  -- Quote 8
('Compact Urban Koi Pond Quote', 'Urban koi pond design for small spaces.', 
 7000.00, 30.00, '2024-10-23', 4, 2000.00, 5000.00, 6, 10, 32, 1),  -- Quote 9
('Zen Pond Design Quote', 'Zen pond design with peaceful elements.', 
 12000.00, 40.00, '2024-10-25', 4, 3000.00, 9000.00, 26, 11, 2, 2),  -- Quote 10
('Luxury Pond Design Quote', 'Luxury koi pond with premium water features.', 
 18000.00, 55.00, '2024-10-27', 4, 4000.00, 14000.00, 16, 12, 7, 4),  -- Quote 11
('Minimalist Zen Pond Quote', 'Minimalist zen koi pond design with simple aesthetics.', 
 9000.00, 35.00, '2024-10-29', 4, 2500.00, 6500.00, 31, 13, 12, 3),  -- Quote 12
('Advanced Zen Pond Quote', 'High-tech filtration system for zen pond.', 
 21000.00, 75.00, '2024-10-31', 4, 5500.00, 15500.00, 21, 14, 17, 4),  -- Quote 13
('Compact Pond Quote', 'Compact koi pond installation for urban spaces.', 
 8000.00, 25.00, '2024-11-02', 4, 2000.00, 6000.00, 31, 15, 22, 2),  -- Quote 14
('Luxury Koi Pond Quote', 'Luxury koi pond with modern features and water aesthetics.', 
 19000.00, 65.00, '2024-11-04', 4, 4500.00, 14500.00, 21, 16, 27, 4),  -- Quote 15
('Tropical Koi Pond Expansion Quote', 'Tropical pond expansion with additional landscaping.', 
 14000.00, 55.00, '2024-11-06', 4, 4000.00, 10000.00, 26, 17, 32, 3),  -- Quote 16
('Zen Pond with Modern Features Quote', 'Zen pond with advanced water features.', 
 13000.00, 45.00, '2024-11-08', 4, 3500.00, 9500.00, 11, 18, 22, 2);  -- Quote 17


-- Insert 14 Contracts
INSERT INTO [Contract] (date_create, file_url, total_price, price_on_concept_design, price_on_construction_design, 
                        price_on_detail_design, price_on_raw_construction, price_on_complete_construction, 
                        contract_term, contract_status, contract_note, term_id, customer_id, quote_id)
VALUES
('2024-10-30', 'contracts/contract1.pdf', 12000.00, 3000.00, 9000.00, 3000.00, 5000.00, 7000.00, 
 'Standard terms', 6, 'Customer accepted the Modern Koi Pond project.', 1, 1, 1),  -- Contract for Project 1
('2024-11-01', 'contracts/contract2.pdf', 8500.00, 2500.00, 6000.00, 2500.00, 4000.00, 6000.00, 
 'Standard terms', 6, 'Customer accepted the Raised Koi Pond project.', 2, 11, 2),  -- Contract for Project 2
('2024-11-03', 'contracts/contract3.pdf', 14000.00, 4500.00, 9500.00, 3500.00, 5000.00, 8000.00, 
 'Premium terms', 6, 'Customer accepted the Tropical Koi Pond project.', 3, 16, 3),  -- Contract for Project 3
('2024-11-05', 'contracts/contract4.pdf', 10200.00, 3500.00, 6700.00, 3200.00, 4500.00, 7500.00, 
 'Standard terms', 6, 'Customer accepted the Zen Garden Pond project.', 4, 6, 4),  -- Contract for Project 4
('2024-11-07', 'contracts/contract5.pdf', 6000.00, 2000.00, 4000.00, 1500.00, 3500.00, 5000.00, 
 'Basic terms', 6, 'Customer accepted the Compact Koi Pond project.', 1, 21, 5),  -- Contract for Project 5
('2024-11-09', 'contracts/contract6.pdf', 18000.00, 5000.00, 13000.00, 5000.00, 7000.00, 11000.00, 
 'Luxury terms', 6, 'Customer accepted the Luxury Modern Koi Pond project.', 3, 26, 6),  -- Contract for Project 6
('2024-11-11', 'contracts/contract7.pdf', 20000.00, 6000.00, 14000.00, 5000.00, 9000.00, 15000.00, 
 'Premium terms', 6, 'Customer accepted the Advanced Koi Pond project.', 4, 31, 7),  -- Contract for Project 7
('2024-11-13', 'contracts/contract8.pdf', 15000.00, 5000.00, 10000.00, 4000.00, 6000.00, 9000.00, 
 'Standard terms', 6, 'Customer accepted the Tropical Koi Pond Installation.', 2, 1, 8),  -- Contract for Project 8
('2024-11-15', 'contracts/contract9.pdf', 7000.00, 2000.00, 5000.00, 2500.00, 4000.00, 6000.00, 
 'Basic terms', 6, 'Customer accepted the Compact Urban Koi Pond project.', 1, 6, 9),  -- Contract for Project 9
('2024-11-17', 'contracts/contract10.pdf', 12000.00, 3000.00, 9000.00, 3000.00, 5000.00, 7000.00, 
 'Standard terms', 6, 'Customer accepted the Zen Pond project.', 1, 16, 10),  -- Contract for Zen Pond
('2024-11-19', 'contracts/contract11.pdf', 18000.00, 4000.00, 14000.00, 4000.00, 8000.00, 12000.00, 
 'Luxury terms', 6, 'Customer accepted the Luxury Koi Pond project.', 4, 11, 11),  -- Contract for Luxury Pond
('2024-11-21', 'contracts/contract12.pdf', 9000.00, 2500.00, 6500.00, 2000.00, 4000.00, 6000.00, 
 'Standard terms', 6, 'Customer accepted the Minimalist Zen Pond project.', 1, 21, 12),  -- Contract for Minimalist Zen Pond
('2024-11-23', 'contracts/contract13.pdf', 21000.00, 5500.00, 15500.00, 5000.00, 9500.00, 14500.00, 
 'Premium terms', 6, 'Customer accepted the Advanced Zen Pond project.', 3, 26, 13),
 ('2024-11-25', 'contracts/contract14.pdf', 8000.00, 2000.00, 6000.00, 2000.00, 4000.00, 6000.00, 
 'Basic terms', 6, 'Customer accepted the Compact Pond project.', 2, 31, 14);  -- Contract for Compact Pond



-- Insert projects without project_content into Project table
INSERT INTO Project (project_name, address, style, description, date_start, date_end, project_status, img_url, stage, is_shareable, contract_id)
VALUES 
('Modern Koi Pond', '123 Garden Ave, Cityville', 'Modern', 'A modern koi pond with a waterfall feature.', 
 '2024-11-01', '2024-12-01', 1, 'projects/modern_koi_pond.jpg', 1, 1, 1), -- Contract 1
('Raised Koi Pond', '456 Urban St, Metropolis', 'Urban', 'Raised koi pond designed for a compact urban space.', 
 '2024-11-03', '2024-12-10', 2, 'projects/raised_koi_pond.jpg', 2, 0, 2), -- Contract 2
('Tropical Koi Pond', '789 Beachside Blvd, Seaview', 'Tropical', 'Tropical-themed koi pond with vibrant plants.', 
 '2024-11-05', '2024-12-15', 3, 'projects/tropical_koi_pond.jpg', 5, 1, 3), -- Contract 3
('Zen Garden Koi Pond', '123 Zen Ln, Hillside', 'Zen', 'A minimalist zen garden koi pond with peaceful elements.', 
 '2024-11-07', '2024-12-20', 3, 'projects/zen_garden_koi_pond.jpg', 2, 1, 4), -- Contract 4
('Compact Koi Pond', '456 City Rd, Downtown', 'Compact', 'Small koi pond with integrated lighting.', 
 '2024-11-09', '2024-12-25', 2, 'projects/compact_koi_pond.jpg', 2, 0, 5), -- Contract 5
('Luxury Modern Koi Pond', '789 Sunset Blvd, Westside', 'Luxury', 'A luxury koi pond with high-end water features.', 
 '2024-11-11', '2024-12-30', 1, 'projects/luxury_modern_koi_pond.jpg', 2, 1, 6), -- Contract 6
('Advanced Koi Pond', '321 Future St, Silicon Valley', 'Advanced', 'A high-tech koi pond with the latest filtration systems.', 
 '2024-11-13', '2024-12-25', 3, 'projects/advanced_koi_pond.jpg', 5, 1, 7), -- Contract 7
('Tropical Koi Pond Installation', '987 Ocean Dr, Palm Beach', 'Tropical', 'A tropical koi pond with lush landscaping.', 
 '2024-11-15', '2024-12-28', 4, 'projects/tropical_installation.jpg', 4, 0, 8), -- Contract 8
('Compact Urban Koi Pond', '789 Urban St, New City', 'Compact', 'A compact koi pond with modern aesthetics.', 
 '2024-11-17', '2024-12-30', 1, 'projects/urban_koi_pond.jpg', 1, 1, 9); -- Contract 9



 -- Insert data into Design table (one design per project)
INSERT INTO Design (design_name, design_status, project_id)
VALUES
('Modern Koi Pond Design', 1, 1),   -- Project 1: Modern Koi Pond
('Raised Koi Pond Design', 4, 2),   -- Project 2: Raised Koi Pond
('Tropical Koi Pond Design', 3, 3), -- Project 3: Tropical Koi Pond
('Zen Garden Koi Pond Design', 3, 4),  -- Project 4: Zen Garden Koi Pond
('Compact Koi Pond Design', 3, 5),  -- Project 5: Compact Koi Pond
('Luxury Modern Koi Pond Design', 3, 6),  -- Project 6: Luxury Modern Koi Pond
('Advanced Koi Pond Design', 3, 7),  -- Project 7: Advanced Koi Pond
('Tropical Koi Pond Installation', 3, 8),  -- Project 8: Tropical Koi Pond Installation
('Urban Koi Pond Design', 2, 9);  -- Project 9: Compact Urban Koi Pond


-- Insert data into Design_Stage table for all projects
INSERT INTO Design_Stage (design_stage_name, design_stage_status, design_stage_price, summary_file, design_id)
VALUES
-- Modern Koi Pond Design (Pending stages)
('Conceptual Design', 1, 2500.00, 'summary/conceptual_modern.pdf', 1),  -- Pending
('Detail Design', 1, 3000.00, 'summary/detail_modern.pdf', 1),  -- Pending
('Construction Design', 1, 3500.00, 'summary/construction_modern.pdf', 1),  -- Pending

-- Raised Koi Pond Design (Canceled, but stage status is 'Pending' due to cancellation)
('Conceptual Design', 1, 1800.00, 'summary/conceptual_raised.pdf', 2),  -- Pending
('Detail Design', 1, 2500.00, 'summary/detail_raised.pdf', 2),  -- Pending
('Construction Design', 1, 3000.00, 'summary/construction_raised.pdf', 2),  -- Pending

-- Tropical Koi Pond Design (All stages are Approved)
('Conceptual Design', 4, 2000.00, 'summary/conceptual_tropical.pdf', 3),  -- Approved
('Detail Design', 4, 2500.00, 'summary/detail_tropical.pdf', 3),  -- Approved
('Construction Design', 4, 3000.00, 'summary/construction_tropical.pdf', 3),  -- Approved

-- Zen Garden Koi Pond Design (All stages are Approved)
('Conceptual Design', 4, 2500.00, 'summary/conceptual_zen.pdf', 4),  -- Approved
('Detail Design', 4, 3000.00, 'summary/detail_zen.pdf', 4),  -- Approved
('Construction Design', 4, 3500.00, 'summary/construction_zen.pdf', 4),  -- Approved

-- Compact Koi Pond Design (All stages are Approved)
('Conceptual Design', 4, 1500.00, 'summary/conceptual_compact.pdf', 5),  -- Approved
('Detail Design', 4, 2000.00, 'summary/detail_compact.pdf', 5),  -- Approved
('Construction Design', 4, 2500.00, 'summary/construction_compact.pdf', 5),  -- Approved

-- Luxury Modern Koi Pond Design (All stages are Approved)
('Conceptual Design', 4, 3500.00, 'summary/conceptual_luxury.pdf', 6),  -- Approved
('Detail Design', 4, 4500.00, 'summary/detail_luxury.pdf', 6),  -- Approved
('Construction Design', 4, 5000.00, 'summary/construction_luxury.pdf', 6),  -- Approved

-- Advanced Koi Pond Design (Conceptual is Processing, others are Pending)
('Conceptual Design', 4, 4000.00, 'summary/conceptual_advanced.pdf', 7),  -- Processing
('Detail Design', 4, 5000.00, 'summary/detail_advanced.pdf', 7),  -- Pending
('Construction Design', 4, 6000.00, 'summary/construction_advanced.pdf', 7),  -- Pending

-- Tropical Koi Pond Installation (All stages are Approved)
('Conceptual Design', 4, 2500.00, 'summary/conceptual_tropical_installation.pdf', 8),  -- Approved
('Detail Design', 4, 3500.00, 'summary/detail_tropical_installation.pdf', 8),  -- Approved
('Construction Design', 4, 4000.00, 'summary/construction_tropical_installation.pdf', 8),  -- Approved

-- Urban Koi Pond Design (Conceptual is Processing, others are Pending)
('Conceptual Design', 2, 1500.00, 'summary/conceptual_urban.pdf', 9),  -- Processing
('Detail Design', 1, 2000.00, 'summary/detail_urban.pdf', 9),  -- Pending
('Construction Design', 1, 2500.00, 'summary/construction_urban.pdf', 9);  -- Pending


-- Conceptual Design (Pending, pay at the end)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the conceptual design.', 1, 1),  -- Pending
('Design', 'Designing the conceptual layout.', 1, 1),  -- Pending
('Editing', 'Final edits on the conceptual design.', 1, 1),  -- Pending
('Payment', 'Payment for the conceptual design.', 1, 1);  -- Pending

-- Detail Design follows the same logic
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the detail design.', 1, 2),  -- Pending
('Design', 'Designing the detailed layout.', 1, 2),  -- Pending
('Editing', 'Final edits on the detail design.', 1, 2),  -- Pending
('Payment', 'Payment for the detail design.', 1, 2);  -- Pending

-- Construction Design follows the same logic
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the construction design.', 1, 3),  -- Pending
('Design', 'Designing the construction layout.', 1, 3),  -- Pending
('Editing', 'Final edits on the construction design.', 1, 3),  -- Pending
('Payment', 'Payment for the construction design.', 1, 3);  -- Pending

-- No stage details required since the project is canceled (all stages are Pending)

-- Conceptual Design (Approved, pay at the beginning)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the conceptual design.', 4, 7),  -- Approved
('Planning', 'Planning for the conceptual design.', 4, 7),  -- Approved
('Design', 'Designing the conceptual layout.', 4, 7),  -- Approved
('Editing', 'Final edits on the conceptual design.', 4, 7);  -- Approved

-- Detail Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the detail design.', 4, 8),  -- Approved
('Planning', 'Planning for the detail design.', 4, 8),  -- Approved
('Design', 'Designing the detailed layout.', 4, 8),  -- Approved
('Editing', 'Final edits on the detail design.', 4, 8);  -- Approved

-- Construction Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the construction design.', 4, 9),  -- Approved
('Planning', 'Planning for the construction design.', 4, 9),  -- Approved
('Design', 'Designing the construction layout.', 4, 9),  -- Approved
('Editing', 'Final edits on the construction design.', 4, 9);  -- Approved

-- Conceptual Design (Approved, similar to Project 3)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the conceptual design.', 4, 10),  -- Approved
('Planning', 'Planning for the conceptual design.', 4, 10),  -- Approved
('Design', 'Designing the conceptual layout.', 4, 10),  -- Approved
('Editing', 'Final edits on the conceptual design.', 4, 10);  -- Approved

-- Detail Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the detail design.', 4, 11),  -- Approved
('Planning', 'Planning for the detail design.', 4, 11),  -- Approved
('Design', 'Designing the detailed layout.', 4, 11),  -- Approved
('Editing', 'Final edits on the detail design.', 4, 11);  -- Approved

-- Construction Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the construction design.', 4, 12),  -- Approved
('Planning', 'Planning for the construction design.', 4, 12),  -- Approved
('Design', 'Designing the construction layout.', 4, 12),  -- Approved
('Editing', 'Final edits on the construction design.', 4, 12);  -- Approved

-- Conceptual Design (Approved, pay first)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the conceptual design.', 4, 13),  -- Approved
('Planning', 'Planning for the conceptual design.', 4, 13),  -- Approved
('Design', 'Designing the conceptual layout.', 4, 13),  -- Approved
('Editing', 'Final edits on the conceptual design.', 4, 13);  -- Approved

-- Detail Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the detail design.', 4, 14),  -- Approved
('Planning', 'Planning for the detail design.', 4, 14),  -- Approved
('Design', 'Designing the detailed layout.', 4, 14),  -- Approved
('Editing', 'Final edits on the detail design.', 4, 14);  -- Approved

-- Construction Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the construction design.', 4, 15),  -- Approved
('Planning', 'Planning for the construction design.', 4, 15),  -- Approved
('Design', 'Designing the construction layout.', 4, 15),  -- Approved
('Editing', 'Final edits on the construction design.', 4, 15);  -- Approved


-- Conceptual Design (Approved, pay first)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the conceptual design.', 4, 16),  -- Approved
('Planning', 'Planning for the conceptual design.', 4, 16),  -- Approved
('Design', 'Designing the conceptual layout.', 4, 16),  -- Approved
('Editing', 'Final edits on the conceptual design.', 4, 16);  -- Approved

-- Detail Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the detail design.', 4, 17),  -- Approved
('Planning', 'Planning for the detail design.', 4, 17),  -- Approved
('Design', 'Designing the detailed layout.', 4, 17),  -- Approved
('Editing', 'Final edits on the detail design.', 4, 17);  -- Approved

-- Construction Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the construction design.', 4, 18),  -- Approved
('Planning', 'Planning for the construction design.', 4, 18),  -- Approved
('Design', 'Designing the construction layout.', 4, 18),  -- Approved
('Editing', 'Final edits on the construction design.', 4, 18);  -- Approved

-- Conceptual Design (Processing, pay last)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the conceptual design.', 2, 19),  -- Processing
('Design', 'Designing the conceptual layout.', 1, 19),  -- Pending
('Editing', 'Final edits on the conceptual design.', 1, 19),  -- Pending
('Payment', 'Payment for the conceptual design.', 1, 19);  -- Pending

-- Detail Design (Pending)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the detail design.', 1, 20),  -- Pending
('Design', 'Designing the detailed layout.', 1, 20),  -- Pending
('Editing', 'Final edits on the detail design.', 1, 20),  -- Pending
('Payment', 'Payment for the detail design.', 1, 20);  -- Pending

-- Construction Design (Pending)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the construction design.', 1, 21),  -- Pending
('Design', 'Designing the construction layout.', 1, 21),  -- Pending
('Editing', 'Final edits on the construction design.', 1, 21),  -- Pending
('Payment', 'Payment for the construction design.', 1, 21);  -- Pending

-- Conceptual Design (Approved, pay first)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the conceptual design.', 4, 22),  -- Approved
('Planning', 'Planning for the conceptual design.', 4, 22),  -- Approved
('Design', 'Designing the conceptual layout.', 4, 22),  -- Approved
('Editing', 'Final edits on the conceptual design.', 4, 22);  -- Approved

-- Detail Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the detail design.', 4, 23),  -- Approved
('Planning', 'Planning for the detail design.', 4, 23),  -- Approved
('Design', 'Designing the detailed layout.', 4, 23),  -- Approved
('Editing', 'Final edits on the detail design.', 4, 23);  -- Approved

-- Construction Design (Approved)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Payment', 'Payment for the construction design.', 4, 24),  -- Approved
('Planning', 'Planning for the construction design.', 4, 24),  -- Approved
('Design', 'Designing the construction layout.', 4, 24),  -- Approved
('Editing', 'Final edits on the construction design.', 4, 24);  -- Approved

-- Conceptual Design (Processing, pay last)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the conceptual design.', 2, 25),  -- Processing
('Design', 'Designing the conceptual layout.', 1, 25),  -- Pending
('Editing', 'Final edits on the conceptual design.', 1, 25),  -- Pending
('Payment', 'Payment for the conceptual design.', 1, 25);  -- Pending

-- Detail Design (Pending)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the detail design.', 1, 26),  -- Pending
('Design', 'Designing the detailed layout.', 1, 26),  -- Pending
('Editing', 'Final edits on the detail design.', 1, 26),  -- Pending
('Payment', 'Payment for the detail design.', 1, 26);  -- Pending

-- Construction Design (Pending)
INSERT INTO Design_Stage_Detail (name, description, status, design_stage_id)
VALUES
('Planning', 'Planning for the construction design.', 1, 27),  -- Pending
('Design', 'Designing the construction layout.', 1, 27),  -- Pending
('Editing', 'Final edits on the construction design.', 1, 27),  -- Pending
('Payment', 'Payment for the construction design.', 1, 27);  -- Pending


-- Insert data into Blue_Print table for each design stage
-- Modern Koi Pond Design (Project 1)
INSERT INTO Blue_Print (title, img_url, date_create, description, blue_print_status, design_stage_id)
VALUES
('Conceptual Blueprint - Modern Koi Pond', 'blueprints/modern_conceptual.jpg', '2024-10-01', 'Conceptual blueprint for modern koi pond.', 0, 1),  -- Rejected
('Detail Blueprint - Modern Koi Pond', 'blueprints/modern_detail.jpg', '2024-10-05', 'Detailed blueprint for modern koi pond.', 0, 2),  -- Rejected
('Construction Blueprint - Modern Koi Pond', 'blueprints/modern_construction.jpg', '2024-10-10', 'Construction blueprint for modern koi pond.', 0, 3);  -- Rejected

-- Raised Koi Pond Design (Project 2 - Canceled, no blueprints needed)

-- Tropical Koi Pond Design (Project 3)
INSERT INTO Blue_Print (title, img_url, date_create, description, blue_print_status, design_stage_id)
VALUES
('Conceptual Blueprint - Tropical Koi Pond', 'blueprints/tropical_conceptual.jpg', '2024-10-01', 'Conceptual blueprint for tropical koi pond.', 1, 7),  -- Approved
('Detail Blueprint - Tropical Koi Pond', 'blueprints/tropical_detail.jpg', '2024-10-05', 'Detailed blueprint for tropical koi pond.', 1, 8),  -- Approved
('Construction Blueprint - Tropical Koi Pond', 'blueprints/tropical_construction.jpg', '2024-10-10', 'Construction blueprint for tropical koi pond.', 1, 9);  -- Approved

-- Zen Garden Koi Pond Design (Project 4)
INSERT INTO Blue_Print (title, img_url, date_create, description, blue_print_status, design_stage_id)
VALUES
('Conceptual Blueprint - Zen Garden Koi Pond', 'blueprints/zen_conceptual.jpg', '2024-10-01', 'Conceptual blueprint for zen garden koi pond.', 1, 10),  -- Approved
('Detail Blueprint - Zen Garden Koi Pond', 'blueprints/zen_detail.jpg', '2024-10-05', 'Detailed blueprint for zen garden koi pond.', 1, 11),  -- Approved
('Construction Blueprint - Zen Garden Koi Pond', 'blueprints/zen_construction.jpg', '2024-10-10', 'Construction blueprint for zen garden koi pond.', 1, 12);  -- Approved

-- Compact Koi Pond Design (Project 5)
INSERT INTO Blue_Print (title, img_url, date_create, description, blue_print_status, design_stage_id)
VALUES
('Conceptual Blueprint - Compact Koi Pond', 'blueprints/compact_conceptual.jpg', '2024-10-01', 'Conceptual blueprint for compact koi pond.', 1, 13),  -- Approved
('Detail Blueprint - Compact Koi Pond', 'blueprints/compact_detail.jpg', '2024-10-05', 'Detailed blueprint for compact koi pond.', 1, 14),  -- Approved
('Construction Blueprint - Compact Koi Pond', 'blueprints/compact_construction.jpg', '2024-10-10', 'Construction blueprint for compact koi pond.', 1, 15);  -- Approved

-- Luxury Modern Koi Pond Design (Project 6)
INSERT INTO Blue_Print (title, img_url, date_create, description, blue_print_status, design_stage_id)
VALUES
('Conceptual Blueprint - Luxury Koi Pond', 'blueprints/luxury_conceptual.jpg', '2024-10-01', 'Conceptual blueprint for luxury koi pond.', 1, 16),  -- Approved
('Detail Blueprint - Luxury Koi Pond', 'blueprints/luxury_detail.jpg', '2024-10-05', 'Detailed blueprint for luxury koi pond.', 1, 17),  -- Approved
('Construction Blueprint - Luxury Koi Pond', 'blueprints/luxury_construction.jpg', '2024-10-10', 'Construction blueprint for luxury koi pond.', 1, 18);  -- Approved

-- Advanced Koi Pond Design (Project 7 - Processing)
INSERT INTO Blue_Print (title, img_url, date_create, description, blue_print_status, design_stage_id)
VALUES
('Conceptual Blueprint - Advanced Koi Pond', 'blueprints/advanced_conceptual.jpg', '2024-10-01', 'Conceptual blueprint for advanced koi pond.', 1, 19),   -- Approved
('Detail Blueprint - Advanced Koi Pond', 'blueprints/advanced_detail.jpg', '2024-10-05', 'Detailed blueprint for advanced koi pond.', 1, 20),   -- Approved
('Construction Blueprint - Advanced Koi Pond', 'blueprints/advanced_construction.jpg', '2024-10-10', 'Construction blueprint for advanced koi pond.', 1, 21);   -- Approved

-- Tropical Koi Pond Installation (Project 8)
INSERT INTO Blue_Print (title, img_url, date_create, description, blue_print_status, design_stage_id)
VALUES
('Conceptual Blueprint - Tropical Installation', 'blueprints/tropical_installation_conceptual.jpg', '2024-10-01', 'Conceptual blueprint for tropical pond installation.', 1, 22),  -- Approved
('Detail Blueprint - Tropical Installation', 'blueprints/tropical_installation_detail.jpg', '2024-10-05', 'Detailed blueprint for tropical pond installation.', 1, 23),  -- Approved
('Construction Blueprint - Tropical Installation', 'blueprints/tropical_installation_construction.jpg', '2024-10-10', 'Construction blueprint for tropical pond installation.', 1, 24);  -- Approved

-- Urban Koi Pond Design (Project 9 - Processing)
INSERT INTO Blue_Print (title, img_url, date_create, description, blue_print_status, design_stage_id)
VALUES
('Conceptual Blueprint - Urban Koi Pond', 'blueprints/urban_conceptual.jpg', '2024-10-01', 'Conceptual blueprint for urban koi pond.', 1, 25),   -- Approved
('Detail Blueprint - Urban Koi Pond', 'blueprints/urban_detail.jpg', '2024-10-05', 'Detailed blueprint for urban koi pond.', 1, 26),   -- Approved
('Construction Blueprint - Urban Koi Pond', 'blueprints/urban_construction.jpg', '2024-10-10', 'Construction blueprint for urban koi pond.', 1, 27);   -- Approved


-- Insert data into Construction table for each project where design is completed or in progress
INSERT INTO Construction (construction_name, construction_status, project_id)
VALUES
('Modern Koi Pond Construction', 1, 1),   -- Pending (design not completed)
('Raised Koi Pond Construction', 4, 2),   -- Canceled (design canceled)
('Tropical Koi Pond Construction', 2, 3), -- Processing (design completed)
('Zen Garden Koi Pond Construction', 2, 4), -- Processing (design completed)
('Compact Koi Pond Construction', 2, 5),  -- Processing (design completed)
('Luxury Modern Koi Pond Construction', 2, 6),  -- Processing (design completed)
('Advanced Koi Pond Construction', 2, 7),  -- Processing (design in progress)
('Tropical Koi Pond Installation', 2, 8),  -- Processing (design completed)
('Urban Koi Pond Construction', 1, 9);  -- Pending (design not completed)

-- Insert Raw and Complete Construction stages for each project
INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 14000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 1, 1),  -- Pending
('Complete Construction', 9000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 1, 1);  -- Pending
-- Raw Construction Stage for Raised Koi Pond
INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 12000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 4, 2),  -- Canceled
('Complete Construction', 8000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 4, 2);  -- Canceled

-- No need for details, as the construction is canceled

-- Tropical Koi Pond (Project 3)
INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 15000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 2, 3),  -- Processing
('Complete Construction', 10000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 1, 3);  -- Pending

-- Zen Garden Koi Pond (Project 4)
INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 14000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 2, 4),  -- Processing
('Complete Construction', 9000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 1, 4);  -- Pending

-- Compact Koi Pond (Project 5)
INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 12000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 2, 5),  -- Processing
('Complete Construction', 8000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 1, 5);  -- Pending

-- Luxury Modern Koi Pond (Project 6)
INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 18000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 2, 6),  -- Processing
('Complete Construction', 12000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 1, 6);  -- Pending

-- Advanced Koi Pond (Project 7)
INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 16000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 2, 7),  -- Processing
('Complete Construction', 11000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 1, 7);  -- Pending

-- Tropical Koi Pond Installation (Project 8)
INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 16000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 2, 8),  -- Processing
('Complete Construction', 11000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 1, 8);  -- Pending

INSERT INTO Construction_Stage (construction_stage_name, construction_stage_price, construction_stage_description, construction_stage_status, construction_id)
VALUES
('Raw Construction', 16000.00, 'Complete raw construction phase: site preparation, excavation, liner install, etc.', 1, 9),  -- Pending
('Complete Construction', 11000.00, 'Complete finishing phase: decoration, testing, inspection, etc.', 1, 9);  -- Pending


INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 3000.00, 'Initial payment for raw construction.', 1, 1),  -- Processing (payment first)
('Site Preparation', 2000.00, 'Preparing the site for construction.', 1, 1),  -- Processing
('Excavating', 3000.00, 'Excavating for pond construction.', 1, 1),  -- Processing
('Liner Install', 2500.00, 'Installing the pond liner.', 1, 1),  -- Pending
('Filtration System', 4000.00, 'Setting up the filtration system.', 1, 1),  -- Pending
('Pump System', 2000.00, 'Installing the pump system.', 1, 1),  -- Pending
('Electric System', 1500.00, 'Installing the electrical system for the pond.', 1, 1);  -- Pending

INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 2000.00, 'Initial payment for complete construction.', 1, 2),  -- Pending (payment first)
('Decoration', 5000.00, 'Adding decorative elements like plants and rocks.', 1, 2),  -- Pending
('Testing', 2000.00, 'Testing the pond systems.', 1, 2),  -- Pending
('Inspection', 1000.00, 'Final inspection of the pond.', 1, 2);  -- Pending

INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Site Preparation', 2000.00, 'Preparing the site for construction.', 2, 3),  -- Processing
('Excavating', 3000.00, 'Excavating for pond construction.', 1, 3),  -- Processing
('Liner Install', 2500.00, 'Installing the pond liner.', 1, 3),  -- Pending
('Filtration System', 4000.00, 'Setting up the filtration system.', 1, 3),  -- Pending
('Pump System', 2000.00, 'Installing the pump system.', 1, 3),  -- Pending
('Electric System', 1500.00, 'Installing the electrical system for the pond.', 1, 3),  -- Pending
('Payment', 3000.00, 'Final payment for raw construction.', 1, 3);  -- Pending (payment last)

INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Decoration', 5000.00, 'Adding decorative elements like plants and rocks.', 1, 4),  -- Pending
('Testing', 2000.00, 'Testing the pond systems.', 1, 4),  -- Pending
('Inspection', 1000.00, 'Final inspection of the pond.', 1, 4),  -- Pending
('Payment', 2000.00, 'Final payment for complete construction.', 1, 4);  -- Pending (payment last)

INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 2500.00, 'Initial payment for raw construction.', 2, 5),  -- Processing (payment first)
('Site Preparation', 1500.00, 'Preparing the site for construction.', 1, 5),  -- Processing
('Excavating', 2500.00, 'Excavating for pond construction.', 1, 5),  -- Processing
('Liner Install', 2000.00, 'Installing the pond liner.', 1, 5),  -- Pending
('Filtration System', 3000.00, 'Setting up the filtration system.', 1, 5),  -- Pending
('Pump System', 2000.00, 'Installing the pump system.', 1, 5),  -- Pending
('Electric System', 1500.00, 'Installing the electrical system for the pond.', 1, 5);  -- Pending
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 2500.00, 'Initial payment for complete construction.', 1, 6),  -- Pending (payment first)
('Decoration', 4000.00, 'Adding decorative elements like plants and rocks.', 1, 6),  -- Pending
('Testing', 1500.00, 'Testing the pond systems.', 1, 6),  -- Pending
('Inspection', 1000.00, 'Final inspection of the pond.', 1, 6);  -- Pending
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Site Preparation', 2000.00, 'Preparing the site for construction.', 2, 7),  -- Processing
('Excavating', 4000.00, 'Excavating for pond construction.', 1, 7),  -- Processing
('Liner Install', 3500.00, 'Installing the pond liner.', 1, 7),  -- Pending
('Filtration System', 5000.00, 'Setting up the filtration system.', 1, 7),  -- Pending
('Pump System', 2500.00, 'Installing the pump system.', 1, 7),  -- Pending
('Electric System', 2000.00, 'Installing the electrical system for the pond.', 1, 7),  -- Pending
('Payment', 6000.00, 'Final payment for raw construction.', 1, 7);  -- Pending (payment last)
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Decoration', 6000.00, 'Adding decorative elements like plants and rocks.', 1, 8),  -- Pending
('Testing', 2500.00, 'Testing the pond systems.', 1, 8),  -- Pending
('Inspection', 1500.00, 'Final inspection of the pond.', 1, 8),  -- Pending
('Payment', 4000.00, 'Final payment for complete construction.', 1, 8);  -- Pending (payment last)
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 3500.00, 'Initial payment for raw construction.', 2, 9),  -- Processing (payment first)
('Site Preparation', 2000.00, 'Preparing the site for construction.', 1, 9),  -- Processing
('Excavating', 4000.00, 'Excavating for pond construction.', 1, 9),  -- Processing
('Liner Install', 3000.00, 'Installing the pond liner.', 1, 9),  -- Pending
('Filtration System', 5000.00, 'Setting up the filtration system.', 1, 9),  -- Pending
('Pump System', 2500.00, 'Installing the pump system.', 1, 9),  -- Pending
('Electric System', 2000.00, 'Installing the electrical system for the pond.', 1, 9);  -- Pending
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 3000.00, 'Initial payment for complete construction.', 1, 10),  -- Pending (payment first)
('Decoration', 5000.00, 'Adding decorative elements like plants and rocks.', 1, 10),  -- Pending
('Testing', 2000.00, 'Testing the pond systems.', 1, 10),  -- Pending
('Inspection', 1000.00, 'Final inspection of the pond.', 1, 10);  -- Pending
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Site Preparation', 2000.00, 'Preparing the site for construction.', 2, 11),  -- Processing
('Excavating', 3000.00, 'Excavating for pond construction.', 1, 11),  -- Processing
('Liner Install', 2500.00, 'Installing the pond liner.', 1, 11),  -- Pending
('Filtration System', 4000.00, 'Setting up the filtration system.', 1, 11),  -- Pending
('Pump System', 2000.00, 'Installing the pump system.', 1, 11),  -- Pending
('Electric System', 1500.00, 'Installing the electrical system for the pond.', 1, 11),  -- Pending
('Payment', 5000.00, 'Final payment for raw construction.', 1, 11);  -- Pending (payment last)
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Decoration', 4000.00, 'Adding decorative elements like plants and rocks.', 1, 12),  -- Pending
('Testing', 2000.00, 'Testing the pond systems.', 1, 12),  -- Pending
('Inspection', 1500.00, 'Final inspection of the pond.', 1, 12),  -- Pending
('Payment', 3500.00, 'Final payment for complete construction.', 1, 12);  -- Pending (payment last)
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 2500.00, 'Initial payment for raw construction.', 2, 13),  -- Processing (payment first)
('Site Preparation', 1500.00, 'Preparing the site for construction.', 1, 13),  -- Processing
('Excavating', 2500.00, 'Excavating for pond construction.', 1, 13),  -- Processing
('Liner Install', 2000.00, 'Installing the pond liner.', 1, 13),  -- Pending
('Filtration System', 3000.00, 'Setting up the filtration system.', 1, 13),  -- Pending
('Pump System', 2000.00, 'Installing the pump system.', 1, 13),  -- Pending
('Electric System', 1500.00, 'Installing the electrical system for the pond.', 1, 13);  -- Pending
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Decoration', 6000.00, 'Adding decorative elements like plants and rocks.', 1, 14),  -- Pending
('Testing', 2500.00, 'Testing the pond systems.', 1, 14),  -- Pending
('Inspection', 1500.00, 'Final inspection of the pond.', 1, 14),  -- Pending
('Payment', 4000.00, 'Final payment for complete construction.', 1, 14);  -- Pending (payment last)
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 2500.00, 'Initial payment for raw construction.', 2, 15),  -- Processing (payment first)
('Site Preparation', 1500.00, 'Preparing the site for construction.', 1, 15),  -- Processing
('Excavating', 2500.00, 'Excavating for pond construction.', 1, 15),  -- Processing
('Liner Install', 2000.00, 'Installing the pond liner.', 1, 15),  -- Pending
('Filtration System', 3000.00, 'Setting up the filtration system.', 1, 15),  -- Pending
('Pump System', 2000.00, 'Installing the pump system.', 1, 15),  -- Pending
('Electric System', 1500.00, 'Installing the electrical system for the pond.', 1, 15);  -- Pending
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Decoration', 6000.00, 'Adding decorative elements like plants and rocks.', 1, 16),  -- Pending
('Testing', 2500.00, 'Testing the pond systems.', 1, 16),  -- Pending
('Inspection', 1500.00, 'Final inspection of the pond.', 1, 16),  -- Pending
('Payment', 4000.00, 'Final payment for complete construction.', 1, 16);  -- Pending (payment last)

INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 2500.00, 'Initial payment for raw construction.', 2, 17),  -- Processing (payment first)
('Site Preparation', 1500.00, 'Preparing the site for construction.', 1, 17),  -- Processing
('Excavating', 2500.00, 'Excavating for pond construction.', 1, 17),  -- Processing
('Liner Install', 2000.00, 'Installing the pond liner.', 1, 17),  -- Pending
('Filtration System', 3000.00, 'Setting up the filtration system.', 1, 17),  -- Pending
('Pump System', 2000.00, 'Installing the pump system.', 1, 17),  -- Pending
('Electric System', 1500.00, 'Installing the electrical system for the pond.', 1, 17);  -- Pending
INSERT INTO Construction_Stage_Detail (construction_stage_detail_name, construction_stage_detail_price, construction_stage_detail_description, construction_stage_detail_status, construction_stage_id)
VALUES
('Payment', 2500.00, 'Initial payment for complete construction.', 1, 18),  -- Pending (payment first)
('Decoration', 4000.00, 'Adding decorative elements like plants and rocks.', 1, 18),  -- Pending
('Testing', 1500.00, 'Testing the pond systems.', 1, 18),  -- Pending
('Inspection', 1000.00, 'Final inspection of the pond.', 1, 18);  -- Pending
-- Insert data into Staff_Design table (designers involved in each design)
-- Insert data into Staff_Design table (designers assigned to projects not in Planning stage)
INSERT INTO Staff_Design (staff_id, design_id)
VALUES

(3, 2),  -- Designer 3 assigned to Raised Koi Pond Design (Project 2)
(8, 2),  -- Designer 4 also assigned to Raised Koi Pond Design
(13, 3),  -- Designer 5 assigned to Tropical Koi Pond Design (Project 3)
(18, 3),  -- Designer 6 also assigned to Tropical Koi Pond Design
(23, 4),  -- Designer 7 assigned to Zen Garden Koi Pond Design (Project 4)
(28, 4),   -- Designer 1 also assigned to Zen Garden Koi Pond Design
(33, 5),   -- Designer 2 assigned to Compact Koi Pond Design (Project 5)
(3, 5),  -- Designer 3 also assigned to Compact Koi Pond Design
(8, 6),  -- Designer 4 assigned to Luxury Modern Koi Pond Design (Project 6)
(13, 6),  -- Designer 5 also assigned to Luxury Modern Koi Pond Design
(28, 7),  -- Designer 6 assigned to Advanced Koi Pond Design (Project 7)
(33, 7),  -- Designer 7 also assigned to Advanced Koi Pond Design
(28, 8),  -- Designer 6 assigned to Advanced Koi Pond Design (Project 7)
(33, 8)  -- Designer 7 also assigned to Advanced Koi Pond Design



-- Insert data into Construction_Staff table (staff assigned to construction projects not in Planning stage)
INSERT INTO Construction_Staff (staff_id, construction_id, role_in_project)
VALUES

(9, 2, 2),   -- Constructor 2 as Supervisor in Raised Koi Pond Construction (Project 2)
(14, 2, 3),  -- Constructor 3 as Worker in Raised Koi Pond Construction
(19, 3, 1),  -- Constructor 4 as Site Manager in Tropical Koi Pond Construction (Project 3)
(24, 3, 2),  -- Constructor 5 as Supervisor in Tropical Koi Pond Construction
(29, 3, 3),  -- Constructor 6 as Worker in Tropical Koi Pond Construction
(34, 4, 1),  -- Constructor 7 as Site Manager in Zen Garden Koi Pond Construction (Project 4)
(4, 4, 2),   -- Constructor 1 also as Supervisor in Zen Garden Koi Pond Construction
(9, 5, 1),   -- Constructor 2 as Site Manager in Compact Koi Pond Construction (Project 5)
(14, 5, 3),  -- Constructor 3 also as Worker in Compact Koi Pond Construction
(19, 6, 2),  -- Constructor 4 as Supervisor in Luxury Modern Koi Pond Construction (Project 6)
(24, 6, 3),  -- Constructor 5 also as Worker in Luxury Modern Koi Pond Construction
(29, 7, 1),  -- Constructor 6 as Site Manager in Advanced Koi Pond Construction (Project 7)
(34, 7, 2),
(29, 8, 3),  -- Constructor 6 as Worker in Tropical Koi Pond Construction
(34, 8, 1)




-- Insert data into Service_Detail table based on the status rules
INSERT INTO Service_Detail (service_detail_price, date_register, rating, service_detail_status, feedback, service_id, customer_id, staff_id)
VALUES
-- Completed services with feedback and rating
(150.00, '2024-09-15', 5, 3, 'Very efficient service!', 1, 1, 9),  -- Flash Cleaning, Completed
(200.00, '2024-09-20', 4, 3, 'Good job, but could be a bit faster.', 2, 6, 4),  -- Routine Cleaning Package, Completed
(300.00, '2024-09-18', 5, 3, 'Excellent cleaning, highly recommend!', 3, 11, 14),  -- Deep Cleaning Service, Completed
(250.00, '2024-09-22', 4, 3, 'Algae issue resolved, good service.', 4, 16, 19),  -- Algae Control Cleaning, Completed
(180.00, '2024-09-25', 5, 3, 'My koi fish are very happy, thanks!', 5, 21, 24),  -- Basic Koi Care, Completed
(250.00, '2024-09-27', 4, 3, 'Comprehensive care for my pond, satisfied.', 6, 26, 24),  -- Koi Care Plus, Completed
(500.00, '2024-09-29', 5, 3, 'Top-notch service, covers everything.', 7, 31, 29),  -- Full Care Package, Completed

-- Canceled services with feedback and rating
(300.00, '2024-10-01', 5, 4, 'Took care of everything while I was away!', 8, 1, 34),  -- Vacation Care Service, Canceled
(200.00, '2024-10-03', 4, 4, 'Regular maintenance, good job.', 9, 6, 23),  -- Essential Maintenance, Canceled
(350.00, '2024-10-05', 4, 4, 'Preventive care for my pond, satisfied.', 10, 11, 4),  -- Preventive Maintenance Package, Canceled
(600.00, '2024-10-07', 5, 4, 'The complete package, highly recommend.', 11, 16, 9),  -- Complete Maintenance Plan, Canceled

-- Services in Processing or Pending status without feedback or rating
(400.00, '2024-10-09', NULL, 2, NULL, 12, 21, 29),  -- Seasonal Maintenance Service, Processing
(250.00, '2024-10-10', NULL, 1, NULL, 5, 21, 4);  -- Basic Koi Care, Pending



-- Insert into Intro_Content table with service-based content
INSERT INTO Intro_Content (content, create_date, lastUpdatedDate, project_id, blog_id, service_id) 
VALUES
('Quick removal of debris and minor cleaning tasks.', '2024-01-15', '2024-01-20', NULL, NULL, 1),
('Includes debris removal, water treatment, and light cleaning every 2-3 months.', '2024-02-01', '2024-02-05', NULL, NULL, 2),
('Comprehensive cleaning of the pond and water filtration system.', '2024-02-10', '2024-02-15', NULL, NULL, 3),
('Includes algae removal and treatment to reduce regrowth.', '2024-03-01', '2024-03-05', NULL, NULL, 4),
('Daily fish feeding, water parameter checks, and basic health monitoring.', '2024-03-10', '2024-03-15', NULL, NULL, 5),
('Includes water quality treatment and health checks for koi fish.', '2024-04-01', '2024-04-05', NULL, NULL, 6),
('Monthly health checks for fish, equipment cleaning, and water quality testing.', '2024-04-10', '2024-04-15', NULL, NULL, 7),
('Includes feeding, water quality checks, and pond monitoring.', '2024-05-01', '2024-05-05', NULL, NULL, 8),
('Monthly water changes, filter cleaning, and equipment monitoring.', '2024-05-10', '2024-05-15', NULL, NULL, 9),
('Includes water changes, equipment inspections, and health monitoring.', '2024-06-01', '2024-06-05', NULL, NULL, 10),
('Covers all aspects of maintenance, including equipment repairs and water management.', '2024-06-10', '2024-06-15', NULL, NULL, 11),
('Adjustments to pond conditions based on the season, such as winterizing or summer care.', '2024-07-01', '2024-07-05', NULL, NULL, 12);


-- Insert the project content into the Intro_Content table
INSERT INTO Intro_Content (content, create_date, lastUpdatedDate, project_id, blog_id, service_id)
VALUES
('Planning and designing a modern koi pond.', '2024-01-10', '2024-01-15', 1, NULL, NULL),
('Design and installation of a raised koi pond.', '2024-02-01', '2024-02-05', 2, NULL, NULL),
('Construction of a tropical koi pond.', '2024-02-15', '2024-02-20', 3, NULL, NULL),
('Building a koi pond in a zen garden style.', '2024-03-01', '2024-03-05', 4, NULL, NULL),
('Installation of a small compact koi pond.', '2024-03-15', '2024-03-20', 5, NULL, NULL),
('Designing and building a luxury koi pond.', '2024-04-01', '2024-04-05', 6, NULL, NULL),
('Construction of an advanced koi pond.', '2024-04-15', '2024-04-20', 7, NULL, NULL),
('Maintaining and enhancing a tropical koi pond.', '2024-05-01', '2024-05-05', 8, NULL, NULL),
('Designing and constructing a koi pond for urban settings.', '2024-05-15', '2024-05-20', 9, NULL, NULL);


-- Insert into Intro_Content table with blog-based content
INSERT INTO Intro_Content (content, create_date, lastUpdatedDate, project_id, blog_id, service_id) 
VALUES
('In this blog, we explore the key design elements to consider when planning your Koi pond...', '2024-09-01', '2024-09-05', NULL, 1, NULL),
('Learn the best practices for maintaining your Koi pond to ensure your fish thrive...', '2024-09-10', '2024-09-12', NULL, 2, NULL),
('If you are new to owning a Koi pond, here are some tips from our consultants...', '2024-09-15', '2024-09-18', NULL, 3, NULL),
('A comprehensive guide to selecting the best filtration system for your Koi pond...', '2024-09-20', '2024-09-22', NULL, 4, NULL),
('Landscaping around your Koi pond can enhance its beauty and provide a serene environment...', '2024-09-25', '2024-09-27', NULL, 5, NULL);

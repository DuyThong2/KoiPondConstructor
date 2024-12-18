﻿Create database swp391121
go

use swp391121
go


-- 1. Authorities

CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,    
    email VARCHAR(50) UNIQUE NOT NULL,   
	img_url varchar(255),
	name varchar(50),
	phone varchar(50),
    password VARCHAR(255) NOT NULL,      
    enabled BIT NOT NULL                 
);


CREATE TABLE authorities (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,  -- Foreign key to 'users.id'
    authority VARCHAR(50) NOT NULL,      
    FOREIGN KEY (user_id) REFERENCES users(id) -- Link to users via 'id'
);



-- 2. Service
CREATE TABLE Service (
    service_id INT PRIMARY KEY IDENTITY(1,1),
    service_name NVARCHAR(255),
    service_description NVARCHAR(255),
    service_img_url varchar(255),
    service_status bit  -- active // disable
);

-- 3. Service_Price
CREATE TABLE Service_Price (
    service_price_id INT PRIMARY KEY IDENTITY(1,1),
    value DECIMAL(10, 2),
    date_apply DATE,
    service_price_status bit,   -- active // disable
    service_id INT,
    FOREIGN KEY (service_id) REFERENCES Service(service_id)
);





-- 4. Customer
CREATE TABLE Customers (
    id INT PRIMARY KEY,                            
    FOREIGN KEY (id) REFERENCES users(id) -- FK referencing 'users.id'
);

-- 5. Loyalty_Point
CREATE TABLE Loyalty_Point (
    loyalty_point_id INT PRIMARY KEY IDENTITY(1,1),
    amount INT,
    date_apply DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

-- 14. Staff
CREATE TABLE staffs (
    id INT PRIMARY KEY,                  -- Inherits the primary key from the 'users' table
    department VARCHAR(100),             -- Department of the staff member
    FOREIGN KEY (id) REFERENCES users(id) -- FK referencing 'users.id'
);



-- 17. Blog
CREATE TABLE Blog (
    blog_id INT PRIMARY KEY IDENTITY(1,1),
    blog_name NVARCHAR(255),
    blog_date_post DATE,
    blog_description NVARCHAR(255),
    blog_img_url NVARCHAR(255),
    staff_id INT,
	blog_status int, -- 1 not ready 2. ready 3.disable
    FOREIGN KEY (staff_id) REFERENCES Staffs(id)
);





-- 20. Term
CREATE TABLE Term (
    term_id INT PRIMARY KEY IDENTITY(1,1),
    percent_on_design1 DECIMAL(5, 2),
    percent_on_design2 DECIMAL(5, 2),
    percent_on_design3 DECIMAL(5, 2),
    percent_on_construct1 DECIMAL(5, 2),
    percent_on_construct2 DECIMAL(5, 2),
    pay_on_start_of_design BIT,
	pay_on_start_of_construction BIT,
    description NVARCHAR(255),
    is_template BIT,
	follow_contract bit,
	term_status bit,
    
);

-- 24. Package
CREATE TABLE Package (
    package_id INT PRIMARY KEY IDENTITY(1,1),
    package_name NVARCHAR(255),
    construction_price_on_square_root DECIMAL(10, 2),
    design_on_square_root DECIMAL(10, 2),
    package_description NVARCHAR(255),
    package_status bit,  -- acctive // disable
);

-- 22. Pre_Design
CREATE TABLE Pre_Design (
    pre_design_id INT PRIMARY KEY IDENTITY(1,1),
    pre_design_name NVARCHAR(255),
    pre_design_img_url NVARCHAR(255),
	pre_design_time NVARCHAR(50),
    pre_design_description NVARCHAR(255),
	pre_design_status bit,
	package_id INT,
	FOREIGN KEY (package_id) REFERENCES Package(package_id)
);

-- 21. Consultant
CREATE TABLE Consultant (
    consultant_id INT PRIMARY KEY IDENTITY(1,1),
    consultant_customer_name NVARCHAR(255),
    consultant_date_time DATETIME,
    consultant_phone NVARCHAR(15),
    consultant_content NVARCHAR(MAX),
    consultant_type NVARCHAR(50),
    consultant_status INT,   -- 1: Pending 2: Assign 3: Processing 4:Completed(khi hợp đồng đc ký) 5.Cancel(khi khách ko muốn tư vấn)
    consultant_email NVARCHAR(255),
    customer_id INT,
    staff_id INT,
	pre_design_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (staff_id) REFERENCES Staffs(id),
	FOREIGN KEY (pre_design_id) REFERENCES Pre_Design(pre_design_id)

);





-- 23. Quotes
CREATE TABLE Quotes (
    quotes_id INT PRIMARY KEY IDENTITY(1,1),
	quotes_name NVARCHAR(200),
    quotes_content NVARCHAR(MAX),
    quotes_total_price DECIMAL(10, 2),
    quotes_area DECIMAL(10, 2),
    quotes_date DATE,
    quotes_status INT,  --1 pending, 2 approved(manager ok),3. rejected(by manage),4.accepted(customer), 5.refused(customer),6.refused(by staff),7. cancel, 8. Finished
	quotes_design_cost DECIMAL(10, 2),
    quotes_construction_cost DECIMAL(10, 2),
    customer_id INT,
    consultant_id int,
    staff_id INT,
	package_id int,
	deposit_on_contract decimal(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (consultant_id) references Consultant(consultant_id),
    FOREIGN KEY (staff_id) REFERENCES Staffs(id),
	FOREIGN KEY (package_id) REFERENCES Package(package_id)
    
);

-- 19. Contract
CREATE TABLE [Contract] (
    contract_id INT PRIMARY KEY IDENTITY(1,1),
    date_create DATE,
    file_url NVARCHAR(255),
    total_price DECIMAL(10, 2),
    price_on_concept_design DECIMAL(10, 2),
    price_on_construction_design DECIMAL(10, 2),
    price_on_detail_design DECIMAL(10, 2),
    price_on_raw_construction DECIMAL(10, 2),
    price_on_complete_construction DECIMAL(10, 2),
    contract_term NVARCHAR(255),
    contract_status INT, -- 1:Pending 2: Approved 3: Rejected(customer) 4:rejected(manager) 5:cancel 6:accepted 7: project created 8: confirmed payment
    contract_note NVARCHAR(255),
	estimated_end_date date,
    term_id int ,
    customer_id INT,
	quote_id int,
	deposit_on_contract_confirmed decimal(10,2),
    FOREIGN key (term_id) references Term(term_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
	FOREIGN KEY (quote_id) REFERENCES Quotes(quotes_id)
);

-- 6. Project
CREATE TABLE Project (
    project_id INT PRIMARY KEY IDENTITY(1,1),
    project_name NVARCHAR(255),
    address NVARCHAR(255),
    style NVARCHAR(50),
    description NVARCHAR(255),
    date_start DATE,
    date_end DATE,
    project_status INT,		-- 1:Pending ; 2:Proccessing; 3: completed/ 4: Cancel 5: request cancel
    img_url NVARCHAR(255),
    stage INT, -- 1: Planning; 2: Design; 3: Construction; 4:Maintance; 5: Finish
	is_shareable bit, --accept; reject  
	contract_id int foreign key references [Contract](contract_id),
    project_cancel_message NVARCHAR(max),
	pre_design_id int foreign key references  Pre_Design(pre_design_id)
);

-- 7. Design
CREATE TABLE Design (
    design_id INT PRIMARY KEY IDENTITY(1,1),
    design_name NVARCHAR(255),
    design_status INT,-- 1:Pending ; 2:Proccessing; 3: completed/ 4: Canceled
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

-- 8. Design_Stage
CREATE TABLE Design_Stage (
    design_stage_id INT PRIMARY KEY IDENTITY(1,1),
    design_stage_name NVARCHAR(255),
    design_stage_status INT, -- 1:Pending ; 2: Proccessing ; 3: rejected; 4:Approved
    design_stage_price DECIMAL(10, 2),
    summary_file NVARCHAR(255),
    design_id INT,
    FOREIGN KEY (design_id) REFERENCES Design(design_id)
);

-- 9.design_stage_Detail
CREATE table Design_Stage_Detail(
	id int primary key identity(1,1),
	[name] nvarchar(50),
	[description] nvarchar(255),
	[status] int,  ---- 1:Pending ; 2:Proccessing;3: Canceled 4: completed/ 
	design_stage_id int foreign key references Design_Stage(design_stage_id)
);

-- 10. Blue_Print
CREATE TABLE Blue_Print (
    blue_print_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(255),
    img_url NVARCHAR(255),
    date_create DATE,
    description NVARCHAR(255),
    blue_print_status INT, --APPROVED // REJECTED 
    design_stage_id INT,
    FOREIGN KEY (design_stage_id) REFERENCES Design_Stage(design_stage_id)
);

-- 11. Construction
CREATE TABLE Construction (
    construction_id INT PRIMARY KEY IDENTITY(1,1),
    construction_name NVARCHAR(255),
    construction_status INT, -- 1:Pending ; 2:Proccessing; 3: completed/ 4: Canceled
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

-- 12. Construction_Stage
CREATE TABLE Construction_Stage (
    construction_stage_id INT PRIMARY KEY IDENTITY(1,1),
    construction_stage_name NVARCHAR(255),
    construction_stage_price DECIMAL(10, 2),
    construction_stage_description NVARCHAR(255),
    construction_stage_status INT,   -- 1:Pending ; 2: Proccessing ; 3: rejected; 4:Approved
    construction_id INT,
    FOREIGN KEY (construction_id) REFERENCES Construction(construction_id)
);

-- 13. Construction_Stage_Detail
CREATE TABLE Construction_Stage_Detail (
    construction_stage_detail_id INT PRIMARY KEY IDENTITY(1,1),
    construction_stage_detail_name NVARCHAR(255),
    construction_stage_detail_price DECIMAL(10, 2),
    construction_stage_detail_description NVARCHAR(255),
	construction_stage_detail_status INT,   -- 1:Pending ; 2: Proccessing ; 3: rejected; 4:Approved
    construction_stage_id INT,
    FOREIGN KEY (construction_stage_id) REFERENCES Construction_Stage(construction_stage_id)
);

-- 15. Staff_Design
CREATE TABLE Staff_Design (
    staff_id INT,
    design_id INT,
    PRIMARY KEY (staff_id, design_id),
    FOREIGN KEY (staff_id) REFERENCES Staffs(id),
    FOREIGN KEY (design_id) REFERENCES Design(design_id)
);

-- 16. Construction_Staff
CREATE TABLE Construction_Staff (
    staff_id INT ,
    construction_id INT,
	role_in_project INT, --1: Site Manager, 2: Supervisor, 3: Worker
    PRIMARY KEY (staff_id, construction_id),
    FOREIGN KEY (staff_id) REFERENCES Staffs(id),
    FOREIGN KEY (construction_id) REFERENCES Construction(construction_id)
);

--   Service Quote
CREATE TABLE Service_Quotes (
    service_quotes_id INT PRIMARY KEY IDENTITY(1,1),
	service_quotes_name NVARCHAR(200),
    service_quotes_content NVARCHAR(MAX),
    service_quotes_total_price DECIMAL(10, 2),
    service_quotes_area DECIMAL(10, 2),
    service_quotes_date DATETIME,
    service_quotes_status INT,  --1 pending, 2 approved(manager ok),3. rejected(by manage),4.accepted(customer), 5.refused(customer),6.refused(by staff),7. cancel
    used_point INT,             --5.refused(customer),6.refused(by staff),7. cancel, 8.deposit paid, 9.complete, 10. Inprogress ,11. complete paid
	is_pay_after BIT,
	customer_id INT,
    consultant_id int,
    staff_id INT,		
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (consultant_id) references Consultant(consultant_id),
    FOREIGN KEY (staff_id) REFERENCES Staffs(id),
    
);

-- Service Quote JOIN Service
CREATE TABLE Service_Quotes_Service(
	service_quotes_id INT,
	service_id INT,
	PRIMARY KEY(service_quotes_id, service_id),
	FOREIGN KEY (service_quotes_id) REFERENCES Service_Quotes(service_quotes_id),
    FOREIGN KEY (service_id) REFERENCES Service(service_id)
)


-- 25. Service_Detail
CREATE TABLE Service_Detail (
    service_detail_id INT PRIMARY KEY IDENTITY(1,1),
    service_detail_price DECIMAL(10, 2),
    date_register DATE,
    rating INT,                      -- Rating for the service
    service_detail_status INT,        -- Service status
    feedback NVARCHAR(MAX),           -- Feedback from the customer
    feedback_date DATE,               -- Date when the feedback was provided
    service_id INT,
    customer_id INT,                  -- Links to the customer giving feedback
    staff_id INT,
	service_quotes_id INT,
    service_cancel_message NVARCHAR(MAX),
    FOREIGN KEY (service_id) REFERENCES Service(service_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (staff_id) REFERENCES Staffs(id),
	FOREIGN KEY (service_quotes_id) REFERENCES Service_Quotes(service_quotes_id),
);
--26. Service_Feedback

-- 18. Comment
CREATE TABLE Comment (
    comment_id INT PRIMARY KEY IDENTITY(1,1),
    comment_status int,  -- acctive//disable
    comment_content NVARCHAR(MAX),
    comment_date_post DATETIME,
    blog_id INT,
    service_id INT,
    blue_print_id INT,
    construction_id INT ,
    customer_id INT,
    staff_id INT,
	
    parent_comment_id INT,  -- Self-referencing foreign key
    FOREIGN KEY (blog_id) REFERENCES Blog(blog_id),
    FOREIGN KEY (service_id) REFERENCES Service(service_id),
    FOREIGN KEY (blue_print_id) REFERENCES Blue_Print(blue_print_id),
    FOREIGN KEY (construction_id) REFERENCES Construction(construction_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (staff_id) REFERENCES Staffs(id),
    FOREIGN KEY (parent_comment_id) REFERENCES Comment(comment_id) -- Self-reference for hierarchical comments
);

CREATE TABLE Password_Reset_Tokens (
    id INT IDENTITY(1,1) PRIMARY KEY,
    token NVARCHAR(255) NOT NULL, 
    user_id INT NOT NULL,  -- Foreign key to the Users table
    expiry_date DATETIME NOT NULL,
    CONSTRAINT FK_User_Token FOREIGN KEY (user_id) REFERENCES Users(id)
);


create table Intro_Content(
	id int identity(1,1) primary key,
	content text,
	create_date dateTime,
	last_updated_date dateTime,
	project_id int foreign key references Project(project_id),
	blog_id int foreign key references Blog(blog_id),
	service_id int foreign key references [Service](service_id),
	pre_design_id int foreign key references Pre_Design(pre_design_id)
)


CREATE TABLE Feedback (
	feedback_id INT IDENTITY(1,1) PRIMARY KEY,
	feedback_content NVARCHAR(255),
	from_user INT NOT NULL,
	to_user INT NOT NULL,
	consultant_id INT,
	quotes_id INT,
	service_quotes_id INT,
	contract_id INT,
	feedback_date DATE,
	FOREIGN KEY (from_user) REFERENCES Users(id),
	FOREIGN KEY (to_user) REFERENCES Users(id),
	FOREIGN KEY (consultant_id) REFERENCES Consultant(consultant_id),
	FOREIGN KEY (quotes_id) REFERENCES Quotes(quotes_id),
	FOREIGN KEY (contract_id) REFERENCES contract(Contract_id),
	FOREIGN KEY (service_quotes_id) REFERENCES Service_Quotes(service_quotes_id)
)


CREATE TABLE Notification (
    notification_id int primary key identity(1,1),
    receiver_id int,
    receiver_type NVARCHAR(55),
    message NVARCHAR(255) NOT NULL,
    is_read bit not null default 0,
    related_id int, --to know the id of the related table
    from_table varchar(50), -- to know the table related to the context of the notification
    create_at_date DATETIME DEFAULT GETDATE(),
    foreign key(receiver_id) references Users(id)
)


CREATE TABLE payment_history (
    payment_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(), -- Generates a unique UUID for each payment
    customer_id INT, -- Foreign key referencing the customer
    amount DECIMAL(10, 2), -- Payment amount
    payment_date DATETIME , -- Date of the payment
    description nvarchar(200),
    payment_method VARCHAR(50), -- Method of payment (e.g., 'Credit Card', 'PayPal')
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);


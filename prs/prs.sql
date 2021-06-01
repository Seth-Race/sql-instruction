-- prs database/Capstone project
-- started 05/28,2021
-- RUN INSERTS AFTER RUNNING THIS

-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;



-- creation of tables

Create table User (
ID 				integer 			primary key auto_increment,
username		varchar(20)			not null unique,
password 		varchar(10) 		not null,
lastName 		varchar(20) 		not null,
firstName 		varchar(20) 	    not null,
email			varchar(75)			not null,
phone			varchar(12)			not null,
reviewer		bit					not null,
admin			bit					not null
);



Create table Vendor (
ID 				integer 			primary key auto_increment,
code			varchar(10)			not null unique,
name	 		varchar(255) 		not null,
address 		varchar(255) 	    not null,
city			varchar(255)		not null,
state			varchar(2)			not null,
zip	 			varchar(5)			not null,
phone			varchar(12)			not null,
email			varchar(75)			not null
);



Create table Request (
ID 					integer 			primary key auto_increment,
userID				integer				not null unique,
description			varchar(100) 		not null default 'Request submitted for approval',
justification		varchar(255) 	    not null default 'New employee equipment',
dateNeeded			date				not null default (current_date),
deliveryMode		varchar(25)			not null default 'Pick-up',
status				varchar(20)			not null default 'Submitted',
total				decimal(10, 2)		not null default '0.00',
submittedDate		datetime			not null default (current_date),
reasonForRejection	varchar(100),
Foreign Key 		(userID)			references user(ID)
);



Create table product (
ID 				integer 			primary key auto_increment,
vendorID		integer				not null,
partNumber 		varchar(50) 		not null,
name	 		varchar(150) 	    not null,
price			decimal(10, 2)		not null,
unit			varchar(255),
photoPath		varchar(255),
Foreign Key		(vendorID) 			references vendor(ID),
Constraint		vendor_part			unique 	(vendorID, partNumber)
);



Create table lineItem (
ID 				integer 		primary key auto_increment,
requestID		integer			not null,
productID		integer 		not null,
quantity 		integer 	    not null,
Foreign Key		(productID)		references product(ID),
Foreign Key  	(requestID)		references request(ID),
Constraint 		req_pdt			unique	(requestID, productID)
);



-- Add 'SYSTEM' user
insert into user (Username, Password, FirstName, LastName, Phone, Email, Reviewer, Admin) VALUES
	('SYSTEM', 'xxxxx', 'System', 'System', 'XXX-XXX-XXXX', 'system@test.com', 0, 0),
	('sblessing', 'login', 'Sean', 'Blessing', 'XXX-XXX-XXXX', 'system@test.com', 1, 1),
    ('serace', '123456', 'Seth', 'Race', 'XXX-XXX-XXXX', 'sethrace@test.com', 1, 1),
	('lcrook', '123456', 'Linda', 'Crook', 'XXX-XXX-XXXX', 'lindacrook@test.com', 1, 0),
    ('dmotley', '123456', 'Dylan', 'Motley', 'XXX-XXX-XXXX', 'dylanmotley@test.com', 0, 0),
    ('mchilders', '123456', 'Matthew', 'Childers', 'XXX-XXX-XXXX', 'Matthewchilders@test.com', 0, 0),
    ('mjowers', '123456', 'Michelle', 'Jowers', 'XXX-XXX-XXXX', 'michellejowers@test.com', 1, 1),
    ('npatel', '123456', 'Naimish', 'Patel,', 'XXX-XXX-XXXX', 'naimishpatel@test.com', 0, 1)
;

-- insert some rows into the Vendor table
INSERT into vendor (ID, code, name, address, city, state, zip, phone, email) VALUES
(1, 'BB-1001', 'Best Buy', '100 Best Buy Street', 'Louisville', 'KY', '40207', '502-111-9099', 'geeksquad@bestbuy.com'),
(2, 'AP-1001', 'Apple Inc', '1 Infinite Loop', 'Cupertino', 'CA', '95014', '800-123-4567', 'genius@apple.com'),
(3, 'AM-1001', 'Amazon', '410 Terry Ave. North', 'Seattle', 'WA', '98109','206-266-1000', 'amazon@amazon.com'),
(4, 'ST-1001', 'Staples', '9550 Mason Montgomery Rd', 'Mason', 'OH', '45040', '513-754-0235', 'support@orders.staples.com'),
(5, 'MC-1001', 'Micro Center', '11755 Mosteller Rd', 'Sharonville', 'OH', '45241', '513-782-8500', 'support@microcenter.com');

-- insert some rows into the Product table
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg');
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg');









-- create a user and grant privileges to that user
DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;
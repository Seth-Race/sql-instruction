-- prs database/Capstone project
-- started 05/28,2021

-- create and select the database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;



-- creation of tables

Create table User (
ID 				integer 			primary key auto_increment,
username		varchar(20)			not null unique,
lastName 		varchar(10) 		not null,
firstName 		varchar(50) 	    not null,
email			varchar(50)			not null,
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
email			varchar(12)			not null
);



Create table Request (
ID 					integer 			primary key auto_increment,
userID				integer				not null unique,
description			varchar(100) 		not null,
justification		varchar(255) 	    not null,
dateNeeded			date				not null,
deliveryMode		varchar(25)			not null,
status				varchar(20)			not null,
total				decimal(10, 2)		not null,
submittedDate		datetime			not null,
reasonForRejection	varchar(100),
Foreign Key 		(userID)			references user(ID)
);



Create table product (
ID 				integer 			primary key auto_increment,
vendorID		integer				not null unique,
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
requestID		integer			not null unique,
productID		integer 		not null,
quantity 		integer 	    not null,
Foreign Key		(productID)		references product(ID),
Foreign Key  	(requestID)		references request(ID),
Constraint 		req_pdt			unique	(requestID, productID)
);




-- create a user and grant privileges to that user
DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;
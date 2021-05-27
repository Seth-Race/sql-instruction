-- create and select the database
DROP DATABASE IF EXISTS foodDB;
CREATE DATABASE foodDB;
USE foodDB;





-- creation of tables


Create table Customer (
ID 				integer 			primary key auto_increment,
customerNumber	varchar(5)			not null unique,
lastName 		varchar(50) 		not null,
firstName 		varchar(50) 	    not null,
email			varchar(50)			not null,
phoneNumber		varchar(16)
);


create table category(
ID					integer				primary key auto_increment,
name				varchar(12)			not null unique
);



create table menuItem (
ID					integer				primary key auto_increment,
categoryID			integer				not null,
name				varchar(50)			not null,
price				decimal(10,2)		not null,
calories			integer				not null,
Foreign Key			(categoryID) 		references category(ID),
CONSTRAINT cat_name unique (categoryID, name)
);




create table orderTicket (
ID				integer					primary key auto_increment,
customerID		integer					not null,
orderDate		timestamp				not null default (current_timestamp),
status			varchar(1)				not null default 'O',
total			decimal(10,2)			not null default '0',
Foreign Key 	(customerID)			references	customer(ID),
CONSTRAINT cust_ord unique (customerID, orderDate)
);




create table lineItem(
ID						integer				primary key auto_increment,
orderTicketID			integer				not null,
menuItemID				integer				not null,
quantity				integer				not null,
Foreign Key 			(orderTicketID)		references orderTicket(ID),
Foreign Key				(menuItemID)		references menuItem(ID),
CONSTRAINT ord_menu unique (orderTicketID, menuItemID)
);

-- thing injection
 insert into category (Name) VALUES
('Appetizers'),
('Salads'),
('Entrees'),
('Sides'),
('Drinks'),
('Desserts')
;



-- create a user and grant privileges to that user
DROP USER IF EXISTS foodDB_user@localhost;
CREATE USER foodDB_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON foodDB.* TO foodDB_user@localhost;
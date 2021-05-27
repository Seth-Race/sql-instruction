-- create and select the database
DROP DATABASE IF EXISTS fooddb;
CREATE DATABASE fooddb;
USE fooddb;





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
name				varchar(9)			not null unique
);



create table menuItem (
ID					integer				primary key auto_increment,
categoryID			integer				not null,
name				varchar(50)			not null,
price				decimal				not null,
calories			integer				not null,
Foreign Key			(categoryID) 		references category(ID),
CONSTRAINT unq_name unique (categoryID, name)
);




create table orderTicket (
ID				integer					primary key auto_increment,
customerID		integer					not null,
orderDate		timestamp				not null,
status			varchar(1)				not null,
total			decimal					not null,
Foreign Key 	(customerID)			references	customer(ID),
CONSTRAINT unq_ticket unique (customerID, orderDate)
);




create table lineItem(
ID						integer				primary key auto_increment,
orderTicketID			integer				not null,
menuItemID				integer				not null,
quantity				integer				not null,
Foreign Key 			(orderTicketID)		references orderTicket(ID),
Foreign Key				(menuItemID)		references menuItem(ID),
CONSTRAINT unq_line unique (orderTicketID, menuItemID)
);

-- thing injection
--  insert into thing () VALUES
-- ();



-- create a user and grant privileges to that user
DROP USER IF EXISTS fooddb_user@localhost;
CREATE USER fooddb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON fooddb.* TO fooddb_user@localhost;
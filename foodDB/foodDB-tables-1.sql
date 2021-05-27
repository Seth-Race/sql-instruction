-- create and select the database
DROP DATABASE IF EXISTS fooddb;
CREATE DATABASE fooddb;
USE fooddb;





-- creation of Student, Course, StudentCourse, and Instructor tables


Create table Customer (
ID 				integer 		primary key auto_increment,
firstName 		varchar(255) 	    not null,
customerNumber	integer				not null auto_increment,
lastName 		varchar(255) 		not null,
phoneNumber		varchar(255)		not null unique,
email			varchar(255)		not null
-- CONSTRAINT unq_student unique (FirstName, LastName, BirthDate)
);




create table Ticket (
ID				integer			primary key auto_increment,
customerID		integer					not null,
menuItemID		varchar(255)			not null,
courseCode		varchar(255)			not null,
orderDate		varchar(255)			not null,
status			varchar(255)			not null,
total			varchar(255)			not null,
Foreign Key 	(customerID)	references	customer(ID),
Foreign Key 	(menuItemID)	references	menuItem(ID)
);



create table manuItem (
ID					integer			primary key auto_increment,
name				varchar(255)		not null,
category			varchar(255)		not null,
price				varchar(255)		not null
);



create table instructor (
Id					integer			primary key auto_increment,
firstName			varchar(255)		not null,
lastName			varchar(255)		not null,
courseID			integer				not null,
Foreign Key (courseID)		references course(ID)
);


-- student injection
 insert into studentCourse (studentID, courseID, gradeQ1, gradeQ2, gradeQ3, gradeQ4) VALUES
();



-- create a user and grant privileges to that user
DROP USER IF EXISTS edudb_user@localhost;
CREATE USER edudb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON edudb.* TO edudb_user@localhost;
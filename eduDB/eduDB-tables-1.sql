-- create and select the database
DROP DATABASE IF EXISTS edudb;
CREATE DATABASE edudb;
USE edudb;





-- creation of Student, Course, StudentCourse, and Instructor tables


Create table Student (
ID 				integer 		primary key auto_increment,
firstName 		varchar(255) 	    not null,
lastName 		varchar(255) 		not null,
Address      	varchar(255) 		not null,
City         	varchar(255) 	    not null,
State			varchar(255)		not null,
Zip				integer				not null,
birthDate		varchar(255)		not null,
phoneNumber		varchar(255)		not null unique,
email			varchar(255)		not null,
socialSN		varchar(11)			not null unique
-- CONSTRAINT unq_student unique (FirstName, LastName, BirthDate)
);




create table Course (
ID			integer			primary key auto_increment,
Subject		varchar(255)			not null,
courseCode	varchar(255)			not null,
description varchar(255)			not null
);



create table studentCourse (
ID					integer			primary key auto_increment,
studentID			integer				not null,
courseID			integer				not null,
gradeQ1				varchar(2)			not null,
gradeQ2				varchar(2)			not null,
gradeQ3				varchar(2)			not null,
gradeQ4				varchar(2)			not null,
instructorID		integer				not null,
Foreign Key (studentID) 	references Student(ID),
Foreign Key (courseID)  	references Course(ID),
Foreign Key (instructorID)  references Instructor(ID),
CONSTRAINT cou_stu unique (courseID, studentID)
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
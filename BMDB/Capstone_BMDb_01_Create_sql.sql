-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;

-- create Movie table
-- DROP TABLE IF EXISTS Movie;
Create table Movie (
ID 			integer 		primary key auto_increment,
Title 		varchar(255) 	not null unique,
Year 		integer 		not null,
Rating 		varchar(5) 		not null,
Director 	varchar(255) 	not null
-- CONSTRAINT utitle unique (Title)
);

-- create Actor table
-- DROP TABLE IF EXISTS Actor;
Create table Actor (
ID 			integer 		primary key auto_increment,
FirstName 	varchar(255) 	not null,
LastName 	varchar(255) 	not null,
Gender 		varchar(1) 		not null,
BirthDate 	date 			not null,
CONSTRAINT unq_actor unique (FirstName, LastName, BirthDate)
);

-- create Credits table
-- business rule - combo of actor+movie must be unique
Create table Credit (
ID 				integer 			primary key auto_increment,
ActorID 		integer 			not null,
MovieID 		integer 			not null,
Role		 	varchar(255)		not null,
Foreign Key (ActorID) references Actor(ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT act_mov unique (ActorID, MovieID)
);

-- Add some movies
 insert into Movie VALUES
 	(1, 'Revenge of the Nerds', 1984, 'R', 'Jeff Kanew'),
 	(2, 'Avengers Infinity War', 2018, 'PG-13', 'Anthony Russo, John Russo'),
    (3, 'Clerks', 1994, 'R', 'Kevin Smith'),
    (4, 'Chasing Amy', 1997, 'R', 'Kevin Smith'),
    (5, 'Star Wars Episode 1 The Phantom Menace', '1999', 'PG', 'George Lucas'),
    (6, 'Hail Caesar', '1994', 'PG', 'Anthony Michael Hall'),
    (7, 'Drawing Flies', '1996', 'UR', 'Malcolm Ingram');
    
-- Add some actors
 insert into Actor VALUES
 	(1, 'Robert', 'Downey Jr.', 'M', '1965-04-04'),
 	(2, 'Chris', 'Hemsworth', 'M', '1983-09-11'),
    (3, 'Scarlett', 'Johansson', 'F', '1984-11-22'),
 	(4, 'Robert', 'Carradine', 'M', '1954-03-24'),
 	(5, 'Anthony', 'Edwards', 'M', '1962-07-19'),
    (6, 'Jason', 'Mewes', 'M', '1974-06-12'),
    (7, 'Joey', 'Adams', 'F', '1968-01-09'),
    (8, 'Samuel L', 'Jackson', 'M', '1948-12-21'),
    (9, 'Kevin', 'Smith', 'M', '1970-08-02');
    
-- Add movie credits for actors
 insert into Credit (ActorID, MovieID, Role) VALUES
 	(1, 2, 'Tony Stark - Iron Man'),
    (2, 2, 'Thor'),
    (3, 2, 'Natasha Romanoff - Black Widow'),
    (4, 1, 'Lewis'),
    (5, 1, 'Gilbert'),
    (6, 3, 'Jay'),
    (6, 4, 'Jay'),
    (7, 4, 'Alyssa Jones'),
    (8, 5, 'Mace Windu'),
    (8, 2, 'Nick Fury'),
    (8, 6, 'Mailman'),
    (1, 6, 'Jerry'),
    (6, 7, 'Az'),
    (7, 7, 'Hippy Chick'),
    (9, 3, 'Silent Bob'),
    (9, 4, 'Silent Bob');


-- create a user and grant privileges to that user
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;

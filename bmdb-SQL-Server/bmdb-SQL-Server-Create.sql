use master;
go
drop database if exists BmDb;
go
create database BmDb;
go
use BmDb;
go
set NOCOUNT on;
go


-- create the tables
-- create Movie table
-- DROP TABLE IF EXISTS Movie;
Create table Movie (
ID 			integer 		primary key identity(1,1),
Title 		varchar(255) 	not null unique,
Year 		integer 		not null,
Rating 		varchar(5) 		not null,
Director 	varchar(255) 	not null
-- CONSTRAINT utitle unique (Title)
);

-- create Actor table
-- DROP TABLE IF EXISTS Actor;
Create table Actor (
ID 			integer 		primary key identity(1,1),
FirstName 	varchar(255) 	not null,
LastName 	varchar(255) 	not null,
Gender 		varchar(1) 		not null,
BirthDate 	date 			not null,
CONSTRAINT unq_actor unique (FirstName, LastName, BirthDate)
);

-- create Credits table
-- business rule - combo of actor+movie must be unique
Create table Credit (
ID 				integer 			primary key identity(1,1),
ActorID 		integer 			not null,
MovieID 		integer 			not null,
Role		 	varchar(255)		not null,
Foreign Key (ActorID) references Actor(ID),
Foreign Key (MovieID) references Movie(ID),
CONSTRAINT act_mov unique (ActorID, MovieID)
);

-- Add some movies
 insert into Movie VALUES
 	('Revenge of the Nerds', 1984, 'R', 'Jeff Kanew'),
 	('Avengers Infinity War', 2018, 'PG-13', 'Anthony Russo, John Russo'),
    ('Clerks', 1994, 'R', 'Kevin Smith'),
    ('Chasing Amy', 1997, 'R', 'Kevin Smith'),
    ('Star Wars Episode 1 The Phantom Menace', '1999', 'PG', 'George Lucas'),
    ('Hail Caesar', '1994', 'PG', 'Anthony Michael Hall'),
    ('Drawing Flies', '1996', 'UR', 'Malcolm Ingram');
    
-- Add some actors
 insert into Actor VALUES
 	('Robert', 'Downey Jr.', 'M', '1965-04-04'),
 	('Chris', 'Hemsworth', 'M', '1983-09-11'),
    ('Scarlett', 'Johansson', 'F', '1984-11-22'),
 	('Robert', 'Carradine', 'M', '1954-03-24'),
 	('Anthony', 'Edwards', 'M', '1962-07-19'),
    ('Jason', 'Mewes', 'M', '1974-06-12'),
    ('Joey', 'Adams', 'F', '1968-01-09'),
    ('Samuel L', 'Jackson', 'M', '1948-12-21'),
    ('Kevin', 'Smith', 'M', '1970-08-02'),
    ('Ewan', 'McGregor', 'M', '1971-03-31'),
    ('Jason', 'Lee', 'M', '1970-04-25');
    
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
    (9, 4, 'Silent Bob'),
    (10, 5, 'Obi-Wan Kenobi'),
    (11, 7, 'Donner'),
    (11, 4, 'Banky Edwards');


-- create a user and grant privileges to that user

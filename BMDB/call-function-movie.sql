-- function to call up movie year, title, actor name (first last) and role
-- 

-- tri join, pulls year title role name
-- select m.year, m.title, c.role, firstName, lastName from actor a
-- 	join credit c on a.id = c.actorID
--     join movie m on m.id = c.movieID
-- 	order by lastName and m.title asc
-- ;

-- MUST change primary key number
-- without declaring column names
-- insert into movie values 
-- 	(8, 'Inception', 2010, 'PG-13', 'Christopher Nolan')
-- ;

-- insert with column name declared
-- insert into movie (Title, Rating, Year, ID, Director)
-- values ('Jurassic Park', 'PG-13', '1993', '9', 'Steven Spielberg')
-- ;

-- insert letting db generate id
-- insert into movie (Title, Year, Rating, Director)
-- 	values('Fight Club', '1999', 'R', 'David Fincher')
-- ;

-- insert multiple rows
-- insert into movie (Title, Year, Rating, Director)
-- 	values('The Shining', '1990', 'R', 'Stanley Kubrick'),
--           ('The Silence of the Lambs', '1991', 'R', 'Johnathan Demme'),
-- 		  ('Dogma', '1999', 'R', 'Kevin Smith')
-- ;

-- multiple rows insert to credit table
-- insert into Credit  (ActorID, MovieID, Role) VALUES
-- 	(9, 13, 'Silent Bob'),
--     (6, 13, 'Jay'),
--     (11, 13, 'Azrael')
-- ;


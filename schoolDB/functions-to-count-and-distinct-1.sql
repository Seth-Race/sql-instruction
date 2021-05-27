-- distinct keyword, removes duplicates
-- select distinct(state) from school_db.student
-- order by state asc
-- ;

-- select distinct state, city from school_db.student
-- order by state asc
-- ;

-- count function 
-- select count(*) from student
-- where state = 'OH'
-- ;

-- students by state counted (count + grouping) (descending count) (with alias 'count')
-- select state, count(state) count from student
-- group by state
-- order by count desc
-- ;

-- min/max function, shows largest/smallest of selected column
-- select max(birthday) from student
-- ;
-- select min(birthday) from student
-- ;

-- most common middle initial, using limit function
-- select count(middleInitial), middleinitial from student
-- 	group by middleInitial
--     order by count(middleInitial) desc
--     limit 1
-- ;

-- student/course enrollment
-- select lastName, firstName, courseID, grade, subject, name from student s
-- 	join enrolled e on studentID = s.id
--     join course c on courseID = c.id
--     order by s.lastName
-- ;


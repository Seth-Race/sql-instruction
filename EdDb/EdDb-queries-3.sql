-- left outer join with specifics
-- select firstName, lastName, majorID, description from student s
-- 	left outer 
--     join major m on m.id = s.majorid
-- ;

-- right outer join (rarely ever used.)
-- select * from student s
-- 	right outer
--     join major m on m.id = s.majorID
-- ;

-- left outer pulling classes and instructors, whether or not instructors are null or not.
-- select code, subject, i.firstName, i.lastName from class c
-- 	left outer
--     join instructor i on i.id = c.instructorID
--     order by i.lastName asc
-- ;

-- subqueries (average of numerical value within subquery)
-- select * from student
-- 	where gpa >= (select avg(gpa) from student)
-- 	order by gpa desc
-- ;

-- subquery built off of less than avg SAT scores.
-- select * from student
-- 	where SAT <= (select avg(SAT) from student)
-- 	order by SAT desc
-- ;


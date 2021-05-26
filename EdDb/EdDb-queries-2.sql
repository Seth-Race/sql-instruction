-- joining two tables (student and major)
-- select * from student s
-- 	join Major m on s.majorID = m.id
--     order by lastName asc
-- ;

-- joining two tables (showing specifics from both tables, ignoring null major and null student)
-- also known as an inner join.
-- select firstName, lastName, code, description from student s
-- 	join Major m on s.majorID = m.id
-- ;

-- join to pull student names, classes enrolled
-- select s.lastName, s.firstName, code, subject from student s 
-- 	join StudentClass sc on s.ID = sc.studentID
--     join class c on sc.classID = c.id
-- ;

-- joining 3 tables to pull specifics (I.E. - Class code, major description, and subject)
-- select c.code, description, subject from student s
-- 	join Major m on s.majorID = m.id
--     join StudentClass sc on s.ID = sc.studentID
-- 	join class c on sc.classID = c.id
--     where m.id = "1"
-- ;


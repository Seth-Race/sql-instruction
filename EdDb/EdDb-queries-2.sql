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

-- join to pull student names, classes enrolled (three table join)
-- select s.lastName, s.firstName, code, subject, classGradeValue from student s 
-- 	join StudentClass sc on s.ID = sc.studentID
--     join class c on sc.classID = c.id
-- ;

-- selecting 3 specific columns (3 table join) with where condition
-- select description, c.code, subject from major m
-- 	join majorclass on majorid = m.id
--     join class c on classid = c.id
--     where description = "General Business"
-- ;

-- selecting 3 specific columns (3 table join) with where condition (distinct/fancy/verbose)
-- select distinct description, subject, c.code from major m
-- 	join majorClass mc on m.id = mc.majorID
--     join class c on mc.classID
--     where m.id = "1"
-- ;


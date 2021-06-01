--select Firstname, Lastname, YearsExperience from Instructor
--	order by Lastname asc
--;

--select s.Firstname, s.Lastname, s.StateCode, m.Description from Student s
--	join Major m on s.MajorId = m.Id
--;

--select * from student s
--	join StudentClass sc on s.Id = sc.StudentId
--	join class c on c.id = sc.ClassId
--;

--select * from student s
--	join StudentClass sc on s.Id = sc.StudentId
--	join ClassGrade cg on sc.ClassGradeValue = cg.Grade
--	join Class c on sc.ClassId = c.id
--;

--select s.Firstname, s.Lastname, c.Code, cg.Grade, i.Firstname as Instructor, i.Lastname as Name from student s
--	join StudentClass sc on s.Id = sc.StudentId
--	join ClassGrade cg on sc.ClassGradeValue = cg.Grade
--	join Class c on sc.ClassId = c.id
--	join Instructor i on c.InstructorId = i.id
--;

select concat(s.Firstname,' ', s.Lastname) as Name, sc.Id from student s
	left outer 
	join StudentClass sc on s.id = sc.StudentId
;


-- listing all by even ID number, excluding duplicates
-- select distinct * 
-- 	from student 
--     where mod(id,2) = 0
-- ;

-- list students whose SAT is less than 1000, ascending SAT order
-- select *
-- 	from student
--     where SAT < '1000'
--     order by SAT asc
-- ;

-- where clause with or
-- select * from student
-- 	where statecode = "OH" or statecode = "IN"
-- ; 

-- where clause with in (requires () to work)
-- select * from student
-- 	where statecode in ("OH", "IN")
-- ; 

-- where clause with !=
-- select * from student
-- 	where statecode != "OH"
-- ; 

-- where clause with not
-- select * from student
-- 	where not statecode = "OH"
-- ; 

-- where clause with between, sorted SAT descending
-- select * from student
-- 	where SAT between  900 and 1200
--     order by SAT desc
-- ; 

-- where clause with like (% is wildcard '_' single letter WC, 'like binary' can be used to require case-sensitivity)
-- select * from student
-- 	where lastName like 'B%'
--     order by lastName desc
-- ; 

-- where clause using like to state specifics. (% wildcard in middle.)
-- select * from student
-- 	where lastName like 'B%s'
--     order by lastName desc
-- ; 


-- function to call up movie year, title, actor name (first last) and role
--

select m.year, m.title, c.role, firstName, lastName from actor a
	join credit c on a.id = c.actorID
    join movie m on m.id = c.movieID
	order by lastName desc
;
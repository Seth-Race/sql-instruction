-- actor queries

-- listing actors by birthdate
select *
	from actor
    order by birthDate
;

-- select particular by ID
select *
	from actor
    where id = 3
;
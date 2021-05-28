-- showing "receipt" join. Line items with total	.

-- select orderTicketID, name, price, quantity, (price * quantity) as subtotal from lineItem
-- 	join menuItem mi on menuItemID = mi.id
--     where orderTicketID = 2
-- ;

-- name vs receipt. (concat lastname, firstname)
-- select o.ID as Ticket, concat(c.lastName, ', ', c.firstName) as 'Customer Name', ca.name as Category, m.name as Item, concat('$', price) as Price, quantity as QTY, concat('$', (price * quantity)) as Subtotal from lineItem l
-- 	join menuItem m on menuItemID = m.id 
--     join orderTicket o on orderTicketID = o.id
--     join customer c on customerid = c.id
--     join category ca on categoryID = ca.id
-- where o.id = 2
-- ; 

-- getting proper total
select orderTicketID as Ticket, sum(price * quantity) as Total from lineItem 
	join menuItem m on menuItemID = m.id
    where orderTicketID = '2'
    group by orderTicketID
;

select sum(price * quantity) as total from lineItem
	join menuItem m on menuItemID = m.id
    where orderTicketID = '2'
;
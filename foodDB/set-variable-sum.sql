-- set a variable with total
-- set @order_total = (select sum(price * quantity) as total from lineItem
-- 	join menuItem m on menuItemID = m.id
--     where orderTicketID = 3
-- 		group by orderTicketID)
-- ;

-- update orderTicket
-- 	set total = @order_total
--     where id = 3
-- ;

-- select * from orderTicket
-- ;


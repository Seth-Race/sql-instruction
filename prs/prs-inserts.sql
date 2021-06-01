-- prs injection


insert into request (id, userID, deliveryMode) values
	(4, 2, 'Delivery')
;
select * from lineItem
;


 insert into lineItem (requestID, productID, quantity) values
	(4, 5, 1),
    (4, 6, 1),
    (4, 9, 1),
    (4, 1, 1),
    (4, 7, 1)
;

set @order_total = (select sum(price * quantity) as total from lineItem
	join product p on productID = p.id
    where requestID = 4
		group by requestID)
;

update request
	set total = @order_total
    where id = 4
;


-- display order and name
select concat(u.firstName, ' ', u.lastname) as name, submittedDate, justification, description, dateNeeded, total, status, deliveryMode from request r
	join user u on userid = u.id
;
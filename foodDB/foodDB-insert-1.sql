-- Add some test data to foodDB
 insert into menuItem VALUES
 	(1, 1, 'Cheese Sticks', 8.99, 800),
 	(2, 1, 'Fried Pickles', 5.99, 800),
	(3, 1, 'Bread Sticks', 7.99, 800),
 	(4, 1, 'Ultimate Nachos', 11.99, 1200),
 	(5, 1, 'Potato Skins', 7.99, 850),
 	(6, 1, 'Loaded French Fries', 9.99, 1000),
	(7, 2, 'House Salad', 8.99, 800),
	(8, 2, 'Caesar Salad', 6.99, 600),    
	(9, 3, 'Filet Mignon', 28.99, 1100),
	(10, 3, 'Pizza', 13.99, 1400),
	(11, 4, 'Loaded Baked Potato', 3.99, 530),
    (12, 4, 'Tater Tots', 3.99, 200),
    (13, 4, 'Side Salad', 3.99, 400),
    (14, 5, 'Soda', 1.99, 160),
    (15, 5, 'Coffee', 1.99, 1),
    (16, 5, 'Milk', 1.99, 103),
    (17, 5, 'Maker"s Mark 46', 8.25, 69),
    (18, 5, 'Water', 0.25, 0),
    (19, 6, 'Cheesecake', 8.99, 400),
    (20, 6, 'Milkshake - Choose a flavor', 8.99, 700)
;

insert into customer VALUES
	(1, 'SR928', 'Race', 'Seth', 'srace@test.com', '513-827-1990'),
    (2, 'ZC967', 'Charles', 'Zeke', 'Zcharles@test.com', '513-827-1991'),
	(3, 'AD725', 'Dudley', 'Amanda', 'Adudley@test2.com', '513-827-1992'),
    (4, 'MJ230', 'James', 'Mick', 'MickJames@dawg.com', '513-827-1993')
;

insert into orderTicket (id, customerID) VALUES
	(1, 1),
    (2, 1)
;

insert into lineItem (orderTicketID, menuItemID, quantity) VALUES
	(1, 9, 2),
	(1, 4, 2),
    (1, 7, 1),
    (2, 1, 1),
    (2, 10,1),
    (2, 17, 4),
    (2, 19, 1)
;
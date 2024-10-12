CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost
FROM Orders;

UPDATE OrdersView
SET Cost = 200
WHERE OrderID = 2;

RENAME TABLE OrdersView TO ClientsOrdersView;

DROP VIEW ClientsOrdersView;
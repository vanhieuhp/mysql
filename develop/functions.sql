CREATE TABLE if not exists clients
(
    ClientID   int NOT NULL,
    ClientName varchar(255) DEFAULT NULL,
    Address    varchar(255) DEFAULT NULL,
    ContactNo  varchar(10)  DEFAULT NULL,
    PRIMARY KEY (ClientID)
);

CREATE TABLE if not exists client_orders
(
    OrderID  INT NOT NULL,
    ClientID INT DEFAULT NULL,
    ItemID   INT DEFAULT NULL,
    Cost     INT DEFAULT NULL,
    PRIMARY KEY (OrderID)
);

CREATE TABLE if not exists item
(
    ItemID INT NOT NULL,
    Name   varchar(150) DEFAULT NULL,
    Cost   INT          DEFAULT NULL,
    PRIMARY KEY (ItemID)
);

CREATE TABLE if not exists mg_orders
(
    OrderID      INT NOT NULL,
    ItemID       INT         DEFAULT NULL,
    Quantity     INT         DEFAULT NULL,
    Cost         INT         DEFAULT NULL,
    OrderDate    DATE        DEFAULT NULL,
    DeliveryDate DATE        DEFAULT NULL,
    OrderStatus  VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (OrderID)
);

INSERT INTO clients
VALUES (1, 'Kishan Hughes', '223 Golden Hills, North Austin, TX', '387986345'),
       (2, 'Indira Moncada', '119 Silver Street, Bouldin Creek, TX', '334567243'),
       (3, 'Mosha Setsile', '785 Bronze Lane, East Austin, TX', '315642597'),
       (4, 'Laura Mills', '908 Diamond Crescent, South Lamar, TX', '300842509'),
       (5, 'Henrik Kreida', '345, Golden Hills, North Austin, TX', '358208983'),
       (6, 'Millicent Blou', '812, Diamond Crescent, North Burnet, TX', '347898755');

INSERT INTO item
VALUES (1, 'Engagement ring', 2500),
       (2, 'Silver brooch', 400),
       (3, 'Earrings', 350),
       (4, 'Luxury watch', 1250),
       (5, 'Golden bracelet', 800),
       (6, 'Gemstone', 1500);

INSERT INTO client_orders
VALUES (1, 1, 1, 2500),
       (2, 2, 2, 400),
       (3, 3, 3, 350),
       (4, 4, 4, 1250),
       (5, 5, 5, 800),
       (6, 6, 6, 1500),
       (7, 2, 4, 400),
       (8, 3, 4, 1250),
       (9, 4, 2, 400),
       (10, 1, 3, 350);

INSERT INTO mg_orders
VALUES (1, 1, 50, 122000, '2022-04-05', '2022-05-25', 'Delivered'),
       (2, 2, 75, 28000, '2022-03-08', NULL, 'In progress'),
       (3, 3, 80, 25000, '2022-05-19', '2022-06-08', 'Delivered'),
       (4, 4, 45, 100000, '2022-01-10', NULL, 'In progress'),
       (5, 5, 70, 56000, '2022-05-19', NULL, 'In progress'),
       (6, 6, 60, 90000, '2022-06-10', '2022-06-18', 'Delivered');


select current_time();

select mod(9, 6);

select isnull(1 + 1);

select greatest(1, 2, 3);

select least(1, 2, 3);

SELECT CONCAT(LCASE(Name), '-', Quantity, '-', UCASE(OrderStatus))
FROM item,
     mg_orders
WHERE item.ItemID = mg_orders.ItemID;

SELECT DATE_FORMAT(DeliveryDate, '%W')
FROM mg_orders;

SELECT OrderID, ROUND((Cost * 5 / 100), 2) AS HandlingCost
FROM mg_orders;

SELECT DATE_FORMAT(DeliveryDate, '%W')
FROM mg_orders
WHERE !ISNULL(DeliveryDate);

SELECT round(235.75, 0);

CREATE DATABASE jewelrystore_db;

USE jewelrystore_db;

select *
from client_orders;
select *
from clients;
select *
from item;

SELECT ClientID, OrderID, CEIL((Cost -(Cost * 5 /100))) AS afterDiscount
FROM client_orders
WHERE ItemID = 4;

select ADDDATE(orderDate, INTERVAL 5 DAY) as DeliveryDate from mg_orders;
select * from mg_orders;
select OrderID, ItemID, Quantity, Cost, OrderDate, COALESCE (DeliveryDate,'NOT DELIVERED') as DeliveryDate, OrderStatus from mg_orders;

select OrderID, nullif(OrderStatus, 'In progress')  as status from mg_orders;

SELECT CEIL(15.50);
SELECT FLOOR(15.50);
SELECT ROUND(15.49);
SELECT FORMAT(3750.753, 2);

SELECT ADDDATE(now(), INTERVAL 5 DAY) as DeliveryDate;

SELECT QUARTER('2022-04-05'); -- 2

SELECT COALESCE(NULL, 'Coursera', NULL, 'Database') as Result; -- The following code returns Coursera, because the COALESCE() function returns the first non-null value in a list.

SELECT IFNULL(NULL, 'Coursera') as Result;
SELECT NULLIF(15, 10); -- 10
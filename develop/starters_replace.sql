CREATE TABLE Starters
(
    StarterName VARCHAR(100) NOT NULL PRIMARY KEY,
    Cost        Decimal(3, 2),
    StarterType VARCHAR(100) DEFAULT 'Mediterranean'
);

select * from Starters;

REPLACE into Starters set StarterName = 'Cheese bread', Cost = 9.50, StarterType = 'Indian';

REPLACE into Starters set StarterName = 'Cheese bread', Cost = 9.75, StarterType = 'Italian';
REPLACE  into Starters (StarterName, Cost, StarterType) values (9.75, 'Cheese bread', 'Italian');
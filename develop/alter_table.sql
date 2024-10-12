CREATE TABLE Staff
(
    StaffID     INT,
    FullName    VARCHAR(100),
    PhoneNumber VARCHAR(10)
);

ALTER TABLE Staff
    MODIFY StaffID INT PRIMARY KEY,
    MODIFY FullName VARCHAR(100) NOT NULL,
    MODIFY PhoneNumber INT NOT NULL;

ALTER TABLE Staff
    ADD COLUMN Role VARCHAR(50) NOT NULL;

ALTER TABLE Staff
    DROP COLUMN PhoneNumber;

CREATE TABLE FoodOrders
(
    OrderID      INT,
    Quantity     INT,
    Order_Status VARCHAR(15),
    Cost         Decimal(4, 2)
);

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    FullName   VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL
);

ALTER TABLE FoodOrders
    MODIFY OrderID INT PRIMARY KEY,
    MODIFY Quantity INT NOT NULL CHECK (Quantity > 0),
    MODIFY Order_Status VARCHAR(15) NOT NULL,
    MODIFY Cost Decimal(4, 2) NOT NULL;

ALTER TABLE FoodOrders ADD COLUMN OrderDate DATE NOT NULL;
ALTER TABLE FoodOrders ADD COLUMN CustomerID INT NOT NULL;
ALTER TABLE FoodOrders ADD CONSTRAINT FK_CustomerID_FoodOrders FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID);
ALTER TABLE FoodOrders CHANGE COLUMN OrderStatus DeliveryStatus VARCHAR(15) NOT NULL;
ALTER TABLE FoodOrders RENAME COLUMN DeliveryStatus TO OrderDeliveryStatus;

create table Employees like employees;

insert into Employees select * from employees;
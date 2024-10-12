CREATE TABLE Clients
(
    ClientID    INT PRIMARY KEY,
    FullName    VARCHAR(100) NOT NULL,
    PhoneNumber INT          NOT NULL UNIQUE
);

CREATE TABLE Items
(
    ItemID   INT PRIMARY KEY,
    ItemName VARCHAR(100)  NOT NULL,
    Price    DECIMAL(5, 2) NOT NULL
);

CREATE TABLE Orders
(
    OrderID  INT PRIMARY KEY,
    ItemID   INT           NOT NULL,
    ClientID INT           NOT NULL,
    Quantity INT           NOT NULL CHECK (Quantity < 4),
    Cost     DECIMAL(6, 2) NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Clients (ClientID),
    FOREIGN KEY (ItemID) REFERENCES Items (ItemID)
);

CREATE TABLE ContractInfo
(
    ContractID INT           NOT NULL PRIMARY KEY,
    StaffID    INT           NOT NULL,
    Salary     Decimal(7, 2) NOT NULL,
    Location   VARCHAR(50)   NOT NULL DEFAULT 'Texas',
    StaffType  VARCHAR(20)   NOT NULL CHECK (StaffType = 'Junior' OR StaffType = 'Senior'),
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID)
);

ALTER TABLE ContractInfo
    ADD CONSTRAINT FK_StaffID_ContractInfo
        FOREIGN KEY (StaffID) REFERENCES Staff (StaffID);


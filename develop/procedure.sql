CREATE PROCEDURE GetItalianCustomers()
SELECT *
FROM Customers
WHERE Country = “Italy”;

CALL GetItalianCustomers();

CREATE PROCEDURE GetProductsDetails() SELECT * FROM Products;
CREATE PROCEDURE GetProductsBasedOnPrice (inputPrice INT)
SELECT * FROM Products WHERE Price <= inputPrice;
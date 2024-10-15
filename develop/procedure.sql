# CREATE PROCEDURE GetItalianCustomers()
# SELECT *
# FROM Customers
# WHERE Country = “Italy”;
#
# CALL GetItalianCustomers();
#
# CREATE PROCEDURE GetProductsDetails() SELECT * FROM Products;
# CREATE PROCEDURE GetProductsBasedOnPrice (inputPrice INT)
# SELECT * FROM Products WHERE Price <= inputPrice;
#

select * from orders;
create procedure getOrderSummary(out numberOfLowAmount int, out numberOfHighAmount int)
begin
    select count(id) into numberOfLowAmount from orders where total_amount < 100;
    select count(id) into numberOfHighAmount from orders where total_amount >= 100;
end;

call getOrderSummary(@low, @high);
select @low as 'Low Amount Orders', @high as 'High Amount Orders';


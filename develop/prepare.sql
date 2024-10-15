PREPARE GetOrderStatement FROM 'SELECT * FROM orders WHERE total_amount > ?';

SET @total_amount = 100;

EXECUTE GetOrderStatement USING @total_amount;
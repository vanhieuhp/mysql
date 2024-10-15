/*
Create event [if not exists] event_name
on SCHEDULE at CURRENT_TIMESTAMP [+ INTERVAL ]
DO
Event_body;

EXAMPLE:
CREATE EVENT IF NOT EXISTS generate_revenue_report
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 12 HOUR
DO
BEGIN
    SELECT SUM(total_amount) INTO @total_revenue FROM orders;
    INSERT INTO revenue_report (total_revenue) VALUES (@total_revenue);
END;
*/

select *
from orders;
create table revenue_report
(
    id            int primary key auto_increment,
    total_revenue int,
    month_year    date
);
select * from revenue_report;

create event generate_revenue_report
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN
    SELECT SUM(total_amount) INTO @total_revenue FROM orders where order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
    INSERT INTO revenue_report (total_revenue, month_year) VALUES (@total_revenue, CURDATE());
END;

show events;

drop event coursera.generate_revenue_report;
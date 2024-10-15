select *
from orders;

select concat(avg(total_amount), ' (2023)') AS "AVG Sale"
from orders
where order_date between '2023-01-01' and '2023-12-31'
union
select concat(avg(total_amount), ' (2024)')
from orders
where order_date between '2024-01-01' and '2024-12-31'
union
select concat(avg(total_amount), ' (2024)')
from orders
where order_date between '2024-01-01' and '2024-12-31'
union
select concat(avg(total_amount), ' (2024)')
from orders
where order_date between '2024-01-01' and '2024-12-31'
union
select concat(avg(total_amount), ' (2024)')
from orders
where order_date between '2024-01-01' and '2024-12-31'
union
select concat(avg(total_amount), ' (2024)')
from orders
where order_date between '2024-01-01' and '2024-12-31'
union
select concat(avg(total_amount), ' (2024)')
from orders
where order_date between '2024-01-01' and '2024-12-31';

with avg_sale_2023 as (select concat(avg(total_amount), ' (2023)') as avg_sale
                       from orders
                       where order_date between '2023-01-01' and '2023-12-31'),
     avg_sale_2023 as (select concat(avg(total_amount), ' (2023)') as avg_sale
                       from orders
                       where order_date between '2023-01-01' and '2023-12-31'),
     avg_sale_2023 as (select concat(avg(total_amount), ' (2023)') as avg_sale
                       from orders
                       where order_date between '2023-01-01' and '2023-12-31'),
     avg_sale_2023 as (select concat(avg(total_amount), ' (2023)') as avg_sale
                       from orders
                       where order_date between '2023-01-01' and '2023-12-31'),
     avg_sale_2023 as (select concat(avg(total_amount), ' (2023)') as avg_sale
                       from orders
                       where order_date between '2023-01-01' and '2023-12-31'),
     avg_sale_2023 as (select concat(avg(total_amount), ' (2023)') as avg_sale
                       from orders
                       where order_date between '2023-01-01' and '2023-12-31'),
     avg_sale_2024 as (select concat(avg(total_amount), ' (2024)') as avg_sale
                       from orders
                       where order_date between '2024-01-01' and '2024-12-31')
select *
from avg_sale_2023
union
select *
from avg_sale_2024;
select *
from orders;

create trigger orderMountCheck
    before insert
    on orders
    for each row
begin
    if new.total_amount < 0 then
        set new.total_amount = 0;
    end if;
end;

insert into orders (total_amount) values (-100);

select * from orders where id = 1001;
drop trigger coursera.orderMountCheck;
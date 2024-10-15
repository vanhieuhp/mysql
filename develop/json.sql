create table activity
(
    activity_id int primary key auto_increment,
    properties  json
);

select *
from activity;

insert into activity (properties)
values ('{
  "name": "John",
  "age": 30,
  "order": true
}');

insert into activity (properties)
values ('{
  "name": "Jane",
  "age": 25,
  "order": false
}');

select activity_id, properties -> '$.name' as name, properties -> '$.age' as age, properties -> '$.order' as orders
from activity;
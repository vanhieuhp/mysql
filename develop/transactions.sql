select *
from movies;

start transaction;

insert into movies (title, director, release_year, genre)
values ('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama');
select * from movies;

commit;
rollback;
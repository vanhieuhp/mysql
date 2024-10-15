select *
from orders;
select *
from movies;

alter table movies
    add column reverseDirector varchar(255);

select director, reverseDirector
from movies;

update movies
set reverseDirector = concat(SUBSTRING_INDEX(director, ' ', -1), ' ', SUBSTRING_INDEX(director, ' ', 1));

create index idxReverseDirector on movies (reverseDirector);
explain select id, director, reverseDirector from movies where reverseDirector like 'Stanton%';
explain select * from movies where director like '%Stanton';

show indexes from movies;
drop index idxReleaseYearGenre on movies;
create index idxReleaseYearGenre on movies (release_year, genre);

explain select * from movies where release_year = 2010;
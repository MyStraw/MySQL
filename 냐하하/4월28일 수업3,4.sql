-- cross join

select concat( b.v, " x " , a.v  ," = " , b.v*a.v) as result
from (
	select 1 v union
	select 2 v union
	select 3 v union
	select 4 v union
	select 5 v union
	select 6 v union
	select 7 v union
	select 8 v union
	select 9 v)a
join
	(select 2 v)b;

-- cross join

select concat( b.v, " x " , a.v  ," = " , b.v*a.v) as 2단, 
concat(c.v, " x " , a.v  ," = " , b.v*a.v) as 3단,
concat(d.v, " x " , a.v  ," = " , b.v*a.v) as 4단,
concat(e.v, " x " , a.v  ," = " , b.v*a.v) as 5단,
concat(f.v, " x " , a.v  ," = " , b.v*a.v) as 6단,
concat(g.v, " x " , a.v  ," = " , b.v*a.v) as 7단,
concat(h.v, " x " , a.v  ," = " , b.v*a.v) as 8단,
concat(i.v, " x " , a.v  ," = " , b.v*a.v) as 9단
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
	(select 2 v ) b
join
	(select 3 v) c
join
	(select 4 v) d
join
	(select 5 v) e
join
	(select 6 v) f
join
	(select 7 v) g
join
	(select 8 v) h
join
	(select 9 v) i;
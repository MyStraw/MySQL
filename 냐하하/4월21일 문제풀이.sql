use warehouse;

-- 1--
select city, jname
from j
where city = 'London';


-- 2--
select sname
from s, j, spj
where s.sno = spj.sno
and j.jno = spj.jno;

-- 3--
select sno, pno, qty
from spj
where qty>=300
and qty<=700;

-- 4--
select color, city
from p
group by color, city;

-- 4--
select distinct color, city
from p;

-- 5--
select sno, pno, jno
from s,p,j
where s.city = j.city and j.city = p.city and s.city = p.city;

-- 6--
select sno, pno, jno
from s,p,j
where s.city <> j.city and j.city <> p.city and s.city <> p.city;

-- 7--
select pname, pno
from p
where pno in (
	select pno
	from spj
	where sno in (
		select sno 
		from s
		where city = 'london'
));

-- 7-1 --
select p.pname, p.pno, jno, s.sno
from p,spj,s
where p.pno = spj.pno
and spj.sno = s.sno
and s.city = 'london';

-- 8--
select p.pname, p.pno, j.jno, s.sno
from p,spj,s, j
where p.pno = spj.pno
and spj.sno = s.sno
and spj.jno = j.jno
and s.city = 'london'
and j.city = 'london';

-- 9 --
select j.city, s.city
from j, s, spj
where s.sno = spj.sno
and spj.jno = j.jno
and j.city<>s.city;

-- 10 --
select j.city, s.city
from j, s, spj
where s.sno = spj.sno
and spj.jno = j.jno
and j.city=s.city;


-- 11 --




-- 12--
select s.sno
from s, p, spj
where




-- 13 --
select count(spj.jno)
from spj
where spj.sno = 's1';


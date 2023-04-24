use warehouse;
-- 1--
select sno, status
from warehouse.s
where city = 'paris' and status > 20;

-- 2--
select sx.sno as firstno, sy.sno as secondno
from s sx, s sy
where sx.city = sy.city and sx.sno<sy.sno;

-- 3 --
select distinct s.sno, s.sname, s.status, s.city
from s, spj
where s.sno = spj.sno
and spj.pno = 'p2';

-- 3 교수님--
select sx.sno, sx.sname, sx.status, sx.city
from s as sx
where exists(select * from spj as spx where sx.sno = spx.sno and spx.pno = 'p2');

select distinct sx.sno, sx.sname, sx.status, sx.city
from s as sx
join spj as spx on sx.sno = spx.sno and spx.pno = 'p2';

select distinct sx.sno, sx.sname, sx.status, sx.city
from s as sx, spj as spx
where sx.sno = spx.sno and spx.pno = 'p2';

-- 4 -- 
select distinct sx.sname
from s sx, p px, spj spx
where color ='red'
and px.pno = spx.pno
and sx.sno = spx.sno;

-- 5--
select distinct sx.sname
from s sx, p px, spj spx
where spx.sno = 's2'
and sx.sno = spx.sno
and px.pno = spx.pno;

-- 6 --
select distinct sname
from s, p, spj
where not exists (select * from p where not exists (select * from spj where spj.sno = s.sno and spj.pno = p.pno));

-- 7--
select distinct sname
from s, p, spj
where not exists (select * from spj where spj.sno = s.sno and spj.pno = 'p2');

-- 8--
select distinct sx.sno
from s sx, spj spy, spj spz
where not exists (select * from spy where spy.sno !='s2' or
exists (select * from spz where spz.sno = sx.sno and spz.pno= spy.pno));

-- 8--
select distinct s.sno, p.pno


-- 1--
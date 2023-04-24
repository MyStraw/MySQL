-- 136~7

select color, city from p;

select distinct color, city from p
order by city;

-- 1-- 
select p.color, p.city
from p
where weight >=10
and city !='paris';

-- 2--
select pno, weight * 454
from p;

-- 3--
select *
from s join p
where s.city = p.city;

-- 4--
select distinct s.city, p.city
from s, p, spj
where s.sno = spj.sno
and p.pno = spj.pno;

-- 5--
select a.sno as aa, b.sno as bb
from s as a, s as b
where a.city = b.city
and a.sno>b.sno;

-- 6--
select count(*)
from s;

-- 7--
select max(qty), min(qty)
from spj
where spj.pno = 'p2';

-- 8--
select sum(qty), spj.pno
from s, p, spj
group by spj.pno;

-- 9 --
select spj.pno
from spj
group by spj.pno
having count(spj.sno)>1; -- 웨어 오얼 해빙

-- 10--
select distinct sname
from s,p,spj
where spj.pno = 'p2'
and spj.pno = p.pno
and spj.sno = s.sno;

-- 11--
select distinct s.sname
from s, spj, p
where spj.pno = p.pno
and spj.sno = s.sno
and p.color = 'red';

-- 12--
select sname
from s
where (select max(status) from s) > status;

-- 14 --
select distinct sname
from s,p,spj
where spj.pno != 'p2'
and spj.pno = p.pno
and spj.sno = s.sno;

-- 15--
select distinct sname
from s,p,spj
where spj.pno = p.pno
and spj.sno = s.sno
and spj.pno in ;



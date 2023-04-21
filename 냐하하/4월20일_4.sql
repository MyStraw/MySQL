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

-- 5--

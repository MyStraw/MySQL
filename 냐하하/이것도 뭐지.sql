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

-- 7 --

SELECT DISTINCT s.sname
FROM s
WHERE s.sno NOT IN (
    SELECT DISTINCT spj.sno
    FROM spj
    WHERE spj.pno = 'P2'
);


-- 8--
select distinct sx.sno
from s sx, spj spy, spj spz
where not exists (select * from spy where spy.sno !='s2' or
exists (select * from spz where spz.sno = sx.sno and spz.pno= spy.pno));

-- 8--
SELECT DISTINCT s.sno
FROM s
WHERE NOT EXISTS (
  SELECT p.pno
  FROM p
  WHERE NOT EXISTS (
    SELECT spj.jno
    FROM spj
    WHERE spj.sno = s.sno AND spj.pno = p.pno
    AND spj.sno = 'S2'
  )
);


SELECT s.sno
FROM s
WHERE s.sno != 'S2'
AND NOT EXISTS (
  SELECT p.pno
  FROM p
  WHERE NOT EXISTS (
    SELECT spj.jno
    FROM spj
    WHERE spj.sno = s.sno AND spj.pno = p.pno
    AND spj.sno = 'S2'
  )
);


SELECT s.sno
FROM s
JOIN spj ON s.sno = spj.sno AND spj.pno IN (
  SELECT pno
  FROM spj
  WHERE sno = 'S2'
)
GROUP BY s.sno
HAVING COUNT(DISTINCT spj.pno) = (
  SELECT COUNT(DISTINCT pno)
  FROM spj
  WHERE sno = 'S2'
);

SELECT s.sno
FROM s
JOIN spj ON s.sno = spj.sno AND spj.pno IN (
  SELECT pno
  FROM spj
  WHERE sno = 'S2'
)
WHERE s.sno <> 'S2'
GROUP BY s.sno
HAVING COUNT(DISTINCT spj.pno) = (
  SELECT COUNT(DISTINCT pno)
  FROM spj
  WHERE sno = 'S2'
);

SELECT s.sno
FROM s, spj
WHERE s.sno <> 'S2'
  AND s.sno = spj.sno
  AND spj.pno IN (
    SELECT spj.pno
    FROM spj
    WHERE spj.sno = 'S2'
  )
GROUP BY s.sno
HAVING COUNT(DISTINCT spj.pno) = (
  SELECT COUNT(*)
  FROM spj
  WHERE spj.sno = 'S2'
);
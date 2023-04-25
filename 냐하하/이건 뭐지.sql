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



-- 8 --
WITH s2_parts AS (
  SELECT DISTINCT pno
  FROM spj
  WHERE sno = 'S2'
)
SELECT sno
FROM spj
WHERE pno IN (SELECT pno FROM s2_parts) AND sno <> 'S2'
GROUP BY sno
HAVING COUNT(DISTINCT pno) = (SELECT COUNT(*) FROM s2_parts);
-- 공급자 s2에 의해 공급되는 부품을 모두 공급하는 공급자의 번호를 찾아라--
-- s2가 공급하는 부품은 p3, p5 뿐이다. 이 부품을 공급하는 또다른 공급자는 s5 뿐이다. 단 한명. 이게 정답.



with s2_all as (select distinct pno from spj where sno='s2')

select sno
from spj
where pno in (select pno from s2_all) and sno <>'s2'
group by sno
having count(distinct pno) = (select count(*) from s2_all);


-- 뭐여
WITH s2_parts AS (
  SELECT DISTINCT pno
  FROM spj
  WHERE sno = 'S2'
), all_sno AS (
  SELECT DISTINCT sno
  FROM spj
  WHERE sno <> 'S2'
)
SELECT a.sno
FROM all_sno a
WHERE NOT EXISTS (
  SELECT *
  FROM s2_parts p
  WHERE NOT EXISTS (
    SELECT *
    FROM spj s
    WHERE s.sno = a.sno AND s.pno = p.pno
  )
);
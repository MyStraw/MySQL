-- London에 있는 공급자에 의해 공급된 부품의 번호, 이름을 찾아라.

-- 7-- in 쓰기
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

-- 7 -- exists 쓰기
select pname, pno
from p
where exists (select pno from spj where exists (select sno from s where city= 'london' and p.pno = spj.pno
and spj.sno = s.sno)); -- 굳이??

-- 7-- join 쓰기
select distinct pname, p.pno
from p
join spj
on p.pno = spj.pno
join s
on s.city= 'london' and spj.sno = s.sno;

-- 7 -- and만 쓰기
select p.pname, p.pno, jno, s.sno
from p,spj,s
where p.pno = spj.pno
and spj.sno = s.sno 
and s.city = 'london';

-- //////////////////////////////////////////////////////////////////////
-- London에 있는 공급자가 London의 프로젝트에 공급한 부품의 부품번호와 이름을 찾아라.

-- 8--
select p.pname, p.pno, j.jno, s.sno
from p,spj,s, j
where p.pno = spj.pno
and spj.sno = s.sno
and spj.jno = j.jno
and s.city = 'london'
and j.city = 'london';



-- 8-1--
select pname, pno
from p
where pno in (
	select pno
	from spj
	where sno in (
		select sno 
		from s
		where city = 'london')
        and jno in ( select jno
        from j
        where city = 'london'));
        
        
    -- 8-1--
select pname, pno
from p
where pno in (
	select pno
	from spj
	where jno in (
		select jno 
		from j
		where city = 'london')
        and sno in ( select sno
        from s
        where city = 'london'));




-- 8-2--
select pname, pno
from p
where exists (select * from spj where exists (select * from s where city= 'london' and p.pno = spj.pno and spj.sno = s.sno) and exists(select * from j where city = 'london' and j.jno = spj.jno));


-- 8-2--
select pname, pno
from p
where exists (select * from spj where exists (select * from s where exists (select * from j where s.city= 'london' and p.pno = spj.pno and spj.sno = s.sno and j.jno = spj.jno and j.city = 'london'))); 



-- 8-3 join이 오히려 in처럼 덩이 붙이는게 비슷--
select distinct p.pname, p.pno
from p
join spj
on spj.pno = p.pno
join s
on s.sno = spj.sno
and s.city = 'london'
join j
on j.jno = spj.jno
and j.city = 'london';

        
-- ////////////////////////////////////////////////////////////////////
-- 135p


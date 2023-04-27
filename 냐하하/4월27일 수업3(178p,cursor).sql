select name, nationLanguage04func(name)
from country
where nationLanguage04func(name) > 90.0
order by nationLanguage04func(name) desc;

-- cursor 이 뭐냐?

use warehouse;
-- 커서 프로시져 만들어. 179p

call cursor_dept();

-- 연습문제 (179p)

-- 1. getGrade(1000, 2500); 함수 만들어 사용
-- 프로시져에서 1000과 2500을 받아서 이걸 기준으로 function을 호출. 이걸 기준으로 등급을 매긴걸 출력한다.


select sum(qty), spj.sno
from p, s, spj
where s.sno = spj.sno
and p.pno = spj.pno
group by spj.sno;

-- 2. 등급부여는 create functon
select getGrade(2000,2500,3000);

select sname, sum(qty), getGrade(sum(qty), 1000, 3000)
from s,spj
where s.sno = spj.sno
group by s.sname;


call setGrade(2000,1000,3000); -- + 도시이름


-- 1000미만 : c, 1000~2500 : B, 2500이상 : A
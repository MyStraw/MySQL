
-- 1. getGrade(1000, 2500); 함수 만들어 사용
-- 프로시져에서 1000과 2500을 받아서 이걸 기준으로 function을 호출. 이걸 기준으로 등급을 매긴걸 출력한다.
-- 1000미만 : c, 1000~2500 : B, 2500이상 : A

-- 펑션부터 짜보고, 쿼리문 미리 짜보고, 프로시져에 복붙 옮기기

select sname, sum(qty), getGrade(sum(qty), 1000, 2500) -- 쿼리문으로 작성후 프로시져에 옮기기전.
from s,spj
where s.sno = spj.sno
group by s.sname;


-- 2. 등급부여는 create functon
select getGrade(2000,1000,3000); -- 기준값, min값, max값 넣어서 펑션 돌려보기
select sgrade(2000,3000,1000); -- min, max 순서 상관없이


call setGrade('london',1000,3000); -- + 도시이름 -- 프로시져 작성후.
call setGrade1('london', 3000, 1000); -- min과 max의 순서를 바꿔도 상관없게.

-- 3. 등급 비교 조건은 prepare, execute, using
-- 그냥에러났을땐 이거, 
call setgrade_Prepare('london', 1000, 3000);
-- 3. 교수님 풀이
call setGrade_Prepare_pro(1000,3000);

-- 4. cursor를 사용. 도시의 공급자 이름과 등급을 모두 출력한다.
call cursor_dept;
call setGrade_cursor(1000, 3000);
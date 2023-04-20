use warehouse;

select * from dept where budget > 8;
select dno, budget from dept;
select emp.dno,dname,budget,eno,ename,salary from dept,emp where dept.dno=emp.dno;
-- from에 테이블이 2개. 그전까진 1개에서 빼왔는데. 두개에서 

select * from emp;
start transaction;
delete from emp where eno = 'E3';
rollback;

select * from s where status < 30;
select * from s where status > 20;

(select * from s where status < 30) union (select * from s where status > 20);
-- 테이블 유형이 같으면 유니온으로 합치기 가능

select * from s where status < 30
union
select * from s where status > 20;
-- 이렇게 해도 되고 cmd 에서도 가능

select sno, sname from s where status < 30
union
select status, city from s where status > 20;
-- 전혀 무의미한 데이터가 된다. 섞여나오네. 문법적 오류는 없으나 컨텐츠상으론 의미없는 데이터가 된다.
-- 유니온은 두 테이블의 결과 데이터, 스키마가 동일해야 의미가 있다!


select A.sno, A.sname, A.status, A.city, B.sno, B.sname, B.status, B.city 
from (select * from s where status < 40) as A 
left join (select * from s where status >20) as B 
on A.sno = B.sno;
-- where b.sno is null;
-- as 생략가능. 별칭
-- B.sno 이름까지 다 넣어보면, 결과창에 B의 s1,s2,s4의  sno, sname 은 강ㅄ이 없기때문에 null이 된다.
-- 이 b가 null인것 중에서 left join은 from 뒤에 있는게 기준. left join 할거를 오른쪽에 적어.
-- 


select A.sno, A.sname, A.status, A.city, B.sno, B.sname, B.status, B.city 
from (select * from s where status < 40) as A 
left join (select * from s where status >20) as B 
on A.sno = B.sno
where b.sno is null;

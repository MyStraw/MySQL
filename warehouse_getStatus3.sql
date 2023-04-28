CREATE DEFINER=`scott`@`%` PROCEDURE `getStatus3`(
in cname varchar(10),
out sumStatus int)
BEGIN
select sum(status)
into sumStatus -- 셀렉트 값을 into라는 변수로 넣었기에 이건 쿼리문이 아니다.
from s
where city=cname;

select sumStatus;

select sum(status)   --  쿼리문이 3개처럼 보이지만 2개다. 이거 2개가 다 출력된다. 탭이 2개 출력
from s
where city = cname;
END
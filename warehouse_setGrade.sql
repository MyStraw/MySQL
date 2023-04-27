CREATE DEFINER=`root`@`localhost` PROCEDURE `setGrade`(
in cname varchar(10), -- 이줄 없애고
in min int,
in max int)
BEGIN

select sname, s.city, sum(qty), getGrade(sum(qty), min, max) -- s.city 없애기
from s,spj
where s.sno = spj.sno
and s.city = cname
group by s.sname;

END
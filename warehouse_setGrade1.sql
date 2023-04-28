CREATE DEFINER=`root`@`localhost` PROCEDURE `setGrade1`(
in cname varchar(10), 
in min int,
in max int)
BEGIN

select sname, sum(qty), sgrade(sum(qty), min, max) 
from s,spj
where s.sno = spj.sno
and s.city = cname
group by s.sname;

END
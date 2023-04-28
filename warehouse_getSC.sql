CREATE DEFINER=`scott`@`%` PROCEDURE `getSC`()
BEGIN
declare ratio int;
set ratio = 15;
if ratio = 10 then
select sno, city from s where status > 20 order by city desc;
else
select sname, status from s where status < 20;
end if;
END
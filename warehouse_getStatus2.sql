CREATE DEFINER=`scott`@`%` PROCEDURE `getStatus2`(
in cname varchar(10),
out sumStatus int)
BEGIN
select sum(status)
into sumStatus
from s
where city=cname;
select sumStatus;
END
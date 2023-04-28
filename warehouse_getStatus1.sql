CREATE DEFINER=`scott`@`%` PROCEDURE `getStatus1`(
in cname varchar(10))
BEGIN
select sum(status)
from s
where city=cname;
END
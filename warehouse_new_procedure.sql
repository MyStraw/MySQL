CREATE DEFINER=`scott`@`%` PROCEDURE `new_procedure`()
BEGIN
select * from s;
select city from s where status > 20;

END
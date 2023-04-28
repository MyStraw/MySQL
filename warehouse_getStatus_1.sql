CREATE DEFINER=`scott`@`%` PROCEDURE `getStatus_1`(
	in cname varchar(10),
	out sumStatus int)
BEGIN
	declare amount int;
	set amount = 0;
	case
		when cname = 'london' then
			set amount = amount + 10;
		when cname = 'paris' then
			set amount = amount + 20;
		when cname = 'oslo' then
			set amount = amount + 30;
		else
			set amount = 5;
end case;

select sum(status)
into sumStatus
from s
where status < amount;

END
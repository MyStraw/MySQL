CREATE DEFINER=`scott`@`%` PROCEDURE `dynamicSQL1`(
in tbl varchar(10), in val int)
BEGIN
	declare stmt varchar(40);
	declare num int;
	set @num = val;
	set @stmt = concat('select * from ' , tbl, ' where qty < ?');
	select @stmt as 'statement';
	prepare st from @stmt;
	execute st using @num;
	deallocate prepare st;
END
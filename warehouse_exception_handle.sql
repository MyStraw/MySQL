CREATE DEFINER=`scott`@`%` PROCEDURE `exception_handle`(in tbl varchar(10))
BEGIN
	declare continue handler for 1146   -- continue 이기 때문에 아래 select * from tbl이 실행된다.
		select 'No table of ', tbl as 'error message';        
	select * from tbl;
   select 1 as a; 
END
CREATE DEFINER=`scott`@`%` PROCEDURE `exception_handle1`(in tbl varchar(10))
BEGIN
	declare exit handler for 1146   -- continue 이기 때문에 아래 select * from tbl 부터 실행된다. exit 이면 그 아래 실행 안된다
		select 'No table of ', tbl as 'error message';        
	select * from tbl;
   select 1 as a; 
END
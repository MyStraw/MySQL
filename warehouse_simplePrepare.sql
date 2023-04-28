CREATE DEFINER=`scott`@`%` PROCEDURE `simplePrepare`()
BEGIN
declare stmt varchar(40); -- 자바의 int s = a+b; 같은. 컴퓨터가 선언해주는거 앞에 declare.
set @stmt = 'select * from emp';
prepare st from @stmt;
execute st;
deallocate prepare st;

END
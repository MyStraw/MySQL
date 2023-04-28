CREATE DEFINER=`scott`@`%` PROCEDURE `dynamicSQL2`(
in tbl varchar(10), in val int, in val2 int)
BEGIN
	declare stmt varchar(40);
	declare num int;
    declare num2 int;
	set @num = val;
    set @num2 = val2;
	set @stmt = concat('select * from ' , tbl, ' where status > ? and status < ?'); -- 위에서부터 순서대로 입력. 순서 잘보셈. 물음표에 val, val2 값들이 순서대로 드간다. from 뒤에 띄우기 반드시!
	select @stmt as 'statement'; -- 에러시 확인용. 
	prepare st from @stmt;
	execute st using @num,@num2; -- using으로 둘다 써야징~. execute는 쿼리문 실행
    
	deallocate prepare st;
END
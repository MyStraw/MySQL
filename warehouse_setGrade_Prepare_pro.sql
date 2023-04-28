CREATE DEFINER=`scott`@`%` PROCEDURE `setGrade_Prepare_pro`(val1 int, val2 int)
BEGIN

	declare qval1 int;
	declare qval2 int;
	declare stmt varchar(256);   
	
   	set @stmt = concat('select s.sno as sno, s.sname as sname, s.city as city, sum(qty) as sum, sgrade(sum(qty), ?, ?)', 
						'from s,spj	where s.sno = spj.sno group by s.sno');
	set @qval1 = val1;
	set @qval2 = val2;
    select @stmt as statement; -- 에러시 확인용?
    
prepare st from @stmt;
execute st using  @qval1, @qval2; -- 이거 순서로 물음표에 들어가는구나
deallocate prepare st;

END
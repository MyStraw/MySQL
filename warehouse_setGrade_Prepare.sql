CREATE DEFINER=`scott`@`%` PROCEDURE `setGrade_Prepare`(
in cname varchar(10), 
in min int,
in max int)
BEGIN

	declare stmt varchar(60);
	declare minn int;
	declare maxx int;
    declare city int;
	set @minn = min;
	set @maxx = max;
    set @city = cname;
	set @stmt = 'select sname, sum(qty), sgrade(sum(qty), ?, ?) 
	from s,spj
	where s.sno = spj.sno
	and s.city = ?
	group by s.sname;';

select @stmt as 'error'; -- 에러시 확인용?
prepare st from @stmt;
execute st using  @minn, @mixx, @city; -- 이거 순서로 물음표에 들어가는구나

deallocate prepare st;

END
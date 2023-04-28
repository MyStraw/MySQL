CREATE DEFINER=`scott`@`%` PROCEDURE `setGrade_cursor`(
in val1 int,
in val2 int)
BEGIN

	declare endRow boolean default false;
	declare sno char(4);
	declare sname char(10);
    declare sumqty int;
    declare grade char(1);
    declare scursor cursor for
		select s.sno as sno, s.sname as sname, sum(qty) as sum, sgrade(sum(qty), val1, val2)
        from spj, s
        where spj.sno = s.sno and s.city = city
        group by s.sno;
	declare continue handler for not found set endRow = true;
    open scursor;
		curLoop : loop
			fetch scursor into sno, sname, sumqty, grade;
			if endRow then leave curLoop;
			end if;
        
			select sno, sname, sumqty, grade;
            
		end loop curLoop;
    close scursor;
END
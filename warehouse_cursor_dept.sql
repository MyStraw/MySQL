CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_dept`()
BEGIN
	declare bsum int default 0;
    declare b int;
    declare endRow int default 0;
    declare dcursor cursor for select budget from dept;
    declare continue handler for not found set endrow = 1;
    open dcursor;
    cursorLoop : loop
		fetch dcursor into b;
        if endRow then leave cursorLoop; -- endRow에 도달하면 cursorLoop 탈출
        end if;
        select b as 'budget';
        set bsum = bsum + b;
	end loop cursorLoop;
    select bsum as 'total sum of budget';
    close dcursor;
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `findLevel`()
BEGIN
	declare x varchar(10);
    declare outLevel varchar(10);
    set x = 'DB';
    call getBudgetLevel(x,outLevel);
    select outLevel;

END
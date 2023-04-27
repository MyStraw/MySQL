CREATE DEFINER=`root`@`localhost` FUNCTION `bLevel`(money int) RETURNS varchar(10) CHARSET utf8mb3 COLLATE utf8mb3_unicode_ci
    DETERMINISTIC
BEGIN

	declare bl varchar(10);
    if money < 20 then set bl = 'silver';
    elseif money < 40 then set bl = 'gold';
    else set bl = 'platinum';
    end if;

RETURN bl;
END
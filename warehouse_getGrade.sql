CREATE DEFINER=`root`@`localhost` FUNCTION `getGrade`(result int, v1 int, v2 int) RETURNS char(2) CHARSET utf8mb3 COLLATE utf8mb3_unicode_ci
    DETERMINISTIC
BEGIN

declare grade char(2);

	if result >= v2 then set grade = 'A';
	elseif result < v1 then set grade = 'C';
	else set grade = 'B';
	end if;

return grade;
END
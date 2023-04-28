CREATE DEFINER=`root`@`localhost` FUNCTION `sgrade`(qty int, val1 int, val2 int) RETURNS char(1) CHARSET utf8mb3 COLLATE utf8mb3_unicode_ci
    DETERMINISTIC
BEGIN
declare grade char(1);
declare maxval, minval int;

if (val1 < val2) then
set maxval = val2, minval = val1;
else
set maxval = val1, minval = val2;
end if;

case 
when maxval <= qty then set grade='A';
when minval <= qty and qty < maxval then set grade='B';
else set grade = 'C';
end case;

RETURN grade;
END
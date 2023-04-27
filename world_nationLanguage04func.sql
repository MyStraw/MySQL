CREATE DEFINER=`root`@`localhost` FUNCTION `nationLanguage04func`(nation varchar(52)) RETURNS double
    DETERMINISTIC
BEGIN
declare per double;

	select max(Percentage)
    into per
	from countrylanguage, country
	where code = countrycode
    and name = nation;   
    
    return per;
END
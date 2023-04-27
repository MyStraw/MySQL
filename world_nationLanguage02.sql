CREATE DEFINER=`scott`@`%` PROCEDURE `nationLanguage02`(
in kor varchar(20))
BEGIN
	select language, IsOfficial, Percentage
	from countrylanguage, country
	where code = countrycode
    and name = kor
    order by percentage desc;
    
	    
END
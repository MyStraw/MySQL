CREATE DEFINER=`scott`@`%` PROCEDURE `nationLanguage01`()
BEGIN	
    select language, IsOfficial, Percentage
	from countrylanguage, country
	where code = countrycode
	and name = 'south korea';    
END
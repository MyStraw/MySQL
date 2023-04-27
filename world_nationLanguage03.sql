CREATE DEFINER=`scott`@`%` PROCEDURE `nationLanguage03`(
in nation varchar(20), 
out per double)
BEGIN

	select max(Percentage)
    into per
	from countrylanguage, country
	where code = countrycode
    and name = nation;   
    
    select per;
	    
END
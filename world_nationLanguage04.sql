CREATE DEFINER=`root`@`localhost` PROCEDURE `nationLanguage04`(
in nation varchar(52),
out per double)
BEGIN

select nationLanguage04func(nation) into per;

END
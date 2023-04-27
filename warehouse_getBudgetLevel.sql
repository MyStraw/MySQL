CREATE DEFINER=`root`@`localhost` PROCEDURE `getBudgetLevel`(in deptName varchar(20),
out deptLevel varchar(20))
BEGIN
	declare dmoney int;
    select budget into dmoney
    from dept where dname = deptName;
    
    select bLevel(dmoney)
    into deptLevel;
    
    select deptLevel;
END
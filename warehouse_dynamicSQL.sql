CREATE DEFINER=`scott`@`%` PROCEDURE `dynamicSQL`(
	in tbl varchar(10))
BEGIN
	declare stmt varchar(40);
    set @stmt = concat('select * from', tbl);
    select @stmt as 'statement';
    prepare st from @stmt; -- prepare로 변수를 준비하고
    execute st; -- 이걸로 변수 실행
    deallocate prepare st;

END
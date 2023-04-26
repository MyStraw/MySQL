-- 테이블이 없을때 에러 1146으로 처리할것이다. https://dev.mysql.com/doc/refman/5.7/en/error-message-elements.html

call exception_handle('df');

select 1 as a; -- 이건 넣어서 걍 실행되는지 볼때 사용하는 용도 (그냥 select 1)

-- // 175p //-----------------------------------

call simplePrepare;

call dynamicSQL('s');

call dynamicSQL1('spj',300);

call dynamicSQL2('s', 10, 30);
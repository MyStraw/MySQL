-- 테이블이 없을때 에러 1146으로 처리할것이다. https://dev.mysql.com/doc/refman/5.7/en/error-message-elements.html

call exception_handle('df');

select 1 as a; -- 이건 넣어서 걍 실행되는지 볼때 사용하는 용도 (그냥 select 1)

-- // 175p //-----------------------------------

call simplePrepare;

call dynamicSQL('s');

call dynamicSQL1('spj',300);

call dynamicSQL2('s', 10, 30); -- select(에러났는지 확인용)와 execute(실제 쿼리문)랑 테이블 2개가 나온다. 테이블탭 잘 봐보셈.
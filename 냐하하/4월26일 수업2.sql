-- 11.8--
call getStatus_1('busan',@total); -- begin 부터 내려가보면 busan은 없으니 else 에서 amount = 5가 나온다. 그냥 시티이름을 얻기위한 조건에 불과. 밑에 select into.에서
-- status 값이 5보다작은걸 찾아서 합한걸 sumStatus로 선언하는건게, 5보다 작은값 가진게 하나도 없잖니. 그러니 null
select @total;

-- 11.9--
call getQtySum(1000);

use sampledb;

select prod_name, vend_name, prod_price, quantity
from orderitems, products, vendors
where products.vend_id = vendors.vend_id
and orderitems.prod_id=products.prod_id
and order_num=20007
order by quantity desc, prod_name asc; -- 1차로 수량으로 desc 하고 2차고 name asc 한겨
-- 디폴트가 asc... 생략가능

-- 그룹으로 묶어보기
SELECT vend_name, order_num, round(SUM(prod_price),1), truncate(AVG(prod_price),3)
FROM orderitems, products, vendors
WHERE
products.vend_id = vendors.vend_id
aND orderitems.prod_id = products.prod_id
AND order_num = 20007
GROUP BY vend_name; -- 집계함수랑 써야지. 묶은담에 집계를 추출하는거니까 select에 뭘 골라올지 다시 잘 봐야지

-- step by step
select prod_id, quantity, item_price
from orderitems
where order_num = 20007;

select products.prod_id, orderitems.quantity, orderitems.item_price
from orderitems, products
where products.prod_id = orderitems.prod_id
and order_num=20007;

select vendors.vend_name, products.prod_id, orderitems.quantity, orderitems.item_price
from orderitems, products, vendors
where products.vend_id = vendors.vend_id
and products.prod_id=orderitems.prod_id
and order_num=20007;





select order_num
from orderitems
where prod_id='RGAN01';
-- 구매이력

SELECT cust_id
FROM orders
WHERE order_num IN (20007,20008);
-- 구매한 고객의 아이디 찾았고

select cust_name, cust_contact
from customers
where cust_id in ('1000000004', '1000000005');
-- 그 회사의 컨택포인트

-- 테이블을 타고 타고 가서 원하는걸 찾는것.


SELECT 
    cust_name,
    cust_state,
    (SELECT 
            COUNT(*)
        FROM
            orders
        WHERE
            orders.cust_id = customers.cust_id) AS orders
FROM
    Customers
ORDER BY cust_name;






select cust_name, cust_state
from customers
order by cust_name;
use sampledb;
-- ppt 85. 같은쿼리. 중첩질의->조인
SELECT 
    cust_name, cust_contact
FROM
    customers
WHERE
    cust_id IN (SELECT 
            cust_id
        FROM
            orders
        WHERE
            order_num IN (SELECT 
                    order_num
                FROM
                    orderitems
                WHERE
                    prod_id = 'RGAN01'));
                    
-- 같은거 2번째꺼--
                    
select cust_name, cust_contact
from customers, orders, orderitems
where customers.cust_id = orders.cust_id
and orderitems.order_num = orders.order_num
and prod_id = 'RGAN01';               

-- 같은거 3번째꺼--

select cust_name, cust_contact
from customers
join orders using (cust_id) -- cust_id 에서 customers 와 orders
join orderitems using (order_num) -- order_num 에서 orderitems와 orders
where prod_id = 'RGAN01';   




-- 년, 월별 주문량--


select count(*), year(order_date), month(order_date)
from orders
group by month(order_date), year(order_date)
order by year(order_date), month(order_date);

select cust_id, count(*), year(order_date), month(order_date)
from orders, customers
where customers.cust_id = orders.cust_id 
group by month(order_date), year(order_date), orders.cust_id
order by year(order_date), month(order_date), orders.cust_id;
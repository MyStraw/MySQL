use sampledb;

select cust_id, cust_name, cust_contact
from customers
where cust_name=
(select cust_name
from customers
where cust_contact = 'Jim Jones');

select c1.cust_id, c1.cust_name, c1.cust_contact
from customers as c1, customers as c2
where c1.cust_name = c2.cust_name
and c2.cust_contact='Jim Jones';



-- 94 outer join, left join 왼쪽 A 기준--
select customers.cust_id, orders.order_num
from customers, orders
where customers.cust_id = orders.cust_id;


select customers.cust_id, orders.order_num
from customers
left outer join orders
on customers.cust_id=orders.cust_id;

-- 95 outer join, right join 오른쪽 B 기준--

select customers.cust_id, orders.order_num
from customers
right outer join orders
on customers.cust_id=orders.cust_id;

-- 복합 질의, union--
select cust_name, cust_contact, cust_email
from customers
where cust_state in('IL', 'IN', 'MI');

select cust_name, cust_contact, cust_email
from customers
where cust_name='Fun4All';


select cust_name, cust_contact, cust_email
from customers
where cust_state in('IL', 'IN', 'MI')
union
select cust_name, cust_contact, cust_email
from customers
where cust_name='Fun4All';

select cust_name, cust_contact, cust_email
from customers
where cust_state
in ('IL', 'IN', 'MI')
or cust_name='Fun4All';


-- union all은 중복을 제거 안한다--
select cust_name, cust_contact, cust_email
from customers
where cust_state in('IL', 'IN', 'MI')
union all
select cust_name, cust_contact, cust_email
from customers
where cust_name='Fun4All'
order by cust_name, cust_contact;
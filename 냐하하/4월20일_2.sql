-- ppt 74부터. join의 이해, sampledb
use sampledb;

SELECT vend_name, prod_name, prod_price
FROM Vendors, Products
WHERE Vendors.vend_id = Products.vend_id;

-- join 키워드를 쓰면? 위와 똑같게.

select vend_name, prod_name, prod_price
from vendors as a
join products as b
on a.vend_id = b.vend_id;
-- 그냥 join은 기본값이 inner join이다.

-- inner join 으로 써도~

select vend_name, prod_name, prod_price
from (select * from vendors) as a 
inner join (select * from products) as b
on a.vend_id = b.vend_id;
-- 그냥 join써도 같다. 


-- left (outer) join 디폴트가 outer. outer는 mysql에서 인식을 못한다. 그냥 left join

SELECT vend_name, prod_name, prod_price
FROM Vendors
JOIN Products USING (vend_id);
-- 결국 이것도 위와같은 조인
-- from에 있는놈도, join에 있는점도 


-- where 빼버리면? a와 b의 공통된 필드를 where로 정해주고 가져와야 하는데
-- 조건 없이 가져오면 그냥 곱으로 모든 가능성의 테이블을 다 가져온다.

SELECT vendors.vend_id as v, products.vend_id as p, vend_name, prod_name, prod_price
FROM Vendors, Products;


SELECT vendors.vend_id as v, products.vend_id as p, vend_name, prod_name, prod_price
FROM Vendors, Products
WHERE Vendors.vend_id = Products.vend_id;





select *
from vendors, products
where vendors.vend_id= products.vend_id
and vend_state='ca'; -- vend 업체가 ca인 업체만 뽑기. 부가적 조건은 and로 게속 붙이면 돼

-- natural join

select *
from vendors
narural join products;
-- 위처럼 곱이 아닌 같은 필드는 1개만 써주고 나머진 그냥 뒤에 붙여줘.
-- 하지만 스키마를 완벽히 잘 알아야 한다. 그래서잘 안쓴다.


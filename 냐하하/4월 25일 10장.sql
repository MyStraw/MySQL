create view good_supplier as
select sno, status, city from s where status > 15;
-- s를 drop 하면 , 이 view 가 유효하지 않아서 이제 실행이 안된다.


-- 125p 4번 뷰로 만들기 --

create view colorful_city as
select distinct color, city
from p;

update p set color = 'Yellow'
where pno='p6';

insert into p (pno, pname, color, weight, city)
values ('p7', 'Nut', 'Yellow', 12.5, 'seoul');

-- 이렇게 추가하니까 view도 자연히 바뀐다. view는 쿼리를 저장하는것.

use world;

-- 앞에서 문제풀이 했던거 다 view로 만들어놔봥~

-- 1--
create view nationlang_exists as
select language, IsOfficial, Percentage
from countrylanguage
where exists (select * from country where name = 'south korea' and code = countrycode);

-- 2--
create view nationlang_join as
select language, IsOfficial, Percentage
from countrylanguage
join country 
on (name = 'south korea' and code = countrycode);

-- 3--
create view nationlang_and as
select language, IsOfficial, Percentage
from countrylanguage, country
where code = countrycode
and name = 'south korea';


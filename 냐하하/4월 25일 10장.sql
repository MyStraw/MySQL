create view good_supplier as
select sno, status, city from s where status > 15;
-- s를 drop 하면 , 이 view 가 유효하지 않아서 이제 실행이 안된다.


-- 125p 4번 뷰로 만들기 --

create view colorful_city as
select distinct color, city
from p


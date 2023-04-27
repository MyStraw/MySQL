use world;

-- 국가명 'south Korea'에서사용되는 언어를 검색해서 , language, isofficial, percentage를 출력하는 프로시저를 작성하세요.
call nationLanguage01();

-- 프로시저 위에꺼에서 국가이름만 입출력 받아서--
call nationLanguage02('china');

-- 프로시저 nationLanguage02() 에서 출력 파라미터에 가장 높은 percentage를 되돌려 주도록 수정하세요.
call nationLanguage03('japan', @percent); -- 앞의 매개변수가 in으로 받아오는거, percent가 out으로 내보내는거.


-- 프로시저 nationLanguage03() 에서 가장 높은 percentage를 가져오는 함수를 호출하는 방식으로 수정하세요. 이건 내일
select nationLanguage04func('japan');

-- procedure, function 차이?
select name, nationLanguage04func(name)
from country
where nationLanguage04func(name) > 90.0
order by nationLanguage04func(name) desc;
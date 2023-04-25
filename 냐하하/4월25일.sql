use world;

-- 국가코드가 'KOR'인 도시를 찾아 인구수를 역순으로 표시하세요. 
select population
from city
where CountryCode = 'KOR'
order by population desc;

-- city 테이블에서 국가코드와 인구수를 출력하라. 정렬은 국가코드 별로 오름차순으로, 동일한 코드(국가) 안에서는 인구수의 역순으로 표시하라.
select CountryCode, population
from city
order by countrycode, population desc;

-- city 테이블에서 국가코드가 'KOR', "CHN", 'JPN'인 도시를 찾으세요.
select name
from city
where countrycode in('KOR','CHN','JPN');

-- 한국에서 사용되는 언어를 검색해서, language, isoffiial, percentage를 아래 방법으로 모두 출력하세요.결과 2개
-- Name = 'south korea'
-- 방법3개로. exsits, join on, 그냥 다 



-- 방법1--
select language, IsOfficial, Percentage
from countrylanguage
where exists (select * from country where name = 'south korea' and code = countrycode);

-- 방법2--
select language, IsOfficial, Percentage
from countrylanguage
join country 
on (name = 'south korea' and code = countrycode);

-- 방법3--
select language, IsOfficial, Percentage
from countrylanguage, country
where code = countrycode
and name = 'south korea';



-- ////////////////////////////////////////////////////////////////////////////////////////

-- city 테이블에서 국가코드가 'KOR'인 도시의 수를 표시하세요.
select count(name)
from city
where countrycode = 'kor';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하세요.
select sum(population)
from city
where countrycode = 'kor';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하세요. 단 결과를 나타내는 테이블의 필드는 '최소값'으로 표시하게요
select min(population) as '최소값'
from city
where countrycode = 'kor';


-- city 테이블에서  국가코드가 'kor'인 도시들의 평균을 구하세요
select avg(population)
from city
where countrycode = 'kor';



-- /////////////////////////////////////////////////////////

-- city 테이블에서 국가코드가 'kor'인 도시의 수를 표시하세요.
select count(name)
from city
where countrycode='kor';

-- city 테이블에서 국가별 도시의 수를 표시하세요.
select countrycode, count(name)
from city
group by countrycode;


-- city 테이블에서 국가별 도시의 수를 표시하고, 국가명도 같이 표시하세요.
select count(city.name), country.name as "국가명"
from city, country
where code = countrycode
group by countrycode;


-- 도시의 수가 10개  이상인 국가에 대해서, city 테이블에서  국가별 도시의 수를 표시하고, 국가명도같이 표시하세요.
select count(city.name), country.name as "국가명"
from city, country
where code = countrycode
group by countrycode
having count(city.name)>=10
order by  count(city.name);


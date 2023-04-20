select population from country where population;

SELECT count(Continent)
FROM Country
WHERE Continent LIKE 'A%';

SELECT count(Continent)
FROM Country
WHERE Continent LIKE '%A';

SELECT count(Continent)
FROM Country
WHERE Continent LIKE '___A';

SELECT count(Continent)
FROM Country
WHERE Continent LIKE 'A___';

SELECT Continent, Name, Population, GNP
FROM Country
WHERE Continent LIKE 'A___';

select name 
from country 
where name like 'A_g%';

select concat(name, '(' , Continent, ')', population, ';', gnp ,';')
from country
order by name;

select CONCAT(name, '(', Continent, ')', Population) AS nation
from Country
ORDER BY Name;

SELECT Continent, Name, (Population/SurfaceArea) AS pd
FROM Country
ORDER BY pd DESC, SurfaceArea DESC;


select *
from country
where SurfaceArea <1.0;

select name, upper(left(name,2)) as Alias, length(name) as Len
from country order by len desc
limit 10;

select name, length(name) as Len
from country
where surfacearea>100
order by length(name) Desc
limit 10;

select name, round(sqrt(surfacearea),2)
from country
order by surfacearea desc;

SELECT
    ROUND(AVG(population), 2) AS 평균,
    MIN(population) as 최소,
    MAX(Population) as 최대,
    COUNT(*),
    SUM(population) as 총인구
FROM
    country
WHERE
    population > 10000000;
    
    
    
    
    
    
SELECT 
    Continent, 
    COUNT(*) AS nation_count
FROM
    country
GROUP BY Continent;
    



SELECT 
    ROUND(AVG(population), 2) AS 평균,
    MIN(population) AS 최소,
    MAX(Population) AS 최대,
    COUNT(*),
    SUM(population) AS 총인구
FROM
    country
WHERE
    population > 10000000
GROUP BY continent
HAVING COUNT(*) >= 2;






select Continent, Count(*) as 나라수
from country
where Population>10000000
group by Continent
having 나라수 >= 2;




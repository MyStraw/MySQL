use sakila;
select CONCAT(FIRST_NAME, " ", last_name) as name, last_update as ymd
from actor
WHERE year(last_update)=2006 LIMIT 10;

select CONCAT(address, " ", address2) as id, last_update as ymd
from address
WHERE second(last_update)=27 LIMIT 10;

SELECT 
    CONCAT(first_name, '_', last_name) AS 이름,
    YEAR(last_update) AS 년,
    MONTH(last_update) AS 월,
    DAY(last_update) AS 일,
    HOUR(last_update) AS 시,
    MINUTE(last_update) AS 분,
    SECOND(last_update) AS 초
FROM
    actor
WHERE
    YEAR(last_update) = 2006
ORDER BY 이름 ASC
LIMIT 20;


    
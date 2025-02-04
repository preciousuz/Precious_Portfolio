#World Life Expectancy Project (Data Cleaning )
SELECT * 
FROM world_life_expectancy.world_life_expectancy_1;

select *
from world_life_expectancy_1
;

select country, year, concat(country, year)
from world_life_expectancy_1
;

select country, year, concat(country, year), count(concat(country, year))
from world_life_expectancy_1
group by country, year, concat(country, year)
having count(concat(country, year)) >1
;

select *
from (select row_id,
concat(country, year),
ROW_NUMBER() over(partition by concat(country,year) ORDER BY concat(country, year)) as Row_Num
from world_life_expectancy_1) as row_table
where row_num >1;

Delete From world_life_expectancy_1
where
Row_ID in ( select Row_ID 
from (select row_id,
concat(country, year),
ROW_NUMBER() over(partition by concat(country,year) ORDER BY concat(country, year)) as Row_Num
from world_life_expectancy_1) as row_table
where row_num >1)
;

select *
from world_life_expectancy_1
;

select *
from world_life_expectancy_1
where Status = '';

select distinct(Status)
from world_life_expectancy_1
where Status <> '';

select distinct(Country)
from world_life_expectancy_1
where Status = 'developing';

update world_life_expectancy_1
set status = 'developing'
where country in (select distinct(Country)
from world_life_expectancy_1
where Status = 'developing');

update world_life_expectancy_1 t1 
join world_life_expectancy_1 t2 
on t1.country = t2.country 
set t1.status = 'developing' 
where t1.status = '' 
and t2.status <> ''
and t2.status = 'developing'
;

select *
from world_life_expectancy_1
where status = ''
;

select *
from world_life_expectancy_1
where country = 'United States of America'
;

update world_life_expectancy_1 t1 
join world_life_expectancy_1 t2 
on t1.country = t2.country 
set t1.status = 'developed' 
where t1.status = '' 
and t2.status <> ''
and t2.status = 'developed'
;

select *
from world_life_expectancy_1
where `life expectancy` = ''
;

select country, year, `life expectancy`
from world_life_expectancy_1
where `life expectancy` = ''
;

select t1.country, t1.year, t1.`life expectancy`,
t2.country, t2.year, t2.`life expectancy`,
t3.country, t3.year, t3.`life expectancy`,
round((t2.`life expectancy` + t3.`life expectancy`)/2,1)
from world_life_expectancy_1 t1
join world_life_expectancy_1 t2
on t1.country = t2.Country
and t1.Year = t2.Year -1
join world_life_expectancy_1 t3
on t1.country = t3.country
and t1.Year = t3.Year +1
where t1.`Life expectancy` = ''
;

update world_life_expectancy_1 t1
join world_life_expectancy_1 t2
on t1.country = t2.Country
and t1.Year = t2.Year -1
join world_life_expectancy_1 t3
on t1.country = t3.country
and t1.Year = t3.Year +1
set t1.`life expectancy` = round((t2.`life expectancy` + t3.`life expectancy`)/2,1)
where t1.`life expectancy` = ''
;

select *
from world_life_expectancy_1
#where `life expectancy` = ''
;
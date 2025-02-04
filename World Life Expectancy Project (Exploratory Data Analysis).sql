#World Life Expectancy Project (Exploratory Data Analysis)
SELECT * 
FROM world_life_expectancy.world_life_expectancy_1
;

SELECT country, 
min(`Life expectancy`), 
max(`life expectancy`),
round(max(`life expectancy`) - min(`life expectancy`),1) as Life_Increase_Over_15_Years
FROM world_life_expectancy_1
group by country
having min(`Life expectancy`) <> 0
and max(`life expectancy`) <> 0
order by Life_Increase_Over_15_Years asc
;

Select year, round(avg(`life expectancy`),2)
from world_life_expectancy_1
group by year
order by year 
;

Select year, round(avg(`life expectancy`),2)
from world_life_expectancy_1
where `Life expectancy` <> 0
and `life expectancy` <> 0
group by year
order by year
;

select *
from world_life_expectancy_1
;

select country, round(avg(`life expectancy`),1) as Life_Exp, round(avg(gdp),1) as gdp
from world_life_expectancy_1
group by country
having Life_exp > 0
and gdp > 0
order by gdp desc
;

select 
Sum(Case When gdp >= 1500 then 1 else 0 end) High_GDP_Count,
Avg(Case When GDP >= 1500 then `Life expectancy` else NULL end) High_GDP_Life_Expectancy,
Sum(Case When gdp <= 1500 then 1 else 0 end) Low_GDP_Count,
Avg(Case When GDP <= 1500 then `Life expectancy` else NULL end) Low_GDP_Life_Expectancy
from world_life_expectancy_1
;

Select Status, round(avg(`life expectancy`),1)
FROM world_life_expectancy_1
Group by status
;

Select Status, count(distinct country), round(avg(`life expectancy`),1)
FROM world_life_expectancy_1
Group by status
;

Select *
from world_life_expectancy_1
;

select country, round(avg(`life expectancy`),1) as Life_Exp, round(avg(BMI),1) as BMI
from world_life_expectancy_1
group by country
having Life_exp > 0
and BMI > 0
order by BMI ASC
;

sELECT COUNTRY,
YEAR,
`LIFE EXPECTANCY`,
`ADULT MORTALITY`,
sum(`Adult Mortality`) OVER(partition by Country ORDER BY Year) AS ROLLING_TOTAL
FROM world_life_expectancy_1
WHERE Country LIKE '%UNITED%'
;



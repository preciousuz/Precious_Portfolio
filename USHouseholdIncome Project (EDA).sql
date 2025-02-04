#US Household Project (EDA)

sELECT*
FROM us_household_income
;

SELECT *
FROM us_household_income_statistics
;

sELECT STATE_NAME, sum(ALAND), sum(AWATER)
FROM us_household_income
group by State_Name
ORDER BY 3 DESC
LIMIT 10
;

sELECT STATE_NAME, sum(ALAND), sum(AWATER)
FROM us_household_income
group by State_Name
ORDER BY 3 DESC
LIMIT 10
;

sELECT*
FROM us_household_income u
right JOIN us_household_income_statistics us
  ON u.id =us.id
  where u.id is null
;
sELECT u.State_Name, county, type, `primary`, mean, median
FROM us_household_income u
inner JOIN us_household_income_statistics us
  ON u.id =us.id
  where mean <> 0
;

sELECT u.State_Name, round(avg(mean),1), round(avg(median),1)
FROM us_household_income u
inner JOIN us_household_income_statistics us
  ON u.id =us.id
  where mean <> 0
  group by u.State_Name
  order by 3 asc
limit 10;
  
sELECT type, count(type), round(avg(mean),1), round(avg(median),1)
FROM us_household_income u
inner JOIN us_household_income_statistics us
  ON u.id =us.id
  where mean <> 0
  group by 1
  order by 3 desc
limit 20;  
  
  
  sELECT type, count(type), round(avg(mean),1), round(avg(median),1)
FROM us_household_income u
inner JOIN us_household_income_statistics us
  ON u.id =us.id
  where mean <> 0
  group by 1
  having count(Type) >100
  order by 4 desc
limit 20;

select *
from us_household_income
where type = 'community';

select u.State_Name, city, round(avg(mean),1), round(avg(median),1)
from us_household_income u
join us_household_income_statistics us
on u.id =us.id
group by u.State_Name, city
order by 3 desc;

sELECT*
FROM us_household_income
;

SELECT *
FROM us_household_income_statistics
;


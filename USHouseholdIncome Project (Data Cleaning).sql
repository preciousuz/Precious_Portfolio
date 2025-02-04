# US Household Income Data Cleaning

SELECT *
FROM us_project.us_household_income;

SELECT * 
FROM us_project.us_household_income_statistics;

SELECT *
FROM us_project.us_household_income;

Alter table us_household_income_statistics rename column `ï»¿id` to `id`;

SELECT count(id)
FROM us_project.us_household_income;

SELECT count(id)
FROM us_project.us_household_income_statistics;

Select ID, count(id)
from us_household_income
group by id
having count(id) >1
;

Delete from us_household_income
where row_id in (
select row_id
from (
Select row_id, 
id,
row_number() over(partition by id order by id) row_num
from us_project.us_household_income) duplicates
where row_num >1)
;

select id, count(id)
from us_household_income_statistics
group by id
having count(id) >1
;

select distinct state_name
from us_household_income
;

update us_household_income
set state_name = 'Georgia'
where state_name = 'georia'
;

update us_household_income
set state_name = 'Alabama'
where state_name = 'alabama'
;

select *
from us_household_income
;

select distinct state_ab
from us_household_income
order by 1
;

select *
from us_household_income
where county = 'Autauga County'
order by 1
;

update us_household_income
set place = 'Autaugaville'
where county = 'Autauga County'
and city = 'vinemont'
;

select type, count(type)
from us_household_income
group by type
;

update us_household_income
set type = 'Borough'
where type = 'Boroughs'
;

select *
from us_household_income
;

select ALand, AWater
from us_household_income
where awater = 0 or AWater = '' or AWater is null
and ALand = 0 or ALand = '' or aland is null
;


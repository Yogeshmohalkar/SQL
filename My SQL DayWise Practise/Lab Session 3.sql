use classicmodels;
select * from customers;

select distinct 
country 
from customers
where country like 'A%' or country like'B%'or country like 'C%' 
order by country;


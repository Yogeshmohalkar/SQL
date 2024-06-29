use classicmodels;
select * from customers;

select 
      customerNumber,creditLimit,
      case
          when creditLimit > 100000 then 'High'
          when creditLimit between 25000 and 100000 then 'Medium'
		  when creditLimit < 25000 then 'low'
      end as Cusromer_Type
from customers;
      
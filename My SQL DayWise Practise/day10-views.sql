# Views
/*
Virtual table created by the named query
Operated similar to base table but does not contain any data of its own
*/

# Commands
-- CREATE VIEW

create view view1
as
select
     customerNumber,customerName
from customers c
where exists (
      select 
           o.orderNumber,
           sum( d.quantityOrdered * d.priceEach ) as Total_Value
      from orders o inner join orderdetails d on o.orderNumber = d.orderNumber 
      where o.customerNumber = c.customerNumber
      group by o.orderNumber
      having Total_Value > 60000
);

-- ACCESS DATA FROM THE VIEW

select * from view1;
select customerNumber from view1;
select count(customerNumber) from view1;


-- ALTER VIEW

alter view view1
as
select
     customerNumber,customerName,phone
from customers c
where exists (
      select 
           o.orderNumber,
           sum( d.quantityOrdered * d.priceEach ) as Total_Value
      from orders o inner join orderdetails d on o.orderNumber = d.orderNumber 
      where o.customerNumber = c.customerNumber
      group by o.orderNumber
      having Total_Value > 60000
);

select * from view1;

-- DROP VIEW

drop view view1;  















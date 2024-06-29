-- Use classicmodels. Find the total amount for each month of each year from payments table.

use classicmodels;
select * from payments;

select
    year(paymentDate) as `Year`,
	monthname(paymentDate) `Month`,
     sum(amount) as TotalAmount
from payments
group by `Year`,`Month` , month(paymentDate)
order by `Year` asc , month(paymentDate) asc;
 

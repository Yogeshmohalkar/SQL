# Subquery
/*
-- A query nested within another query or subquery
-- Must be enclosed in parenthesis
-- Inner query: Subquery 	Outer query: Containing query
*/

use classicmodels;
select * from customers limit 10 ;
select customernumber from customers limit 10;
select customername from customers where customernumber = 112 ;


# Independent Subqueries: 
/*
- executed as standlone subquery.
- inner query is executed first and then outer query
*/
# with SELECT 
-- 1. % of total sales (quantityOrdered) and revenure (quantityOrdered * priceEach) for each productLine

select 
      productline,
      sum(quantityOrdered) as Total_sale,
      sum(quantityOrdered * priceEach) as Total_Revenue 
from products p 
inner join orderdetails d on p.productcode = d.productcode
group by productline ;

-- FINAL ANSWER 
select 
      productline,
      sum(quantityOrdered)/ ( select sum(quantityOrdered) from Orderdetails ) * 100  as `%_Total_sale`,
      sum(quantityOrdered * priceEach)/ (select sum(quantityOrdered * priceEach)from orderdetails) * 100 as `%_Total_Revenue` 
from products p 
inner join orderdetails d on p.productcode = d.productcode
group by productline ;
    
select sum(quantityOrdered) from orderdetails ; -- '105516' TOTAL_SALE
select sum(quantityOrdered * priceEach)from orderdetails ; --  '9604190.61' TOTAL REVENUE

-- IN CASE , IF WE WANT TO REDUCE DECIMAL NUMBER OR (ROUND/TRUNCATE) THE VALUES WE  USE(ROUND/TRUNCATE)
select 
      productline,
      round( sum(quantityOrdered)/ ( select sum(quantityOrdered) from Orderdetails ) * 100 , 2) as `%_Total_sale`,
	  truncate( sum(quantityOrdered * priceEach)/ (select sum(quantityOrdered * priceEach)from orderdetails) * 100, 2) as `%_Total_Revenue` 
from products p 
inner join orderdetails d on p.productcode = d.productcode
group by productline ;


# with WHERE Clause
-- > MySQL subquery with comparison operators
-- 2.The customers with payments greater than average payment.
    
    select * from payments;
    -- STEP 1 : 
select
	  customerNumber,
	  amount
from payments
where amount > avg(payments);

-- FIRST FIND AVG [ STEP 2 ]

select avg(amount) from payments;

-- STEP3

select
	  customerNumber,
	  amount
from payments
where amount > '32431.645531'; -- WE CANNOT WRITE THIS VALUE BECAUSE IT CAN BE UPDATED TIMTE TO TIME

-- STEP 4

select
	  customerNumber,
	  amount
from payments
where amount > (select avg(amount) from payments);  -- INSTEAD OF WRITING VALUE SUB-QUERY MUST BE WRITEN HERE.

-- > MySQL subquery with IN and NOT IN operators
-- 3. Find the customers who have not placed any orders as follows
-- find out the customer number who are not in the list of customers with orders.
select 
     customernumber
from customers
where customerNumber not in (select distinct customernumber from orders) ;

# with FROM clause
-- TOP N SUBCATEGORIES OF EVERY CATEGIRIE 
use day3;
select * from myemp;
-- 4. Find top 3 paid employees from every department

-- FIRST CREATE DERIVED TABLE AND PIUTN INTO FROM() CLAUSE.
select 
     DEP_ID,
     EMP_ID,
     SALARY,
	 Dense_Rank() over ( partition by  DEP_ID  order by salary desc ) DRANK
from myemp ; -- THIS IS CALLED AS DERIVED TABLE . [not answer]

select *  
from(select    -- here you should take the main query as a inner query in from() clause and in outer clause you write where conditon.
     DEP_ID,
     EMP_ID,
     SALARY,
	 Dense_Rank() over ( partition by  DEP_ID  order by salary desc ) DRANK
from myemp) t1  -- pase derived table into from () give alies name otherwise uit eill throw error.
where DRANK <= 3 ; -- here add where clause to get top 3 


-- 5. Find top 3 selling products from each productline

# Coorelated Subqueries: 
/*
-  A correlated subquery is a subquery that uses the data from the outer query.
-  A correlated subquery is evaluated once for each row in the outer query.
*/

USE CLASSICMODELS;
SELECT * FROM PRODUCTS;
-- 	6. Select products whose buy prices are greater than the average buy price of all products in each product line.

SELECT productCode,productName,buyPrice,productLine
FROM PRODUCTS P
WHERE BUYPRICE > (
	  SELECT avg(buyPrice) FROM PRODUCTS
      WHERE productLine = P.PRODUCTLINE
);


-- 	7. find customers who placed at least one sales order with the total value greater than 60K.

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










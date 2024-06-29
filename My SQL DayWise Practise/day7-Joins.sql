# Joins: Retrieve data from two more more table

-- Steps:
-- 1. Specify the joining tables in the FROM Clause, and JOIN type -
-- 2. Specify the JOIN condition - common column / conditional expression
-- 3. Filter rows/ Specify columns/ Order the rows/ LIMIT the resulting rows. 
-- ---------------------------------------------------------------------------------------------------------------------
# Types of Joins
-- 1. Inner Join: Returns records that have matching values in both tables
-- 2. Left Outer Join/ Left Join: Returns all records from the left table, and the matched records from the right table
-- 3. Right Outer Join/ Right Join: Returns all records from the right table, and the matched records from the left table
-- 4. Full Outer join: returns all records from both the tables matching or not
-- 5. Cross Join: multiplies/ matches every record from left table to every record from right table
-- 6. Self Join: tables joined to themselves


# Problem Statements

use classicmodels;

select
      e.employeeNumber,
      e.FirstName,
      e.lastName,
      e.jobTitle,
      o.country
from employees e inner join offices o on e.officeCode = o.officeCode;

-- get employee from USA only

select
      e.employeeNumber,
      e.FirstName,
      e.lastName,
      e.jobTitle,
      o.country
from employees e inner join offices o on e.officeCode = o.officeCode
where country = "usa";

-- EMPLOYEES  ORDER BY LAST NAME  FROM USA

select
      e.employeeNumber,
      e.FirstName,
      e.lastName,
      e.jobTitle,
      o.country
from employees e inner join offices o on e.officeCode = o.officeCode
where country = "usa"
ORDER BY lastName ;

-- GET FIRST 3 EMPLOYEES BY LAST NAME FROM USA

select
      e.employeeNumber,
      e.FirstName,
      e.lastName,
      e.jobTitle,
      o.country
from employees e inner join offices o on e.officeCode = o.officeCode
where country = "usa"
ORDER BY lastName 
limit 3 ;

/**/

use classicmodels;
select * from customers;
select * from orders;

-- 1. Query Customers (customerNumber, customerName, phone ) whose orders are Disputed or On Hold.

select
	 c.customerNumber,
     c.customerName,
     c.phone,
     o.orderNumber,
     o.`status`
from customers c inner join orders o on c.customerNumber = o.customerNumber;

-- CHECK WEATHER orders are Disputed or On Hold

select
	 c.customerNumber,
     c.customerName,
     c.phone,
     o.orderNumber,
     o.`status`
from customers c inner join orders o on c.customerNumber = o.customerNumber
where  o.`status` = 'Disputed' or  o.`status` = 'On Hold';

-- WRITE ITIN ANOTHER WAY  

select
	 c.customerNumber,
     c.customerName,
     c.phone,
     o.orderNumber,
     o.`status`
from customers c inner join orders o on c.customerNumber = o.customerNumber
where  o.`status` in ('Disputed', 'On Hold');

-- 2. Calculate the total quantity sold and the revenue generated for each product.
-- total quantity sold = SUM(quantityOrdered) 
-- total revenue generated = SUM(quantityOrdered * priceEach)

select 
      p.productCode,
      p.productName,
      sum(o.quantityOrdered) as total_quantity_sold,
      sum(o.quantityOrdered * o.priceEach) as  total_revenue_generated
from products p inner join orderdetails o on p.productCode = o.productCode
group by p.productCode , p.productName ;

-- 3. Query Country names and their respective average sales, order the results by avg. sales from highest to lowest.
-- total sales = sum(quantityOrdered * priceEach)
-- customers - orders - orderDetails 

select *
from customers c 
inner join orders o on c.CustomerNumber = o.CustomerNumber
inner join orderDetails d on o.ordernumber = d.orderNumber ;

select 
      c.country,
      avg(d.quantityOrdered * d.priceEach) as Average_Sales
from customers c 
inner join orders o on c.CustomerNumber = o.CustomerNumber
inner join orderDetails d on o.ordernumber = d.orderNumber 
group by c.country
order by Average_Sales desc ;

select 
      c.country,
      d.quantityOrdered ,
      d.priceEach
from customers c 
inner join orders o on c.CustomerNumber = o.CustomerNumber
inner join orderDetails d on o.ordernumber = d.orderNumber ;

select 
      c.country,
      d.quantityOrdered *  d.priceEach as Sales 
      -- this will give sales per customer for country
from customers c 
inner join orders o on c.CustomerNumber = o.CustomerNumber
inner join orderDetails d on o.ordernumber = d.orderNumber ;

select 
      c.country,
      avg(quantityOrdered * d.priceEach) as Avg_Sales -- this will give ave sale for each country
from customers c 
inner join orders o on c.CustomerNumber = o.CustomerNumber
inner join orderDetails d on o.ordernumber = d.orderNumber
group by c.country ; -- to find Avg_sales for each country we use group by 

-- 4. Retrieve the top 5 customers who made the highest total purchases from the orders table.

select 
      o.customerNumber,
      sum(d.quantityOrdered * d.priceEach) Total_Purchase
from orders o inner join orderDetails d on o.OrderNumber = d.OrderNumber 
group by o.customerNumber
order by Total_Purchase desc
limit 5 ; 

# Self Join

use day3;
select * from myemp;

-- 5. Retrieve all employees (emp_id, emp_name) and their respective managers (mgr_id, mgr_name), if any. 

select 
      e1.EMP_ID,
      concat(e1.FIRST_NAME , "  " , E1.LAST_NAME) as EMP_NAME,
      e1.MGR_ID,
      concat(e2.FIRST_NAME , "  " , E2.LAST_NAME) as MGR_NAME
from myemp e1 left join myemp e2 on e1.MGR_ID = e2.EMP_ID ;

-- 6. Find names and salaries of employees who earn more than their managers

select 
      e1.EMP_ID,
      concat(e1.FIRST_NAME , "  " , E1.LAST_NAME) as EMP_NAME,
      e1.salary as EMP_SALARY,
      e1.MGR_ID,
      concat(e2.FIRST_NAME , "  " , E2.LAST_NAME) as MGR_NAME,
	  e2.salary as MGR_SALARY
from myemp e1 join myemp e2 on e1.MGR_ID = e2.EMP_ID and e1.salary > e2.salary  ;



# Homework
-- 1. write a query to list the employees (employeeNumber, employeeName) along with their work location (state, city)
-- 2. 
/*
Retrieve the total sales amount for each state, 
and categorize the states as-
'High': total sales > 1000000
'Medium': total sales > 500000 
'Low': Otherwise
*/

-- 3. 
/*																						
Retrieve 
- the total sales amount for each productline (total_sales = quantityOrdered * priceEach) and 
- the number of distinct customers who purchased from that product line.
*/
-- 4. Display the list of customers with no orders placed.




































































--  				Table:  customers										Table: orders
					+----------------------------------------+				+------------+--------------+------------+
					| CustomerID | CustomerName | City       |				| OrderID    | OrderDate    | CustomerID |
					+----------------------------------------+				+------------+--------------+------------+
					| 1          | John Smith   | New York   |				| 1          | 2022-07-10   | 1          |
					| 2          | Emma Johnson | London     |				| 2          | 2022-08-05   | 2          |
					| 3          | Alex Brown   | Paris      |				| 3          | 2022-09-20   | 1          |
					+----------------------------------------+				+------------+--------------+------------+;

-- ------------------------------------------------------------------------------------------------------------------------















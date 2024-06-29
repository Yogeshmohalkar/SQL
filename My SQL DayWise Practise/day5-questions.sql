use classicmodels;
select * from customers;
# Aggregate Functions
-- 1. Write a query to find total no. customers

select 
	 count(customerNumber) as customer_count
from customers ;

-- 2. Write a query to list the number of jobs available in the employees table.

select * from employees;
select
      count( distinct jobTitle) as Available_jobs
from employees;

-- 3. Write a query to get the total salary payable to employees.

select * from day3.myemp;
select 
      sum(SALARY) as payable_salary
from day3.myemp;

-- 4. Write a query to get the maximum salary of an employee working as a Programmer.

select * from day3.myemp;

select 
      max(SALARY)
 from day3.myemp
 where JOB_ID = 'IT_PROG';

# Group By single column
-- 5. Write a query to get the number of employees with the same job.

use day3;
select * from myemp;
select
	 JOB_ID,
     count(EMP_ID)
from myemp
group by JOB_ID;

-- 6. Write a query to get the difference between the highest and lowest salaries.

select
     max(SALARY) , 
     min(SALARY),
     max(SALARY) -  min(SALARY) as SALARY_DIFF
from myemp;

-- 7. Write a query to get the department ID and the total salary payable in each department.

select
	DEP_ID,
    sum(SALARY)
from myemp
group by DEP_ID;

select
	DEP_ID,
    sum(SALARY)
from myemp
group by DEP_ID
having sum(SALARY) > 50000 ; -- this clause can be used to filter data by  diff group / filter group/records

select
	DEP_ID,
    sum(SALARY) as TOTAL_SALARY_PAYABLE
from myemp
group by DEP_ID
having TOTAL_SALARY_PAYABLE > 50000 ; -- you can use elias here 

-- 8. Write queries to find min, max and average salary of employees, GROUP BY HIRE_YEAR

select * from myemp;
select 
      year(HIRE_DATE),
      min(SALARY),
      max(SALARY),
      avg(SALARY)
from myemp
group by year(HIRE_DATE) ;

select 
      min(SALARY),
      max(SALARY),
      avg(SALARY),
      year(HIRE_DATE) as `YEAR`
from myemp
group by `YEAR` ;

select 
      min(SALARY),
      max(SALARY),
      avg(SALARY),
      year(HIRE_DATE) as `YEAR`
from myemp
group by `YEAR`
order by `YEAR` ;



# Group By multiple columns

use classicmodels;
select* from customers;

-- 9. Write a query to find total no. of customers and their maximum credit limit from each country, state

select 
	 country,
     state,
     count(customerNumber) as customer_count,
     max(creditLimit) as Max_credit_limit
from customers
group by country,state
having state is not null ;

-- 10. Write queries to find average and highest salary of employees per year and month

use day3;
select *  from myemp;
select
      year(HIRE_DATE) as HIRE_YEAR ,
      month(HIRE_DATE)as HIRE_MONTH ,
      max(SALARY),
      avg(SALARY)
from myemp
group by HIRE_YEAR,HIRE_MONTH ;

select
      year(HIRE_DATE) as HIRE_YEAR ,
      monthname(HIRE_DATE)as HIRE_MONTH , -- in case if you want to write query by MONTHNAME()
      max(SALARY),
      avg(SALARY)
from myemp
group by HIRE_YEAR,HIRE_MONTH ;

# Filter groups by HAVING clause

use classicmodels;
select * from customers;

-- 11. Write a query to find total no. of customers from Norway and Sweden.

select
	country,
    count(customerNumber)
from customers
group by country
having country in ('Norway','Sweden' );

-- 12. Write a query to get the average salary for each job ID excluding programmer.

select * from day3.myemp;
select 
      JOB_ID,
      avg(SALARY)
 from day3.myemp
 group by JOB_ID
 HAVING JOB_ID != " 'IT_PROG' " ;  -- [ <> ]
 
 -- NOT EQUALS TO != CAN BE WRITTEN IN ANOTHWR WAY [ <> ]

select 
      JOB_ID,
      avg(SALARY)
 from day3.myemp
 group by JOB_ID
 HAVING JOB_ID  <>  " 'IT_PROG' " ;


-- 13. Write a query to get the job ID and maximum salary of the employees 
--     where maximum salary is greater than or equal to $4000.

select 
      JOB_ID,
      max(SALARY) as Max_salary
 from day3.myemp
 group by JOB_ID
 HAVING Max_salary  >= 4000 ;

-- 14. Write a query to get the average salary for all departments employing more than 10 employees.

select 
      DEP_ID,
      AVG(SALARY) as Avg_salary
 from day3.myemp
 group by DEP_ID
 HAVING count(EMP_ID) > 10 ;  
# ORDER groups by ORDER BY clause

use classicmodels;
select * from customers;
-- 15. Find total credit limit and highest credit limit for each sales representative,
--    and sort the results in descending order of the highest credit limit.

select
	 salesRepEmployeeNumber,
     sum(creditLimit) as Total_Credit_Limit,
     max(creditLimit) as Max_Credit_Limit
from customers
group by salesRepEmployeeNumber
order by Max_Credit_Limit desc ;


# Advanced
-- 16. Write a query to find top 3 sales representatives with highest no. of customers

select
	 salesRepEmployeeNumber,
     count(customerNumber) as customer_count
from customers
group by salesRepEmployeeNumber
order by  customer_count desc
limit 3 ;
-- REMOVE NULL VALUES  
select
	 salesRepEmployeeNumber,
     count(customerNumber) as customer_count
from customers
group by salesRepEmployeeNumber
having salesRepEmployeeNumber is not null
order by  customer_count desc
limit 3 ;

# Homework
-- 1. Write a query to find EMPLOYEE_COUNT and MANAGER_COUNT of employees working in each department
-- 2. Calculate average credit limit of customers in each country
--     and display only those records where the where the average credit limit is greater than 50000
-- 3. Write a query to find average salary and total no. of employees working in the department - 50 and 80
-- 4. Write a query to find top 3 job profiles with highest salary payable.

-- NOTE:
-- GROUP BY Columns : columns specified in GROUP BY clause
-- AGGREGATED Columns : columns to which aggreate functions are applied
-- filter Columns : columns on which filter condition is defined
-- Use HAVING : filter column is GROUP BY column or AGGREGATED column
-- Use WHERE  : filter column is otherwise   





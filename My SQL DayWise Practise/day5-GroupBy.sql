
# Aggregate Functions
-- Summarize multiple rows into a single value for the entire group, column, or table 

# COUNT(column) 			--> returns total no. of NOT NULL rows in the result set/ NOT NULL values in the column
# SUM(numerical_column)		--> returns addition of values in the column 
# AVG(numerical_column)		--> returns average value  
# MIN(column)				--> returns minimum value
# MAX(column)				--> returns maximum value

use day3;
select * from myemp;
select count(SALARY) , count(EMAIL) from myemp;
select count(EMAIL) from myemp;
select count( distinct DEP_ID) from myemp;
select count(DEP_ID) from myemp;
select count(DEP_ID) , count(MGR_ID) from myemp ;
select DEP_ID from myemp;
select distinct DEP_ID from myemp;

select count(*) from myemp ;

select
      sum(salary),
      avg(salary),
      count(salary)
from myemp;

select
      min(salary),min(COMMISSION_PCT),
      max(salary),max(COMMISSION_PCT)
from myemp;

select * from myemp;

select
      min(HIRE_DATE) as earliest_hd,
      max(HIRE_DATE) as latest_hd
from myemp;

select
      min(year(HIRE_DATE)) as earliest_hy,
      max(year(HIRE_DATE)) as latest_hy
from myemp;

select * from myemp;



    
    

    
    
    
    
    


















-- 1. Write a query to find total no. of employees
-- 2. Write queries to find total/max/min/avg salaries from the myemp table
USE day3;
# Problem Statements:
# Group By single column
-- 1. Write a query to find EMPLOYEE_COUNT and MANAGER_COUNT of employees working in each department

SELECT
	DEP_ID, 
	EMP_ID,
    MGR_ID
FROM myemp;

SELECT
	DEP_ID, 
	COUNT(EMP_ID) AS EMPLOYEE_COUNT,
    COUNT(DISTINCT MGR_ID) AS MANAGER_COUNT
FROM myemp
GROUP BY DEP_ID;

-- 2. Write queries to find min, max and average salary of employees, GROUP BY HIRE YEAR

SELECT
	YEAR(HIRE_DATE) AS YEAR,
	MIN(SALARY),
    MAX(SALARY),
    AVG(SALARY)
FROM myemp
GROUP BY YEAR;

# Group By multiple columns
-- 3. Write queries to find avg salary of employees, group by DEP_ID AND HIRE YEAR

SELECT
	DEP_ID,
    JOB_ID,
	MIN(SALARY),
    MAX(SALARY),
    AVG(SALARY)
FROM myemp
GROUP BY DEP_ID, JOB_ID
ORDER BY DEP_ID;

# Filter groups by HAVING clause
-- 4. Write a query to find min/max/avg salary of employees working in the department - 50 and 80

# Advanced
-- 6. Write a query to find top 3 job profiles with highest salary
-- 7. Write a query to find highest salaries of each year for an IT_PROG employee





USE classicmodels;










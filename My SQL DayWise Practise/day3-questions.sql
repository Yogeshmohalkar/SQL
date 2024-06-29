 # DQL: Data Query Language - SELECT 
-- 1. Subset of SQL that focuses on retrieving /reading data from database
-- 2. Crucial for Data Analysis, Reporting , or Database Management 

select * from myemp;
select EMP_ID from myemp;
select FIRST_NAME,LAST_NAME from myemp;
select EMP_ID,EMAIL,SALARY,DEP_ID from myemp;

# Selecting Specific Columns
-- Problem Statement: 
-- 1. Write a query to fetch the EMP_ID, FIRST_NAME,LAST_NAME and JOB_ID of employees.

select EMP_ID, FIRST_NAME,LAST_NAME,JOB_ID from myemp;

-- 2. Write a query to fetch joining dates and job id of employees.


select EMP_ID,HIRE_DATE,JOB_ID from myemp;

# Selecting All Data
-- Problem Statement: 
-- 1. Get all the employees details.

select * from myemp;
 
# Unique results with: DISTINCT clause -- to get unique results from the table
-- Problem Statement: 
-- 1. What are the different Departments in employee table?

select DEP_ID from myemp;
select distinct DEP_ID from myemp;

-- 2. Get the unique JOB_IDs from employees table.

select JOB_ID from myemp;
select distinct JOB_ID from myemp;

-- 3. Get the unique DEP_IDs and managers(mgr_id) working for each department.

select DEP_ID,MGR_ID,JOB_ID from myemp;
select distinct DEP_ID,MGR_ID,JOB_ID from myemp;
select distinct DEP_ID,MGR_ID,JOB_ID,SALARY from myemp;

# Limiting results with: LIMIT clause -- LIMIT THE NO. RECORDS FETCHED FROM THE TABLE
-- Problem Statement: 
-- 1. Get first 10 records from the employee table.

select * from myemp limit 10;
select * from myemp limit 5;
select * from myemp limit 2,1;
select * from myemp limit 4,1;
select * from myemp limit 3,2;
select * from myemp limit 2,2;
select * from myemp limit 4,5;

use day3;

# Sorting Rows with:  ORDER BY [ASC|DESC] Operator 
-- Problem Statement:
-- 1. Get EMP_ID, SALARY and order THE RESULTS by SALARY

select * from myemp;
select
   EMP_ID,
   SALARY
from myemp
order by SALARY asc;

select EMP_ID,SALARY from myemp order by SALARY desc;


-- 2. Top 5 HIGHEST Paid employees (EMP_ID, SALARY) 

select
   EMP_ID,
   SALARY
from myemp 
order by SALARY desc
limit 5;

-- 3. Top 5 LOWEST Paid employees
select 
EMP_ID,
SALARY
from myemp
order by SALARY asc
limit 5;

-- 4. Top 5 salaries from the myemp table

select distinct salary
 from myemp 
 order by salary desc
limit 5;

-- 5. get DEP_ID, FIRST_NAME, LAST_NAME OF EMPLOYEE ordered by dept_id and first name
SELECT
DEP_ID,
FIRST_NAME,
LAST_NAME
FROM myemp
order by DEP_ID ASC , FIRST_NAME ASC;

-- Note :
-- NEUMARIC  -- ASC( lowest - highest)                          --DESC(highest - lowest)
-- STRING    -- ASC( starting with 'a' - starting with 'z')     --DESC( starting with 'z' - 'a' )
-- Date/Time -- ASC( Oldest to Newest )                         --DESC( newest-oldest)

-- 6. get DEP_ID, HIRE_DATE, EMP_ID OF EMPLOYEE ordered by dept_id and HIRE_DATE

select 
 DEP_ID,
 HIRE_DATE,
 EMP_ID
 from myemp
 order by DEP_ID ASC , HIRE_DATE ASC;
 
 select 
 DEP_ID,
 HIRE_DATE,
 EMP_ID
 from myemp
 order by DEP_ID ASC , HIRE_DATE DESC;
 
 select 
 DEP_ID,
 HIRE_DATE,
 EMP_ID
 from myemp
 order by DEP_ID, HIRE_DATE ; -- default order will be ascending 

-- 7. Write a query to find the 3rd highest salary from a table.=

select distinct SALARY 
from myemp
order by salary desc
LIMIT 2,1;

-- 7. Write a query to find the 2nd highest salary from a table.=

select distinct SALARY
from myemp 
order by SALARY desc
limit 1,1;

-- 7. Write a query to find the 4th  & 5th highest salary from a table.


select SALARY
FROM myemp 
ORDER BY SALARY desc
LIMIT 3,2;

select
EMP_ID,
FIRST_NAME
FROM myemp 
ORDER BY SALARY desc
limit 3,2;

# Selecting Specific Columns: Using Alias --> TEMPORARY/DISPLAY NAME GIVEN TO COLUMN OR A TABLE
-- Problem Statement: 
-- 1. Get EMP_ID, JOB_ID  as designation for all employees

select
   EMP_ID,
   JOB_ID AS DESIGNATION
FROM myemp;

# Selecting derived Columns: Using Alias
-- Problem Statement: 
-- 1. Write a query to fetch the yearly package of each employee(EMP_ID) (YEARLY_PACKAGE = SALARY * 12)

select 
     EMP_ID,
     SALARY AS MONTHLY_SALARY,
     SALARY * 12 AS YEARLY_PACKAGE
FROM myemp;

-- 2. Write a query to get the EMP_ID, JOB_ID, SALARY and 15% bonus for each employee.(BONUS = SALARY * 0.15)

SELECT 
     EMP_ID,
     JOB_ID,
     SALARY,
     SALARY * 0.15 AS BONUS
FROM myemp;

select * from myemp;
#  Selecting Specific Rows/Filtering: WHERE clause
-- Problem Statement: 
-- 1. Get EMP_ID, FIRST_NAME, LAST_NAME and EMAIL of employees from department with DEP_ID 50.

SELECT
  DEP_ID, EMP_ID, FIRST_NAME, LAST_NAME,EMAIL
FROM myemp
WHERE DEP_ID = 50;

-- 2. Get salaries of IT professionals (EMP_ID) from the employee table. (JOB_ID = IT_PROG)

SELECT 
     EMP_ID,JOB_ID,SALARY
FROM myemp
WHERE JOB_ID = 'IT_PROG';

-- 3. Get EMP_ID and HIRE_DATE of employees having salary LESS than 15000. 		(Operator: <)

SELECT 
EMP_ID,HIRE_DATE,SALARY
FROM myemp
WHERE SALARY < 15000;

-- 4. Get EMP_ID and HIRE_DATE of employees having salary greater than 15000. 	(Operator: >)

SELECT 
EMP_ID,HIRE_DATE,SALARY
FROM myemp
WHERE SALARY < 15000;

-- 5. Get EMP_ID and HIRE_DATE of employees having salary ATLEAST 15000. 		(Operator: >=)

SELECT 
EMP_ID,HIRE_DATE,SALARY
FROM myemp
WHERE SALARY >= 15000;

-- 6. Get EMP_ID and HIRE_DATE of employees having salary ATMOST 15000. 		(Operator: <=)

SELECT 
EMP_ID,HIRE_DATE,SALARY
FROM myemp
WHERE SALARY <= 15000;

# WHERE clause: BETWEEN Operator
-- Problem Statement: 
-- 1. Get EMP_ID and HIRE_DATE of employees having salary from 10000 to 20000.

SELECT
EMP_ID,
HIRE_DATE,
SALARY
FROM myemp
where SALARY between 10000 and 20000;

use day3;
select * from myemp;

# WHERE clause:  LIKE Operator/NOT LIKE Operator
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ 

select 
      EMP_ID,FIRST_NAME,LAST_NAME
from myemp
where FIRST_NAME like 'A%' ;

-- 2. Get the employees whose name ends with ‘a’ 

select 
      EMP_ID,FIRST_NAME,LAST_NAME
from myemp
where FIRST_NAME like '%A' ;

-- 3. Get the employees whose name does not end with ‘a’

select 
      EMP_ID,FIRST_NAME,LAST_NAME
from myemp
where FIRST_NAME not like '%A' ;

-- 4. Get the employees whose name does not begin with ‘a’

select 
      EMP_ID,FIRST_NAME,LAST_NAME
from myemp
where FIRST_NAME not like 'A%' ;

-- 5. Get the employees whose name has ‘a’ at the second position

select 
      EMP_ID,FIRST_NAME,LAST_NAME
from myemp
where FIRST_NAME like '_A%' ;

-- 5. Get the employees whose name has ‘a’ at the third position 

select 
      EMP_ID,FIRST_NAME,LAST_NAME
from myemp
where FIRST_NAME like '__A%' ;

-- 5. Get the employees whose JOB_ID IS STARTING WITH 'SA'

select 
      EMP_ID,JOB_ID,FIRST_NAME,LAST_NAME
from myemp
where JOB_ID like 'SA%' ;


# WHERE clause: AND Operator > select rows that satisfy two conditions
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ and COMMISSION_PCT greater than 0.

select 
      EMP_ID,FIRST_NAME,LAST_NAME,COMMISSION_PCT
from myemp
where FIRST_NAME like 'A%' and COMMISSION_PCT > 0 ;

-- 2. Get the EMP_ID and email of employees whose name has second character ‘a’ and minimum salary 10000.

select 
      EMP_ID,EMAIL,FIRST_NAME,SALARY
from myemp
where FIRST_NAME like '_A%' and SALARY >=10000;


# WHERE clause: OR Operator > select rows that satisfy either of two conditions
-- Problem Statement:
-- 1. Get the employees whose name begins with ‘a’ or COMMISSION_PCT greater than 0.

select 
      EMP_ID,FIRST_NAME,LAST_NAME,COMMISSION_PCT
from myemp
where FIRST_NAME like 'A%' or COMMISSION_PCT > 0 ;

-- 2. Get EMP_ID and email of employees from the departments with IDs 40, 110 and 80.

select 
      EMP_ID,EMAIL,DEP_ID
from myemp
where DEP_ID = 40 or DEP_ID = 110 or DEP_ID = 80 ;


USE Classicmodels;
select * from offices;

-- 3. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan. (DB : CLASSICMODELS, TABLE: offices) 

select 
phone,addressLine1,addressLine2,city,country
from offices
where country = 'UK' or country = 'japan';

# WHERE clause: IN Operator/NOT IN Operator
-- checks 1. same column 	2. comparison is '='
-- Problem Statement: 
-- 1. Get EMP_ID and email of employees from the departments with IDs 40, 110 and 80.

select
   EMP_ID,FIRST_NAME,LAST_NAME,DEP_ID
from myemp
where DEP_ID in (40,110,80) ;
-- 2. Get EMP_ID and email of employees not in the departments with IDs 40, 110 and 80.

select
   EMP_ID,FIRST_NAME,LAST_NAME,DEP_ID
from myemp
where DEP_ID not in (40,110,80) ;

# WHERE clause: IS NULL Operator/ IS NOT NULL Operator
-- Problem Statement: 
-- 1.  Get employees IDS, names where email IS NULL 

select
   EMP_ID,FIRST_NAME,LAST_NAME,EMAIL
from myemp
where EMAIL IS NULL ;

-- 2.  Get employees IDs, names where email IS NOT NULL


select
   EMP_ID,FIRST_NAME,LAST_NAME,EMAIL
from myemp
where EMAIL IS not NULL ;

-- isnull / is not null
-- isnull()  function
-- ifnull()
-- coalesce() -- it takes list of values as inpute
-- return the first not null value 
select coalesce(1, 4, 56);
select coalesce(null ,1, 4, 56);
select coalesce('ExcelR',null ,1, 4, 56);
select coalesce(null ,2.34,6.56,'ExcelR',null ,1, 4, 56);


use classicmodels;
select * from offices;

select 
     officeCode,
     country,
     state,
     isnull(state),
     ifnull(state, 'Not Reported')
from offices;

select 
      officeCode,country,state,
      concat(state, ' , ', country) as Location
from offices;

select 
	officeCode,country,state,
    coalesce(concat(state, ' , ', country),state,country) as location 
from offices; 

-- DATE AND TIME FUNCTION 
-- '2023-10-2'

select year('2023-10-2');
select month('2023-10-2');
select monthname('2023-10-2');
select day('2023-10-2');
select dayname('2023-10-2');
select quarter('2023-10-2');

select year(now());
select month(now());
select monthname(now());
select day(now());
select dayname(now());
select quarter(now());

select * from payments;
select 
      year(paymentDate),
      month(paymentDate),
      monthname(paymentDate),
	  day(paymentDate),
      dayname(paymentDate),
      quarter(paymentDate)
from payments ; 

-- string function : operate on string values / string column

use day3;
select * from myemp;

select
      upper(FIRST_NAME) as First_name,
      upper(LAST_NAME)  as Last_name
from myemp ;

select
      lower(FIRST_NAME) as First_name,
      lower(LAST_NAME)  as Last_name
from myemp ;

select
      concat(First_name, '  ', Last_name) as EMP_Name
from myemp ;

select
      concat(upper(FIRST_NAME), '  ', upper(LAST_NAME) ) as EMP_Name
from myemp ;

select
     upper(concat(First_name, '  ', Last_name)) as EMP_Name
from myemp ;

-- Write a query to get details of employees hired before year 2000  (DB: day3   Table: myemp)

select *
from myemp
where year(HIRE_DATE) < 2000;

-- write a query to get details of employees hired between the year 1998 and 2001


select *
from myemp
where year(HIRE_DATE) between 1998 and 2001
order by year(HIRE_DATE) desc ;

-- write a query to get details of employees hired after '01-01-2001'

select *
from myemp
where (HIRE_DATE) > '2001-01-01' ;

-- write a query to get details of employees and order by month

select * from myemp
order by month(hire_date);

-- write a query to get the days difference between order date and shipped date(DB: classicmodels   Table: orders)

use classicmodels;
select * from orders;

select  
	 orderNumber,
     orderDate,
     shippedDate,
	 datediff(shippedDate,orderDate) as date_difference
from orders;

# Home Work
-- 1. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan(using or) (DB : CLASSICMODELS, TABLE: offices) 
-- 2. Get the PHONE AND ADDRESS of all the city offices in the UK and Japan (using in)(DB : CLASSICMODELS, TABLE: offices) 
-- 3. Get the orders which are On hold, disputed or in process (DB : CLASSICMODELS, TABLE: orders)














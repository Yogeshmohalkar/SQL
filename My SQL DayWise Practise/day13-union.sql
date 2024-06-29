CREATE DATABASE day14;
USE day14;

CREATE TABLE t1 (c1 INT, c2 CHAR(1));
INSERT INTO t1 VALUES (1,'A'), (2,'B'), (3,'C');

CREATE TABLE t2 (c1 INT, c2 CHAR(1));
INSERT INTO t2 VALUES (1,'A'), (2,'B'), (4,'D');

select * from t1;
select * from t2;



# UNION
/*
- combines the result set of two or more SELECT query into one.
- Removes the duplicate rows from both sets.
*/

select * from t1
union -- REMOVES THE DUPLICATE AND TAKES UNIQUE VALUES
select * from t2;

# UNION ALL
/*
- combines the result set of two or more SELECT query into one.
- Retains the duplicate rows from both sets.
*/

select * from t1
union ALL-- TAKES ALL VALUES SUCH AS DUPLICATES
select * from t2;

# INTERSECT
/*
- combine two result sets and return the data which are common in both the result set.
*/

SELECT * FROM t1
WHERE c1 IN ( SELECT C1 FROM t2 );

# Conditions to use UNION/ UNION ALL/ INTERSECT

USE CLASSICMODELS;
SELECT * FROM EMPLOYEES;

/*
- both SELECT statements should have equal no. of fields in the same order of compatible data-types.
- The data-types of these fields shoukd either be same or compatible with each other.
*/
-- Write a SQL query to find all salespeople and customers located in the city of London.

-- STEPS : FIND SALES REP FROM LONDON.
SELECT
	 concat(e.firstName," ", e.lastName ) AS emp_name,
     o.city
from employees e inner join offices o on e.officeCode = o.officeCode
where city = "LONDON"  ;

-- FIND CUSTOMERS FROM LONDON.

select 
     customerName,
     city
from customers
where city = "London" ;

-- COMBINE BOTH RESULT STES USING UNION OPERATOR.

SELECT
	 concat(e.firstName," ", e.lastName ) AS emp_name,
     o.city,
     'employee' as catogery
from employees e inner join offices o on e.officeCode = o.officeCode
where city = "LONDON"  
UNION
select 
     -- customerName : THIS WILL GIVE WRONG NAMES
      concat( contactFirstName, ' ' ,contactLastName ),
     city,
     'customer' as catogery
from customers
where city = "London" ;









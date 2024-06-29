
USE day7;

-- 1. Inner Join: Returns records that have matching values in both tables
SELECT t1.*,t2.column3
FROM table1 t1
INNER JOIN table2 t2 ON t1.column1 = t2.column1;


SELECT *
FROM TABLE1 t1
INNER JOIN TABLE2 t2 ON t1.column1 = t2.column1;



SELECT t1.column1, t2.column3
FROM TABLE1 t1
INNER JOIN TABLE2 t2 ON t1.column1 = t2.column1;


SELECT *
FROM TABLE2 t2
INNER JOIN TABLE1 t1 ON t2.column1 = t1.column1;

-- table and column alias
SELECT
     column1 AS col1,
     column2 AS 'col 1'
FROM table1 t1;

-- 2. Left outer join/ Left join: Returns all records from the left table, and the matched records from the right table

USE day7;
SELECT *
FROM table1 t1
LEFT JOIN table2 t2 ON t1.column1 = t2.column1;

-- 3. Right outer join/ Right join: Returns all records from the Right table, and the matched records from the left table
SELECT *
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.column1 = t2.column1;

-- 4. Full Outer join: returns all records from both the tables matching or not
SELECT *
FROM table1 t1
LEFT JOIN table2 t2 ON t1.column1 = t2.column1
UNION
SELECT *
FROM table1 t1
RIGHT JOIN table2 t2 ON t1.column1 = t2.column1;


-- 5. Cross Join: multiplies/ matches every record from left table to every record from right table


select * 
from table1 t1
join table2 t2 ;

select count(*) 
from table1 t1
join table2 t2 ;

select * 
from table1 , table2 ; -- can also perform cross join operation like this.

-- Self Join: tables joined to themselves

select * 
from table1 t1 inner join table1 t2 on t1.column1 = t2.column1 ;












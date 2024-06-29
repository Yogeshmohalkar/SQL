  # Window Functions
/*
1. divide the result set into subsets/partitions and 
2. apply window functions to each partition 
3. written in select clause and derive new columns
*/

# Syntax
/*
	SELECT 
		column1, column2,
		function(aggregation) OVER (PARTITION BY ... ORDER BY...)
	FROM table1
    	WHERE condition;
*/

# Window Functions:

use day3;
select * from myemp;

-- 1. ROW_NUMBER() 
-- :Assigns a sequential integer to every row within its partition

select 
      DEP_ID,
      EMP_ID,
      row_number() over ( partition by DEP_ID ) as _row_number
from myemp;

-- 2. RANK()
-- :Assigns a rank to every row within its partition

select 
     EMP_ID,DEP_ID,SALARY,
     rank() over(partition by DEP_ID order by salary desc) _row
from myemp; -- only used rank
     
select 
      EMP_ID,DEP_ID,SALARY,
	  row_number() over ( partition by DEP_ID order by salary desc) as _row_number,
      rank() over(partition by DEP_ID order by salary desc) _row
from myemp; -- used row to know difference bet rank & row_number

-- :Assigns the same rank to the rows with equal values
-- :There is a gap in the sequence of ranked values for every repeated value in the ordered sequence

-- 3. DENSE_RANK()
-- :Assigns a rank to every row within its partition
-- :Assigns the same rank to the rows with equal values
-- :There is no gap in the sequence of ranked values 

select 
      EMP_ID,DEP_ID,SALARY,
	  row_number() over ( partition by DEP_ID order by salary desc) as _row_number,
      rank() over(partition by DEP_ID order by salary desc) _row,
      dense_rank() over( partition by DEP_ID order by salary desc ) Drank
from myemp;

-- 4. LEAD()

use classicmodels;
select* from orders;
-- :Returns the value of the Nth row after the current row in a partition. 
-- :It returns NULL if no subsequent row exists.

select -- YOU WILL GET 1 ST ROW/NEXT FROM SELECTED ROW.
      customerNumber,orderNumber,orderDate,
      lead(orderDate,1) over( partition by customerNumber order by orderDate ) as Next_Order_date
from orders; 

select -- YOU WILL GET 2 ND ROW/NEXT FROM SELECTED ROW.
      customerNumber,orderNumber,orderDate,
      lead(orderDate,2) over( partition by customerNumber order by orderDate ) as Next_Order_Date
from orders;
      
-- 5. LAG()
-- :Returns the value of the Nth row before the current row in a partition. 
-- :It returns NULL if no preceding row exists.

select    -- YOU WILL GET 1 st previous ROW/NEXT FROM SELECTED ROW.
      customerNumber,orderNumber,orderDate,
      lead(orderDate,1) over( partition by customerNumber order by orderDate ) as Next_Order_Date,
      lag(orderDate,1) over( partition by customerNumber ) as Previous_Order_Date
from orders; -- no need to mention order by OrdrDate here in LAG 

select -- YOU WILL GET 2 ND previous ROW/NEXT FROM SELECTED ROW.
      customerNumber,orderNumber,orderDate,
      lead(orderDate,2) over( partition by customerNumber order by orderDate ) as Next_Order_Date,
      lag(orderDate,2) over( partition by customerNumber ) as Previous_Order_Date
from orders; --  no need to mention order by OrdrDate here in LAG 

-- 6. FIRST_VALUE()
-- :Returns the value of the specified expression with respect to the first row in the window frame.

select -- YOU WILL GET FIRST VALUE OF PARTION IN SELECTED COLUMN.
      customerNumber,orderNumber,orderDate,
      first_value(orderDate) over ( partition by customerNumber order by orderDate ) as First_Order_Date
from orders;

-- 7. LAST_VALUE()
-- :Returns the value of the specified expression with respect to the last row in the window frame.

select -- YOU WILL GET FIRST VALUE OF PARTION IN SELECTED COLUMN.
      customerNumber,orderNumber,orderDate,
      last_value(orderDate) over ( partition by customerNumber  ) as Last_Order_Date
from orders;





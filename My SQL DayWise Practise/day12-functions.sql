# Functions
/*
- Stored program that returns a single value.
- Accepts i/p value 		--> perform computations/ data manipulations 	--> returns a single value
- Can be
	1. DETERMINISTIC		--> returns same result for the same set of input parameters
    2. NON-DETERMINISTIC	--> returns different result for the same set of input parameters
*/

# Syntax
/*
DELIMITER //
CREATE FUNCTION fun_name(par1 d_type, ...)
RETURNS data_type
[NOT] DETERMINISTIC
BEGIN
		-- SQL statements
END //
DELIMITER ;
*/

-- 1. Create a function that takes credit limit of a customer and returns the customer level. 
-- Credit Limit > 50000  --> 'PLATINUM'
-- Credit Limit > 10000  --> 'GOLD'
-- OTHERWISE  --> 'SILVER'
-- call the function in select query

DELIMITER //
CREATE FUNCTION getCustomerLevel( creditLimit INT )
RETURNS VARCHAR(20)
DETERMINistic
BEGIN
     -- CREATE A VARIABLE INSIDE FUNCTION TO STORE CUSTOMER LEVEL. 
     DECLARE CUST_LEVEL VARCHAR(20) ;
     SET CUST_LEVEL = (
         CASE
			WHEN creditLimit > 50000 THEN 'PLATINUM'
            WHEN creditLimit > 10000 THEN 'GOLD'
            ELSE 'SILVER'
		END ) ;
	 RETURN ( CUST_LEVEL );
END //
DELIMITER ;
-- CALL getCustomerLevel(); NO NEED TO CALL FUNCTION 
SELECT * FROM CUSTOMERS;
SELECT
     customerNumber,
     customerName,
	 creditLimit,
     getCustomerLevel( creditLimit) AS Customer_Level
FROM CUSTOMERS ;
-- 2. creating function to get employee name (firstName + lastName)

# Conditional Statement: execute statement(s) if and only if the specified condition is satisfied
/*

IF condition_
	- statement 1;
    - statement 2;
    ...
END IF;

*/

# LOOP statement: to execute a block of statements repeatedly based on a condition.
/*
label: LOOP
	...
	IF condition_
    THEN LEAVE label;
	...
END LOOP;
*/

-- CREATE A LOOP THAT WILL TAKE INTEGER INPUT AND RETURN SUM OF INTEGERS UNTIL THE INPUTE NUMBER
-- i/p : 5 , o/p : 1+2+3+4+5 = 15 
-- i/p : 3 , o/p : 1+2+3 = 6

-- TEMPLATE 
-- DELIITER //
-- CREATE FUNCTION SumofNo()
-- RETURNS INT
-- DETERMINISTIC
-- BEGIN
      
-- END //
-- DELIMITER ;


 DELIMITER //
CREATE FUNCTION SumofNo( num INT )
RETURNS INT
DETERMINISTIC
BEGIN
      DECLARE sum_no INT  ;   --  CREATE A VARIABLE TO STORE THE RESULT
      DECLARE counter INT ;  --  CREATE A VARIABLE AS A COUNTER
      
      SET sum_no = 0  ;
      SET counter = 0 ;
      
      lable1 : LOOP
		  SET counter = counter + 1 ;
		      IF  counter > num
				  THEN LEAVE lable1;
		      END IF ;
		  SET sum_no = sum_no + counter ;
      END LOOP ;
      RETURN sum_no ;
END //
DELIMITER ;
 
SELECT SumofNo(5) ;
SELECT SumofNo(3) ;
SELECT SumofNo(6) ;
 
 
 
 
 
 
 
 
 
 









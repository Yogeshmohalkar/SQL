# Stored Procedure
/* 
Predefined, reusable sequence of SQL statements stored and executed as a single unit
Consist of a 
	1. Name - to refer for reuse 
	2. Parameter list -  to pass values and get results back
	3. Body - having SQL statements separated by semicolons(;)
Implements business logic, performs database operations, automates tasks
Use:
-- Reusability 
-- Abstraction 
*/

# Types of Stored Procedures
-- 1. Simple Stored Procedure
-- 2. Procedure with IN parameter
-- 3. Procedure with OUT parameter
-- 4. Procedure with INOUT parameter

# Variables
-- Named data object that store data values are used to pass values from one statement to another.
-- Value of an user-defined varibale can be changed during procedure execution.
-- Steps to use Variables inside stored program
	-- 1. Declaring Variables 	--> DECLARE variable_name data-type DEFAULT default_value;
    -- 2. Assigning Values	  	--> SET variable_name = value;
  
-- To use Variables outside the stored program
  -- SET @VAR.NAME = 2;		SET @.VAR = 2;		SET @VAR. = 2;
  -- SET @VAR_NAME = 2;		SET @_VAR = 2;		SET @VAR_ = 2;
  -- SET @VAR$NAME = 2;		SET @$VAR = 2;		SET @VAR$ = 2;
  
# Parameters
-- temporary variables that holds the arguement passed and/or return value
-- Modes of parameter
	-- 1. IN	-> to pass an input/arguement to stored procedure
	-- 2. OUT	-> to return back value from the stored procedure to the calling statement
    -- 3. INOUT	-> combination of IN and OUT parameter
 
# Examples:

use classicmodels;
select * from employees;

-- 1. Create an procedure that displays the employee details

DELIMITER //
create procedure GetEmployeeSDetails()
begin
     SELECT * FROM EMPLOYEES ;
end //
DELIMITER ;

-- CALL A PROCEDURE 

call GetEmployeeSDetails() ;


-- 2. Create a procedure to get the employee details for a given employee number.
-- 1002, 1056, 1076, 1088

DELIMITER // 
CREATE procedure getEmployee( in eid int )
begin
     select * from employees
     where employeeNumber = eid ;
end //
DELIMITER ;

call getEmployee(1002);
call getEmployee(1056);
-- 3. Create a procedure that returns employee count for a given office location

select distinct country from offices;

DELIMITER //
CREATE PROCEDURE GetEmployeeCount( in Loc varchar(20) , out Ecount int )
BEGIN
     select 
           count(employeeNumber) into Ecount
           from employees e inner join offices o on e.officeCode = o.officeCode
           group by country
           having country = loc;
END //
DELIMITER ;	

call GetEmployeeCount( "USA" , @empcount ); -- must give variable for output . 
-- "VARIABLE" = DATA OBJECT THAT CARRIES ALL DATA VALUE FROM ONE COMMAND TO ANOTHER 
select  @empcount;

call GetEmployeeCount('france' , @franceemp );
select @franceemp;

#---------------------------------------------------------------------------------------------------------------------------------------
-- SET A VALUE OUTSIDE OF A PROCEDURE 
set @counter = 0 ;
select @counter ;
-- CREATE A PROCEDURE TO INCREMENT THE COUNTER WITH EVERY CALL

DELIMITER // 
CREATE procedure _INCREMENT(  inout C int )
begin
     SET C = C+1;
END //
DELIMITER ;

CALL _INCREMENT(@counter);
SELECT @counter;

SET @YOGESH = 5;
CALL _INCREMENT(@YOGESH ); -- if you run this again or pass value again it will be incremented by 1. again
SELECT @YOGESH ;
























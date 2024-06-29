# Errors: Abnormal conditions that disrupts the normal execution of the SQL statements
# Exceptions: Errors that can be handled 
/*
- Two types of Exceptions:
	1. System Defined Exceptions: Any issue with the code, the issue is shown by default.
    2. User Defined Exceptions: User decides when the issue has to be shown
*/
USE classicmodel;
select * from employees;

# Error Handling:
/*
- MySQL handler to handle errors encountered in stored procedures.

- Syntax: DECALRE <action> HANDLER FOR <condition-value>

- Two types of actions/handler:
	1. CONTINUE : the execution of the enclosing code block ( BEGIN … END ) continues.
    2. EXIT : the execution of the enclosing code block, where the handler is declared, terminates.
    
- After declaring the ACTION, you need to tell the system what needs to be done for the exception. 
  There are three things that can be done
	1. A MYSQL ERROR CODE (E.G. 1062)
    2. A STANDARD SQLSTATE VALUE OR IT CAN BE SQLWARNING, NOTFOUND ERROR, SQLEXCEPTION
    3. A NAMED CONDITION ASSOCIATED WITH MYSQL ERROR CODE OR SQL STATEVALUE
*/

USE classicmodels;
/*
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN

END


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN

END
*/

CALL TESTING0(); -- THIS WILL GIVE ERROR
------------------------------------------------------------------------------------------------------
-- EXIT HANDLER

DELIMITER //
CREATE PROCEDURE TESTING1()
BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION
     SELECT "specified table doesnt exist in the database" ;
     
     SELECT 8 FROM TEST;
     SELECT * FROM employees;
END //
DELIMITER ;

CALL TESTING1();  

------------------------------------------------------------------------------------------------------
-- COTINUE HANDLER

DELIMITER //
CREATE PROCEDURE TESTING2()
BEGIN
     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
     SELECT "specified table doesnt exist in the database" ;
     
     SELECT 8 FROM TEST;
     SELECT * FROM employees;
END //
DELIMITER ;

CALL TESTING2();  









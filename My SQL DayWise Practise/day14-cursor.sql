
USE classicmodels;
SELECT * FROM customer_summary;

SELECT DISTINCT customerNumber FROM orders;  -- list of customers who has placed orders
-- 103, 112, 114, 119

-- STEP1 : fecthing customerNUmber 
-- STEP2 : calculating total purchase amount 
-- STEP3 : update the customer summary table  

# Cursor
/* 
- A cursor allows you to iterate a set of rows returned by a query and process each row individually.
- MySQL cursor is read-only, non-scrollable and asensitive.
*/

DELIMITER //
CREATE PROCEDURE updateCustomerSummary()
BEGIN
	-- declaring variables
	DECLARE done INT DEFAULT 0;
    DECLARE cust_no INT;
    DECLARE total_spending DECIMAL(10,2);
-- 1. declare cursor
	DECLARE cust_cursor CURSOR FOR
		SELECT DISTINCT customerNumber FROM orders;
    -- create a continue handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND   -- DECLARING continue handler for not found exception
    SET done = 1;
-- 2. open cursor
	OPEN cust_cursor;
    read_loop: LOOP
		-- STEP1 : fecthing customerNUmber 
		FETCH cust_cursor INTO cust_no;   -- 103, 112, 114, 119
		-- get out of loop when all the data from the select query is processed
		IF done = 1
			THEN LEAVE read_loop;
		END IF;
		-- STEP2 : calculating total purchase amount 
		SELECT
			SUM(quantityOrdered * priceEach) INTO total_spending
		FROM orders o
		JOIN orderdetails d ON o.orderNumber = d.orderNumber
		WHERE o.customerNumber = cust_no;
		-- STEP3 : update the customer summary table  
		UPDATE customer_summary
		SET totalPurchaseAmount = total_spending
		WHERE customerNumber = cust_no;
    END LOOP;
-- 3. close cursor
	CLOSE cust_cursor;
END //
DELIMITER ;


SELECT * FROM customer_summary;

CALL updateCustomerSummary();

SELECT * FROM customer_summary;































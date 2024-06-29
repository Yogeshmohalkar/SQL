

-- NULL values = ABSENT AND NOT KNOWN
-- 1) IS NULL/ IS NOT NULL
-- 2) IS NULL(COLUMN NAME) FUNCTION
-- 3) IF NULL(COLUMN NAME,ALTERNATE VALUE)
-- 4) COALESCE(LIST OF VALUE) -- KOH-UH-LES
-- take list of values as input
-- returns the first not null value
-- TAKE NOT NULL VALUE FROM LFT TO RHT

SELECT coalesce(NULL , 1,4,56);
SELECT coalesce('excelr', NULL , 1,4,56);
SELECT coalesce(NULL, 2.34,6,56 ,'excelr', NULL , 1,4,56);

USE CLASSICMODELS;
SELECT * FROM offices;

SELECT
officecode, country ,state,
isnull(country),
ifnull(state, '-- NOT REPORTED--')
from offices;

-- CONCAT() - COMBINE TWO OR MORE STR VALUES
SELECT
     officecode,STATE,COUNTRY,
     coalesce(concat(state, ', ', country), STATE, COUNTRY) AS LOCATION
FROM officeS;

SELECT
     COUNTRY_NAME, state,
     coalesce(concat(STATE, 'a,b,c ',COUNTRY),state,country)
     FROM offices;
     
USE CLASSICMODELS;
SELECT * FROM offices;
SELECT DISTINCT(country) From customers
WHERE country LIKE "A%" OR country LIKE"B%"  OR COUNTRY LIKE"C%"
ORDER BY country;


-- #DAY 3 - LAB SESSION
USE CLASSICMODELS;
SELECT * FROM CUSTOMERS;

select 
      CUSTOMERNUMBER,
      CREDITLIMIT,
      case
          when CREDITLIMIT < 25000 then 'LOW' #it shows the new column value
          when CREDITLIMIT BETWEEN 25000 AND 100000  then 'MEDIUM'
          ELSE 'HIGH'
		END AS customertype  #it shows the new column
	FROM customers;

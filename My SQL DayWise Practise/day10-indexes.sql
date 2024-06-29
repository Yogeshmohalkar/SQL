# Index
/*
Index is a data structure created using one or more columns to speed up the query execution
Practically is a table with PRIMARY KEY or INDEX KEY and a pointer to each record in the actual table
There are two types of Index:
	1. Clustered Index 		--> Should be Unique and NOT NULL (PRIMARY KEY - default)
							--> Can define only one Clustered Index per table
	2. Non-Clustered index	--> Can contain duplicate or NULL values	
							--> Can define one or more non-clustered indexes on a table
*/

use classicmodels;
select * from customers;

-- Creating index on a table
-- 		1. Creating Index on one column

create index index_country on customers(country);

-- 		2. Creating Index on multiple columns

create index index_location on customers(city,postalcode);

-- 		3. Creating Unique Index

create unique index uindex_contact on customers(city,phone);

-- Listing indexes defined on a table

show index from customers;

-- Deleting existing indexes on a table

drop index index_location on customers;














							
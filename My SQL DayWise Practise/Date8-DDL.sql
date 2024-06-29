
# DDL : Data Definition Language
/*
-- Used to create, modify and drop the database and its objects
-- The commands of Data Definition Language Deal with 
   how the data should exist in database.
*/

# Commands
-- CREATE : Create Database and Database Objects (Tables, etc)
-- DROP : Drop Database and Database objects
-- ALTER : Change the structure of database
-- TRUNCATE : Empty table in an Database

# 1. CREATE Command

create database day8;
use day8;

-- Create a Database
-- Create tables
/*
Child Table																																		 
Table: employees												        
Columns:																
emp_id - (PK)															
emp_name - NOT NULL														
hire_date  															    
dept_id -															
+--------+-----------------+-------------+---------+			     
| emp_id | emp_Name   	   | hire_date   | dept_id |        		 
+--------+-----------------+-------------+---------+		    	 
| 1      | John Doe        | 2023-05-01  |	101    |				 
| 2      | Jane Smith      | 2023-05-02  |	102	   |				 
| 3      | Michael Johnson | 2023-05-03  |	101	   |				 				                             
| 4      | David Wilson    | 2023-05-05  |	102    |				      
+--------+-----------------+-------------+---------+  											
*/

create table employees (
	   emp_id int primary key auto_increment ,
       emp_Name varchar(25) not null ,
       hire_date date ,
       dept_id int 
);

desc employees ; -- can also use discription/desc 

insert into employees values (1,'John Doe','2023-05-01',101);
insert into employees(emp_Name,hire_date,dept_id) values ('Jane Smith','2023-05-02',102);
insert into employees(emp_Name,hire_date,dept_id) values ('Michael Johnson','2023-05-03',101);
insert into employees values (12,'David Wilson','2023-05-05',102);
insert into employees(emp_Name,hire_date,dept_id) values ('xyz','2023-05-04',101);  
insert into employees values (Null ,'abc','2023-05-05',102); 
-- AUTO INCREMENTED NULL values 

select * from employees;

# 2. ALTER Command
-- Add a new column to the table

alter table employees
add column age int check (age > 0);

alter table employees
add column designation varchar(10) after emp_Name;

alter table employees
add column emp_index int first;


-- Remove existing column in the table

alter table employees
drop column emp_index;

alter table 
drop column designation;

-- Change the data type

desc employees;

alter table employees
modify column emp_Name varchar(50);

alter table employees
modify column dept_id decimal(4,0);

-- Rename a column
alter table employees
change column emp_id eid decimal(4,0);
desc employees;

-- Rename a table

alter table employees
rename to emps; 
desc employees; -- this will throw error because name has changed
desc emps;

rename table emps to employees;
desc emps; -- this will throw error because name has changed again 
desc employees; 

# 2. DROP Command

create database demo;
use demo;

create table table1 ( column1 int , column2 int );
create table table2 ( column1 int , column2 int );
create table table3 ( column1 int , column2 int );

-- Drop table

drop table table1;
drop table table2,table3 ;

 -- table has dropped

-- Drop database

drop database demo;

show tables;
show databases;

# 4. TRUNCATE`  -- DROP TABLE + CREATE TABLE

use day8;
select * from employees;

 /*
TRUNCATE is a DDL command which deletes or removes all the records 
from the table. This command also removes the space allocated for 
storing the table records.
*/

truncate table employees;
select * from employees;


# SQL Constraints -- RULES/LIMITATIONS
-- Specifies rules for the data that goes into table.
-- Can be Column level or Table level.

# Types of Constraints
-- 1. Entity Intigrity Constraints		: NOT NULL					
-- 2. Domain Integrity ConstrainTs		: CHECK | DEFAULT 			
-- 3. Key Intigrity Constraints			: UNIQUE | PRIMARY KEY		
-- 4. Refrential Integrity Constraints	: FOREIGN KEY


# SYNTAX
/*
CREATE TABLE table_name (
	column_name1 data_type NOT NULL,
	column_name2 data_type UNIQUE
);
*/

-- NOT NULL		--> Ensures No NULL values in column
-- UNIQUE		--> Ensures no duplicate column values     phone_no, email    
-- CHECK 		--> Specifies conditon for input values	   CHECK(age >= 16) 
-- DEAFULT		--> Default value of the specified column   DEFAULT 18 | 'STRING' | '2023-06-26'
-- PRIMARY KEY	--> Uniquely identifies each record  (UNIQUE + NOT NULL)
-- FOREIGN KEY	--> Ensures data consistency in database tables

-- Create tables
/*
Child Table																Parent Table																		 
Table: employees												        Table: departments
Columns:																Columns:
emp_id - (PK)															dept_id  - (PK)
emp_name - NOT NULL														dept_name  - (NOT NULL, UNIQUE)
hire_date  															    location - (DEFAULT - MUMBAI)
dept_id - FK															emp_count - (5-200)
+--------+-----------------+-------------+---------+			     +---------+----------+-----------+-----------+
| emp_id | emp_Name   	   | hire_date   | dept_id |        		 | dept_id | dept_name| location  | emp_count |
+--------+-----------------+-------------+---------+		    	 +---------+----------+-----------+-----------+
| 1      | John Doe        | 2023-05-01  |	101    |				 | 101     | A        | Pune      | 100		  |
| 2      | Jane Smith      | 2023-05-02  |	102	   |				 | 102     | B        | Mumbai    | 150		  |
| 3      | Michael Johnson | 2023-05-03  |	101	   |				 +---------+----------+-----------+-----------+				      ^                        
| 4      | David Wilson    | 2023-05-05  |	102    |				      ^ 
+--------+-----------------+-------------+---------+                      | (PK)
												 |  (FK)				  |	Primary Key
                                                 | 	Foreign key		      |
                                                 +------------------------+
*/

create database day6;
use day6;
select * from departments;
select * from emplyoees;
insert into departments values (101, 'A','PUNE',100);
INSERT INTO DEPARTMENTS(DEP_ID,DEPT_NAME,EMP_COUNT)VALUES(102,'B',150);
-- PARENT TABLE


CREATE TABLE departments(    # create table with 1st parent table
dep_id int primary key,      #put constraint with key fn
dept_name char(1) NOT NULL unique,
LOCATION varchar(25) DEFAULT 'MUMBAI',
EMP_COUNT int CHECK(emp_count between 5 and 200)

);

insert into departments values (101, 'C','PUNE',100); -- Error Code: 1062. Duplicate entry '101' for key 'departments.PRIMARY'
insert into departments values (NULL, 'A','PUNE',100); -- Error Code: 1048. Column 'dep_id' cannot be null


select * from departmentS;

--- EMPLOYEEE TABLE

insert into emplyoees values ( 1, 'John Doe' , '2023-05-01',101  );
insert into emplyoees values ( 2, 'Jane Smith' , '2023-05-02',102  );
insert into emplyoees values ( 3, 'Michael Johnson' , '2023-05-03',101  );
insert into emplyoees values ( 4, 'David Wilson' , '2023-05-05',102  );

select * from emplyoees;

CREATE TABLE EMPLYOEES(
emp_id int primary key,
emp_name varchar (25) not null,
hire_date date,
dep_id int,
foreign key(dep_id) references departments(dep_id) #we can put (fk) in paranthesis then refernces or then parent table
on update cascade  #any updation  action happen in  parent table same action happen in employee table
on delete cascade #any delete action we put in parent table same action happen in employee table
);

CREATE TABLE EMPLYOEES(
emp_id int primary key,
emp_name varchar (25) not null,
hire_date date,
dep_id int,
foreign key(dep_id) references departments(dep_id)
on update set null 
on delete set null 
);

-- ALL DATA FROM EMPLYOEE TABLE GOT DELEED WHILE PERFORMING DML OPERATIONS ON TABLE 
-- AGAIN INSERTING VSLUES TO EMP TABLE

insert into emplyoees values ( 1, 'John Doe' , '2023-05-01',101  );
insert into emplyoees values ( 2, 'Jane Smith' , '2023-05-02',102  );
insert into emplyoees values ( 3, 'Michael Johnson' , '2023-05-03',101  );
insert into emplyoees values ( 4, 'David Wilson' , '2023-05-05',102  );

SELECT * FROM EMPLYOEES; -- VALUES ARE INSERTED BACK TO THE TABLE



































































































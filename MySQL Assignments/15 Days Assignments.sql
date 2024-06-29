/* 
Day 1  No questions
Day 2 No questions
*/
use classicmodels; 
# DAY-3
# 1) Show customer number, customer name, state and credit limit from customers table for below conditions. 
# Sort the results by highest to lowest values of creditLimit. 
# ●	State should not contain null values
# ●	credit limit should be between 50000 and 100000 

select * from customers;
select customernumber,customername,state,creditlimit from customers 
where creditlimit between 50000 and 100000 
and state is not null 
order by creditlimit desc;

# 2) Show the unique productline values containing the word cars at the end from products table.

select * from products;
select distinct productline from products where productline like "%cars";

# DAY-4
# 1) Show the orderNumber, status and comments from orders table for shipped status only. 
# If some comments are having null values then show them as “-“.

select * from orders;
select ordernumber,status,ifnull(comments,"-") from orders where status="shipped" ; 

# 2) Select employee number, first name, job title and job title abbreviation from employees table based on following conditions.
# If job title is one among the below conditions, then job title abbreviation column should show below forms.
#      ●	President then “P”
#      ●	Sales Manager / Sale Manager then “SM”
#      ●	Sales Rep then “SR”
#      ●	Containing VP word then “VP”

select * from employees;
select 
employeenumber,
firstname,
jobtitle,
case 
    when jobtitle="President" then "P"
    when jobtitle like "Sales Manager%"  then "SM"
    when jobtitle like "sale manager%" then "SM"
    when jobtitle="Sales Rep" then "SR"
    when jobtitle like "%VP%" then "VP"
end as jobtitle_abbr 
from employees; 

# DAY-5
# 1) For every year, find the minimum amount value from payments table.

select * from payments;
select year(PaymentDate) as year,min(amount) from payments group by year order by year;

# 2) For every year and every quarter, find the unique customers and total orders from orders table. 
# Make sure to show the quarter as Q1,Q2 etc

select * from orders; 
select 
year(orderdate) as `Year`,
concat('Q',quarter(orderdate)) as `Quarter`, 
count(distinct customernumber) as Unique_Customers,
count(ordernumber)as Total_Orders from orders
group by `Year`,`Quarter`
order by `Year`,`Quarter`;

# 3) Show the formatted amount in thousands unit (e.g. 500K, 465K etc.) for every month (e.g. Jan, Feb etc.) with filter 
# on total amount as 500000 to 1000000. Sort the output by total amount in descending mode. [ Refer. Paym ents Table]

select * from payments;
with 
formatted_cte as (select substring(monthname(paymentdate),1,3)as "Month",
concat(round(sum(amount)/1000,0),"k") as Formatted_Amount 
from payments
group by month
order by formatted_amount desc)
select * from formatted_cte where formatted_amount>"500k" or formatted_amount<"1000k";

# DAY-6:

# 1) Create a journey table with following fields and constraints.
#  ●	Bus_ID (No null values)
#  ●	Bus_Name (No null values)
#  ●	Source_Station (No null values)
#  ●	Destination (No null values)
#  ●	Email (must not contain any duplicates)

create table 
journey( bus_id int not null,
		 bus_name varchar(10) not null,
         source_station varchar(10) not null,
	     destination varchar(10) not null,
	     email varchar(10) unique); 
         
# 2) Create vendor table with following fields and constraints.

#  ●	Vendor_ID (Should not contain any duplicates and should not be null)
#  ●	Name (No null values)
#  ●	Email (must not contain any duplicates)
#  ●	Country (If no data is available then it should be shown as “N/A”)


create table 
vendor( vendor_id int primary key not null,
        name varchar(20) not null,
		email varchar(20) unique,
        country varchar(20) default "N/A"
); 
# 3) Create movies table with following fields and constraints.

#  ●	Movie_ID (Should not contain any duplicates and should not be null)
#  ●	Name (No null values)
#  ●	Release_Year (If no data is available then it should be shown as “-”)
#  ●	Cast (No null values)
#  ●	Gender (Either Male/Female)
#  ●	No_of_shows (Must be a positive number)

create table
Movies( Movie_id int primary key not null ,
        Movie_Name varchar(50) not null,
		Release_Year int default 0,
        Cast varchar(55) not null,
		Gender enum("male","female"),
        No_of_Shows int check(No_of_Shows > 0)
        );
        
# 4)	Create the following tables. Use auto increment wherever applicable

# a. Product
# ✔	product_id - primary key
# ✔	product_name - cannot be null and only unique values are allowed
# ✔	description
# ✔	supplier_id - foreign key of supplier table

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    supplier_id INT,
    FOREIGN KEY (supplier_id)
        REFERENCES suppliers (supplier_id)
);

# b. Suppliers
# ✔	supplier_id - primary key
# ✔	supplier_name
# ✔	location

create table Suppliers(supplier_id int primary key auto_increment,
                       supplier_name varchar(50),
                       location varchar(50));

# c. Stock
# 	id - primary key
# ✔	product_id - foreign key of product table
# ✔	balance_stock

create table Stock(id int primary key auto_increment,
                   product_id int,
                   balance_stock int,
                   foreign key(product_id) references suppliers(supplier_id));

# DAY 7
# 1) Show employee number, Sales Person (combination of first and last names of employees),
#  unique customers for each employee number and sort the data by highest to lowest unique customers.
# Tables: Employees, Customers

select * from employees;
select * from customers;
select
	 e.employeeNumber,
     concat(e.firstname," ",e.lastname) as "SalesPerson",
     count(distinct c.customerNumber) as "UniqueCustomers"
from employees e join customers c 
on e.employeeNumber=c.salesRepEmployeeNumber
group by e.employeeNumber,salesRepEmployeeNumber
order by uniquecustomers desc;

# 2) Show total quantities, total quantities in stock, left over quantities for each product and each customer. 
# Sort the data by customer number.
# Tables: Customers, Orders, Orderdetails, Products

select * from customers;
select * from orders;
select * from orderdetails;
select * from products;
select c.customernumber,c.customerName,p.productcode,p.productname,
       sum(od.quantityordered) as "Ordered Qty",
       sum(p.quantityinstock) as "Total Inventory",
       sum(p.quantityinstock-od.quantityordered) as "Left Qty"
from customers c
join orders o on 
c.customernumber=o.customernumber
join 
orderdetails od on o.ordernumber=od.ordernumber
join
products p on od.productCode=p.productCode
group by
c.customernumber,p.productCode,p.productName
order by
c.customernumber;

# 3) Create below tables and fields. (You can add the data as per your wish)
#  ●	Laptop: (Laptop_Name)
#  ●	Colours: (Colour_Name)
# Perform cross join between the two tables and find number of rows.

create table laptop(laptop_name varchar(10));
create table colors(color_name varchar(10));
insert into laptop values("dell"),("HP");
insert into colors values("white"),("silver"),("black");
select * from laptop;
select * from colors;       
select * from laptop cross join colors;

# 4) Create table project with below fields.
#  ●	EmployeeID
#  ●	FullName
#  ●	Gender
#  ●	ManagerID
# Add below data into it.
# INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
# INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
# INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
# INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
# INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
# INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
# INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);
# Find out the names of employees and their related managers 

create table 
           Project( employeeid int,
                    fullname varchar(30),
                    gender enum("male","female"),
                    managerid int );
insert into project values(1,"pranaya","male",3);       
insert into project values(2,"priyanka","female",1);
insert into project values(3,"preeti","female",null);
insert into project values(4,"anurag","male",1);
insert into project values(5,"sambit","male",1);
insert into project values(6,"rajesh","male",3);
insert into project values(7,"hina","female",3);

select * from project;
select m.fullname as Mgr_Name,
       e.fullname as Emp_Name
from project as e join project as m 
on e.managerid=m.employeeid ;

/* Day 8
Create table facility. Add the below fields into it.
●	Facility_ID
●	Name
●	State
●	Country

i) Alter the table by adding the primary key and auto increment to Facility_ID column.
ii) Add a new column city after name with data type as varchar which should not accept any null values. */

create table 
           facility( facility_id int,
					 name varchar(20),
                     state varchar(20),
                     country varchar(20) );
alter table 
          facility modify column facility_id int auto_increment primary key;
alter table 
          facility add column city varchar(20) not null after name;
desc facility;

/* Day 9
Create table university with below fields.
●	ID
●	Name
Add the below data into it as it is.
INSERT INTO University
VALUES (1, "       Pune          University     "), 
               (2, "  Mumbai          University     "),
              (3, "     Delhi   University     "),
              (4, "Madras University"),
              (5, "Nagpur University");
Remove the spaces from everywhere and update the column like Pune University etc. */

create table 
            university(id int,name varchar(20));
insert into university values(1,"     pune university    "),
                             (2," mumbai  university    "),
                             (3,"   delhi university    "),
                             (4,"madras university"),
                             (5,"nagpur university"); 
 set sql_safe_updates=0;
 update university set name=trim(name);
 select * from university;
 
 /* Day 10
Create the view products status. Show year wise total products sold. Also find the percentage of total value for each year. 
The output should look as shown in below figure */

CREATE VIEW products_status AS
SELECT
 YEAR(o.orderDate) AS Year,
 CONCAT(
  count(od.priceEach),
   ' (',
    ROUND((SUM(od.priceEach * od.quantityOrdered) / (SELECT SUM(od2.priceEach * od2.quantityOrdered) FROM OrderDetails od2)) * 100),
	'%)'
    ) AS Value
FROM Orders o
JOIN
    OrderDetails od ON o.orderNumber = od.orderNumber
GROUP BY
    Year
ORDER BY
  Value desc;

SELECT * FROM products_status;

/* Day 11
1)	Create a stored procedure GetCustomerLevel which takes input as customer number and gives the output as either Platinum, 
Gold or Silver as per below criteria.
Table: Customers
●	Platinum: creditLimit > 100000
●	Gold: creditLimit is between 25000 to 100000
●	Silver: creditLimit < 25000 
2)	Create a stored procedure Get_country_payments which takes in year and country as inputs and gives year wise, country wise total amount as an output. Format the total amount to nearest thousand unit (K)
Tables: Customers, Payments */

select * from customers;
CALL GetCustomerLevel(103,@level);

SELECT @level AS CustomerLevel;

DELIMITER //
CREATE PROCEDURE 
               GetCustomerLevel(IN customerNumber INT,
							    OUT customerLevel VARCHAR(10) )
BEGIN
    DECLARE credit DECIMAL(10, 2);
    SELECT 
          creditLimit INTO credit 
	FROM Customers 
    WHERE customerNumber = customerNumber LIMIT 1;
    IF credit > 100000 
    THEN
	SET customerLevel = 'Platinum';
    ELSEIF credit >= 25000 AND credit <= 100000 
    THEN
	SET customerLevel = 'Gold';
    ELSE
        SET customerLevel = 'Silver';
    END IF;
END //
DELIMITER ;

CALL GetCustomerLevel(103,@level);
SELECT @level AS "Customer Level";

/* 2)	Create a stored procedure Get_country_payments which takes in year and country as inputs and gives year wise, country wise total amount as an output. Format the total amount to nearest thousand unit (K)
Tables: Customers, Payments
*/

DELIMITER //
CREATE PROCEDURE 
                Get_country_payments( IN inputYear INT, 
                                      IN inputCountry VARCHAR(255) )
BEGIN
    SELECT
         YEAR(p.paymentDate) AS Year,
         c.country AS Country,
         CONCAT(FORMAT(SUM(p.amount)/1000, 0), 'K') AS 'Total Amount'
    FROM Payments p
    JOIN Customers c 
    ON p.customerNumber = c.customerNumber
    WHERE
        YEAR(p.paymentDate) = inputYear AND c.country = inputCountry
    GROUP BY
        Year, Country;
END //

DELIMITER ;

CALL Get_country_payments(2003, 'France');

drop procedure get_country_payments;

/*
Day 12
1)	Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. Format the YoY values in no decimals and show in % sign.
Table: Orders
*/

select * from orders;
 select year(orderdate) as "year",
	    monthname(orderdate) as "month",
        count(ordernumber) as "totalorders",
        concat(round(((count(ordernumber)-
        lag(count(ordernumber),1) over()) /
        lag(count(ordernumber),1) over()) *100),"%") as "%YOY_change"
        from orders 
        group by year,month;
        
/*
2)	Create the table emp_udf with below fields.
●	Emp_ID
●	Name
●	DOB
Add the data as shown in below query.
INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");
Create a user defined function calculate_age which returns the age in years and months (e.g. 30 years 5 months) by accepting DOB column as
 a parameter.
*/

CREATE TABLE emp_udf (
    Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DOB DATE
);

INSERT INTO emp_udf (Name, DOB)
VALUES 
    ("Piyush", "1990-03-30"),
    ("Aman", "1992-08-15"),
    ("Meena", "1998-07-28"),
    ("Ketan", "2000-11-21"),
    ("Sanjay", "1995-05-21");
    
DELIMITER //

CREATE FUNCTION calculate_age(date_of_birth DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE years INT;
    DECLARE months INT;
    DECLARE age VARCHAR(50);
 SET years = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());
 SET months = TIMESTAMPDIFF(MONTH, date_of_birth, CURDATE()) % 12;
  IF years = 0 THEN
	SET age = CONCAT(months, ' months');
    ELSEIF months = 0 THEN
	SET age = CONCAT(years, ' years');
    ELSE
        SET age = CONCAT(years, ' years ', months, ' months');
    END IF;

    RETURN age;
END //

DELIMITER ;

SELECT Emp_ID,Name, DOB, calculate_age(DOB) AS Age FROM emp_udf;

/*
Day 13
1)	Display the customer numbers and customer names from customers table who have not placed any orders using subquery
Table: Customers, Orders
*/

select * from customers;
 select * from orders; 
 select distinct customernumber from orders;
 select customernumber,customername from customers where
 customernumber not in(select distinct customernumber from orders);

/*
2)	Write a full outer join between customers and orders using union and get the customer number, customer name, count of orders for every customer.
Table: Customers, Orders
*/

select *from customers;
 select * from orders;
 select c.customernumber,c.customername,count(o.ordernumber) as totalorders
 from customers c
 left join orders o on c.customernumber=o.customernumber
 group by c.customernumber,c.customername
 union 
 select c.customernumber,c.customername,count(o.ordernumber) as totalorders
 from customers c 
 right join orders o on c.customernumber=o.customernumber
 group by c.customernumber,c.customername;

/*
3)	Show the second highest quantity ordered value for each order number.
Table: Orderdetails
*/

select * from orderdetails;
with s as ( select 
                  ordernumber,
                  quantityordered,
                  dense_rank() over(partition by ordernumber 
                                    order by quantityordered desc) as ranks
 from orderdetails) 
                  select ordernumber,
						 quantityordered 
				  from s 
                  where ranks=2;
                  
/*
4)	For each order number count the number of products and then find the min and max of the values among count of orders.
Table: Orderdetails
*/

select * from orderdetails;
 select ordernumber,count(productcode) as total
 from orderdetails
 group by ordernumber;
 select max(total),min(total) from 
 (select ordernumber,count(productcode) as total
 from orderdetails
 group by ordernumber) as abc;
 
 /* 5)	Find out how many product lines are there for which the buy price value is greater than the average of buy price value. 
 Show the output as product line and its count
 */
 
 select * from productlines;
 select * from products;
 select productline,avg(buyprice) from products group by productline;
 select productline,count(*) as productline_count from products where buyprice>(
 select avg(buyprice) from products) group by productline;
 
 /*
 Day 14
Create the table Emp_EH. Below are its fields.
●	EmpID (Primary Key)
●	EmpName
●	EmailAddress
Create a procedure to accept the values for the columns in Emp_EH. Handle the error using exception handling concept. 
Show the message as “Error occurred” in case of anything wrong.
 */
 
CREATE TABLE Emp_EH (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(255),
    EmailAddress VARCHAR(255)
);


DELIMITER //

CREATE PROCEDURE InsertEmp_EH(
    IN p_EmpID INT,
    IN p_EmpName VARCHAR(255),
    IN p_EmailAddress VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error occurred';
    END;
    START TRANSACTION;
    INSERT INTO Emp_EH (EmpID, EmpName, EmailAddress)
    VALUES (p_EmpID, p_EmpName, p_EmailAddress);

    COMMIT;
END //

DELIMITER ;
select * from emp_eh;

/*
Create the table Emp_BIT. Add below fields in it.
●	Name
●	Occupation
●	Working_date
●	Working_hours

Insert the data as shown in below query.
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  
 
Create before insert trigger to make sure any new value of Working_hours, if it is negative, 
then it should be inserted as positive.
*/

CREATE TABLE Emp_BIT (
    Name VARCHAR(255),
    Occupation VARCHAR(255),
    Working_date DATE,
    Working_hours INT
);


INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);


DELIMITER //
CREATE TRIGGER EnsurePositiveWorkingHours
BEFORE INSERT ON Emp_BIT
FOR EACH ROW
BEGIN
    IF NEW.Working_hours < 0 THEN
        SET NEW.Working_hours = -NEW.Working_hours;
    END IF;
END //
DELIMITER ;

select * from emp_bit;
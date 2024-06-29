CREATE database db1;
create database db2;
show databases;
create database day2;
use day2;
-- create table
create table products(
	product_id INT ,
    product_name varchar(25),
    price decimal(5,2),
    release_date date
);

insert into products values(1, "T-shirt" , 5.00 , "2023-05-01" );
select * from products ;
insert into products values(2 , 'BookShelf', 19.34 , '2023-05-02');
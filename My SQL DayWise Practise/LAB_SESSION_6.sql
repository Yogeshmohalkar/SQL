create database ExcelR ;
use ExcelR;
create table Students(
      Roll_No int primary key,
      Name varchar(25) not null,
      Age int check( Age between 5 and 15),
      Parents_Email varchar(100) unique,
      Address varchar(100) default "-"
);

select * from Students ;

insert into Students 
values(1,'YogeshM',10,"yogesh@gmail.com",'krushnanagar') ;

insert into Students(Roll_No,Name,Age)
values(2,'VarshaM',08);
 
select * from Students ; 
use day6;
show tables;

select * from departments;
select * from emplyoees;

-- UPDATE A SINGLE RECORD

update emplyoees
set emp_name = 'xyz'
where emp_id = 1 ;

update emplyoees
set hire_date = '2023-08-20'
where emp_id = 1;

update emplyoees
set hire_date = '2023-08-20'
where emp_id = 1;

update emplyoees
set hire_date = '2023-09-10'
where emp_name = 'Jane Smith';

update emplyoees 
set emp_name = concat('emp',emp_id)
where dep_id = 101 ;
select * from emplyoees;

set SQL_SAFE_UPDATES = 0; 
-- [set SQL_SAFE_UPDATES = 0;]
-- this command  will help to avoid errors while updating or changing 

update emplyoees 
set emp_name = concat('emp',emp_id)
where dep_id = 102 ;
select * from emplyoees;

-- changing multiple records 

update emplyoees
set emp_name = 'Yogesh' , hire_date = "2023-12-01"
where emp_id = 4;
select * from emplyoees;

update emplyoees
set emp_name = concat('EMPLYOEE', emp_id);

-- DELETE : delete records from table

-- DELETE SINGLE RECORD
delete from emplyoees
where emp_id = 1;
select * from emplyoees;

-- DELETE MULTIPLE RECORDS

Delete from emplyoees
where DEP_id = 102 ;
select * from emplyoees;

-- deleting all data
Delete from emplyoees;
select * from emplyoees;





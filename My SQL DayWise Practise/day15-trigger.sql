# Triggers
/*
- A stored procedure program that is invoked automatically in response to an event associated with a table.
- Each trigger is associated with a table
- A trigger can be activated on any DML statement - INSERT, UPDATE, DELETE
*/

USE day15;
SHOW TABLES;
SELECT * FROM employee;
SELECT * FROM employee_log;

-- trigger on UPDATE command

CREATE TRIGGER employee_update
BEFORE UPDATE ON employee
FOR EACH ROW
	INSERT INTO employee_log
    SET _action = 'update',
    eid = OLD.eid,
    prev_ename = OLD.ename,
    current_ename = NEW.ename,
    prev_job_title = OLD.job_title,
    current_job_title = NEW.job_title,
    prev_salary = OLD.salary,
    current_salary = NEW.salary,
    _change_date = NOW();

-- trigger on INSERT command

CREATE TRIGGER employee_insert
AFTER insert on employee
FOR EACH ROW
	INSERT INTO employee_log
    SET _action = 'insert',
    eid = NEW.eid,
    current_ename = NEW.ename,
    current_job_title = NEW.job_title,
    current_salary = NEW.salary,
    _change_date = NOW();

-- trigger on DELETE command

CREATE TRIGGER employee_delete
BEFORE DELETE ON employee
FOR EACH ROW
	INSERT INTO employee_log
    SET _action = 'delete',
    eid = OLD.eid,
    prev_ename = OLD.ename,
    prev_job_title = OLD.job_title,
    prev_salary = OLD.salary,
    _change_date = NOW();

SELECT * FROM employee;
SELECT * FROM employee_log;

-- insert into employee

INSERT INTO employee value ( 5 , 'AMAN','aman@sample.com','Data Analyst', 50000);
INSERT INTO employee value ( 6 , 'YOGESH','yogesh@sample.com','AI Engineer', 150000);

SELECT * FROM employee;
SELECT * FROM employee_log;

-- update employee

UPDATE employee
SET salary = 270000
WHERE eid = 6;

UPDATE employee
set salary = 100000
WHERE eid = 1;

SELECT * FROM employee;
SELECT * FROM employee_log;

-- delete operation

DELETE from employee
where eid = 3;

SELECT * FROM employee;
SELECT * FROM employee_log;

# Syntax
/*
						CREATE TRIGGER trigger_name
						{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
						ON table_name FOR EACH ROW
						trigger_body;
        
- Trigger action time:
	1. BEFORE: the trigger is invoked beforE each row is modified.
    2. AFTER: the trigger is invoked after each row is modified.
- Modifiers:
    1. OLD: the value of the columns BEFORE the DML has fired
    2. NEW: the value of the columns AFTER the DML has fired
*/










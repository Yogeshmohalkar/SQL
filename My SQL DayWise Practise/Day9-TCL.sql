# TCL : Transaction Control Langugae
/*
-- A single unit of work in a database is formed after 
   the consecutive execution of commands is known as a transaction
-- TCL commands help to manage the transactions that take place 
   in a database.
-- Ensure the database never contains the result of partial operations.
*/

# TCL Commands:
-- TRANSACTION
-- COMMIT  --> to save the changes made to the database permanently
-- ROLLBACK --> reverting the changes
-- SAVEPOINT

CREATE DATABASE day9;
USE day9;

CREATE TABLE students (
	sid INT PRIMARY KEY,
    sname VARCHAR(25),
	marks INT check(marks BETWEEN 0 AND 50)
);

INSERT INTO students 
VALUES
(1, 'ABC', 35), (2, 'PQR', 41), (3, 'XYZ', 45), (4, 'IJK', 38);

select * from students;

-- create transaction

START TRANSACTION ; -- IT WILL START THE TRANSACTION.
INSERT INTO students VALUES (5, 'AMAN', 47); -- HERE WE INSERTED SOME DATA

UPDATE students SET marks = 33 where sid = 2; -- PERFORMED SOME OPERATIONS LIKE UPDATE AND DELETE RECORDS
DELETE FROM students where sid = 3;
-- BUT NOW WE WANT TO REVERT THE CHANGES BECAUSE OF SOME MISTAKE AND WANT DATA BACK 
ROLLBACK; -- IT WILL END THE TRANSACTION AND UNDO CHANGES.
select * from students; -- BECAUSE OF ROLL BACK ALL THE CHANGES ARE BEING UNDO. 

START TRANSACTION ;
INSERT INTO students VALUES (5, 'AMAN', 47);
UPDATE students SET marks = 33 where sid = 2; 
DELETE FROM students where sid = 3;
COMMIT; -- IT WILL END THE TRANSACTION AND SAVE THE CHANGES PERMENANTLY IN THE DATABASE.
-- WHENEVER YOU WANT TO SAVE CHANGES PERMNANATLY USE COMMIT COMMAND. 
select * from students;

-- In SQL, the COMMIT statement saves changes to the current transaction, making them permanent. 
-- The ROLLBACK statement undoes all changes made to the current transaction after the last COMMIT
 
-- SAVEPOINT 

START TRANSACTION;
INSERT INTO students VALUES (6, 'ASD', 47);
INSERT INTO students VALUES (7, 'ASD', 47);
INSERT INTO students VALUES (8, 'ASD', 47);
INSERT INTO students VALUES (9, 'ASD', 47);
SAVEPOINT s1;
INSERT INTO students VALUES (10, 'ASD', 47);
INSERT INTO students VALUES (11, 'ASD', 47);
ROLLBACK TO s1;
select * from students;

START TRANSACTION;
INSERT INTO students VALUES (10, 'ASD', 47);
INSERT INTO students VALUES (11, 'ASD', 47);
SAVEPOINT s1;
INSERT INTO students VALUES (12, 'ASD', 47);
INSERT INTO students VALUES (13, 'ASD', 47);
SAVEPOINT s2;
INSERT INTO students VALUES (14, 'ASD', 47);
INSERT INTO students VALUES (15, 'ASD', 47);
ROLLBACK TO s2;
select * from students;





















































































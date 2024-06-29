
# OPERATIONS ON PARENT TABLE

SELECT * FROM DEPARTMENTS;  # this is parent table
SELECT * FROM emplyoees;    # this is child table

# OPERATIONS ON PARENT TABLE

# UPDATE OPERATION
-- lets update department id of 101 to 105 

update departments
set dep_id = 105
where dep_id = 101 ;

# DELETE OPERATION 

delete FROM departments
WHERE dep_id = 102 ;

delete FROM departments
WHERE dep_id = 105 ;

SELECT * FROM DEPARTMENTS;  # this is parent table
SELECT * FROM emplyoees;    # this is child table
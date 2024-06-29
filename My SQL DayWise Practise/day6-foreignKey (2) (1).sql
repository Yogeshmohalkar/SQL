 Table: employees  
 
+------------+-----------------+-------------+-----------+-----------+-----------+
| employeeId | employeeName    | hireDate    | deptName  | location  | emp_Count |		
+------------+-----------------+-------------+-----------+-----------+-----------+
| 1          | John Doe        | 2023-05-01  | A         | Pune      | 100		 |
| 2          | Jane Smith      | 2023-05-02  | B         | Mumbai    | 150		 |
| 3          | Michael Johnson | 2023-05-03  | B         | Mumbai    | 150		 |
| 4          | Emily Brown     | 2023-05-04  | A         | Pune      | 100		 |
| 5          | David Wilson    | 2023-05-05  | B         | Mumbai    | 150		 |
+------------+-----------------+-------------+-----------+-----------+-----------+	


Goal 1: Data Consistency  --> same data throughout the database
Goal 2: No (Data Redundency : repeated data)

-- tables in the relational database are connected by common columns
-- common columns : columns storing same information

Child Table																 Parent Table																		 
Table: employees												         Table: departments
+------------+-----------------+-------------+---------+			     +---------+----------+-----------+-----------+
| employeeId | employeeName    | hireDate    | deptId  |        		 | deptId  | deptName | location  | emp_Count |
+------------+-----------------+-------------+---------+		    	 +---------+----------+-----------+-----------+
| 1          | John Doe        | 2023-05-01  |	101    |				 | 101     | A        | Pune      | 100		  |
| 2          | Jane Smith      | 2023-05-02  |	102	   |				 | 102     | B        | Mumbai    | 150		  |
| 3          | Michael Johnson | 2023-05-03  |	101    |		         +---------+----------+-----------+-----------+
| 4          | Emily Brown     | 2023-05-04  |	101	   |				      ^                        
| 5          | David Wilson    | 2023-05-05  |	102    |				      | (PK)
+------------+-----------------+-------------+---------+                      | Primary Key
												 |  (FK)					  |	
                                                 | 	Foreign key		    	  |
                                                 +----------------------------+

                                                 
			Foregin Key : Column or Combination of columns from the child table that
							refrences PRIMARY KEY from the parent table
			Purpose: To maintain the data consistency
					 To connect two tables in the database
                        
                        
            
            
            
            
            
            
            
            
                                                 
            Data Consistency                                             
                                                 
                                                 
			database: college 
			tables:   							sid 	deptNo                                            
			students(sid, deptNo)   		--  1,		10A
			adminRecords(sid, deptNo) 		--  1,		10A
			library(sid, deptNo)			--  1,		10B
			sports(sid, deptNo)				--  1,		10A
                                                 




'' --> EMPTY STRING
' ' --> STRING WITH A SINGLE CHARACTER








  
  departments - maths, english, computer
  roll          (1-30), (1- 25), (1-35)
  
  
  CREATE TABLE students(
	sid INT PRIMARY KEY,
    dept VARCHAR(10) PRIMARY KEY,
    name VARCHAR(20)
  );

  
  
  
  
  
  
  
  
  
  
  
  
                                                 
                                                 